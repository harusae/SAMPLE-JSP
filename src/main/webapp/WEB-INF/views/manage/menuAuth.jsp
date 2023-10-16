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
        <h1 class="title"><i class="cqc-browser"></i>권한 별 메뉴 관리</h1>
        <p class="desc"></p>
    </div>

    <div class="ax-base-content">
        <div data-page-buttons="">
            <div class="button-warp">
                <button type="button" class="btn btn-info" data-page-btn="save" onclick="registAuthMenu();"><i class="cqc-save"></i>등록</button>
                <button type="button" class="btn btn-info" data-page-btn="delete" onclick="deleteAuthMenu();"><i class="cqc-trash"></i>삭제</button>
            </div>
        </div>

        <div role="page-header">
            <form method="post" id="authMenuForm" >
                <div data-ax-tbl="" id="" class="ax-search-tbl" style="">
                    <div data-ax-tr="" id="" class="" style="">
                        <div data-ax-td="" id="" class="" style=";width:300px">
                            <div data-ax-td-label="" class="" style="">권한</div>
                            <div data-ax-td-wrap="">
                                <select id="userAuthSelected" name="userAuthSelected" class="form-control" >
                                    <option value="">권한을 선택하세요.</option>
                                </select></div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="H10"></div>
        </div>

        <div data-ax5layout="ax1" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 864px;">
            <div data-split-panel="{width: &quot;300&quot;}" id="" class="split-panel-vertical" style="display: block; width: 300px; left: 0px;">
                <div style="padding-right: 10px;" class="" data-split-panel-wrap="">
                    <div class="ax-button-group" data-fit-height-aside="tree-view-01">
                        <div class="left">
                            <h2><i class="cqc-list"></i>권한 별 메뉴 목록 </h2>
                        </div>
                        <div class="right">
                        </div>
                    </div>
                    <div id="treeViewMenuAuth"></div>
                </div>
            </div>

            <div data-splitter="{}" class="split-panel-vertical" style="display: block; width: 7px; left: 300px;"></div>
            <div data-split-panel="{width: &quot;*&quot;}" id="split-panel-form" class="split-panel-vertical" style="display: block; width: 864px; left: 307px;">
                <div style="padding-left: 10px;" class="" data-split-panel-wrap="">
                    <div data-fit-height-aside="form-view-01">
                        <div class="ax-button-group">
                            <div class="left">
                                <h2><i class="cqc-news"></i>권한 별 메뉴 선택 </h2>
                            </div>
                            <div class="right">

                            </div>
                        </div>
                        <form name="formView01" id="formView01" method="post" onsubmit="return false" style="">
                            <div data-ax-tbl="" id="" class="ax-form-tbl" style="">
                                <div data-ax-tr="" id="" class="" style="">
                                    <div data-ax-td="" id="" class="" style=";width:100%">
                                        <div data-ax-td-label="" class="" style=";width:150px">메뉴명</div>
                                        <div data-ax-td-wrap="">
                                            <select id="userAuthMenu" name="userAuthMenu" class="form-control" >
                                                <option value="">메뉴를 선택하세요.</option>
                                            </select>
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
<!--
<div class="wrapper">
    <div class="container" style="float:left">
        <h1>권한 별 메뉴 목록</h1>
        <div class="form-group" id="authMenuForm">
            <label >권한</label>
            <select id="userAuthSelected" name="userAuthSelected" class="form-control" >
                <option value="">권한을 선택하세요.</option>
            </select>
        </div>

        <div id="treeViewMenuAuth" style="width:400px; height:500px; border:1px solid black; float:left"/>
        <br/>
    </div>

    <div class="container2" style="float:right">
        <h1>권한 별 메뉴 선택</h1>
            <div class="form-group">
                <label >메뉴명</label>
                <select id="userAuthMenu" name="userAuthMenu" class="form-control" >
                    <option value="">메뉴를 선택하세요.</option>
                </select>
            </div>
            <button class="btn btn-primary" onclick="registAuthMenu();">등록</button>
            <button class="btn btn-primary" onclick="deleteAuthMenu();">삭제</button>
        <br/>
    </div>
</div>
-->
</body>
<!-- script for chart/grid (오브젝트 아래위치에서 작성해야 동작) -->
<script>

    function registAuthMenu(){
        if(menuAuthFormCheck()){
            var param = {
                'userAuth': $('#userAuthSelected').val(),
                'userAuthMenu': $('#userAuthMenu').val()
            };
            commonAjax("/manage/menu/auth/regist", param, function(res){
                    getMenuTree2($('#userAuthSelected').val());
                    alert('등록되었습니다.');
                },
                function (error){
                    alert('등록실패');
                }
            );
        }
    }
    function deleteAuthMenu(){
        if(menuAuthFormCheck()){
            var param = {
                'userAuth': $('#userAuthSelected').val(),
                'userAuthMenu': $('#userAuthMenu').val()
            };
            commonAjax("/manage/menu/auth/delete", param, function(res){
                    getMenuTree2($('#userAuthSelected').val());
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

    function getUserAuthList() {
        commonAjax("/manage/menu/auth/userAuth", {}, function(res){
            $('#userAuthSelected').children('option:not(:first)').remove();
            for(var i=0; i<res.length; i++){
                //console.log('res['+i+'] : ', res[i]);
                $('#userAuthSelected').append('<option value="'+res[i].userAuth+'">'+res[i].userAuthName+'</option>');
            }
        });
    }
    function getMenuList2() {
        commonAjax("/manage/menu/list", {}, function(res){
            $('#userAuthMenu').children('option:not(:first)').remove();
            for(var i=0; i<res.length; i++){
                //console.log('res['+i+'] : ', res[i]);
                var menuName = res[i].upperMenuId ? '- '+res[i].menuName : res[i].menuName;
                $('#userAuthMenu').append('<option value="'+res[i].menuId+'">'+menuName+'</option>');
            }
        });
    }
    function getMenuTree2(userAuthValue) {
        commonAjax("/manage/menu/tree", {'userAuth': userAuthValue}, function(res){
                initTree2(res);
        });
    }

    function initTree2(data){
        var options = {
            bootstrap2: false,
            showTags: true,
            levels: 2,
            data: data,
            onNodeSelected: function(event, node) {
                //console.log( node.id );
                $('#userAuthMenu').val(node.id);
            },
        };

        $('#treeViewMenuAuth').treeview(options);
    }
    function menuAuthFormCheck(){
        if($('#userAuthSelected').val()== '' || $('#userAuthMenu').val()== '' ){
            alert('권한과 메뉴명을 선택하세요.');
            return false;
        }
        return true;
    }

    //select 변경 시 이벤트 처리
    $('#userAuthSelected').change(function(){
       getMenuTree2(this.value);
    });

    //초기화
    $(function() {
        getUserAuthList();
        getMenuList2();

    });
    //tree end
</script>

</html>
