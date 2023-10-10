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
                <button type="button" class="btn btn-info" data-page-btn="search"><i class="cqc-magnifier"></i> 조회 </button>
                <button type="button" class="btn btn-info" data-page-btn="save"><i class="cqc-save"></i> 저장</button>
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
                        <div id="gridMenuAuth"></div>
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
                            <button type="button" class="btn btn-default" data-form-view-01-btn="form-clear">
                                <i class="cqc-erase"></i>
                                신규
                            </button>
                        </div>
                    </div>
                    <form name="formView01" id="formView01" method="post" onsubmit="return false" style="">

                        <input type="hidden" name="act_tp" id="act_tp" value="">
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
                                    </div>
                                </div>
                            </div>
                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style=";width:120px">비밀번호</div>
                                    <div data-ax-td-wrap="">
                                        <input type="password" id="password" name="password" class="form-control W120" value="" readonly="readonly">
                                    </div>
                                </div>
                                <div data-ax-td="" class="" style=";width:460px">
                                    <div data-ax-td-label="" class="" style=";width:120px">비밀번호 확인</div>
                                    <div data-ax-td-wrap="">
                                        <input type="password" id="password2" name="password2" class="form-control inline-block W120" value="" readonly="readonly">
                                        &nbsp;
                                        <label>
                                            <input type="checkbox" id="pwChange" name="pwChange" value="Y">
                                            비밀번호 변경
                                        </label>
                                        <label>
                                            <input type="checkbox" id="pwInit" name="pwReset" value="Y">
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

                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:100%">
                                    <div data-ax-td-label="" class="" style=";width:120px">비고</div>
                                    <div data-ax-td-wrap="">
                                        <input type="text" name="remark" data-ax-path="remark" maxlength="100" class="form-control" value="">
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
                console.log('pwInit : ', dataUserList[i].resetYn);
                if(dataUserList[i].resetYn != null && dataUserList[i].resetYn == 'Y'){
                    $('#pwInit').prop('checked', true);
                }
                else{
                    $('#pwInit').prop('checked', false);
                }

            }
        }
    }

    function initUserPw(checkValue){
        //console.log('checkValue : ', checkValue);
        //console.log('checked : ', $('#pwInit').is(":checked"));
        //console.log('userId : ', $('#userId').val());
        if(!$('#pwInit').is(":checked")){
            if(confirm('다시 초기화를 실행하겠습니까?')){
                var param = {
                    'userId': $('#userId').val()
                };
                commonAjax("/manage/user/initPw", param, function(res){
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
