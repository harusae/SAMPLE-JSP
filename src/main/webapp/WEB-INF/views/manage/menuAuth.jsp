<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <h1>권한 별 메뉴 목록</h1>
        <div class="form-group" id="authMenuForm">
            <label >권한</label>
            <select id="userAuth" name="userAuth" class="form-control" >
                <option value="">권한을 선택하세요.</option>
            </select>
        </div>
        <!--
        <div id="gridMenuAuth"></div>
        -->

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
</body>
<!-- script for chart/grid (오브젝트 아래위치에서 작성해야 동작) -->
<script>
/*
    let dataMenuAuth = [
        ["사용자", "메뉴1", "/menu1", null],
        ["사용자", "메뉴1sub1", "/menu1/sub1", null],
        ["관리자", "메뉴1", "/menu1", null],
        ["관리자", "메뉴1sub1", "/menu1/sub1", null],
        ["관리자", "관리메뉴1", "/manage/menu1", null],
        ["관리자", "관리메뉴2", "/manage/menu2", null],

    ];

    const gridMenu = new gridjs.Grid({
        columns: ["권한", "메뉴ID", "메뉴명",
            {
                name: '삭제',
                formatter: (cell, row) => {
                    return gridjs.h('button', {
                        className: 'py-2 mb-4 px-4 border rounded-md text-white bg-blue-600',
                        onClick: () => alert(row.cells[0].data +':'+row.cells[1].data)
                    }, '삭제');
                }
            },],
        data: dataMenuAuth,
        pagination: {
            limit: 10
        },
        resizable: true,
        search: true,
        sort: true
    }).render(document.getElementById("gridMenuAuth"));
*/

    function registAuthMenu(){
        if(menuAuthFormCheck()){
            $.ajax({
                url : "/manage/authMenu/regist",
                type : "post",
                data : {
                    'userAuth': $('#userAuth').val(),
                    'userAuthMenu': $('#userAuthMenu').val()
                },
                dataType : "json",
                success : function(res){
                    //console.log('registMenu res : ', res);
                    getMenuTree($('#userAuth').val());
                    alert('등록되었습니다.');
                },
                error : function (res){
                    //console.log('error : ', res);
                    alert('등록실패');
                }
            });

        }
    }
    function deleteAuthMenu(){
        if(menuAuthFormCheck()){
            $.ajax({
                url : "/manage/authMenu/delete",
                type : "post",
                data : {
                    'userAuth': $('#userAuth').val(),
                    'userAuthMenu': $('#userAuthMenu').val()
                },
                dataType : "json",
                success : function(res){
                    //console.log('registMenu res : ', res);
                    getMenuTree($('#userAuth').val());
                    alert('삭제되었습니다.');
                },
                error : function (res){
                    //console.log('error : ', res);
                    if(res.responseText != ''){
                        alert(res.responseText);
                    }
                    else{
                        alert('삭제실패');
                    }
                }
            });

        }

    }

    function getUserAuthList() {
        $.ajax({
            url : "/manage/authMenu/userAuth",
            type : "post",
            data : {},
            success : function(res){
                $('#userAuth').children('option:not(:first)').remove();
                for(var i=0; i<res.length; i++){
                    //console.log('res['+i+'] : ', res[i]);
                    $('#userAuth').append('<option value="'+res[i].userAuth+'">'+res[i].userAuth+'</option>');
                }
            },
            error : function (res){
                //console.log('error : ', res);
            }
        });
    }
    function getMenuList() {
        $.ajax({
            url : "/manage/menu/list",
            type : "post",
            data : {},
            success : function(res){
                $('#userAuthMenu').children('option:not(:first)').remove();
                for(var i=0; i<res.length; i++){
                    //console.log('res['+i+'] : ', res[i]);
                    $('#userAuthMenu').append('<option value="'+res[i].menuId+'">'+res[i].menuName+'</option>');
                }
            },
            error : function (res){
            }
        });
    }
    function getMenuTree(userAuth) {
        $.ajax({
            url : "/manage/menu/tree",
            type : "post",
            data : {'userAuth': userAuth},
            success : function(res){
                //console.log('getMenuTree res : ', res);
                initTree(res);
            },
            error : function (res){
                //console.log('error : ', res);
            }
        });
    }

    function initTree(data){
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
        if($('#userAuth').val()== '' || $('#userAuthMenu').val()== '' ){
            alert('권한과 메뉴명을 선택하세요.');
            return false;
        }
        return true;
    }

    //select 변경 시 이벤트 처리
    $('#userAuth').change(function(){
       getMenuTree(this.value);
    });

    //초기화
    $(function() {
        getUserAuthList();
        getMenuList();

    });
    //tree end
</script>

</html>
