<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/htm; charset=UTF-8">
<meta name="viewport" content="width = devided-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>DEBATE</title>
</head>
<body>
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
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px; ">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
						<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>
	</div>
</body>
</html>