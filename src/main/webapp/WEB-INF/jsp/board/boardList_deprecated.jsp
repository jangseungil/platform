<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="http://www.platform.co.kr" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/jsp/common/common.jsp"/>
<html>
<head>
<title>first</title>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/common/navbar.jsp">
	<jsp:param name="tab" value="test"/>
</jsp:include>


<div ng-app="myApp" ng-controller="myCtrl" class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">게시판	</div>
	
	<div class="navbar-form navbar-right">
		<div class="form-group">
			<input type="text" name="name" class="form-control" placeholder="Search by 제목..""> 
		</div>
		<button type="button" class="btn btn-default">Submit</button>
	</div>
	
	<table class="table">
	    <colgroup>
	        <col width="10%"/>
	        <col width="*"/>
	        <col width="15%"/>
	    </colgroup>
	    <thead>
	        <tr>
	            <th scope="col">글번호</th>
	            <th scope="col">제목</th>
	            <th scope="col">작성일</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:choose>
	            <c:when test="${fn:length(boardList) > 0}">
	                <c:forEach items="${boardList}" var="boardVo">
	                    <tr>
	                        <td>${boardVo.seq}</td>
	                        <td>${boardVo.title} [${boardVo.viewCnt}]</td>
	                        <td>${boardVo.regTime}</td>
	                    </tr>
	                </c:forEach>
	            </c:when>
	            <c:otherwise>
	                <tr>
	                    <td colspan="4">조회된 결과가 없습니다.</td>
	                </tr>
	            </c:otherwise>
	        </c:choose>
	         
	    </tbody>
	</table>
	
	<util:name firstPageNo="${boardVo.firstPageNo}"/>
	
	<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true">
	    <jsp:param name="firstPageNo" value="${boardVo.firstPageNo}" />
	    <jsp:param name="prevPageNo" value="${boardVo.prevPageNo}" />
	    <jsp:param name="startPageNo" value="${boardVo.startPageNo}" />
	    <jsp:param name="pageNo" value="${boardVo.pageNo}" />
	    <jsp:param name="endPageNo" value="${boardVo.endPageNo}" />
	    <jsp:param name="nextPageNo" value="${boardVo.nextPageNo}" />
	    <jsp:param name="finalPageNo" value="${boardVo.finalPageNo}" />
	</jsp:include> 
</div>
 
<form name="board" action="/board/boardList">
	<input type="hidden" id="pageNo" name="pageNo"/>
</form>

<script type="text/javascript">
	var goPage = function (inx) {
		$("#pageNo").val(inx);
		$("form[name=board]").submit();
	};
</script>

</body>
</html>
