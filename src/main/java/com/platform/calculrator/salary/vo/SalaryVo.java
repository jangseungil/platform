package com.platform.calculrator.salary.vo;

public class SalaryVo {
	
	private int noTax;

	private int yearSalary;
	
	private int nationalPension;
	
	private int healthInsurance;
	
	private int taxBeforeAmount;
	
	private int taxAfterAmount;
	
	private int longHealthInsurance;
	
	private int unemploymentInsurance;
	
	private int incomeTax;
	
	private int countryIncomeTax;
	
	private int totalTaxAmount;
	
	private int noTaxManCnt;
	
	public SalaryVo() {
		
	}

	public int getNoTax() {
		return noTax;
	}

	public void setNoTax(int noTax) {
		this.noTax = noTax;
	}

	public int getNationalPension() {
		return nationalPension;
	}

	public void setNationalPension(int nationalPension) {
		this.nationalPension = nationalPension;
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

	public int getTaxBeforeAmount() {
		return taxBeforeAmount;
	}

	public void setTaxBeforeAmount(int taxBeforeAmount) {
		this.taxBeforeAmount = taxBeforeAmount;
	}

	public int getTaxAfterAmount() {
		return taxAfterAmount;
	}


	public void setTaxAfterAmount(int taxAfterAmount) {
		this.taxAfterAmount = taxAfterAmount;
	}

	public int getYearSalary() {
		return yearSalary;
	}

	public void setYearSalary(int yearSalary) {
		this.yearSalary = yearSalary;
	}

	public int getUnemploymentInsurance() {
		return unemploymentInsurance;
	}

	public void setUnemploymentInsurance(int unemploymentInsurance) {
		this.unemploymentInsurance = unemploymentInsurance;
	}

	public int getIncomeTax() {
		return incomeTax;
	}

	public void setIncomeTax(int incomeTax) {
		this.incomeTax = incomeTax;
	}

	public int getCountryIncomeTax() {
		return countryIncomeTax;
	}

	public void setCountryIncomeTax(int countryIncomeTax) {
		this.countryIncomeTax = countryIncomeTax;
	}

	public int getTotalTaxAmount() {
		return totalTaxAmount;
	}

	public void setTotalTaxAmount(int totalTaxAmount) {
		this.totalTaxAmount = totalTaxAmount;
	}

	public int getNoTaxManCnt() {
		return noTaxManCnt;
	}

	public void setNoTaxManCnt(int noTaxManCnt) {
		this.noTaxManCnt = noTaxManCnt;
	}
}
