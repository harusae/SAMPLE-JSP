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
    <title>USER</title>

</head>
<body>
<div class="wrapper">
    <div class="container" style="float:left; width:60%;">
        <h1>사용자 관리</h1>
        <div id="gridMenuAuth"></div>
        <br/>
    </div>

    <div class="container2" style="float:left">
        <h1>사용자 정보</h1>
        <form method="post" id="userForm">
            <div class="form-group">
                <label >사용자 명</label>
                <input type="text" id="userName" name="userName" class="form-control">
            </div>
            <div class="form-group">
                <label >ID</label>
                <input type="text" id="userId" name="userId" class="form-control">
            </div>
            <div class="form-group">
                <label >비밀번호</label>
                <input type="password" id="password" name="password" class="form-control">
            </div>
            <div class="form-group">
                <label >비밀번호 확인</label>
                <input type="password" id="password2" name="password2" class="form-control">
                <input type="checkbox" id="pwChange" name="pwChange">비밀번호 변경
                <input type="checkbox" id="pwInit" name="pwReset">비밀번호 초기화
            </div>
            <div class="form-group">
                <label >사용여부</label>
                <select id="useYn" name="useYn" class="form-control" >
                    <option value="Y">사용</option>
                    <option value="N">사용안함</option>
                </select>
            </div>
            <div class="form-group">
                <label >계정상태</label>
                <select id="activeYn" name="activeYn" class="form-control" >
                    <option value="Y">활성</option>
                    <option value="N">잠김</option>
                </select>
            </div>
            <div class="form-group">
                <label >비고</label>
                <input type="text" id="" name="" class="form-control">
            </div>
            <div class="form-group">
                <label >메뉴그룹</label>
                <select id="userAuth" name="userAuth" class="form-control" >
                    <option value="">권한을 선택하세요.</option>
                </select>
            </div>
            <div class="form-group">
                <label >알림권한</label>
                <select id="alarmYn" name="alarmYn" class="form-control" >
                    <option value="Y">사용</option>
                    <option value="N">사용안함</option>
                </select>
            </div>
        </form>
        <button class="btn btn-primary" onclick="">등록</button>
        <button class="btn btn-primary" onclick="">저장</button>
        <br/>
    </div>
</div>
</body>
<script>
    var dataUserList = [];

    function getUserList() {
        commonAjax("/manage/user/list", {}, function(res){
            dataUserList = res;
            initUserGrid(dataUserList);
        });
    }

    function getUserAuthList1() {
        commonAjax("/manage/menu/auth/userAuth", {}, function(res){
            $('#userAuth').children('option:not(:first)').remove();
            for(var i=0; i<res.length; i++){
                //console.log('res['+i+'] : ', res[i]);
                $('#userAuth').append('<option value="'+res[i].userAuth+'">'+res[i].userAuth+'</option>');
            }
        });
    }

    function setUserInfo(userId){
        //console.log('setUserInfo : ', userId);
        for(var i=0; i<dataUserList.length; i++){
            if(dataUserList[i].userId == userId){
                //console.log('dataUserList[i] : ', dataUserList[i]);
                $('#userName').val(dataUserList[i].userName);
                $('#userId').val(dataUserList[i].userId);
                $('#useYn').val(dataUserList[i].useYn);
                $('#activeYn').val(dataUserList[i].activeYn);
                $('#userAuth').val(dataUserList[i].userAuth);
                $('#alarmYn').val(dataUserList[i].alarmYn);

            }
        }
    }

    function initUserPw(checkValue){
        console.log('checkValue : ', checkValue);
        console.log('checked : ', $('#pwInit').is(":checked"));
        console.log('userId : ', $('#userId').val());
        if(!$('#pwInit').is(":checked")){
            alert('실행한 초기화는 취소할 수 없습니다.');
            $('#pwInit').prop('checked', true);
        }else if($('#userId').val() == ''){
            alert('비밀번호 초기화할 사용자를 선택하세요.');
            $('#pwInit').prop('checked', false);
        }
        else if(confirm('사용자의 비밀번호를 초기화하겠습니까?')){
            var param = {
                'userId': $('#userId').val()
            };
            commonAjax("/manage/user/initPw", param, function(res){
                    alert('초기화되었습니다.');
                },
                function (error){
                    if(error.responseText != ''){
                        alert(error.responseText);
                    }
                    else{
                        alert('실행 실패');
                    }
                    $('#pwInit').prop('checked', false);
                }
            );
        }

    }

    function initUserGrid(data){
        const gridUserList = new gridjs.Grid({
            columns:[
                {id: 'userId',name:'ID'},
                {id: 'userName',name:'사용자 명'},
                {id: 'userAuth',name:'권한'},
                {id: 'useYn',name:'사용여부'},
                {id: 'activeYn',name:'계정상태'},
                /*{
                    name: '삭제',
                    formatter: (cell, row) => {
                        return gridjs.h('button', {
                            className: 'py-2 mb-4 px-4 border rounded-md text-white bg-blue-600',
                            onClick: () => alert(row.cells[0].data +':'+row.cells[1].data)
                        }, '삭제');
                    }
                },*/
            ],
            data: data,
            pagination: {
                limit: 10
            },
            resizable: true,
            search: true,
            sort: true
        }).render(document.getElementById("gridMenuAuth"));
        gridUserList.on('rowClick', (...args) => {
            /*
            console.log(Object.keys(args[1]));
            console.log(Object.keys(args[1]._cells));
            console.log(Object.keys(args[1]._cells[0]));
            console.log('args : ', args[1]._cells[0].data);
            console.log('args : ', args[1]._cells[1].data);
            console.log('args : ', args[1]._cells[2].data);
            console.log('args : ', args[1]._cells[3].data);
            */
            setUserInfo(args[1]._cells[0].data);
        });
    }

    $('#pwInit').change(function(){
        initUserPw(this.value);
    });

    //초기화
    $(function() {
        getUserList();
        getUserAuthList1();
    });
</script>
</html>
