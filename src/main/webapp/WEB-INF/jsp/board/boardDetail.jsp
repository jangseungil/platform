<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <table class="board_view">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <caption>게시글 상세</caption>
        <tbody>
            <tr>
                <th scope="row">글 번호</th>
                <td>${map.TITLE }</td>
                <th scope="row">조회수</th>
                <td>${map.VIEW_CNT }</td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td>${map.REG_ID }</td>
                <th scope="row">작성시간</th>
                <td>${map.REG_TIME }</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${map.TITLE }</td>
            </tr>
            <tr>
                <td colspan="4">${map.CONTENTS }</td>
            </tr>
        </tbody>
    </table>
     
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
    <a href="#this" class="btn" id="delete">삭제하기</a>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
             
            $("#update").on("click", function(e){
                e.preventDefault();
                fn_openBoardUpdate();
            });
            
            $("#delete").on("click", function(e){
            	e.preventDefault();
            	fn_deleteBoard();
            });
        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/boardList' />");
            comSubmit.submit();
        }
         
        function fn_openBoardUpdate(){
        	return;
        	
            var seq = "${map.SEQ}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/boardUpdate' />");
            comSubmit.addParam("SEQ", seq);
            comSubmit.submit();
        }
        
        function fn_deleteBoard(){
        	var seq = "${map.SEQ}";
        	var comSubmit = new ComSubmit();
        	
        	comSubmit.setUrl("<c:url value='/board/deleteBoard' />");
        	comSubmit.addParam("SEQ", seq);
        	
        	comSubmit.submit();
        }
    </script>
</body>
</html>