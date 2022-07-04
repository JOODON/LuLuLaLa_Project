<%--
  Created by IntelliJ IDEA.
  User: launc
  Date: 2022-06-22
  Time: 오후 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BBSDAO" %>
<%@ page import="bbs.BBS"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" contant="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width",initial-scale="1">
    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <title>로그인 페이지</title>
    <style>
        body{
            background:url("img/게시판 메인배경.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
        header{
            border: solid 3px #EEE3F8;
            border-radius: 17px;
            height: 100px;
            background: #fcf9f9;
        }
        .header{
            font-size: 50px;
            display: flex;
            margin-top:15px;
            font-weight: 800;
            list-style: none;
            justify-content: center;
        }
        .title{
            color: #EEE3F8;
        }
        .table{
            display: flex;
            justify-content: center;
        }
        .sotitle{
            display: flex;
            justify-content: center;
            font-size: 28px;
            font-weight: 900;
            color: #EEE3F8;
            margin-top: 10px;
        }
        table{
            margin-top: 30px;
            border-collapse: collapse;

        }
        td{
            background: #EEE3F8;
            border: solid 1px #EEE3F8;

        }
        th{
            border-radius: 10px;
            border: solid 3px #F7F8E3;
            background:#F7F8E3;
        }
        .bt{
            width: 100px;
            height: 45px;
            border-radius: 10px;
            border:none;
            background: #E3E7F8;
        }
        .bton{
            display: flex;
            justify-content: right;
            margin-top: -40px;
            margin-right: 10%;
        }
        bton{
            text-underline:none;
        }
        p{
            display: flex;
            justify-content: center;
        }
        a{
            text-decoration-line: none;
        }
        .container{
            margin: auto;
            margin-top: 100px;
            border: 8px solid #F7F8E3;
            height: 800px;
            width: 830px;
            border-radius: 30px;
            background: #fcf9f9;
        }
        a{
            list-style: none;
            color: black;
        }
        .btn-left,.btn-right{
            background: #F7F8E3;
            color: #ACABAB;
            height: 45px;
            width: 100px;
            display: flex;
            justify-content: center;
            margin-left: 10%;
            border-radius: 10px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
<%
    String userID=null;
    if (session.getAttribute("userID")!= null){
        userID=(String) session.getAttribute("userID");
    }
    int pageNumber=1;
    if(request.getParameter("pageNumber") != null ){
        pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
    }
%>
<header>
    <ul class="header">
        <li class="t1"><a class="title" href="homepage.jsp">LuLuLaLa게시판</a></li>
    </ul>
</header>
<div class="container">
    <div class="sotitle">
        LULULALA
    </div>
    <div class="table">
        <table border="1">

            <th width="100" height="30" >번호</th>
            <th width="300">제목</th>
            <th width="200">작성자</th>
            <th width="200">작성일</th>
        <%
            BBSDAO bbsdao=new BBSDAO();
            ArrayList<BBS> list =bbsdao.getList(pageNumber);
            for (int i=0; i< list.size(); i++){

        %>
            <tr>
                <td class="td1" width="100"><p><%= list.get(i).getBbsID() %></p></td>
                <td height="40" width="300" class="td2"><p><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>" > <%= list.get(i).getBbsTitle().replaceAll(" ", " &nbsp").replaceAll("<", " &lt;").replaceAll("<", " &gt;").replaceAll("\n", "</br>")%> </a></p></td>
                <td class="td3" width="200"><p><%=list.get(i).getUserID()%></p></td>
                <td class="td4" width="200"><p><%= list.get(i).getBbsDate().substring(0,11)+ list.get(i).getBbsDate().substring(11,13)+"시" + list.get(i).getBbsDate().substring(14,16)+ "분" %></p></td>
            </tr>
        <%
            }
        %>
        </table>
    </div>

<%
    if (pageNumber !=1){

%>
<a href="main.jsp?pageNumber=<%= pageNumber - 1 %>"class="btn-left"> <p> 이전 </p></a>
<%
    }if (bbsdao.nextPage(pageNumber+1)){
%>
<a href="main.jsp?pageNumber=<%= pageNumber + 1 %>"class="btn-right"> <p> 다음 </p> </a>
<%
    }if(userID != null){

%>
<div class="bton" >
    <a href="write.jsp"><input class="bt" type="button" value="글쓰기"/></a>
</div>
<%
    }
%>
</body>
</html>