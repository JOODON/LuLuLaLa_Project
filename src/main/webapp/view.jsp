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
    <h1>게시판 글보기</h1>
  </header>
  <tr>
    <td>글 보기</td>
    <td colspan="2" ><%= bbs.getBbsTitle() %></td>
  </tr>
  <tr>
    <td>작성자</td>
    <td colspan="2" ><%=bbs.getUserID()%></td>
  </tr>
  <tr>
    <td>작성 일자</td>
    <td colspan="2" ><%=bbs.getBbsDate().substring(0,11)+ bbs.getBbsDate().substring(11,13)+"시" + bbs.getBbsDate().substring(14,16)+ "분"%></td>
  </tr>
  <tr>
    <td>내용</td>
    <td colspan="2" ><%=bbs.getBbsContent()%></td>
  </tr>
<a href="main.jsp"> 목록 </a>
  <%
    if( userID !=null && userID.equals(bbs.getUserID())){
  %>
      <a href="update.jsp?bbsID=<%= bbsID %>" > 수정</a>
      <a href="delete.jsp?bbsID=<%= bbsID %>" > 삭제</a>
  <%
  }
  %>

</div>
</body>
</html>
