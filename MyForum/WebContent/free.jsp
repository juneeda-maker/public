<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="free.FreeDAO" %>
<%@ page import="free.Free" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/htm; charset=UTF-8">
<meta name="viewport" content="width = devided-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>DEBATE</title>
<style type="text/css">
	a,a:hover
	{
		color: #000000;
		text-decoration: none;	
	}
</style>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") !=null){
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if(request.getParameter("pageNumber")!=null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
					<%
						FreeDAO freeDAO = new FreeDAO();
						ArrayList<Free> list = freeDAO.getList(pageNumber);
						for(int i = 0; i< list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href = "view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11, 13) + "시"
								+ list.get(i).getBbsDate().substring(14, 16)+ "분" %></td>
					</tr>
					<%
						}					
					%>
				</tbody>
			</table>
			<%
				if(pageNumber !=1){
			%>
				<a href="free.jsp?pageNumber=<%=pageNumber - 1%>"class="btn btn-sucess btn-arrow-left">이전</a> 
			<%	//게시글이 10개 이상 작성 됐을시 이전버튼 생성
				}if(freeDAO.nextPage(pageNumber + 1)){
			%>	
			<a href="free.jsp?pageNumber=<%=pageNumber +1%>"class="btn btn-sucess btn-arrow-left">다음</a>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>