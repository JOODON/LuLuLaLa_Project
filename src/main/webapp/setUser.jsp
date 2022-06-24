<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="Styleseet" href="Style.css">
    <title>회원가입</title>
    <style>
        body{
            background-image:  url("img/image (2) (1).png");
            background-position: center;
            background-repeat:no-repeat;
        }
        *{
            margin: 0%;
        }
        header{
            display: flex;
            justify-content: center;
            margin-top: 150px;
            color: #D7BFE6;
            font-size: 10px;

        }
        .user{
            display: flex;
            justify-content: center;
            color: #D7BFE6;
            font-size: 30px;
        }
        input{
            width: 450px;
            height: 43px;
            background-color: #F7F8E3;
            border: none;
            color:#D7BFE6;
            border-radius: 7px;
        }
        #id,#passward,#name,#gender,#email{
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .container{
            border: 1px solid #B5B5B5;
            border-radius: 14px;
            width: 500px;
            height: 400px;
            margin: auto;
            margin-top: 20px;
        }
        .makebt{
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        #inputbt{
            background:#D7BFE6;
            color: #F7F8E3;
        }
    </style>
</head>
<body>
<header>
    <h3 class="titlelogo">LULULALA</h3>
</header>
<div class="user">
    <h1 class="set_user">회원가입</h1>
</div>
<div class="container">
    <form action="setUserAction.jsp">
        <div id="id">
            <input type="text" value="아이디" id="idinput" name="userID">
        </div>
        <div id=passward>
            <input type="text" value="비밀번호"id="psinput" name="userPassward" minlength="4">
        </div>
        <div id="name">
            <input type="text" value="이름"id="nameinput" name="userName" >
        </div>
        <div id="gender">
            <input type="text" value="성별"id="genderinput" name="userGender">
        </div>
        <div id="email">
            <input type="text" value="이메일"id="mailinput" name="userEmail" minlength="10">
        </div>
        <div class="makebt">
            <input type="submit" value="계정만들기" id="inputbt">
        </div>
    </form>
</div>
</body>
</html>