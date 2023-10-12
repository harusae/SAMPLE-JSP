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
                <button type="button" class="btn btn-info" data-page-btn="search"><i class="cqc-magnifier"></i> 조회 </button>
                <button type="button" class="btn btn-info" data-page-btn="save"><i class="cqc-save"></i> 저장</button>
                <button type="button" class="btn btn-info" data-page-btn="excel"><i class="cqc-file-excel-o"></i> 엑셀</button>
                <button type="button" class="btn btn-fn1" data-page-btn="fn1"><i class="cqc-minus"></i> 삭제</button>
            </div>
        </div>
        <!-- 검색바 -->
        <div role="page-header">
            <form name="searchKeywordForm" id="searchKeywordForm" method="post" onsubmit="javascript:return false;" style="">
                <div data-ax-tbl="" class="ax-search-tbl" style="">
                    <div data-ax-tr="" class="" style="">
                        <div class="right">
                            <div data-ax-td="" id="" class="" style=";width:300px">
                                <div data-ax-td-label="" class="" style="">키워드</div>
                                <div data-ax-td-wrap="">
                                    <input type="text" id="searchKeyword" name="searchKeyword" class="form-control form-control" placeholder="검색어를 입력하세요">
                                </div>
                            </div>
                            <div data-ax-td="" id="" class="" style=";width:300px">
                                <div data-ax-td-label="" class="" style="">키워드유형</div>
                                <div data-ax-td-wrap="">
                                    <select id="keyType" name="keyType" data-ax-path="keyType" class="form-control W100">
                                        <option value="">전체</option>
                                        <option value="KEY001">부정키워드</option>
                                        <option value="KEY002">관심키워드</option>
                                        <option value="KEY003">이슈키워드</option>
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
            <div data-split-panel="{width: &quot;50%&quot;}" id="" class="split-panel-vertical" style="display: block; width: 945px; left: 0px;">
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

                    </div>
                </div>
            </div>

            <div data-splitter="{}" class="split-panel-vertical" style="display: block; width: 7px; left: 945px;"></div>

            <div data-split-panel="{width: &quot;*&quot;}" id="" class="split-panel-vertical" style="display: block; width: 451px; left: 952px;">
                <div style="padding-left: 10px;" class="" data-split-panel-wrap="scroll">
                    <!-- 폼 -->
                    <div class="ax-button-group" role="panel-header">
                        <div class="left">
                            <h2><i class="cqc-news"></i>
                                상세정보
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
                        <div data-ax-tbl="" id="" class="ax-form-tbl" style="">
                            <div data-ax-tr="" id="" class="" style="">
                                <div data-ax-td="" id="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style="">ID</div>
                                    <div data-ax-td-wrap="">
                                        <input type="text" data-ax-path="id" class="form-control" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <div data-ax-tr="" id="" class="" style="">
                                <div data-ax-td="" id="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style="">키워드유형</div>
                                    <div data-ax-td-wrap="">
                                        <select class="form-control form-control W100 " data-ax-path="keywordType">
                                            <option value="KEY001">부정키워드</option>
                                            <option value="KEY002">관심키워드</option>
                                            <option value="KEY003">이슈키워드</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div data-ax-tr="" id="" class="" style="">
                                <div data-ax-td="" id="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style="">키워드</div>
                                    <div data-ax-td-wrap="">
                                        <input type="text" data-ax-path="keyword" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div data-ax-tr="" id="" class="" style="">
                                <div data-ax-td="" id="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style="">사용여부</div>
                                    <div data-ax-td-wrap="">
                                        <select class="form-control form-control W100 " data-ax-path="useYn">
                                            <option value="Y">사용</option>
                                            <option value="N">사용안함</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div data-ax-tr="" id="" class="" style="">
                                <div data-ax-td="" id="" class="" style=";width:300px">
                                    <div data-ax-td-label="" class="" style="">정렬순서</div>
                                    <div data-ax-td-wrap="">
                                        <input type="text" name="threshold" data-ax-path="threshold" maxlength="15" title="정렬순서" class="form-control" value="">
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
</html>
