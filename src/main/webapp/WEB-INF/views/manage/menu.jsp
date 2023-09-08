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
        <h1>메뉴목록</h1>
        <div id="treeViewMenu" style="width:400px; height:500px; border:1px solid black; float:left"/>
        <br/>
    </div>

    <button class="btn btn-primary" onclick="testMenu1();">test</button>

    <div class="container2" style="float:right">
        <h1>메뉴 관리</h1>
        <form method="post">
            <div class="form-group">
                <label >메뉴ID</label>
                <input type="text" name="menuId" class="form-control" placeholder="아이디 입력해주세요">
            </div>
            <div class="form-group">
                <label >메뉴명</label>
                <input type="text" name="menuName" class="form-control" placeholder="메뉴명 입력해주세요">
            </div>
            <div class="form-group">
                <label >메뉴URL</label>
                <input type="text" name="menuUrl" class="form-control" placeholder="메뉴URL 입력해주세요">
            </div>
            <div class="form-group">
                <label >메뉴 표시 순서</label>
                <input type="text" name="sort" class="form-control" placeholder="메뉴순서 입력해주세요">
            </div>
            <div class="form-group">
                <label >상위메뉴</label>
                <select name="userAuth" class="form-control" >
                    <option value="">상위메뉴없음(최상위메뉴)</option>
                    <option value="menuId1">메뉴1</option>
                    <option value="menuId1">메뉴2</option>
                    <option value="menuId2">메뉴3</option>
                </select>
            </div>
            <button class="btn btn-primary"">등록/수정</button>
            <button class="btn btn-primary">삭제</button>
        </form>
        <br/>
    </div>
</div>
</body>
<script>
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

    var options = {
        bootstrap2: false,
        showTags: true,
        levels: 5,
        data: data,
        onNodeSelected: function(event, node) {
            alert( node.id );
        },
    };
    $(function() {
        $('#treeViewMenu').treeview(options);
    });
    //tree end
</script>

</html>
