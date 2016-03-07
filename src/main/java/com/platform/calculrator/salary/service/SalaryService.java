package com.platform.calculrator.salary.service;

import org.springframework.stereotype.Service;

import com.platform.calculrator.salary.vo.SalaryVo;

@Service
public class SalaryService {
	
	/**
	 * nationalPensionRate nationalPensionRate 9%
	 */
	private static double nationalPensionRate = 9.0 / 100;
	
	//2016����� 6.12����
	private static double healthInsuranceRate = 6.12 / 100;

	//2016����� 6.55����
	private static double longHealthInsuranceRate = 6.55 / 100;
	
	
	public void getSalary(SalaryVo salaryVo) {
		//��������(�⺻��)
		setTaxBeforeAmount(salaryVo);
		
		//���ο��� ������
		setNationalPension(salaryVo);
		
		//�ǰ����� ������
		setHealthInsurance(salaryVo);
		
		//����纸�� ������
		setLongHealthInsurance(salaryVo);
		
		//���Ŀ���
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
