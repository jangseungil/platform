<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/jsp/common/common.jsp"/>
<html>
<head>
	<title>Test</title>
</head>

<body>

<jsp:include page="/WEB-INF/jsp/common/navbar.jsp">
	<jsp:param name="tab" value="test"/>
</jsp:include>


<div ng-app="myApp" ng-controller="myCtrl" class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">사용자목록</div>
	<div class="panel-body">
		<p>사용자 관리 테스트 페이지 입니다.</p>
	</div>
	
	<div class="navbar-form navbar-right">
		<div class="form-group">
			<input type="text" name="name" class="form-control" placeholder="Search by name..""> 
		</div>
		<button type="button" class="btn btn-default">Submit</button>
	</div>

	<!-- Table -->
	<table class="table">
		<colgroup>
			<col width="10%"/>
			<col width=""/>
			<col width="7%"/>
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="content in contents">
				<td>{{content.no}}</td>
				<td><a href="#gopage" ng-click="gopage(content.link)">{{content.title}}</a></td>
				<td>{{content.time}}</td>
			</tr>
		</tbody>
	</table>
	
	<div id="aaaa">
	</div>
</div>



<script type="text/javascript">
	//angular.js 이용
	var app = angular.module("myApp", []);
	
	app.controller("myCtrl", function($scope, $http) {
		$scope.contents = {};
		
		$http.jsonp("http://localhost:3000/test?callback=JSON_CALLBACK")
		.success(function(data) {
			$scope.contents = data;
		});
		
		
		$scope.gopage = function(link){		
			link = link.replace("http://b.issuein.com/", "");
			console.log(link);
			$http.jsonp("http://localhost:3000/test/view?callback=JSON_CALLBACK&link=" + link)
			.success(function(data) {
				$("#aaaa").children().remove();
				$("#aaaa").append(data);
			});
		};
		
	});
</script>
</html>
