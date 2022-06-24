<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="USER.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="USER" class="USER.user" scope="page"/>
<jsp:setProperty name="USER" property="userID"/>
<jsp:setProperty name="USER" property="userPassward"/>
<jsp:setProperty name="USER" property="userName"/>
<jsp:setProperty name="USER" property="userGender"/>
<jsp:setProperty name="USER" property="userEmail"/>

<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" contant="text/html"; charset="UTF-8">
</head>
<body>
<%
    if(USER.getUserID()==null || USER.getUserPassward() ==null || USER.getUserName() == null || USER.getUserGender()==null||USER.getUserEmail()==null ){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력하지 않으신 부분이 있습니다')");
        script.println("history.back()");
        script.println("</script>");
    }
    else {
        userDAO userDAO = new userDAO();
        int result = userDAO.join(USER);
        if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미존재하는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href=main.jsp");
            script.println("</script>");
        }
    }
%>

</body>
</html>
