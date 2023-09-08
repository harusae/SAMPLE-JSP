<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MENU</title>

    <!--grid.js-->
    <script src="/js/gridjs.umd.js"></script>
    <link href="/css/mermaid.min.css" rel="stylesheet"/>
    <!--bootstrap Treeview-->
    <script src="/js/jquery-3.7.1.min.js"></script>
    <script src="/js/bootstrap-treeview.js"></script>
    <link href="/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/css/bootstrap-treeview.css" rel="stylesheet"/>

</head>
<body>
<div class="wrapper">
    <div class="container" style="float:left">
        <h1>권한 별 메뉴 목록</h1>
        <div class="form-group">
            <label >권한</label>
            <select name="userAuth" class="form-control" >
                <option value="">권한을 선택하세요.</option>
                <option value="MANAGER">관리자</option>
                <option value="USER">사용자</option>
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
                <select name="userAuth" class="form-control" >
                    <option value="">메뉴를 선택하세요.</option>
                    <option value="menuId1">메뉴1</option>
                    <option value="menuId2">메뉴1sub1</option>
                    <option value="menuId1">메뉴2</option>
                    <option value="menuId2">메뉴3</option>
                </select>
            </div>
            <button class="btn btn-primary">등록</button>
            <button class="btn btn-primary">삭제</button>
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

    //tree
    var data = [
        {
            id:1,
            text: 'Parent 1',
            href: '#parent1',
            tags: ['4'],
            nodes: [
                {
                    id:2,
                    text: 'Child 1',
                    href: '#child1',
                    tags: ['2'],
                    nodes: [
                        {
                            id:3,
                            text: 'Grandchild 1',
                            href: '#grandchild1',
                            tags: ['0']
                        },
                        {
                            id:4,
                            text: 'Grandchild 2',
                            href: '#grandchild2',
                            tags: ['0']
                        }
                    ]
                },
                {
                    id:5,
                    text: 'Child 2',
                    href: '#child2',
                    tags: ['0']
                }
            ]
        },
        {
            id:6,
            text: 'Parent 2',
            href: '#parent2',
            tags: ['0']
        },
    ];
    $(function() {

        var options = {
            bootstrap2: false,
            showTags: true,
            levels: 5,
            data: data,
            onNodeSelected: function(event, node) {
                alert( node.id );
            },
        };

        $('#treeViewMenuAuth').treeview(options);
    });
    //tree end
</script>

</html>
