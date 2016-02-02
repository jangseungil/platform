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
		<tbody id="contensBody">
		</tbody>
	</table>
</div>

<script type="text/javascript">

	$.ajax({
		url: "http://localhost:3000/test",
		dataType : "jsonp"
	}).success(function(obj) {
		for(var i=0, len=obj.length; i<len; i++) {
			console.log(obj[i].no);
			var contents =  "<tr>" +
							"	<td><a href'/issuein/list'>"+ obj[i].no +"</a></td>" +
							"	<td>"+obj[i].title+"</td>" +
							"	<td>"+obj[i].time+"</td>" +
							"</tr>";
			
			$("#contensBody").append(contents);
						
		}
	});
	
</script>
</html>
