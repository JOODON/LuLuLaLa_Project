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
      margin-top: 30px;
      display: flex;
      justify-content: center;
      color: #EEE3F8;
      font-size: 40px;
    }
    .container{
      border: 3px solid #efe9af;
      border-radius: 10px;
      width: 800px;
      height: 850px;
      margin: auto;
      background: #fcf9f9;
    }
    .texthead{
      border: 3px solid #EEE3F8;
      width: 700px;
      display: flex;
      justify-content: space-between;
      margin: auto;

      margin-top: 40px;
    }
    p{
      margin-top: 20px;
      font-size: 14px;
      color: #ACABAB;
    }
    .textbody{
      width: 700px;
      height: 600px;

      margin: auto;
      border-radius: 10px;
      margin-top: 70px;
    }
    .titlehead{
      display: flex;
      justify-content: center;
      border-radius: 10px;
      border: 3px solid #EEE3F8;

    }
    .titlebody{
      display: flex;
      justify-content: center;
      border: 3px solid #f3f1ac;
      border-radius: 10px;
      height: 500px;
      margin-top: 10px;
    }
    a{
      text-decoration-line: none;
      color: #ACABAB;
    }
    .button{
      width: 400px;
      display: flex;
      justify-content:space-between;
      margin: auto;
      margin-top: -50px;
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

  <header>
    <h1>게시판 글보기</h1>
  </header>

  <div class="container">
    <div class="texthead">
      <h3>글 제목</h3>
      <P><%= bbs.getBbsTitle().replaceAll(" ", " &nbsp").replaceAll("<", " &lt;").replaceAll("<", " &gt;").replaceAll("\n", "</br>") %></p>

      <h3 class="textuser">작성자</h3>
      <p><%=bbs.getUserID()%></p>

      <h3 >작성 일자</h3>
    <p><%=bbs.getBbsDate().substring(0,11)+ bbs.getBbsDate().substring(11,13)+"시" + bbs.getBbsDate().substring(14,16)+ "분"%></p>
    </div>

    <div class="textbody">
      <div class="titlehead">
        <h3>내용</h3>
      </div>
      <div class="titlebody">
    <p><%=bbs.getBbsContent().replaceAll(" ", " &nbsp").replaceAll("<", " &lt;").replaceAll("<", " &gt;").replaceAll("\n", "</br>")%></p>
    </div>
  </div>
</div>

<div class="button">
      <a href="main.jsp"> 목록 </a>
  <%
    if( userID !=null && userID.equals(bbs.getUserID())){
  %>
      <a href="update.jsp?bbsID=<%= bbsID %>" > 수정</a>
      <a onclick="return confirm(`정말로 삭제하시겠습니까?`)"href="deleteAction.jsp?bbsID=<%= bbsID %>" > 삭제</a>
  <%
  }
  %>

  </div>
</div>
</body>
</html>
