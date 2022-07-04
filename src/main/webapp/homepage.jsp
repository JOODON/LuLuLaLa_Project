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
        .text{
            height: 600px;
            width: 800px;
            display: flex;
            justify-content: center;
            border: 5px solid #B5B5B5;
            border-radius: 15px;
            margin: auto;
            margin-top: 30px;
            background: #fcf9f9;

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
        <li class="list1"><a href="login.jsp"> 로그인</a></li>
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
    <div class="textbody">
    <p>안녕하세요! 6월 20일 부터  지금 7월 4일까지 총 14일 약 2주에 거친 포트폴리오를 만들었습니다.
        <br>
    처음에는 그냥 가볍게 생각하고 만들었었는데 생각보다 데이터베이스 관련해서 다루기가 어렵더라고요
        <br>
     데이터 베이스를 구축하는거 부터 시작해서 Tomcat으로 서버 돌리기 그리고 이클리스 강의만 올라와 있어서
        <br>
        강의를 보고 이해하며 인텔리제이라는 개발툴에서 사용하는게 생각보다 어려웠고 이렇게 간단한 게시판이라도
        <br>
        되게 많은 기능이 들어가고 그 기능들을 구축하기 위하여 많은 노력이 필요하단느걸 알았습니다.
        <br>
        앞으로의 공부 계획은 팀플로 코딩 강의 사이트를 한번 더 만들어 볼 생각입니다.
        <br>
        웹 디자인도 배워야될거같고.. JSP로 구축을 해봤기 때문에 스프링으로 넘어가서
        <br>
        더 배워야될거 같습니다. 서블릿도 공부할거구 할게 너무 많지만 하나하나씩 하면서
        <br>
        노력 하며 배워야 될거같습니다.!!
    </p>
    </div>

</div>
</body>
</html>