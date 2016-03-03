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

<p class="bg-primary"></p>

<div class="container">
  <div class="jumbotron">
    <h1>My First Bootstrap Page</h1>
    <p>Resize this responsive page to see the effect!</p> 
  </div>
  <div class="row">
    <div class="col-sm-4">
      <h3>연봉계산기</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>
    <div class="col-sm-4">
      <h3>대출계산기</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>
    <div class="col-sm-4">
      <h3>연비계산기</h3>        
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>
  </div>

	<div class="row">
		<!-- TWITTER PANEL -->
		<div class="col-lg-4 col-md-4 col-sm-4 mb">
			<div class="twitter-panel pn">
				<i class="fa fa-twitter fa-4x"></i>
				<p>Dashgum is here! Take a look and enjoy this new Bootstrap Dashboard theme.</p>
				<p class="user">@Alvrz_is</p>
			</div>
		</div><!-- /col-md-4 -->
			
		<! -- Blog Panel -->
		<div class="col-lg-4 col-md-4 col-sm-4 mb">
			<div class="content-panel pn">
				<div id="blog-bg">
					<div class="badge badge-popular">POPULAR</div>
					<div class="blog-title">Incredible Title</div>
				</div>
				<div class="blog-text">
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. <a href="#">Read More</a></p>
				</div>
			</div>
		</div><!-- /col-md-4-->
		
		
		<div class="col-lg-4 col-md-4 col-sm-4 mb">
			<!-- INSTAGRAM PANEL -->
			<div class="instagram-panel pn">
				<i class="fa fa-instagram fa-4x"></i>
				<p>@THISISYOU<br/>
					5 min. ago
				</p>
				<p><i class="fa fa-comment"></i> 18 | <i class="fa fa-heart"></i> 49</p>
			</div>
		</div><!-- /col-md-4 -->
	</div>

 </div>
<form name="board" action="/board/boardList">
	<input type="hidden" id="pageNo" name="pageNo"/>
</form>

<script type="text/javascript">
</script>

</body>
</html>
