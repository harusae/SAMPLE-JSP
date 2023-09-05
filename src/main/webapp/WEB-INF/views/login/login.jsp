<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h1>로그인</h1>
    <form method="post" action="/loginPrc">
        <div class="form-group">
            <label >아이디</label>
            <input type="text" name="username" class="form-control" placeholder="아이디 입력해주세요">
        </div>
        <div class="form-group">
            <label >비밀번호</label>
            <input type="password" name="password" class="form-control" placeholder="비밀번호 입력해주세요">
        </div>
        <button type="submit" class="btn btn-primary">로그인</button>
    </form>
    <br/>
</div>

</body>
</html>
