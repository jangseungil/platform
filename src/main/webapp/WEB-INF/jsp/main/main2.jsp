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

	<div class="container">	
		<div class="row">
	
		<div class="jumbotron">
			<h1>공사중... 여기는 main/main2.jsp</h1>
			<p><a href="/board/boardList">게시판</a></p>
		</div>
		
			<div class="col-lg-4">
				<div>
					<p></p>
				</div>
				
				<div>
					<img alt="aa" srcset="/images/sal_cal_1024.jpg 1024w, /images/sal_cal_640.jpg 640w, /images/sal_cal_320.jpg 320w" sizes="(min-width: 36em) 33.3vw, 100vw">
				</div>
			</div>
		
			<div class="col-lg-4">
				<div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
				</div>
				<div class="debt_pannel pn" onclick="mainRouter.goSalary();">
				</div>
			</div>
		
			<div class="col-lg-4">
				<div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
				</div>
				<div class="oil-pannel pn" onclick="mainRouter.goSalary();">
				</div>
			</div>

		</div>
	</div>
	<form name="board" action="/board/boardList">
	<input type="hidden" id="pageNo" name="pageNo"/>
</form>

<script type="text/javascript">
	var mainRouter = {};
	mainRouter.goSalary = function() {
		window.location = "/calculator/salary";
	};
	
</script>

</body>
</html>
