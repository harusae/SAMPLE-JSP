<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal" />
</sec:authorize>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="icon" href="data:,">
    <link href="/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="/js/jquery-3.7.1.min.js"></script>
</head>

<script>
    function resetPw(){
        if(resetPwFormCheck()){
            commonAjax("/login/resetPw", $("#resetPwForm").serialize(), function(res){
                    alert('변경되었습니다. 다시 로그인해주세요.');
                    location.href = "/logout";
                },
                function (error){
                    console.log("error status : ", error.status);
                    if(error.responseText != ''){
                        alert(error.responseText);
                    }
                    else{
                        alert('변경실패');
                    }
                }
            );
        }
    }

    function resetPwFormCheck(){
        var pw = $("#password").val();
        var num = pw.search(/[0-9]/g);
        var eng = pw.search(/[a-z]/ig);
        var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        if(
            $('#password').val()== '' ||
            $('#password2').val()== ''
        ){
            alert('항목을 모두 입력해야 등록가능합니다.');
            return false;
        }else if($('#password').val() != $('#password2').val()){
            alert('동일한 비밀번호를 입력해주세요.');
            return false;
        }else if(pw.length < 8){
            alert('8자리 이상 입력해주세요.');
            return false;
        }else if(pw.search(/\s/) != -1){
            alert("비밀번호는 공백 없이 입력해주세요.");
            return false;
        }else if(num < 0 || eng < 0 || spe < 0 ){
            alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
            return false;
        }
        return true;
    }

    //초기화
    $(function() {
    });

    //비동기통신 시 세션체크필요 > 공통모듈로 호출
    function commonAjax(url, param, callback, errCallback){
        $.ajax({
            url : url,
            type : "post",
            data : param,
            success : function(res){
                return callback(res);
            },
            error : function (error){
                //console.log('error : ', error);
                if(error.status == '401'){
                    console.log('error status : ', error.status);
                    alert('로그인이 필요합니다.');
                    location.href = '/';
                }
                else if(error.status == '403'){
                    console.log('error status : ', error.status);
                    alert('권한이 필요합니다.');
                }
                else{
                    errCallback(error);
                }
            }
        });
    }
</script>

<body>

<div class="container">
    <h1>비밀번호 변경</h1>
    <form method="post" id="resetPwForm">
        <div class="form-group">
            <label >비밀번호</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="변경할 비밀번호를 입력해주세요">
        </div>
        <div class="form-group">
            <label >비밀번호 확인</label>
            <input type="password" id="password2" name="password2" class="form-control" placeholder="다시 한 번 입력해주세요">
        </div>
    </form>
    <button type="button" class="btn btn-primary" onclick="resetPw();">비밀번호 변경</button>
    <br/>
    <!-- 초기화 대상이 아닌 경우 -->
    <c:if test="${'Y' ne principal.resetYn}">
        <script>
            alert('초기화 대상이 아닙니다.');
            history.back();
        </script>
    </c:if>
</div>

</body>
</html>
