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
<body class="ax-body " data-page-auto-height="true">
<div id="ax-base-root" data-root-container="true">
    <div class="ax-base-title" role="page-title">
        <h1 class="title"><i class="cqc-browser"></i> 사용자 관리</h1>
        <p class="desc"></p>
    </div>
    <div class="ax-base-content">
        <div data-page-buttons="">
            <div class="button-warp">
                <button type="button" class="btn btn-default" data-page-btn="reload" onclick="window.location.reload();"><i class="cqc-cw"></i></button>
                <button type="button" class="btn btn-info" data-page-btn="save" onclick="registUser()"><i class="cqc-save"></i>등록</button>
                <button type="button" class="btn btn-info" data-page-btn="update" onclick="modifyUser()"><i class="cqc-upload"></i>수정</button>
            </div>
        </div>
        <div data-ax5layout="ax1" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 879px;">
            <div data-split-panel="{width: &quot;40%&quot;}" class="split-panel-vertical" style="display: block; width: 600px; left: 0px;">
                <div style="padding-right: 10px;" class="" data-split-panel-wrap="">
                    <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                        <div class="left">
                            <h2><i class="cqc-list"></i>
                                사용자 목록
                            </h2>
                        </div>
                        <div class="right"></div>
                    </div>
                    <div data-ax5grid="grid-view-01" data-fit-height-content="grid-view-01" style="height: 839px;">
                        <div id="gridManageUser"></div>
                    </div>
                </div>
            </div>
            <div data-splitter="{}" class="split-panel-vertical" style="display: block; width: 7px; left: 600px;"></div>
            <div data-split-panel="{width: &quot;*&quot;}"  class="split-panel-vertical" style="display: block; width:800px; left: 607px;">
                <div style="padding-left: 10px;" class="" data-split-panel-wrap="scroll">
                    <div class="ax-button-group" role="panel-header">
                        <div class="left">
                            <h2><i class="cqc-news"></i>
                                사용자 정보
                            </h2>
                        </div>
                        <div class="right">
                            <button type="button" class="btn btn-default" id="chkSsoUsrBtn" onclick="chkSsoUsr()">
                                <i class="cqc-erase"></i>
                                SSO연동확인
                            </button>
                        </div>
                    </div>
                    <form name="manageUserForm" id="manageUserForm" method="post" onsubmit="return false" style="">
                        <input type="hidden" id="blntBrno" name="blntBrno"/>
                        <input type="hidden" id="hlfcDscd" name="hlfcDscd"/>

                        <div data-ax-tbl="" class="ax-form-tbl" style="">
                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style=";width:120px">사용자 명</div>
                                    <div data-ax-td-wrap="">
                                        <input type="text" id="userName" name="userName" class="av-required form-control W120">
                                    </div>
                                </div>
                                <div data-ax-td="" class="" style=";width:220px">
                                    <div data-ax-td-label="" class="" style=";width:120px">아이디</div>
                                    <div data-ax-td-wrap="">
                                        <input type="text" id="userId" name="userId"  class="av-required form-control W150">
                                        <input type="hidden" id="ssoChk" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style=";width:120px">비밀번호</div>
                                    <div data-ax-td-wrap="">
                                        <label>
                                            <input type="checkbox" id="pwInit" name="pwInit" value="Y" checked>
                                            비밀번호 초기화
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style=";width:120px">사용여부</div>
                                    <div data-ax-td-wrap="">
                                        <select id="useYn" name="useYn" class="form-control form-control W100" >
                                            <option value="Y">사용</option>
                                            <option value="N">사용안함</option>
                                        </select>
                                    </div>
                                </div>

                                <div data-ax-td="" class="" style=";width:220px">
                                    <div data-ax-td-label="" class="" style=";width:120px">계정상태</div>
                                    <div data-ax-td-wrap="">
                                        <select id="activeYn" name="activeYn" class="form-control null" >
                                            <option value="Y">활성</option>
                                            <option value="N">잠김</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="H5"></div>
                        <div class="ax-button-group sm">
                            <div class="left">
                                <h3>메뉴 그룹 설정</h3>
                            </div>
                        </div>

                        <div data-ax-tbl="" class="ax-form-tbl" style="">
                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:250px">
                                    <div data-ax-td-label="" class="" style="">메뉴 그룹</div>
                                    <div data-ax-td-wrap="">
                                        <select id="userAuth" name="userAuth" class="form-control null " >
                                            <option value="">권한을 선택하세요.</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="H5"></div>
                        <div data-ax-tbl="" class="ax-form-tbl" style="">
                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:250px">
                                    <div data-ax-td-label="" class="" style="">알림 권한</div>
                                    <div data-ax-td-wrap="">
                                        <select id="alarmYn" name="alarmYn" class="form-control null " >
                                            <option value="Y">사용</option>
                                            <option value="N">사용안함</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
<!--
                        <div class="H5"></div>
                        <div class="ax-button-group sm">
                            <div class="left">
                                <h3>권한 그룹 설정</h3>
                            </div>
                        </div>
                        <div data-ax-tbl="" class="ax-form-tbl" style="">
                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:100%">
                                    <div data-ax-td-label="" class="" style="">권한 그룹</div>
                                    <div data-ax-td-wrap="">
                                        <label class="checkbox-inline"><input type="checkbox" name="grpAuthCd" data-ax-path="grpAuthCd" value="S0001"> 소메뉴 권한 </label><label class="checkbox-inline"><input type="checkbox" name="grpAuthCd" data-ax-path="grpAuthCd" value="S0002"> 사용 불가 </label>
                                    </div>
                                </div>
                            </div>
                        </div>
-->
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var gridUserList;
    var dataUserList = [];

    function getUserList() {
        commonAjax("/manage/user/list", {}, function(res){
            dataUserList = res;
            updateUserGrid(dataUserList);
        });
    }
    function getUserAuthList1() {
        commonAjax("/manage/menu/auth/userAuth", {}, function(res){
            $('#userAuth').children('option:not(:first)').remove();
            for(var i=0; i<res.length; i++){
                //console.log('res['+i+'] : ', res[i]);
                $('#userAuth').append('<option value="'+res[i].userAuth+'">'+res[i].userAuthName+'</option>');
            }
        });
    }
    function modifyUser(){
        if(!$('#userId').attr('readonly')){
            alert('수정할 사용자정보를 선택하세요.');
            return false;
        }

        if(manageUserFormCheck()){
            if(confirm('변경하겠습니까?')){
                commonAjax("/manage/user/modify", $("#manageUserForm").serialize(), function(res){
                        alert('변경되었습니다.');
                        getUserList();
                    },
                    function (error){
                        alert('변경실패');
                    }
                );
            }
        }
    }
    function chkSsoUsr(){
        if($('#userId').attr('readonly')){  //사용자 수정을 선택했던 경우 > 입력리셋
            $('#userId').attr('readonly', false);
            $('#userId').val('');
            $('#userName').val('');
            $('#useYn').val('Y');
            $('#activeYn').val('Y');
            $('#userAuth').val('');
            $('#alarmYn').val('Y');
            $('#pwInit').prop('checked', true);
            return false;
        }

        if($('#userId').val() == ''){
            alert('등록할 ID를 입력하세요.');
        }
        else if($('#ssoChk').val() !='checked'){
            var param = {
                'userId': $('#userId').val()
            };
            commonAjax("/manage/user/ssoUsr", param, function(res){
                    $('#userName').val(res.usrNm);
                    $('#blntBrno').val(res.blntBrno);
                    $('#hlfcDscd').val(res.hlfcDscd);
                    alert('등록가능한 사용자입니다.');
                    $('#ssoChk').val('checked');
                    $('#chkSsoUsrBtn').html('<i class="cqc-erase"></i> SSO연동확인(확인완료)');
                },
                function (error){
                    $('#ssoChk').val('failed');
                    $('#chkSsoUsrBtn').html('<i class="cqc-erase"></i> SSO연동확인');
                    if(error.responseText != ''){
                        alert(error.responseText);
                    }
                    else{
                        alert('조회 실패');
                    }
                }
            );
        }
        else{
            alert('등록준비 완료');
        }
    }
    function registUser(){
        if($('#ssoChk').val() !='checked'){
            alert("SSO연동확인을 실행해주세요.");
            return false;
        }

        if(manageUserFormCheck()){
            if(confirm('등록하겠습니까?')){
                commonAjax("/manage/user/regist", $("#manageUserForm").serialize(), function(res){
                        alert('등록되었습니다.');
                        getUserList();
                    },
                    function (error){
                        alert('등록실패');
                    }
                );
            }
        }

    }

    function initUserPw(checkValue){
        //console.log('checkValue : ', checkValue);
        //console.log('checked : ', $('#pwInit').is(":checked"));
        //console.log('userId : ', $('#userId').val());

        if(!$('#userId').attr('readonly')) {  //사용자 등록인 경우 초기화실행으로 고정
            $('#pwInit').prop('checked', true);
            return false;
        }

        if(!$('#pwInit').is(":checked")){
            if(confirm('다시 초기화를 실행하겠습니까?')){
                var param = {
                    'userId': $('#userId').val()
                };
                commonAjax("/manage/user/initPw", param, function(res){
                        getUserList();
                        alert('재초기화되었습니다.');
                    },
                    function (error){
                        if(error.responseText != ''){
                            alert(error.responseText);
                        }
                        else{
                            alert('실행 실패');
                        }
                    }
                );
            };
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
                    getUserList();
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
        else{
            $('#pwInit').prop('checked', false);
        }

    }
    function manageUserFormCheck(){
        if(
            $('#userId').val() == ''||
            $('#userName').val() == ''||
            $('#userAuth').val()== ''
        ){
            alert('아이디/사용자 명/메뉴그룹은 필수입력입니다.');
            return false;
        }

        return true;
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
                if(dataUserList[i].initYn != null && dataUserList[i].initYn == 'Y'){
                    $('#pwInit').prop('checked', true);
                }
                else{
                    $('#pwInit').prop('checked', false);
                }

                $('#userId').attr('readonly', true);
                $('#ssoChk').val('');
                $('#chkSsoUsrBtn').html('<i class="cqc-erase"></i> SSO연동확인');
            }
        }
    }
    function initUserGrid(data){
        gridUserList = new gridjs.Grid({
            columns:[
                {id: 'userId',name:'ID'},
                {id: 'userName',name:'사용자 명'},
                {id: 'userAuthName',name:'권한'},
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
        }).render(document.getElementById("gridManageUser"));
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
    function updateUserGrid(data){
        gridUserList.updateConfig({
            search: false,
            pagination: false,
            data: data
        }).forceRender();
    }

    $('#pwInit').change(function(){
        initUserPw(this.value);
    });
    $('#userId').change(function(){
        $('#ssoChk').val('changed');
        $('#chkSsoUsrBtn').html('<i class="cqc-erase"></i> SSO연동확인');
    })

    //초기화
    $(function() {
        initUserGrid(dataUserList);
        getUserList();
        getUserAuthList1();
    });
</script>
</html>
