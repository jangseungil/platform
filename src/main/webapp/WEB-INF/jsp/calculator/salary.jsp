<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="http://www.platform.co.kr" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/jsp/common/common.jsp"/>
<html>
<head>
<title>main</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
</head>
<body>

<div class="container" ng-app="myApp" ng-controller="myCtrl">
	<!--header start-->
	<header class="header black-bg">
		<div class="sidebar-toggle-box">
			<div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
		</div>
		<!--logo start-->
		<a href="/" class="logo"><b>Home</b></a>
		<!--logo end-->
		<div class="nav notify-row" id="top_menu">
			<!--  notification start -->
			<ul class="nav top-menu">
				<!-- inbox dropdown start-->
				<li id="header_inbox_bar" class="dropdown">
				<a href="/calculator/salary">
					<i class="fa fa-money"></i> 
				</a>
				<!-- inbox dropdown end -->
			</ul>
			<!--  notification end -->
		</div>
		<!-- 
		<div class="top-menu">
			<ul class="nav pull-right top-menu">
				<li><a class="logout" href="login.html">Logout</a></li>
			</ul>
		</div>
		 -->
	</header>
	<!--header end-->
	
	<div class="wrapper">
		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<h4 class="mb">
				</h4>
				<form class="form-horizontal style-form" method="get">
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">퇴직금</label>
						<div class="col-sm-4">
							<div class="radio-inline">
							  <label for="optionsRadios1">
						     	 <input type="radio" name="outWorkDivison" id="optionsRadios1" value="separate" checked="checked" ng-model="outWorkDivison">
							     별도
							  </label>
							</div>
							<div class="radio-inline">
							  <label for="optionsRadios2">
							    <input type="radio" name="outWorkDivison" id="optionsRadios2" value="include" ng-model="outWorkDivison">
							     포함
							  </label>
							</div>
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label" for="yearSalary">연봉</label>
						<div class="col-sm-4">
							<input type="text" class="form-control text-right" id="yearSalary" name="yearSalary" ng-model="yearSalary" maxlength="11" placeholder="원" r>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label" for="noTax">비과세액</label>	
						<div class="col-sm-4">
							<input class="form-control text-right" id="noTax" type="text" name="noTax" ng-model="noTax" maxlength="9" placeholder="원">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">부양가족수(본인포함)</label>
						<div class="col-sm-4">
							<input type="text" class="form-control text-right" placeholder="명(본인포함)" name="noTaxManCnt" ng-model="noTaxManCnt" maxlength="2">
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-4"></div>
						<div class="col-sm-4">
							<button type="button" class="btn btn-primary btn-lg" ng-click="getSalary()">계산하기</button>
							<button type="button" class="btn btn-default btn-lg" ng-click="reset()">다시하기</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-2"></div>
		</div>
		<!-- /row -->

		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<h4 class="mb">
					<i class="fa fa-angle-right"> result</i>
				</h4>
				<form class="form-horizontal style-form" method="get">
					<div class="form-group has-warning">
						<label class="col-sm-4 col-sm-4 control-label">기본급(세전)</label>
						<div class="col-sm-4">
							<input type="text" class="form-control text-right" readonly="readonly" ng-model="taxBeforeAmount">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">국민연금</label>
						<div class="col-sm-4">
							<input type="text" class="form-control text-right" readonly="readonly" ng-model="nationalPension">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">건강보험</label>
						<div class="col-sm-4">
							<input type="text" class="form-control text-right" readonly="readonly" ng-model="healthInsurance">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">장기요양</label>
						<div class="col-sm-4">
							<input type="text" class="form-control text-right" readonly="readonly" ng-model="longHealthInsurance">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">고용보험</label>
						<div class="col-sm-4">
							<input type="text" class="form-control text-right" readonly="readonly" ng-model="unemploymentInsurance">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">소득세</label>
						<div class="col-sm-4">
							<input type="text" class="form-control text-right" readonly="readonly" ng-model="incomeTax">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">지방소득세</label>
						<div class="col-sm-4">
							<input type="text" class="form-control text-right" readonly="readonly" ng-model="countryIncomeTax">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-4 col-sm-4 control-label">공제액 합계</label>
						<div class="col-sm-4">
							<input type="text" class="form-control text-right" readonly="readonly" ng-model="totalTaxAmount">
						</div>
					</div>
					
					<div class="form-group has-success">
						<label class="col-sm-4 col-sm-4 control-label">예상 실수령액(월)</label>
						<div class="col-sm-4">
							<input type="text" class="form-control text-right" readonly="readonly" ng-model="taxAfterAmount">
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
</div>
	



<script type="text/javascript">
var app = angular.module("myApp", []);

app.controller("myCtrl", function($scope, $http) {
	$scope.getSalary = function(){		
		var dataObj = {
			yearSalary : unComma($scope.yearSalary) //연봉
			, noTax : unComma($scope.noTax) //비과세액
			, noTaxManCnt : unComma($scope.noTaxManCnt) //비과세액
			, outWorkDivison : $scope.outWorkDivison
		};	
	
		var res = $http.post('/calculator/salary/get', dataObj);
		res.success(function(data, status, headers, config) {
			$scope.taxBeforeAmount = data.taxBeforeAmount + "원";
			$scope.nationalPension = data.nationalPension + "원";
			$scope.healthInsurance = data.healthInsurance + "원";
			$scope.longHealthInsurance = data.longHealthInsurance + "원";
			$scope.unemploymentInsurance = data.unemploymentInsurance + "원";
			$scope.incomeTax = data.incomeTax + "원";
			$scope.countryIncomeTax = data.countryIncomeTax + "원";
			$scope.totalTaxAmount = data.totalTaxAmount + "원";
			$scope.taxAfterAmount = data.taxAfterAmount + "원";
		});
		res.error(function(data, status, headers, config) {
			alert("failure message: " + JSON.stringify({data: data}));
		});		

		$scope.taxAfterAmount='';
	};
	
	$scope.reset = function(){	
		//입력영역
		$scope.yearSalary = "원";
		$scope.noTax = addComma("100000");
		$scope.noTaxManCnt = "1";
		$scope.outWorkDivison = "separate";
		
		//출력영역
		$scope.taxBeforeAmount = "0원";
		$scope.nationalPension = "0원";
		$scope.healthInsurance = "0원";
		$scope.longHealthInsurance = "0원";
		$scope.unemploymentInsurance = "0원";
		$scope.incomeTax = "0원";
		$scope.countryIncomeTax = "0원";
		$scope.totalTaxAmount = "0원";
		$scope.taxAfterAmount = "0원";
	};
	
	$scope.reset();
	
	$scope.$watch("yearSalary", function(newValue, oldValue) {
		$scope.yearSalary = addComma(unComma(newValue));
	});
	
	$scope.$watch("taxBeforeAmount", function(newValue, oldValue) {
		$scope.taxBeforeAmount = addComma(unComma(newValue) + "원");
	});
	
	$scope.$watch("nationalPension", function(newValue, oldValue) {
		$scope.nationalPension = addComma(unComma(newValue) + "원");
	});
	
	$scope.$watch("healthInsurance", function(newValue, oldValue) {
		$scope.healthInsurance = addComma(unComma(newValue) + "원");
	});
	
	$scope.$watch("longHealthInsurance", function(newValue, oldValue) {
		$scope.longHealthInsurance = addComma(unComma(newValue) + "원");
	});
	
	$scope.$watch("unemploymentInsurance", function(newValue, oldValue) {
		$scope.unemploymentInsurance = addComma(unComma(newValue) + "원");
	});
	
	$scope.$watch("incomeTax", function(newValue, oldValue) {
		$scope.incomeTax = addComma(unComma(newValue) + "원");
	});
	
	$scope.$watch("countryIncomeTax", function(newValue, oldValue) {
		$scope.countryIncomeTax = addComma(unComma(newValue) + "원");
	});
	
	$scope.$watch("totalTaxAmount", function(newValue, oldValue) {
		$scope.totalTaxAmount = addComma(unComma(newValue) + "원");
	});
	
	$scope.$watch("taxAfterAmount", function(newValue, oldValue) {
		$scope.taxAfterAmount = addComma(unComma(newValue) + "원");
	});
	
});

var addComma = function(str) {
	str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

var unComma = function(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
</script>

</body>
</html>
