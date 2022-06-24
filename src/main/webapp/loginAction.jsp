<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="USER.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="USER" class="USER.user" scope="page"/>
<jsp:setProperty name="USER" property="userID"/>
<jsp:setProperty name="USER" property="userPassward"/>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" contant="text/html"; charset="UTF-8">
</head>
<body>
    <%
        userDAO userDAO=new userDAO();
        int result = userDAO.login(USER.getUserID(), USER.getUserPassward());
        if(result==1){
            PrintWriter script=response.getWriter();
            script.println("<script>");
            script.println("location.href='main.jsp'");
            script.println("</script>");
        }
        else if (result==0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else if (result==-1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else if (result==-2) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류가 발생했습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
    %>
</body>
</html>
