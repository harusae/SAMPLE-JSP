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
    <title>키워드 관리</title>

</head>
<body class="ax-body " data-page-auto-height="true">
<div id="ax-base-root" data-root-container="true">
    <div class="ax-base-title" role="page-title">
        <h1 class="title"><i class="cqc-browser"></i> 키워드 관리</h1>
        <p class="desc"></p>
    </div>
    <div class="ax-base-content">
        <div data-page-buttons="">
            <div class="button-warp">
                <button type="button" class="btn btn-default" data-page-btn="reload" onclick="window.location.reload();"><i class="cqc-cw"></i></button>
                <button type="button" class="btn btn-info" data-page-btn="search" onclick="getKeywordList();"><i class="cqc-magnifier"></i> 조회 </button>
                <button type="button" class="btn btn-info" data-page-btn="save" onclick="registManageKeyword();"><i class="cqc-save"></i>등록</button>
                <button type="button" class="btn btn-info" data-page-btn="update" onclick="modifyManageKeyword();"><i class="cqc-upload"></i>수정</button>
                <button type="button" class="btn btn-info" data-page-btn="excel" onclick="onBtnExport();"><i class="cqc-file-excel-o"></i> 엑셀</button>
                <button type="button" class="btn btn-fn1" data-page-btn="fn1" onclick="deleteManageKeyword();"><i class="cqc-minus"></i> 삭제</button>
            </div>
        </div>
        <!-- 검색바 -->
        <div role="page-header">
            <form name="searchKeywordForm" id="searchKeywordForm" method="post" onsubmit="javascript:return false;" style="">
                <div data-ax-tbl="" class="ax-search-tbl" style="">
                    <div data-ax-tr="" class="" style="">
                        <div class="right">
                            <div data-ax-td="" class="" style=";width:300px">
                                <div data-ax-td-label="" class="" style="">키워드</div>
                                <div data-ax-td-wrap="">
                                    <input type="text" id="searchKeyword" name="searchKeyword" class="form-control form-control" placeholder="검색어를 입력하세요">
                                </div>
                            </div>
                            <div data-ax-td="" class="" style=";width:300px">
                                <div data-ax-td-label="" class="" style="">키워드유형</div>
                                <div data-ax-td-wrap="">
                                    <select id="searchDicType" name="searchDicType" data-ax-path="keyType" class="form-control W140">
                                        <option value="">전체</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="H10"></div>
        </div>

        <div data-ax5layout="ax1" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 739px;">
            <div data-split-panel="{width: &quot;50%&quot;}" class="split-panel-vertical" style="display: block; width: 945px; left: 0px;">
                <div style="padding-right: 10px;" class="" data-split-panel-wrap="">
                    <!-- 목록 -->
                    <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                        <div class="left">
                            <h2><i class="cqc-list"></i>
                                키워드 목록
                            </h2>
                        </div>
                        <div class="right"></div>
                    </div>
                    <div data-ax5grid="grid-view-01" data-fit-height-content="grid-view-01" style="height: 699px;">
                        <div id="gridManageKeyword"></div>
                    </div>
                </div>
            </div>

            <div data-splitter="{}" class="split-panel-vertical" style="display: block; width: 7px; left: 945px;"></div>

            <div data-split-panel="{width: &quot;*&quot;}" class="split-panel-vertical" style="display: block; width: 451px; left: 952px;">
                <div style="padding-left: 10px;" class="" data-split-panel-wrap="scroll">
                    <!-- 폼 -->
                    <div class="ax-button-group" role="panel-header">
                        <div class="left">
                            <h2><i class="cqc-news"></i>
                                상세정보
                            </h2>
                        </div>
                        <!--
                        <div class="right">
                            <button type="button" class="btn btn-default" data-form-view-01-btn="form-clear">
                                <i class="cqc-erase"></i>
                                신규
                            </button>
                        </div>
                        -->
                    </div>

                    <form id="manageKeywordForm" name="manageKeywordForm" method="post" onsubmit="return false">
                        <div data-ax-tbl="" class="ax-form-tbl" style="">
                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style="">ID</div>
                                    <div data-ax-td-wrap="">
                                        <input type="text" id="dicId" name="dicId" class="form-control" readonly="readonly" placeholder="자동입력">
                                    </div>
                                </div>
                            </div>
                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style="">키워드유형</div>
                                    <div data-ax-td-wrap="">
                                        <select id="dicType" name="dicType" class="form-control form-control W140 ">
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style="">키워드</div>
                                    <div data-ax-td-wrap="">
                                        <input type="text" id="keyword" name="keyword" data-ax-path="keyword" class="form-control" placeholder="키워드 입력해주세요">
                                    </div>
                                </div>
                            </div>
                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style="">사용여부</div>
                                    <div data-ax-td-wrap="">
                                        <select id="keywordUseYn" name="keywordUseYn" class="form-control form-control W100">
                                            <option value="Y">사용</option>
                                            <option value="N">사용안함</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div data-ax-tr="" class="" style="">
                                <div data-ax-td="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style="">정렬순서</div>
                                    <div data-ax-td-wrap="">
                                        <input type="number" id="keywordSortOrder" name="keywordSortOrder" class="form-control" placeholder="키워드 순서 입력해주세요">
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
</body>
<script>
    var gridManageKeywordList;
    var dataKeywordList = [];
    var deleteKeywordTargetList = [];

    function getDicTypeList() {
        var param = {
            'groupCd': 'TADIC'
        };
        commonAjax("/manage/keyword/code", param, function(res){
            $('#searchDicType').children('option:not(:first)').remove();
            $('#dicType').children('option:not(:first)').remove();
            for(var i=0; i<res.length; i++){
                //console.log('res['+i+'] : ', res[i]);
                $('#searchDicType').append('<option value="'+res[i].code+'">'+res[i].name+'</option>');
                $('#dicType').append('<option value="'+res[i].code+'">'+res[i].name+'</option>');
            }
        });
    }
    function getKeywordList() {
        var param = {
            'searchKeyword': $('#searchKeyword').val(),
            'searchDicType': $('#searchDicType').val()
        };
        commonAjax("/manage/keyword/list", param, function(res){
            dataKeywordList = res;
            updateGridManageKeyword(dataKeywordList);
        });
    }
    function setManageKeywordInfo(dicId){
        for(var i=0; i<dataKeywordList.length; i++){
            if(dataKeywordList[i].dicId == dicId){
                $('#dicId').val(dataKeywordList[i].dicId);
                $('#dicType').val(dataKeywordList[i].dicType);
                $('#keyword').val(dataKeywordList[i].keyword);
                $('#keywordUseYn').val(dataKeywordList[i].useYn);
                $('#keywordSortOrder').val(dataKeywordList[i].sortOrder);
            }
        }
    }

    function registManageKeyword(){
        if($('#dicId').val() != ''){
            clearManageKeywordForm();
        }
        else if(manageKeywordFormCheck()){
            if(confirm('등록하겠습니까?')){
                commonAjax("/manage/keyword/regist", $("#manageKeywordForm").serialize(), function(res){
                        getKeywordList();
                        clearManageKeywordForm();
                        alert('등록되었습니다.');
                    },
                    function (error){
                        alert('등록실패');
                    }
                );
            }
        }
    }
    function modifyManageKeyword() {
        if($('#dicId').val() == ''){
            alert('수정할 키워드를 선택하세요.');
            return false;
        }

        if (manageKeywordFormCheck()) {
            if(confirm('변경하겠습니까?')){
                commonAjax("/manage/keyword/modify", $("#manageKeywordForm").serialize(), function(res){
                        getKeywordList();
                        clearManageKeywordForm();
                        alert('변경되었습니다.');
                    },
                    function (error){
                        alert('변경실패');
                    }
                );
            }
        }
    }
    function deleteManageKeyword(){
        if(deleteKeywordTargetList.length < 1){
            alert("삭제할 키워드를 선택하세요.");
            return false;
        }
        if(confirm(deleteKeywordTargetList.length+"개의 키워드를 삭제하겠습니까?")){
            var param = {
                'deleteKeywordTargetList': deleteKeywordTargetList.toString()
            };
            commonAjax("/manage/keyword/delete", param, function(res){
                    getKeywordList();
                    clearManageKeywordForm();
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
    function onBtnExport() {
        if(confirm('엑셀 다운로드하겠습니까?')){
            var wb = new ExcelJS.Workbook();
            var workbookName = "keyword.xlsx";
            var worksheetName = "키워드 목록";
            var ws = wb.addWorksheet(worksheetName,
                {
                    properties: {
                        tabColor: {argb:'FFFF0000'}
                    }
                }
            );
            ws.columns = [
                {
                    key: "keyword",
                    header: "키워드",
                    width: 20
                },
                {
                    key: "dicType",
                    header: "키워드유형",
                    width: 15,
                    style: { numFmt: '"£"#,##0.00;[Red]-"£"#,##0.00' }
                },
                {
                    key: "useYn",
                    header: "사용여부",
                    width: 10,
                    outlineLevel: 1 ,
                    hidden: false
                },
                {
                    key: "sortOrder",
                    header: "정렬순서",
                    width: 10,
                    outlineLevel: 1 ,
                    hidden: false
                },
            ];
            ws.addRows(dataKeywordList);
            wb.xlsx.writeBuffer()
                .then(function(buffer) {
                    saveAs(
                        new Blob([buffer], { type: "application/octet-stream" }),
                        workbookName
                    );
                });
        }
    }

    function initGridManageKeyword(data){
        $('#gridManageKeyword').append("<div id='gridManageKeywordSub'></div>");
        gridManageKeywordList = new gridjs.Grid({
            columns:[
                {
                    id: 'chk',
                    name: '삭제선텍',
                    width: '110px',
                    plugin: {
                        component: gridjs.plugins.selection.RowSelection
                    }
                },
                {id: 'dicId',name:'ID', hidden: true},
                {id: 'keyword',name:'키워드'},
                {id: 'dicTypeName',name:'키워드유형'},
                {id: 'useYn',name:'사용여부'},
                {id: 'sortOrder',name:'정렬순서'},
            ],
            data: data,
            pagination: {
                limit: 5
            },
            search: true,
            sort: true
        }).render(document.getElementById("gridManageKeywordSub"));
        gridManageKeywordList.on('rowClick', (...args) => {
            setManageKeywordInfo(args[1]._cells[1].data);
        });
        gridManageKeywordList.config.store.subscribe(function (state) {
            deleteKeywordTargetList = [];
            //선택된 체크박스가 있는 경우
            if(state.rowSelection){
                var selectedIds = state.rowSelection.rowIds;
                var key = Array.from(gridManageKeywordList.config.pipeline.cache.keys())[2];
                var tableData = gridManageKeywordList.config.pipeline.cache.get(key).rows;
                for (let i = 0; i < selectedIds.length; i++) {
                    for (let j = 0; j < tableData.length; j++) {
                        if (selectedIds[i] == tableData[j].id) {
                            //console.log('Match: ', tableData[j].cells[1].data);
                            deleteKeywordTargetList.push(tableData[j].cells[1].data);
                        }
                    }
                }
            }
        })
    }
    function updateGridManageKeyword(data){
        $('#gridManageKeywordSub').remove();
        initGridManageKeyword(data);
    }

    function manageKeywordFormCheck(){
        if(
            $('#keyword').val() == '' ||
            $('#keywordSortOrder').val() == ''
        ){
            alert('키워드/정렬순서를 입력해주세요.');
            return false;
        }
        return true;
    }
    function clearManageKeywordForm(){
        //트리에서 데이터틑 선택한 경우 입력폼 초기화 + menuId 입력가능처리
        $('#dicId').val('');
        $('#dicType').val('INTEREST');
        $('#keyword').val('');
        $('#keywordUseYn').val('Y');
        $('#keywordSortOrder').val('');
    }

    //초기화
    $(function() {
        initGridManageKeyword(dataKeywordList);
        getDicTypeList();
        getKeywordList();
    });
</script>
</html>
