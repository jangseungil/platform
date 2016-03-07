package com.platform.calculrator.salary.vo;

public class SalaryVo {
	private int noTax;
	
	private int nationalPension;
	
	private int healthInsurance;
	
	private int longHealthInsurance;
	
	private int taxBeforeAmount;
	
	private int taxAfterAmount;
	
	private int yearSalary;
	
	public SalaryVo() {
		
	}
	
	public int getTaxAfterAmount() {
		return taxAfterAmount;
	}

	public void setTaxAfterAmount(int taxAfterAmount) {
		this.taxAfterAmount = taxAfterAmount;
	}

	public int getTaxBeforeAmount() {
		return taxBeforeAmount;
	}

	public void setTaxBeforeAmount(int taxBeforeAmount) {
		this.taxBeforeAmount = taxBeforeAmount;
	}

	public int getYearSalary() {
		return yearSalary;
	}

	public void setYearSalary(int yearSalary) {
		this.yearSalary = yearSalary;
	}

	public int getNationalPension() {
		return nationalPension;
	}

	public void setNationalPension(int nationalPension) {
		this.nationalPension = nationalPension;
	}

	public int getNoTax() {
		return noTax;
	}

	public void setNoTax(int noTax) {
		this.noTax = noTax;
	}

	public int getHealthInsurance() {
		return healthInsurance;
	}

	public void setHealthInsurance(int healthInsurance) {
		this.healthInsurance = healthInsurance;
	}

	public int getLongHealthInsurance() {
		return longHealthInsurance;
	}

	public void setLongHealthInsurance(int longHealthInsurance) {
		this.longHealthInsurance = longHealthInsurance;
	}
}
