<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <h1>미정 > 정의 후 구현</h1>
        <div id="gridMenuAuth"></div>
        <br/>
    </div>

    <div class="container2" style="float:left">
        <h1>권한 별 메뉴 선택</h1>
        <div class="form-group">
            <label >메뉴명</label>
            <input type="text">
            <label >메뉴명</label>
            <select id="" name="" class="form-control" >
                <option value="">메뉴를 선택하세요.</option>
            </select>
        </div>
        <button class="btn btn-primary" onclick="">등록</button>
        <button class="btn btn-primary" onclick="">삭제</button>
        <br/>
    </div>
</div>
</body>
<script>
    let dataUserList = [];

    function getUserList() {
        commonAjax("/manage/user/list", {}, function(res){
            dataUserList = res;
            initUserGrid(dataUserList);
        });
    }
    function initUserGrid(data){
        const gridUserList = new gridjs.Grid({
            columns:[
                {id: 'userId',name:'ID'},
                {id: 'userName',name:'이름'},
                {id: 'userAuth',name:'권한'},
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
            console.log(Object.keys(args[1]));
            console.log(Object.keys(args[1]._cells));
            console.log(Object.keys(args[1]._cells[0]));
            console.log('args : ', args[1]._cells[0].data);
            console.log('args : ', args[1]._cells[1].data);
            console.log('args : ', args[1]._cells[2].data);
            console.log('args : ', args[1]._cells[3].data);
        });
    }

    //초기화
    $(function() {
        getUserList();
    });
</script>
</html>
