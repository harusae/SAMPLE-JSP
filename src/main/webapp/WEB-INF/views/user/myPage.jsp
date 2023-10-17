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
    <title>마이페이지</title>

</head>
<body class="ax-body " data-page-auto-height="true">
<div id="ax-base-root" data-root-container="true">
    <div class="ax-base-title" role="page-title">
        <h1 class="title"><i class="cqc-browser"></i> 마이페이지</h1>
        <p class="desc"></p>
    </div>
    <div class="ax-base-content">
        <div data-page-buttons="">
            <div class="button-warp">
                <button type="button" class="btn btn-default" data-page-btn="reload" onclick="window.location.reload();"><i class="cqc-cw"></i></button>
                <button type="button" class="btn btn-info" data-page-btn="update" onclick="modifyMyPageInfo()"><i class="cqc-upload"></i>수정</button>
            </div>
        </div>

        <div role="page-header">
            <form name="myPageForm" id="myPageForm" method="post" onsubmit="return false;" style="">

                <div data-ax-tbl="" class="ax-search-tbl" style="">

                    <div data-ax-tr="" class="" style="">
                        <div data-ax-td="" id="" class="" style=";width:400px">
                            <div data-ax-td-label="" class="" style=";width:120px">기존 비밀번호</div>
                            <div data-ax-td-wrap="">
                                <input type="password" id="myPagePassword" name="myPagePassword" class="form-control inline-block W120" disabled>
                                &nbsp;
                                <label>
                                    <input type="checkbox" id="myPagePwChange" name="myPagePwChange" value="Y">
                                    비밀번호 변경
                                </label>
                            </div>
                        </div>
                    </div>

                    <div data-ax-tr="" class="" style="">
                        <div data-ax-td="" id="" class="" style=";width:280px">
                            <div data-ax-td-label="" class="" style=";width:120px">바꿀 비밀번호</div>
                            <div data-ax-td-wrap="">
                                <input type="password" id="myPagePassword1" name="myPagePassword1" class="form-control W120" disabled>
                            </div>
                        </div>

                        <div data-ax-td="" id="" class="" style=";width:400px">
                            <div data-ax-td-label="" class="" style=";width:120px">바꿀 비밀번호 확인</div>
                            <div data-ax-td-wrap="">
                                <input type="password" id="myPagePassword2" name="myPagePassword2" class="form-control inline-block W120" disabled>
                            </div>
                        </div>
                    </div>

                    <div data-ax-tr="" class="" style="">
                        <div data-ax-td="" class="" style=";width:175px">
                            <div data-ax-td-label="" class="" style=";width:120px">알림 권한</div>
                            <div data-ax-td-wrap="">
                                <div class="form-inline">
                                    <div class="form-group">
                                        <select id="myPageAlarmYn" name="myPageAlarmYn" class="form-control null " >
                                            <option value="Y">사용</option>
                                            <option value="N">사용안함</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </form>
        </div>
     </div>
</div>
</body>
<script>
    function getMyPageInfo() {
        commonAjax("/myPage/info", {}, function(res){
            $('#myPageAlarmYn').val(res.alarmYn);
            $('#myPagePassword').val('');
            $('#myPagePassword1').val('');
            $('#myPagePassword2').val('');
            $('#myPagePassword').attr("disabled", true);
            $('#myPagePassword1').attr("disabled", true);
            $('#myPagePassword2').attr("disabled", true);
            $('#myPagePwChange').prop("checked", false);
        });
    }

    function modifyMyPageInfo(){

        if( !$('#myPagePwChange').is(":checked") ||
            ($('#myPagePwChange').is(":checked") && myPageFormCheck())
        ){
            if(confirm("변경하겠습니까?")){
                commonAjax("/myPage/changeInfo", $("#myPageForm").serialize(), function(res){
                        alert('변경되었습니다.');
                        getMyPageInfo();
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
    }

    function myPageFormCheck(){
        var pw = $("#myPagePassword1").val();
        var num = pw.search(/[0-9]/g);
        var eng = pw.search(/[a-z]/ig);
        var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        if(
            $('#myPagePassword').val()== '' ||
            $('#myPagePassword1').val()== '' ||
            $('#myPagePassword2').val()== ''
        ){
            alert('항목을 모두 입력해야 비밀번호 변경이 가능합니다.');
            return false;
        }else if($('#myPagePassword1').val() != $('#myPagePassword2').val()){
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

    $('#myPagePwChange').change(function(){
        console.log("change :", $('#myPagePwChange').is(":checked"));
       if($('#myPagePwChange').is(":checked")){
           $('#myPagePassword').attr("disabled", false);
           $('#myPagePassword1').attr("disabled", false);
           $('#myPagePassword2').attr("disabled", false);
       }
       else{
           $('#myPagePassword').attr("disabled", true);
           $('#myPagePassword1').attr("disabled", true);
           $('#myPagePassword2').attr("disabled", true);
       }
    });

    //초기화
    $(function() {
        getMyPageInfo();
    });
</script>
</html>
