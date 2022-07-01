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
      border-radius: 10px;
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
  BBS bbs = new BBSDAO().getBBS(bbsID);
%>
<div class="container">
  <header>
    <h1>게시판 글쓰기 양식</h1>
  </header>
  <form action="writeAction.jsp">
    <div class="title">
      <input type="text" name="bbsTitle" class="texthead" placeholder="글내용" >
    </div>
    <div class="text">
      <textarea type="text" name="bbsContent" class="textbody" placeholder="글 내용"></textarea>
    </div>
    <div class="bt">
      <input class="buttom" type="submit" value="글쓰기"/>
    </div>
  </form>
</div>
</body>
</html>
