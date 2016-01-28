<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/jsp/common/common.jsp"/>
<html ng-app="helloApp">
<head>
	<title>Test</title>
</head>

<body ng-controller="CompanyCtrl">

<jsp:include page="/WEB-INF/jsp/common/navbar.jsp">
	<jsp:param name="tab" value="test"/>
</jsp:include>


<div class="panel panel-default">
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
			<tr>
				<td><a href="/issuein/list"></a></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</div>

<script type="text/javascript">

	
</script>
</html>
