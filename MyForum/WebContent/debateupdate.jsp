<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="debate.Debate" %>
<%@ page import="debate.DebateDAO" %>
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
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int bbsID = 0;
	if (request.getParameter("bbsID") !=null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href='debate.jsp'");
		script.println("</script>");
	}
	Debate free = new DebateDAO().getDebate(bbsID);
		if(!userID.equals(free.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'debate.jsp'");
			script.println("</script>");
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
			
	
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logoutAction.jsp">로그아웃</a></li>
				<li><a href="#">내정보</a></li>
			</ul>
			
		</div>
	</nav>
	<div class="container">
		<div class="row">
		<form method="post" action="debateupdateAction.jsp?bbsID=<%= bbsID %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=free.getBbsTitle() %>"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%=free.getBbsContent() %></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글수정">
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>