package com.platform.calculrator.salary.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;

import com.platform.calculrator.salary.vo.SalaryVo;

@Service
public class SalaryService {
	
	//2016년기준 4.5%
	private static double nationalPensionRate = 4.5 / 100;
	
	//2016년기준 3.06%
	private static double healthInsuranceRate = 3.06 / 100;

	//2016년기준 6.55%
	private static double longHealthInsuranceRate = 6.55 / 100;
	
	//2016년기준 0.65%
	private static double unemploymentInsuranceRate = 0.65 / 100;
	
	
	public void getSalary(SalaryVo salaryVo) {
		//세전월급(기본급)
		setTaxBeforeAmount(salaryVo);
		
		//국민연금 차감
		setNationalPension(salaryVo);
		
		//건강보험 차감
		setHealthInsurance(salaryVo);
		
		//장기요양보험 차감
		setLongHealthInsurance(salaryVo);
		
		//고용보험 차감
		setUnemploymentInsurance(salaryVo);

		//소득세
		salaryVo.setIncomeTax(cutWon(getIncomeTax(salaryVo.getTaxBeforeAmount(), salaryVo.getNoTaxManCnt())));
		
		//지방소득세 (소득세의 10%)
		salaryVo.setCountryIncomeTax(cutWon(salaryVo.getIncomeTax() * 10 / 100));
		
		//공제액 합계
		setTotalTaxAmount(salaryVo);
		
		//세후월급
		setTaxAfterAmount(salaryVo);
		
	}

	/**
	 * 원단위 절사
	 * @param digits
	 * @return
	 */
	private int cutWon(int digits) {
		return (int) Math.floor((digits)/10)*10;
	}

	private void setLongHealthInsurance(SalaryVo salaryVo) {
		salaryVo.setLongHealthInsurance(cutWon((int) (salaryVo.getHealthInsurance() * longHealthInsuranceRate)));
	}

	private void setHealthInsurance(SalaryVo salaryVo) {
		salaryVo.setHealthInsurance(cutWon((int) (salaryVo.getTaxBeforeAmount() * healthInsuranceRate)));
	}

	private void setTaxBeforeAmount(SalaryVo salaryVo) {
		salaryVo.setTaxBeforeAmount((salaryVo.getYearSalary() / 12) - salaryVo.getNoTax());
	}
	
	private void setNationalPension(SalaryVo salaryVo) {
		salaryVo.setNationalPension(cutWon((int) (salaryVo.getTaxBeforeAmount() * nationalPensionRate)));
	}
	
	private void setUnemploymentInsurance(SalaryVo salaryVo) {
		salaryVo.setUnemploymentInsurance(cutWon((int) (salaryVo.getTaxBeforeAmount() * unemploymentInsuranceRate)));
	}

	private void setTaxAfterAmount(SalaryVo salaryVo) {
		salaryVo.setTaxAfterAmount(salaryVo.getTaxBeforeAmount() 
				- salaryVo.getNationalPension()
				- salaryVo.getHealthInsurance()
				- salaryVo.getLongHealthInsurance()
				- salaryVo.getUnemploymentInsurance()
				- salaryVo.getIncomeTax()
				- salaryVo.getCountryIncomeTax()
		);
	}
	
	private void setTotalTaxAmount(SalaryVo salaryVo) {
		salaryVo.setTotalTaxAmount(salaryVo.getNationalPension()
				+ salaryVo.getHealthInsurance()
				+ salaryVo.getLongHealthInsurance()
				+ salaryVo.getUnemploymentInsurance()
				+ salaryVo.getIncomeTax()
				+ salaryVo.getCountryIncomeTax()
		);
	}
	
	//근로간이세액표에 해당되는 소득세 가져오기
	public static int getIncomeTax(int taxBeforeAmount, int noTaxManCnt) {
		//간이세액표단위(천원), 연봉기준으로 바꿔줌
		taxBeforeAmount = taxBeforeAmount/1000;
		
		// 파일을 읽기위해 엑셀파일을 가져온다
		FileInputStream fis;
		HSSFWorkbook workbook = null;
		try {
			fis = new FileInputStream("C:\\근로소득_간이세액표(조견표).xls");
			workbook = new HSSFWorkbook(fis);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		int rowindex = 0;
		int columnindex = 0;

		// 시트 수 (첫번째에만 존재하므로 0을 준다)
		// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
		HSSFSheet sheet = workbook.getSheetAt(0);
		
		// 행의 수
		int rows = sheet.getPhysicalNumberOfRows() - 3;
		int incomeTax = 0;
		
		HSSFRow row = null;
		//10000초과 14000이하 - > (10,000,000원인 경우의 해당 세액) + (10,000,000원을 초과하는 금액 중 98%를 곱한 금액의 35% 상당액)										
		if(taxBeforeAmount > 10000 && taxBeforeAmount <= 14000) {
			
			row = sheet.getRow(rows-1); //10000에 해당되는 row
			incomeTax = (int) (getValueByRow(noTaxManCnt + 1, row) + ((taxBeforeAmount - 10000) * 0.98 * 0.35 * 1000));
		} else if (taxBeforeAmount > 14000) { //14000초과  (10,000,000원인 경우의 해당세액) + (1,372,000원)+ (14,000,000원을 초과하는 금액 중 98%를 곱한 금액의 38% 상당액) 										
			row = sheet.getRow(rows-1); //10000에 해당되는 row
			incomeTax = (int) (getValueByRow(noTaxManCnt + 1, row) + (((14000 - 10000) * 0.98 * 0.35) + ((taxBeforeAmount - 14000) * 0.98 * 0.38)  * 1000));
		} else {
			//중첩포문에서 빠져나오기위해 라벨설정
			lbOut:
			for (rowindex = 3; rowindex < rows; rowindex++) {
				// 행을 읽는다
				row = sheet.getRow(rowindex);
				if (row != null) {
					// 셀의 수 (0부터 1개)
					int cells = 1;
					for (columnindex = 0; columnindex <= cells; columnindex++) {
						//월급여액 이상, 미만
						if(taxBeforeAmount >= getValueByRow(0, row) && taxBeforeAmount < getValueByRow(1, row)) {
							
							//3번째 컬럼(공제대상가족수1) ~ 13번째걸럼(공제대상가족수11)
							incomeTax = getValueByRow(noTaxManCnt + 1, row);
							
							break lbOut;
						}
					}
				}
			}
		}
		
		
		
		
		
		try {
			workbook.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return incomeTax;
	}
	
	private static int getValueByRow(int columnindex, HSSFRow row) {
		HSSFCell cell = row.getCell(columnindex);
		
		String value = "";

		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_FORMULA:
			value = cell.getCellFormula();
			break;
		case HSSFCell.CELL_TYPE_NUMERIC:
			value = cell.getNumericCellValue() + "";
			break;
		case HSSFCell.CELL_TYPE_STRING:
			value = cell.getStringCellValue() + "";
			break;
		case HSSFCell.CELL_TYPE_BLANK:
			value = cell.getBooleanCellValue() + "";
			break;
		case HSSFCell.CELL_TYPE_ERROR:
			value = cell.getErrorCellValue() + "";
			break;
		}
		
		if("false".equals(value)) {
			value = "0";
		}

		return (int) Double.parseDouble(value);
	}
}
