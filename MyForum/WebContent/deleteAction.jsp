<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="free.FreeDAO" %>
<%@ page import="free.Free" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Conten-Type" content="text/html; charset=UTF-8">
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
		script.println("location.href='free.jsp'");
		script.println("</script>");
	}
	Free free = new FreeDAO().getFree(bbsID);
		if(!userID.equals(free.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'free.jsp'");
			script.println("</script>");
	}else{
			FreeDAO freeDAO = new FreeDAO();
			int result = freeDAO.delete(bbsID);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'free.jsp'");
				script.println("</script>");
			}
		}
	
	
	%>
</body>
</html>