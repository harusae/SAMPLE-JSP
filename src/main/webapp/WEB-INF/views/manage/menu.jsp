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
            <div data-split-panel="{width: &quot;300&quot;}" id="" class="split-panel-vertical" style="display: block; width: 300px; left: 0px;">
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
                                <h2>
                                    <i class="cqc-news"></i>
                                    프로그램 설정 </h2>
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
                                            <input type="text" id="menuUrl" name="menuUrl" class="form-control" placeholder="메뉴URL 입력해주세요">
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
                                <!--
                                <div data-ax-tr="" id="" class="" style="">
                                    <div data-ax-td="" id="" class="" style=";width:100%">
                                        <div data-ax-td-label="" class="" style=";width:150px">메뉴ID</div>
                                        <div data-ax-td-wrap="">
                                            <input type="text" data-ax-path="progCd" class="form-control" value="" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                                <div data-ax-tr="" id="" class="" style="">
                                    <div data-ax-td="" id="" class="" style=";width:100%">
                                        <div data-ax-td-label="" class="" style=";width:150px">다국어 설정</div>
                                        <div data-ax-td-wrap="">
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <label>한국어</label>
                                                    <input type="text" data-ax-path="multiLanguageJson.ko" class="form-control ">
                                                </div>
                                                <div class="form-group">
                                                    <label>English</label>
                                                    <input type="text" data-ax-path="multiLanguageJson.en" class="form-control ">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div data-ax-tr="" id="" class="" style="">
                                    <div data-ax-td="" id="" class="" style=";width:100%">
                                        <div data-ax-td-label="" class="" style=";width:150px">프로그램 명</div>
                                        <div data-ax-td-wrap="">

                                            <input type="hidden" data-ax-path="menuId" class="form-control" value="122">
                                            <input type="hidden" data-ax-path="progNm" class="form-control" value="키워드 검색">
                                            <div class="form-group">
                                                <div data-ax5combobox="progCd" data-ax5combobox-config="{size: &quot;&quot;, editable: false, multiple: false}"><select tabindex="-1" class="form-control " name="progCd"><option value=""></option><option value="api">API(api)</option><option value="ax5ui-sample">UI 템플릿(ax5ui-sample)</option><option value="axboot-js">[API]axboot.js(axboot-js)</option><option value="category_total">감성분석 현황(category_total)</option><option value="system-config-common-code">공통코드 관리(system-config-common-code)</option><option value="keyword_monitoring">관심키워드분석(keyword_monitoring)</option><option value="notSessionUser">권한없음(notSessionUser)</option><option value="sense_analysis">긍부정 업무(소분류/대분류/전체)(sense_analysis)</option><option value="basic">기본 템플릿(basic)</option><option value="large_neg_call">대분류별부정콜추이(large_neg_call)</option><option value="dashboard">대시보드(dashboard)</option><option value="login">로그인(login)</option><option value="counsel_type_compare">리스크분석(counsel_type_compare)</option><option value="system-config-menu">메뉴 관리(system-config-menu)</option><option value="customer_shout">민원 멀티스크린 연계(customer_shout)</option><option value="sense_analysis_neg">부정 키워드/부정문장(sense_analysis_neg)</option><option value="category_pos_call">분류별 긍정콜 현황(category_pos_call)</option><option value="category_neg_call">분류별 부정콜 현황(category_neg_call)</option><option value="system-auth-user">사용자 관리(system-auth-user)</option><option value="dictionary_mng">사전관리(dictionary_mng)</option><option value="counsel_qa_mng">상담품질관리(counsel_qa_mng)</option><option value="counsel_qa_statistics">상담품질통계(counsel_qa_statistics)</option><option value="horizontal-layout">상하 레이아웃(horizontal-layout)</option><option value="realtime_view_popup">실시간 전광판_팝업(realtime_view_popup)</option><option value="realtime_keyword">실시간급상승키워드(realtime_keyword)</option><option value="realtime_view">실시간전광판(realtime_view)</option><option value="realtime_view_sum">실시간전광판썸뱅크(realtime_view_sum)</option><option value="rule_pass_ob">아웃바운드규정준수(rule_pass_ob)</option><option value="popkeyword_analysis">업무별인기키워드분석(popkeyword_analysis)</option><option value="system-operation-log">에러로그 관리(system-operation-log)</option><option value="sales_lead_cs">영업점연계_CS(sales_lead_cs)</option><option value="biz_branch">영업점연계_영업점(biz_branch)</option><option value="kind_emp">우수상담직원(kind_emp)</option><option value="analysis_subcate_ib">인바운드 상담시간별 소분류분석(analysis_subcate_ib)</option><option value="rule_pass_ib">인바운드규정준수(rule_pass_ib)</option><option value="common_jijum_modal">점번검색(common_jijum_modal)</option><option value="vertical-layout">좌우 레이아웃(vertical-layout)</option><option value="customer_shout_sales">주요 민원 현황(customer_shout_sales)</option><option value="small_count">주요업무분석(small_count)</option><option value="small_count_sum">주요업무분석썸뱅크(small_count_sum)</option><option value="chart_sample">차트 샘플(chart_sample)</option><option value="keyword_search" selected="selected">키워드 검색(keyword_search)</option><option value="keyword_mng">키워드 관리(keyword_mng)</option><option value="tab-layout">탭 레이아웃(tab-layout)</option><option value="page-structure">페이지 구조(page-structure)</option><option value="system-config-program">프로그램 관리(system-config-program)</option></select><div class="form-control  ax5combobox-display default" data-ax5combobox-display="ax5combobox-42" data-ax5combobox-instance="8" style="min-width: 964px;">
                                                    <div class="ax5combobox-display-table" data-els="display-table">
                                                        <div data-ax5combobox-display="label-holder">
                                                            <a data-ax5combobox-display="label" spellcheck="false"><div tabindex="-1" data-ax5combobox-selected-label="0" data-ax5combobox-selected-text="키워드 검색(keyword_search)"><div data-ax5combobox-remove="true" data-ax5combobox-remove-index="0"><i class="cqc-cancel3"></i></div><span>키워드 검색(keyword_search)</span></div><input type="text" data-ax5combobox-display="input" style="border:0 none;"></a>
                                                        </div>
                                                        <div data-ax5combobox-display="addon">
                                                            <span class="addon-icon-closed"><span class="addon-icon-arrow"></span></span>
                                                            <span class="addon-icon-opened"><span class="addon-icon-arrow"></span></span>
                                                        </div>
                                                    </div>
                                                </div></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                -->

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
-->
</body>
<script>
    var menuList = [];

    function registMenu(){
        if($("#menuId").attr("readonly") == 'readonly'){clearMenuForm();}
        else if(menuFormCheck()){
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
    function modifyMenu() {
        if (menuFormCheck()) {
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
