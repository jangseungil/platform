<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="http://www.platform.co.kr" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/jsp/common/common.jsp"/>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <link rel="icon" href="../../favicon.ico">
	 <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">    
    <!-- Custom styles for this template -->
    <!-- <link href="jumbotron.css" rel="stylesheet">  -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>main2</title>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Number.com</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
      	<br />
        <p>Number.com is going to be the most famous web site in the world!</p>
        <p><a class="btn btn-primary btn-lg" href="/board/boardList" role="button">Board &raquo;</a></p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4" style="text-align:center;">
          <div>
			<img alt="연봉계산기" class="img-rounded img-responsive" style="cursor:pointer;" onclick="mainRouter.goSalary();" src="/images/sal_cal_320.jpg">
			<br />
		  </div>
          <!-- <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>  -->
        </div>
         <div class="col-md-4" style="text-align:center;">
          <div>
			<img alt="연봉계산기" class="img-rounded img-responsive" style="cursor:pointer;" onclick="mainRouter.goSalary();" src="/images/sal_cal_320.jpg">
			<br />
		  </div>
          <!-- <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>  -->
        </div>
         <div class="col-md-4" style="text-align:center;">
          <div>
			<img alt="연봉계산기" class="img-rounded img-responsive" style="cursor:pointer;" onclick="mainRouter.goSalary();" src="/images/sal_cal_320.jpg">
		  </div>
          <!-- <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>  -->
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; Company 2016</p><p style="font-size:9pt;">대표이사: 정규민, 장승일, 김건</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!-- <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>  -->
    
    <script src="<c:url value='/js/common/common.js'/>" charset="utf-8"></script>
    
    <script type="text/javascript">
   	 	var mainRouter = {};
		mainRouter.goSalary = function() {
			window.location = "/calculator/salary";
		};
    </script>
  </body>
</html>
