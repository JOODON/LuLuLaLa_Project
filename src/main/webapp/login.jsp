<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" contant="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width",initial-scale="1">
    <script src="https://kit.fontawesome.com/f696815b8c.js" crossorigin="anonymous"></script>
    <title>로그인 페이지</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Titan+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <style>
        body{
            background: #F7F8E3;
        }
        .title{
            margin-top: 100px;
        }
        .h1{
            font-size: 50px;
            color:#EEE3F8;
            font-family: 'Titan One', cursive;
        }
        .container{
            border: 1px solid #B5B5B5;
            width: 396px;
            height: 320px;
            margin:0 auto;
            border-radius: 32px;
            background: #ffffff;
        }
        header{
            display:flex;
            justify-content: center;
        }
        .id{
            margin-top: 12px;
            border:none;
        }
        .passward{
            margin-top: 14px;
            border:none;

        }
        .idbox,.passwardbox{
            width: 366px;
            height: 53px;
            border:solid 1px #B5B5B5;
            border-radius:17px;
            display: flex;
            justify-content:center;
        }
        .idbox{
            margin-top:12px;
            margin-left: 14px;
        }
        .passwardbox{
            margin-top:12px;
            margin-left: 14px;
        }
        .id, .passward{
            width: 307px;
            height: 22px;
            border-radius: 7px;
            background: #F7F8E3;
        }

        .push{
            width: 339px;
            height: 52px;
            border-radius: 14px;
            border: 1px solid #B5B5B5;
            background:#EEE3F8 ;
            color: white;
            font-size: 30px;
        }
        .loginbt{
            display:flex;
            justify-content: center;
            margin-top:15px;
            font-family: 'Black Han Sans', sans-serif;
        }

        #id,#pass{
            margin-top: 15px;
            margin-right: 10px;
        }
        #rename{
            display: flex;
            justify-content:center;
            margin-top: 30px;
            font-family: 'Black Han Sans', sans-serif;
        }
        a{
            text-decoration-line: none;
            color: #B5B5B5;
        }

    </style>
</head>
<body>
<header>
    <h1 class="title"><a class="h1" href="homepage.jsp">LuLuLaLa</a></h1>
</header>

<div class="container">
    <form action="loginAction.jsp">
        <div class="idbox">
            <i id="id" class="fa-regular fa-user"></i>
            <input class="id" type="text" name="userID" placeholder="아이디">
        </div>
        <div class="passwardbox">
            <i id="pass" class="fa-solid fa-lock"></i>
            <input class="passward" type="text" name="userPassward"minlength="4" placeholder="비밀번호">
        </div>
        <div class="loginbt">
            <input class="push" type="submit" value="로그인">
        </div>
    </form>
    <div id="rename">
        <a href="#" >비밀번호 찾기|</a>
        <a href="#" >아이디 찾기|</a>
        <a href="setUser.jsp">회원가입</a>
    </div>
</div>
</body>
</html>