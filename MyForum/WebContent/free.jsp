<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/htm; charset=UTF-8">
<meta name="viewport" content="width = devided-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>DEBATE</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") !=null){
		userID = (String) session.getAttribute("userID");
	}
	%>    
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="main.jsp">DEBATE</a>
		</div>
		<div class="collapse navbar-collapse" id="bs example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="best.jsp">인기글</a></li>
				<li><a href="debate.jsp">자유토론게시판</a></li>
				<li><a href="free.jsp">막글게시판</a></li>
				<li><a href="qa.jsp">질문건의게시판</a></li>
			</ul>
			<%
				if(userID == null){ //로그인상태가 아닐
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
			<%
				}else{ //로그인상태
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logoutAction.jsp">로그아웃</a></li>
				<li><a href="#">내정보</a></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>안녕하세요</td>	
						<td>홍길동</td>
						<td>2017-05-04</td>  
					</tr>
				</tbody>
			</table>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>