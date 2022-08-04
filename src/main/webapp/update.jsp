<%--
  Created by IntelliJ IDEA.
  User: launc
  Date: 2022-06-29
  Time: 오전 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BBS" %>
<%@ page import="bbs.BBSDAO" %>

<html>
<head>
    <title>게시판 글쓰기</title>
    <meta http-equiv="Content-Type" contant="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width",initial-scale="1">
    <style>
        body{
            background:url("img/게시판 메인배경.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
        h1{
            display: flex;
            justify-content: center;
            color: #EEE3F8;
        }
        .title{
            display: flex;
            justify-content: center;
        }
        .text{
            display: flex;
            justify-content: center;
        }
        .bt{
            display: flex;
            justify-content: center;
        }
        .texthead{
            margin-top: 30px;
            width: 800px;
            height: 50px;
            border-radius: 3px;
            border: 5px solid #F7F8E3;

        }
        .textbody{
            width: 800px;
            height: 600px;
            margin-top: 30px;
            border-radius: 3px;
            border: 5px solid #F7F8E3;
        }
        .container{
            border: 6px solid #d6d2ee;
            width: 830px;
            margin: auto;
            margin-top: 140px;
            border-radius: 10px;
            background: #fcf9f9;
        }
        .bt{

            margin-top: 10px;
        }
        .buttom{
            width: 800px;
            border: 3px solid #ccc8ee;
            background:#ffffff;
        }
    </style>
</head>
<body>
    <%
        String userID=null;

        if(session.getAttribute("userID") != null ){
            userID=(String) session.getAttribute("userID");
        }

        if (userID==null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을하세요.')");
            script.println("location.href=login.jsp()");
            script.println("</script>");
        }

        int bbsID=0;

        if (request.getParameter("bbsID") != null) {
            bbsID= Integer.parseInt(request.getParameter("bbsID"));
        }
        if(bbsID==0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글 입니다.')");
            script.println("location.href=maim.jsp()");
            script.println("</script>");
        }
        BBS bbs=new BBSDAO().getBBS(bbsID);
        if(!userID.equals(bbs.getUserID())){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다.')");
            script.println("location.href=maim.jsp()");
            script.println("</script>");
    }

    %>
    <div class="container">
    <header>
        <h1>게시판 수정 양식</h1>
    </header>
    <form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
        <div class="title">
            <input type="text" name="bbsTitle" class="texthead" placeholder="글내용" value="<%= bbs.getBbsTitle()%>">
        </div>
        <div class="text">
            <textarea type="text" name="bbsContent" class="textbody" placeholder="글 내용"><%= bbs.getBbsContent()%></textarea>
        </div>

        <div class= "bt">
            <input class="buttom" type="submit" value="글수정"/>
        </div>
    </form>
</div>
</body>
</html>
