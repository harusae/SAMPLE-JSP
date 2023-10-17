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
    <title>MENU</title>

</head>
<body class="ax-body " data-page-auto-height="true" style="cursor: auto;">
<div id="ax-base-root" data-root-container="true">
    <div class="ax-base-title" role="page-title">
        <h1 class="title"><i class="cqc-browser"></i> 메뉴 관리</h1>
        <p class="desc"></p>
    </div>

    <div class="ax-base-content">
        <div data-page-buttons="">
            <div class="button-warp">
                <!--
                <button type="button" class="btn btn-default" data-page-btn="reload" onclick="window.location.reload();"><i class="cqc-cw"></i></button>
                <button type="button" class="btn btn-info" data-page-btn="search"><i class="cqc-magnifier"></i> 조회 </button>
                -->
                <button type="button" class="btn btn-info" data-page-btn="save" onclick="registMenu();"><i class="cqc-save"></i>등록</button>
                <button type="button" class="btn btn-info" data-page-btn="update" onclick="modifyMenu();"><i class="cqc-upload"></i>수정</button>
                <button type="button" class="btn btn-info" data-page-btn="delete" onclick="deleteMenu();"><i class="cqc-trash"></i>삭제</button>
            </div>
        </div>

        <div data-ax5layout="ax1" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 864px;">
            <div data-split-panel="{width: &quot;300&quot;}" class="split-panel-vertical" style="display: block; width: 300px; left: 0px;">
                <div style="padding-right: 10px;" class="" data-split-panel-wrap="">
                    <div class="ax-button-group" data-fit-height-aside="tree-view-01">
                        <div class="left">
                            <h2><i class="cqc-list"></i>메뉴 목록 </h2>
                        </div>
                        <!--
                        <div class="right">
                            <button type="button" class="btn btn-default" data-tree-view-01-btn="add"><i class="cqc-circle-with-plus"></i> 추가</button>
                        </div>
                        -->
                    </div>
                    <div id="treeViewMenu">
                    </div>
                </div>
            </div>

            <div data-splitter="{}" class="split-panel-vertical" style="display: block; width: 7px; left: 300px;"></div>
            <div data-split-panel="{width: &quot;*&quot;}" id="split-panel-form" class="split-panel-vertical" style="display: block; width: 864px; left: 307px;">
                <div style="padding-left: 10px;" class="" data-split-panel-wrap="">
                    <div data-fit-height-aside="form-view-01">
                        <div class="ax-button-group">
                            <div class="left">
                                <h2><i class="cqc-news"></i>프로그램 설정 </h2>
                            </div>
                            <div class="right">

                            </div>
                        </div>

                        <form method="post" id="menuForm" onsubmit="return false" style="">
                            <div data-ax-tbl="" class="ax-form-tbl" style="">

                                <div data-ax-tr="" class="" style="">
                                    <div data-ax-td="" class="" style=";width:100%">
                                        <div data-ax-td-label="" class="" style=";width:150px">메뉴ID</div>
                                        <div data-ax-td-wrap="">
                                            <input type="text" id="menuId" name="menuId" class="form-control" placeholder="아이디 입력해주세요">
                                        </div>
                                    </div>
                                </div>
                                <div data-ax-tr="" class="" style="">
                                    <div data-ax-td="" class="" style=";width:100%">
                                        <div data-ax-td-label="" class="" style=";width:150px">메뉴명</div>
                                        <div data-ax-td-wrap="">
                                            <input type="text" id="menuName" name="menuName" class="form-control" placeholder="메뉴명 입력해주세요">
                                        </div>
                                    </div>
                                </div>
                                <div data-ax-tr="" class="" style="">
                                    <div data-ax-td="" class="" style=";width:100%">
                                        <div data-ax-td-label="" class="" style=";width:150px">메뉴URL</div>
                                        <div data-ax-td-wrap="">
                                            <input type="text" id="menuUrl" name="menuUrl" class="form-control" placeholder="하위메뉴가 있는 최상위메뉴인 경우 미입력으로 비워주세요.">
                                        </div>
                                    </div>
                                </div>
                                <div data-ax-tr="" class="" style="">
                                    <div data-ax-td="" class="" style=";width:100%">
                                        <div data-ax-td-label="" class="" style=";width:150px">상위메뉴</div>
                                        <div data-ax-td-wrap="">
                                            <select id="upperMenuId" name="upperMenuId" class="form-control" >
                                                <option value="">상위메뉴없음(최상위메뉴)</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div data-ax-tr="" class="" style="">
                                    <div data-ax-td="" class="" style=";width:100%">
                                        <div data-ax-td-label="" class="" style=";width:150px">메뉴 표시 순서</div>
                                        <div data-ax-td-wrap="">
                                            <input type="number" id="menuOrder" name="menuOrder" class="form-control" placeholder="메뉴 표시 순서 입력해주세요">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var menuList = [];

    function registMenu(){
        if($("#menuId").attr("readonly") == 'readonly'){clearMenuForm();}
        else if(menuFormCheck()){
            if(confirm('등록하겠습니까?')){
                commonAjax("/manage/menu/regist", $("#menuForm").serialize(), function(res){
                        getMenuList1();
                        getMenuTree1();
                        getTopMenuList();
                        clearMenuForm();
                        alert('등록되었습니다.');
                    },
                    function (error){
                        alert('등록실패');
                    }
                );
            }
        }
    }
    function modifyMenu() {
        if (menuFormCheck()) {
            if(confirm('변경하겠습니까?')){
                $("#upperMenuId").removeAttr("disabled");
                commonAjax("/manage/menu/modify", $("#menuForm").serialize(), function(res){
                        getMenuList1();
                        getMenuTree1();
                        getTopMenuList();
                        clearMenuForm();
                        alert('변경되었습니다.');
                    },
                    function (error){
                        alert('변경실패');
                    }
                );
            }
        }
    }
    function deleteMenu() {
        if (confirm('삭제하시겠습니까?')) {
            commonAjax("/manage/menu/delete", $("#menuForm").serialize(), function(res){
                    getMenuList1();
                    getMenuTree1();
                    getTopMenuList();
                    clearMenuForm();
                    alert('삭제되었습니다.');
                },
                function (error){
                    if(error.responseText != ''){
                        alert(error.responseText);
                    }
                    else{
                        alert('삭제실패');
                    }
                }
            );
        }
    }

    function getMenuList1() {
        commonAjax("/manage/menu/list", {}, function(res){
            menuList = res;
        });
    }
    function getTopMenuList() {
        commonAjax("/manage/menu/topList", {}, function(res){
            $('#upperMenuId').children('option:not(:first)').remove();
            for(var i=0; i<res.length; i++){
                //console.log('res['+i+'] : ', res[i]);
                $('#upperMenuId').append('<option value="'+res[i].menuId+'">'+res[i].menuName+'</option>');
            }
        });
    }
    function getMenuTree1() {
        commonAjax("/manage/menu/tree", {}, function(res){
            initTree1(res);
        });
    }

    function initTree1(data){
        var options = {
            bootstrap2: false,
            showTags: true,
            levels: 2,
            data: data,
            onNodeSelected: function(event, node) {
                //선택한 tree.nodeid와 동일한 menuid의 정보를 메뉴관리에 표시
                for(var i=0; i<menuList.length; i++){
                    if(menuList[i].menuId == node.id){
                        $('#menuId').val(menuList[i].menuId);
                        $('#menuName').val(menuList[i].menuName);
                        $('#menuUrl').val(menuList[i].menuUrl);
                        $('#menuOrder').val(menuList[i].menuOrder);
                        $('#upperMenuId').val(menuList[i].upperMenuId);
                        $("#menuId").attr("readonly",true); //menuId 변경불가처리
                        $("#upperMenuId").not(":selected").attr("disabled", "disabled"); //upperMenuId 변경불가처리
                        return;
                    }
                }
            },
        };

        $('#treeViewMenu').treeview(options);
    }
    function menuFormCheck(){
        if(
            $('#menuId').val()== '' ||
            $('#menuName').val()== '' ||
            $('#menuOrder').val()== ''
        ){
            alert('상위메뉴를 제외한 다른 항목을 모두 입력해야 등록가능합니다.');
            return false;
        }
        return true;
    }
    function clearMenuForm(){
        //트리에서 데이터틑 선택한 경우 입력폼 초기화 + menuId 입력가능처리
        $('#menuId').val('');
        $('#menuName').val('');
        $('#menuUrl').val('');
        $('#menuOrder').val('');
        $('#upperMenuId').val('');
        $("#menuId").attr("readonly",false);
        $("#upperMenuId").removeAttr("disabled");
    }

    //초기화
    $(function() {
        getMenuList1();
        getTopMenuList();
        getMenuTree1();
    });
</script>

</html>
