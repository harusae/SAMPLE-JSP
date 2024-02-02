<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/default.css">
    <link rel="stylesheet" type="text/css" href="css/new_page.css">
    <link rel="stylesheet" href="font-awesome/css/all.min.css">
</head>
<body>

<div class="login_box">
    <h1><a href="#">
        LOGIN
        <!--<img src="/img/img01.jpg" alt="Pixabay로부터 입수된 alhh님의 이미지 입니다."></a>-->
    </h1>
    <form method="post" action="/loginPrc">
        <div class="form-group">
            <label >아이디</label>
            <input type="text" name="username" class="form-control" placeholder="아이디 입력해주세요">
        </div>
        <div class="form-group">
            <label >비밀번호</label>
            <input type="password" name="password" class="form-control" placeholder="비밀번호 입력해주세요">
        </div>
        <div class="btn_group">
            <button type="submit" class="btn btn-primary">로그인</button>
        </div>
    </form>
    <br/>
    <!-- 로그인 실패 처리 -->
    <c:if test="${not empty errorMsg}">
        <script>
            alert('${errorMsg}');
            history.back();
        </script>
    </c:if>
</div>

</body>
</html>
