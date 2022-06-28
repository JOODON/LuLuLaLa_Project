<%--
  Created by IntelliJ IDEA.
  User: launc
  Date: 2022-06-22
  Time: 오후 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" contant="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width",initial-scale="1">
    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <title>로그인 페이지</title>
    <style>
        header{
            border: solid 15px #EEE3F8;
            border-radius: 17px;
            height: 100px;
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
            margin-top: 20px;
            margin-right: 330px;
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
            border: 15px solid #F7F8E3;
            height: 500px;
            width: 830px;
            border-radius: 20px;
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
    <ul class="header">
        <li class="title">LuLuLaLa게시판</li>
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

            <tr>
                <td class="td1" width="100"><p>1</p></td>
                <td height="40" width="300" class="td2"><p>자기 소개 글</p></td>
                <td class="td3" width="200"><p>주동호</p></td>
                <td class="td4" width="200"><p>2022.06.27</p></td>
            </tr>
        </table>
    </div>
</div>
<%
    if(userID != null){

%>
<a class="bton" href="#">
    <input class="bt" type="submit" value="글쓰기"/>
</a>
<%
    }
%>
</body>
</html>