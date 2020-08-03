<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.CommentDAO" %>
<%@ page import="debate.DebateDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comment" class="comment.Comment" scope="page" />
<jsp:setProperty name="comment" property="content" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String ruserID = null;
	if(session.getAttribute("ruserID")!=null){
		ruserID = (String)session.getAttribute("ruserID");
	}
	if(ruserID == null){ //로그아웃 상태로 글 작성 시도시
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else{
		if(comment.getContent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 채워주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			CommentDAO commentDAO = new CommentDAO();
			int result = commentDAO.write(comment.getContent(), ruserID);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('댓글작성에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'view.jsp'");
				script.println("</script>");
			}
		}
	}
	%>
</body>
</html>