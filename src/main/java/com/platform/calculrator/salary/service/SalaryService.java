package com.platform.calculrator.salary.service;

import org.springframework.stereotype.Service;

import com.platform.calculrator.salary.vo.SalaryVo;

@Service
public class SalaryService {
	
	/**
	 * nationalPensionRate nationalPensionRate 9%
	 */
	private static double nationalPensionRate = 9.0 / 100;
	
	//2016년기준 6.12프로
	private static double healthInsuranceRate = 6.12 / 100;

	//2016년기준 6.55프로
	private static double longHealthInsuranceRate = 6.55 / 100;
	
	
	public void getSalary(SalaryVo salaryVo) {
		//세전월급(기본급)
		setTaxBeforeAmount(salaryVo);
		
		//국민연금 차감액
		setNationalPension(salaryVo);
		
		//건강보험 차감액
		setHealthInsurance(salaryVo);
		
		//장기요양보험 차감액
		setLongHealthInsurance(salaryVo);
		
		//세후월급
		setTaxAfterAmount(salaryVo);
	}

	private void setLongHealthInsurance(SalaryVo salaryVo) {
		salaryVo.setLongHealthInsurance((int) (salaryVo.getHealthInsurance() * longHealthInsuranceRate));
	}

	private void setHealthInsurance(SalaryVo salaryVo) {
		salaryVo.setHealthInsurance((int) (salaryVo.getTaxBeforeAmount() * healthInsuranceRate));
	}

	private void setTaxBeforeAmount(SalaryVo salaryVo) {
		salaryVo.setTaxBeforeAmount((salaryVo.getYearSalary() / 12) - salaryVo.getNoTax());
	}
	
	private void setNationalPension(SalaryVo salaryVo) {
		salaryVo.setNationalPension((int) ((salaryVo.getTaxBeforeAmount() * nationalPensionRate) / 2));
	}

	private void setTaxAfterAmount(SalaryVo salaryVo) {
		salaryVo.setTaxAfterAmount(salaryVo.getTaxBeforeAmount() - salaryVo.getNationalPension());
	}
}
