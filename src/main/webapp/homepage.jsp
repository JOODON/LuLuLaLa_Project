<%--
  Created by IntelliJ IDEA.
  User: launc
  Date: 2022-06-28
  Time: 오전 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body{
            background:url("img/게시판 메인배경.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
        header{
            display: flex;
            justify-content: center;
            font-size: 32px;
            border: 3px solid #EEE3F8;
            color: #EEE3F8;
            border-radius: 15px;
            background: #fcf9f9;
        }
        ul{
            display: flex;
            margin-left: 30px;
            justify-content: right;
        }
        a{
            text-decoration-line: none;
            color: #ACABAB;
        }
        li{
            list-style: none;

        }
        .list1,.list2{
            font-size: 20px;
            margin-top: -47px;
            margin-right: 50px;
        }
        ol{
            font-size: 20px;
            margin-top: 5px;
        }
        .link{
            margin-top: 10px;
            border: 5px solid #F7F8E3;
            height: 40px;
            border-radius: 15px;
            background: #fcf9f9;
        }
        .texthead{
            height: 600px;
            width: 800px;
            display: flex;
            justify-content: center;
            border: 5px solid #B5B5B5;
            border-radius: 15px;
            margin: auto;
            margin-top: 70px;
            background: #fcf9f9;
            font-size: 18px;
            color: #ACABAB;
            text-align: center;
        }
    </style>
</head>
<body>
<%
    String userID=null;
    if (session.getAttribute("userID")!= null){
        userID=(String) session.getAttribute("userID");
    }
%>
<header>
    <h1>LuLuLaLa게시판</h1>
</header>
<div class="link">
    <ol class="list">
        <li> <a href="main.jsp">게시판</a></li>
    </ol>
    <%
        if(userID == null){

    %>
    <ul class="list">
        <li class="list1"><a href="login.jsp"> 로그인 </a></li>
        <li class="list2"><a href="setUser.jsp"> 회원가입 </a></li>
    </ul>
</div>
    <%
    }else{


    %>
<ul class="list">
    <li class="list1"><a href="logoutAction.jsp"> 로그아웃</a></li>
</ul>
<%
    }
%>
<div class="text">
        <div class="texthead">
           <h3>LuLuLaLa프로젝트</h3>
        </div>

</div>
</body>
</html>