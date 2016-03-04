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
	
		<div class="jumbotron">
			<h1>정규민, 김건, 장승일의 보금자리 입니다.</h1>
			<p>혼자있고 싶으니까 나가주세요!</p>
		</div>
		
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 mb">
				<div>
					<h3>salary calculator</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
				</div>
				<div class="twitter-panel pn" onclick="mainRouter.goSalary();">
					<i class="fa fa-twitter fa-4x"></i>
					<p>calculate your salary</p>
					<p class="user">@Jang</p>
				</div>
			</div>

			<! -- Blog Panel -->
			<div class="col-lg-4 col-md-4 col-sm-4 mb">
				<div>
					<h3>debt calculator</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
				</div>
				<div class="content-panel pn">
					<div id="blog-bg">
						<div class="blog-title">Incredible Title</div>
					</div>
					<div class="blog-text">
						<p>
							Lorem Ipsum is simply dummy text of the printing and typesetting
							industry. <a href="#">Read More</a>
						</p>
					</div>
				</div>
			</div>


			<div class="col-lg-4 col-md-4 col-sm-4 mb">
				<div>
					<h3>car oil rate calculator</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
				</div>
				<div class="instagram-panel pn">
					<i class="fa fa-instagram fa-4x"></i>
					<p>
						@THISISYOU<br /> 5 min. ago
					</p>
					<p>
						<i class="fa fa-comment"></i> 18 | <i class="fa fa-heart"></i> 49
					</p>
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
