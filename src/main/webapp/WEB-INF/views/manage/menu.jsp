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
<body>
<div class="wrapper">
    <div class="container" style="float:left">
        <h1>메뉴목록</h1>
        <p></p>
        <div id="treeViewMenu" style="width:400px; height:500px; border:1px solid black; float:left"/>
        <br/>
    </div>

    <div class="container2" style="float:right">
        <h1>메뉴 관리</h1>
        <form method="post" id="menuForm">
            <div class="form-group">
                <label >메뉴ID</label>
                <input type="text" id="menuId" name="menuId" class="form-control" placeholder="아이디 입력해주세요">
            </div>
            <div class="form-group">
                <label >메뉴명</label>
                <input type="text" id="menuName" name="menuName" class="form-control" placeholder="메뉴명 입력해주세요">
            </div>
            <div class="form-group">
                <label >메뉴URL</label>
                <input type="text" id="menuUrl" name="menuUrl" class="form-control" placeholder="메뉴URL 입력해주세요">
            </div>
            <div class="form-group">
                <label >상위메뉴</label>
                <select id="upperMenuId" name="upperMenuId" class="form-control" >
                    <option value="">상위메뉴없음(최상위메뉴)</option>
                </select>
            </div>
            <div class="form-group">
                <label >메뉴 표시 순서</label>
                <input type="number" id="menuOrder" name="menuOrder" class="form-control" placeholder="메뉴순서 입력해주세요">
            </div>
        </form>
        <button class="btn btn-primary" onclick="registMenu();">등록</button>
        <button class="btn btn-primary" onclick="modifyMenu();">수정</button>
        <button class="btn btn-primary" onclick="deleteMenu();">삭제</button>
        <br/>
    </div>
</div>
</body>
<script>
    var menuList = [];

    function registMenu(){
        if($("#menuId").attr("readonly") == 'readonly'){clearMenuForm();}
        else if(menuFormCheck()){
            commonAjax("/manage/menu/regist", $("#menuForm").serialize(), function(res){
                    getMenuList();
                    getMenuTree();
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
    function modifyMenu() {
        if (menuFormCheck()) {
            $("#upperMenuId").removeAttr("disabled");
            commonAjax("/manage/menu/modify", $("#menuForm").serialize(), function(res){
                    getMenuList();
                    getMenuTree();
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
    function deleteMenu() {
        if (confirm('삭제하시겠습니까?')) {
            commonAjax("/manage/menu/delete", $("#menuForm").serialize(), function(res){
                    getMenuList();
                    getMenuTree();
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

    function getMenuList() {
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
    function getMenuTree() {
        commonAjax("/manage/menu/tree", {}, function(res){
            initTree(res);
        });
    }

    function initTree(data){
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
        getMenuList();
        getTopMenuList();
        getMenuTree();
    });
</script>

</html>
