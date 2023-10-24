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
    <title>감성분석</title>

</head>
<body class="ax-body " data-page-auto-height="true">
<div id="ax-base-root" data-root-container="true">
    <div class="ax-base-title" role="page-title">
        <h1 class="title"><i class="cqc-browser"></i> 감성분석 현황</h1>
        <p class="desc"></p>
    </div>
    <div class="ax-base-content">
        <div data-page-buttons="">
            <div class="button-warp">
                <button type="button" class="btn btn-default" data-page-btn="reload" onclick="window.location.reload();"><i class="cqc-cw"></i></button>
                <button type="button" class="btn btn-info" data-page-btn="search"><i class="cqc-magnifier"></i> 조회 </button>
            </div>
        </div>

        <div role="page-header">
            <form name="searchView0" id="searchView0" method="post" onsubmit="return ACTIONS.dispatch(ACTIONS.PAGE_SEARCH);" style="">

                <input type="hidden" id="progressDate">
                <input type="hidden" id="posnegLevel">
                <div data-ax-tbl="" id="" class="ax-search-tbl" style="">
                    <div data-ax-tr="" id="" class="" style="">
                        <div data-ax-td="" id="" class="" style=";width:250px">
                            <div data-ax-td-label="" class="" style="">콜유형</div>
                            <div data-ax-td-wrap="">

                                <select id="callType" data-ax-path="callType" class="form-control W110">
                                    <option value="0|1">전체</option>
                                    <option value="0">I/B</option>
                                    <option value="1">O/B</option>
                                </select>
                                <input type="hidden" id="categoryFullName" name="categoryFullName">
                                <input type="hidden" id="posnegLevel">

                            </div>
                        </div>
                        <div data-ax-td="" id="" class="" style=";width:250px">
                            <div data-ax-td-label="" class="" style="">기간유형</div>
                            <div data-ax-td-wrap="">

                                <select id="periodType" data-ax-path="periodType" class="form-control W110">
                                    <option value="day">일별</option>
                                    <option value="month">월별</option>
                                    <!-- <option value="period_time">시간대별</option> -->
                                </select>

                            </div>
                        </div>

                        <div data-ax-td="" id="" class="" style=";width:300px">
                            <div data-ax-td-label="" class="" style=";width:80px">기간선택</div>
                            <div data-ax-td-wrap="">

                                <div class="input-group" data-ax5picker="date">
                                    <input id="fromDay" type="text" class="form-control" placeholder="yyyy/mm/dd">
                                    <span class="input-group-addon">~</span>
                                    <input id="toDay" type="text" class="form-control" placeholder="yyyy/mm/dd">
                                    <span class="input-group-addon"><i class="cqc-calendar"></i></span>
                                </div>

                            </div>
                        </div>

                        <div data-ax-td="" id="" class="" style=";width:250px">
                            <div data-ax-td-label="" class="" style="">센터</div>
                            <div data-ax-td-wrap="">

                                <select id="centerNm" data-ax-path="centerNm" class="form-control W120">
                                    <option value="CC">고객상담부</option>
                                    <!--                            <option value="SUM">썸뱅크</option> -->
                                    <option value="CARD">카드사업단</option>
                                </select>

                            </div>
                        </div>

                        <div data-ax-td="part" id="part" class="" style=";width:270px">
                            <div data-ax-td-label="part" class="" style=";width:80px">파트</div>
                            <div data-ax-td-wrap="">

                                <div class="form-inline">
                                    <div class="form-group">
                                        <select id="groupID" data-ax-path="groupID" class="form-control W80">
                                            <option value="all">전체</option>
                                            <option value="15">예금</option>
                                            <option value="14">대출</option>
                                            <option value="16">비씨</option>
                                            <option value="20">멀티</option>
                                            <option value="9">자동화</option>
                                            <option value="8">인터넷</option>
                                            <option value="10">영업점</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </form>
            <div class="H10"></div>
        </div>

        <div data-ax5layout="ax1" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 734px;">
            <div data-split-panel="{width: &quot;43%&quot;}" id="" class="split-panel-vertical" style="display: block; width: 1223.26px; left: 0px;">
                <div style="padding-right: 3px;" class="" data-split-panel-wrap="">

                    <div data-split-panel="{height: &quot;50%&quot;}" style="padding-top: 5px; display: block; height: 381.68px; top: 352.32px;" class="split-panel-horizontal">
                        <div style="padding-top: 5px;" class="" data-split-panel-wrap="">

                            <div class="ax-button-group" data-fit-height-aside="grid-view-02">
                                <div class="left" style="width:30%;">
                                    <h3><i class="cqc-list"></i> 관심 키워드 </h3>
                                </div>
                            </div>

                            <div data-ax5layout="ax3" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 734px;">
                                <div data-split-panel="{width: &quot;40%&quot;}" class="split-panel-vertical" style="display: block; width: 672.8px; left: 0px;">
                                    <div style="padding-right: 5px; height: 350px;" class="" data-split-panel-wrap="">

                                        <div id="chart-container"style="height: 360px;">
                                            <canvas id="chart1AnalysisState"></canvas>
                                        </div>

                                    </div>
                                </div>

                                <div data-split-panel="{width: &quot;60%&quot;}" class="split-panel-vertical" style="display: block; width: 522.2px; left: 672.8px;">
                                    <div style="padding-left: 5px; height: 771px;" class="" data-split-panel-wrap="">

                                        <div id="chart-container2">

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div data-split-panel="{height: &quot;50%&quot;}" style="padding-top: 5px; display: block; height: 381.68px; top: 352.32px;" class="split-panel-horizontal">
                        <div style="padding-top: 5px;" class="" data-split-panel-wrap="">

                            <div class="ax-button-group" data-fit-height-aside="grid-view-02">
                                <div class="left" style="width:30%;">
                                    <h3><i class="cqc-list"></i> 관심 키워드 </h3>
                                </div>
                                <div class="right" style="width:10%;">
                                    <button type="button" class="btn btn-default" data-form-view-01-btn="excel_down_02">Excel</button>
                                </div>
                                <div class="right" style="width:55%;"> </div>
                                <div class="right" style="width: 100px;">

                                    <select class="form-control null " id="intType"><option value="DAY">일별</option><option value="MONTH">월별</option></select>
                                </div>
                            </div>

                            <div data-ax5layout="ax3" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 734px;">
                                <div data-split-panel="{width: &quot;40%&quot;}" class="split-panel-vertical" style="display: block; width: 672.8px; left: 0px;">
                                    <div style="padding-right: 5px; height: 350px;" class="" data-split-panel-wrap="">

                                        <div data-ax5grid="grid-view-02" data-fit-height-content="grid-view-02" style="height: 310px;"><div data-ax5grid-container="root" data-ax5grid-instance="ax5grid-38" style="height: 310px;">
                                            <div data-ax5grid-container="hidden">
                                                <textarea data-ax5grid-form="clipboard"></textarea>
                                            </div>
                                            <div data-ax5grid-container="header" style="height: 28px;">
                                                <div data-ax5grid-panel="aside-header" style="left: 0px; width: 50px; height: 28px;"><table border="0" cellpadding="0" cellspacing="0"><colgroup><col style="width:50px;"><col></colgroup><tbody><tr class=""><td data-ax5grid-column-attr="lineNumber" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-key="__index_header__" data-ax5grid-column-colindex="null" data-ax5grid-column-rowindex="undefined" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;">&nbsp;</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" style="height: 28px;min-height: 1px;"></td></tr></tbody></table></div>
                                                <div data-ax5grid-panel="left-header" style="display: none;"></div>
                                                <div data-ax5grid-panel="header" style="left: 50px; width: 616px; height: 28px;">
                                                    <div data-ax5grid-panel-scroll="header"><table border="0" cellpadding="0" cellspacing="0"><colgroup><col style="width:298px;"><col style="width:101px;"><col style="width:101px;"><col style="width:103px;"><col style="width:80px;"><col></colgroup><tbody><tr class=""><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-key="keyword" data-ax5grid-column-colindex="0" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;">키워드</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="1" data-ax5grid-column-key="lastWeekCnt" data-ax5grid-column-colindex="1" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;">전주</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="2" data-ax5grid-column-key="yesterdayCnt" data-ax5grid-column-colindex="2" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;">전일</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="3" data-ax5grid-column-key="todayCnt" data-ax5grid-column-colindex="3" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;">당일</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="4" data-ax5grid-column-key="textValue" data-ax5grid-column-colindex="4" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;">통화내역</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" style="height: 28px;min-height: 1px;"></td></tr></tbody></table><div data-ax5grid-column-resizer="0" style="height:27px;left: 294px;"></div><div data-ax5grid-column-resizer="1" style="height:27px;left: 395px;"></div><div data-ax5grid-column-resizer="2" style="height:27px;left: 496px;"></div><div data-ax5grid-column-resizer="3" style="height:27px;left: 599px;"></div><div data-ax5grid-column-resizer="4" style="height:27px;left: 679px;"></div></div>
                                                </div>
                                                <div data-ax5grid-panel="right-header" style="display: none;"></div>
                                            </div>
                                            <div data-ax5grid-container="body" style="height: 265px;">
                                                <div data-ax5grid-panel="top-aside-body" style="display: none;"></div>
                                                <div data-ax5grid-panel="top-left-body" style="display: none;"></div>
                                                <div data-ax5grid-panel="top-body" style="display: none;">
                                                    <div data-ax5grid-panel-scroll="top-body" style="padding-left: 0px; padding-right: 0px;"></div>
                                                </div>
                                                <div data-ax5grid-panel="top-right-body" style="display: none;"></div>
                                                <div data-ax5grid-panel="aside-body" style="left: 0px; width: 50px; top: 0px; height: 265px;">
                                                    <div data-ax5grid-panel-scroll="aside-body" style="top: 0px;"><div style="background:repeating-linear-gradient(to top, #fff 0px, #fff 27px, #eee 27px, #eee 28px);font-size:0;line-height:0;height: 0px;"></div><table border="0" cellpadding="0" cellspacing="0"><colgroup><col style="width:50px;"><col></colgroup><tbody><tr class="tr-0" data-ax5grid-tr-data-index="0" data-ax5grid-tr-data-o-index="0" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="aside-body-scroll" data-ax5grid-data-index="0" data-ax5grid-data-o-index="0" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="undefined" data-ax5grid-column-colindex="null" data-ax5grid-column-attr="lineNumber" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" "="" style="height:27px;line-height: 21px;">1</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="0" data-ax5grid-data-o-index="0" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-1" data-ax5grid-tr-data-index="1" data-ax5grid-tr-data-o-index="1" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="aside-body-scroll" data-ax5grid-data-index="1" data-ax5grid-data-o-index="1" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="undefined" data-ax5grid-column-colindex="null" data-ax5grid-column-attr="lineNumber" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" "="" style="height:27px;line-height: 21px;">2</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="1" data-ax5grid-data-o-index="1" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-2" data-ax5grid-tr-data-index="2" data-ax5grid-tr-data-o-index="2" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="aside-body-scroll" data-ax5grid-data-index="2" data-ax5grid-data-o-index="2" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="undefined" data-ax5grid-column-colindex="null" data-ax5grid-column-attr="lineNumber" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" "="" style="height:27px;line-height: 21px;">3</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="2" data-ax5grid-data-o-index="2" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-3" data-ax5grid-tr-data-index="3" data-ax5grid-tr-data-o-index="3" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="aside-body-scroll" data-ax5grid-data-index="3" data-ax5grid-data-o-index="3" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="undefined" data-ax5grid-column-colindex="null" data-ax5grid-column-attr="lineNumber" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" "="" style="height:27px;line-height: 21px;">4</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="3" data-ax5grid-data-o-index="3" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-0" data-ax5grid-tr-data-index="4" data-ax5grid-tr-data-o-index="4" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="aside-body-scroll" data-ax5grid-data-index="4" data-ax5grid-data-o-index="4" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="undefined" data-ax5grid-column-colindex="null" data-ax5grid-column-attr="lineNumber" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" "="" style="height:27px;line-height: 21px;">5</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="4" data-ax5grid-data-o-index="4" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-1" data-ax5grid-tr-data-index="5" data-ax5grid-tr-data-o-index="5" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="aside-body-scroll" data-ax5grid-data-index="5" data-ax5grid-data-o-index="5" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="undefined" data-ax5grid-column-colindex="null" data-ax5grid-column-attr="lineNumber" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" "="" style="height:27px;line-height: 21px;">6</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="5" data-ax5grid-data-o-index="5" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-2" data-ax5grid-tr-data-index="6" data-ax5grid-tr-data-o-index="6" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="aside-body-scroll" data-ax5grid-data-index="6" data-ax5grid-data-o-index="6" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="undefined" data-ax5grid-column-colindex="null" data-ax5grid-column-attr="lineNumber" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" "="" style="height:27px;line-height: 21px;">7</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="6" data-ax5grid-data-o-index="6" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-3" data-ax5grid-tr-data-index="7" data-ax5grid-tr-data-o-index="7" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="aside-body-scroll" data-ax5grid-data-index="7" data-ax5grid-data-o-index="7" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="undefined" data-ax5grid-column-colindex="null" data-ax5grid-column-attr="lineNumber" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" "="" style="height:27px;line-height: 21px;">8</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="7" data-ax5grid-data-o-index="7" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr></tbody></table><div style="background:repeating-linear-gradient(to bottom, #fff 0px, #fff 27px, #eee 27px, #eee 28px);font-size:0;line-height:0;height: 0px;"></div></div>
                                                </div>
                                                <div data-ax5grid-panel="left-body" style="display: none;">
                                                    <div data-ax5grid-panel-scroll="left-body"></div>
                                                </div>
                                                <div data-ax5grid-panel="body" style="left: 50px; width: 616px; top: 0px; height: 265px;">
                                                    <div data-ax5grid-panel-scroll="body" style="padding-left: 0px; padding-right: 0px; top: 0px;"><div style="background:repeating-linear-gradient(to top, #fff 0px, #fff 27px, #eee 27px, #eee 28px);font-size:0;line-height:0;height: 0px;"></div><table border="0" cellpadding="0" cellspacing="0"><colgroup><col style="width:298px;"><col style="width:101px;"><col style="width:101px;"><col style="width:103px;"><col style="width:80px;"><col></colgroup><tbody><tr class="tr-0" data-ax5grid-tr-data-index="0" data-ax5grid-tr-data-o-index="0" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="0" data-ax5grid-data-o-index="0" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="0" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="left" "="" style="height:27px;line-height: 21px;">금리</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="0" data-ax5grid-data-o-index="0" data-ax5grid-column-row="0" data-ax5grid-column-col="1" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="1" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="0" data-ax5grid-data-o-index="0" data-ax5grid-column-row="0" data-ax5grid-column-col="2" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="2" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">30</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="0" data-ax5grid-data-o-index="0" data-ax5grid-column-row="0" data-ax5grid-column-col="3" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="3" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="0" data-ax5grid-data-o-index="0" data-ax5grid-column-row="0" data-ax5grid-column-col="4" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="4" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" "="" style="height:27px;line-height: 21px;"></span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="0" data-ax5grid-data-o-index="0" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-1" data-ax5grid-tr-data-index="1" data-ax5grid-tr-data-o-index="1" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="1" data-ax5grid-data-o-index="1" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="0" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="left" "="" style="height:27px;line-height: 21px;">보험</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="1" data-ax5grid-data-o-index="1" data-ax5grid-column-row="0" data-ax5grid-column-col="1" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="1" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="1" data-ax5grid-data-o-index="1" data-ax5grid-column-row="0" data-ax5grid-column-col="2" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="2" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">52</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="1" data-ax5grid-data-o-index="1" data-ax5grid-column-row="0" data-ax5grid-column-col="3" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="3" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="1" data-ax5grid-data-o-index="1" data-ax5grid-column-row="0" data-ax5grid-column-col="4" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="4" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" "="" style="height:27px;line-height: 21px;"></span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="1" data-ax5grid-data-o-index="1" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-2" data-ax5grid-tr-data-index="2" data-ax5grid-tr-data-o-index="2" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="2" data-ax5grid-data-o-index="2" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="0" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="left" "="" style="height:27px;line-height: 21px;">신용</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="2" data-ax5grid-data-o-index="2" data-ax5grid-column-row="0" data-ax5grid-column-col="1" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="1" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="2" data-ax5grid-data-o-index="2" data-ax5grid-column-row="0" data-ax5grid-column-col="2" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="2" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">179</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="2" data-ax5grid-data-o-index="2" data-ax5grid-column-row="0" data-ax5grid-column-col="3" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="3" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="2" data-ax5grid-data-o-index="2" data-ax5grid-column-row="0" data-ax5grid-column-col="4" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="4" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" "="" style="height:27px;line-height: 21px;"></span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="2" data-ax5grid-data-o-index="2" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-3" data-ax5grid-tr-data-index="3" data-ax5grid-tr-data-o-index="3" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="3" data-ax5grid-data-o-index="3" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="0" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="left" "="" style="height:27px;line-height: 21px;">은행</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="3" data-ax5grid-data-o-index="3" data-ax5grid-column-row="0" data-ax5grid-column-col="1" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="1" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="3" data-ax5grid-data-o-index="3" data-ax5grid-column-row="0" data-ax5grid-column-col="2" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="2" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">763</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="3" data-ax5grid-data-o-index="3" data-ax5grid-column-row="0" data-ax5grid-column-col="3" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="3" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="3" data-ax5grid-data-o-index="3" data-ax5grid-column-row="0" data-ax5grid-column-col="4" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="4" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" "="" style="height:27px;line-height: 21px;"></span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="3" data-ax5grid-data-o-index="3" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-0" data-ax5grid-tr-data-index="4" data-ax5grid-tr-data-o-index="4" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="4" data-ax5grid-data-o-index="4" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="0" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="left" "="" style="height:27px;line-height: 21px;">은행</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="4" data-ax5grid-data-o-index="4" data-ax5grid-column-row="0" data-ax5grid-column-col="1" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="1" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="4" data-ax5grid-data-o-index="4" data-ax5grid-column-row="0" data-ax5grid-column-col="2" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="2" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">763</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="4" data-ax5grid-data-o-index="4" data-ax5grid-column-row="0" data-ax5grid-column-col="3" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="3" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="4" data-ax5grid-data-o-index="4" data-ax5grid-column-row="0" data-ax5grid-column-col="4" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="4" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" "="" style="height:27px;line-height: 21px;"></span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="4" data-ax5grid-data-o-index="4" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-1" data-ax5grid-tr-data-index="5" data-ax5grid-tr-data-o-index="5" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="5" data-ax5grid-data-o-index="5" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="0" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="left" "="" style="height:27px;line-height: 21px;">인증서</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="5" data-ax5grid-data-o-index="5" data-ax5grid-column-row="0" data-ax5grid-column-col="1" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="1" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="5" data-ax5grid-data-o-index="5" data-ax5grid-column-row="0" data-ax5grid-column-col="2" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="2" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">81</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="5" data-ax5grid-data-o-index="5" data-ax5grid-column-row="0" data-ax5grid-column-col="3" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="3" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="5" data-ax5grid-data-o-index="5" data-ax5grid-column-row="0" data-ax5grid-column-col="4" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="4" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" "="" style="height:27px;line-height: 21px;"></span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="5" data-ax5grid-data-o-index="5" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-2" data-ax5grid-tr-data-index="6" data-ax5grid-tr-data-o-index="6" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="6" data-ax5grid-data-o-index="6" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="0" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="left" "="" style="height:27px;line-height: 21px;">적금</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="6" data-ax5grid-data-o-index="6" data-ax5grid-column-row="0" data-ax5grid-column-col="1" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="1" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="6" data-ax5grid-data-o-index="6" data-ax5grid-column-row="0" data-ax5grid-column-col="2" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="2" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">42</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="6" data-ax5grid-data-o-index="6" data-ax5grid-column-row="0" data-ax5grid-column-col="3" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="3" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="6" data-ax5grid-data-o-index="6" data-ax5grid-column-row="0" data-ax5grid-column-col="4" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="4" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" "="" style="height:27px;line-height: 21px;"></span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="6" data-ax5grid-data-o-index="6" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr><tr class="tr-3" data-ax5grid-tr-data-index="7" data-ax5grid-tr-data-o-index="7" data-ax5grid-selected="false" data-ax5grid-disable-selection="false"><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="7" data-ax5grid-data-o-index="7" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="0" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="left" "="" style="height:27px;line-height: 21px;">카드</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="7" data-ax5grid-data-o-index="7" data-ax5grid-column-row="0" data-ax5grid-column-col="1" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="1" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="7" data-ax5grid-data-o-index="7" data-ax5grid-column-row="0" data-ax5grid-column-col="2" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="2" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">580</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="7" data-ax5grid-data-o-index="7" data-ax5grid-column-row="0" data-ax5grid-column-col="3" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="3" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="right" "="" style="height:27px;line-height: 21px;">0</span></td><td data-ax5grid-panel-name="body-scroll" data-ax5grid-data-index="7" data-ax5grid-data-o-index="7" data-ax5grid-column-row="0" data-ax5grid-column-col="4" data-ax5grid-column-rowindex="0" data-ax5grid-column-colindex="4" data-ax5grid-column-attr="default" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" "="" style="height:27px;line-height: 21px;"></span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" data-ax5grid-data-index="7" data-ax5grid-data-o-index="7" data-ax5grid-column-attr="default" style="height: 28px;min-height: 1px;"></td></tr></tbody></table><div style="background:repeating-linear-gradient(to bottom, #fff 0px, #fff 27px, #eee 27px, #eee 28px);font-size:0;line-height:0;height: 0px;"></div></div>
                                                </div>
                                                <div data-ax5grid-panel="right-body" style="display: none;">
                                                    <div data-ax5grid-panel-scroll="right-body"></div>
                                                </div>
                                                <div data-ax5grid-panel="bottom-aside-body" style="display: none;"></div>
                                                <div data-ax5grid-panel="bottom-left-body" style="display: none;"></div>
                                                <div data-ax5grid-panel="bottom-body" style="display: none;">
                                                    <div data-ax5grid-panel-scroll="bottom-body" style="padding-left: 0px; padding-right: 0px;"></div>
                                                </div>
                                                <div data-ax5grid-panel="bottom-right-body" style="display: none;"></div>
                                            </div>
                                            <div data-ax5grid-container="page" style="display: none;">
                                                <div data-ax5grid-page="holder">
                                                    <div data-ax5grid-page="navigation"><div data-ax5grid-page-navigation="holder">
                                                    </div></div>
                                                    <div data-ax5grid-page="status"><span> 1 - 8 of 8 &nbsp; Total 0</span></div>
                                                </div>
                                            </div>
                                            <div data-ax5grid-container="scroller">
                                                <div data-ax5grid-scroller="vertical" style="display: none;">
                                                    <div data-ax5grid-scroller="vertical-bar" style="width: 10px; left: 2px; top: -15px; height: 15px;"></div>
                                                </div>
                                                <div data-ax5grid-scroller="horizontal" style="display: block; width: 666px; height: 15px; right: 0px; bottom: 0px;">
                                                    <div data-ax5grid-scroller="horizontal-bar" style="height: 10px; top: 2px; left: 0px; width: 600.668px;"></div>
                                                </div>
                                                <div data-ax5grid-scroller="corner" style="display: none;"></div>
                                            </div>
                                            <div data-ax5grid-resizer="vertical"></div>
                                            <div data-ax5grid-resizer="horizontal"></div>
                                        </div></div>

                                    </div>
                                </div>

                                <div data-split-panel="{width: &quot;60%&quot;}" class="split-panel-vertical" style="display: block; width: 522.2px; left: 672.8px;">
                                    <div style="padding-left: 5px; height: 771px;" class="" data-split-panel-wrap="">

                                        <div id="chart-container2">

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                </div>
            </div>


            <div data-split-panel="{width: &quot;*&quot;}" id="" class="split-panel-vertical" style="display: block; width: 571.74px; left: 1223.26px;">
                <div style="padding-left: 3px;" class="" data-split-panel-wrap="">
                    <div class="ax-button-group" data-fit-height-aside="right-view-01">
                        <div class="left">
                            <h2>
                                <i class="cqc-list"></i>
                                실시간 키워드 순위 (전체) </h2>
                        </div>
                    </div>

                    <div data-fit-height-content="right-view-01" style="border: 1px solid rgb(216, 216, 216); background: rgb(255, 255, 255); height: 694px;" align="center">
                        <canvas id="chart3AnalysisState"></canvas>
                    </div>
                </div>
            </div>

        </div>


    </div>
</div>
</body>
<script>
    var analysisStateList1;

    function getChart1AnalysisState(){

        var param = {
            'sentClsCd' : '300002'
        };

        commonAjax("/analysisState/list1", param, function(res){
            analysisStateList1 = res;
            console.log('analysisStateList1 : ',analysisStateList1);

            var chartLabels = [];
            var chartData = [];
            var listLength =analysisStateList1.length < 10 ? analysisStateList1.length : 10;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(analysisStateList1[i].day);
                chartData.push(analysisStateList1[i].sumCount);
            }
            // 차트를 그럴 영역을 dom요소로 가져온다.
            var chartArea1home = document.getElementById('chart1AnalysisState').getContext('2d');
            // 차트를 생성한다.
            chart1InterestKeyword = new Chart(chartArea1home, {
                // ①차트의 종류(String)
                type: 'line',
                // ②차트의 데이터(Object)
                data: {
                    // ③x축에 들어갈 이름들(Array)
                    labels: chartLabels,
                    // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                    datasets: [{
                        // ⑤dataset의 이름(String)
                        label: '',
                        // ⑥dataset값(Array)
                        data: chartData,
                        // ⑦dataset의 배경색(rgba값을 String으로 표현)
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.5)',
                            'rgba(54, 162, 235, 0.5)',
                            'rgba(255, 206, 86, 0.5)',
                            'rgba(75, 192, 192, 0.5)',
                            'rgba(153, 102, 255, 0.5)',
                            'rgba(255, 159, 64, 0.5)'
                        ],
                        // ⑧dataset의 선 색(rgba값을 String으로 표현)
                        //borderColor: 'rgba(255, 99, 132, 1)',
                        // ⑨dataset의 선 두께(Number)
                        borderWidth: 1
                    }]
                },
                // ⑩차트의 설정(Object)
                options: {
                    maintainAspectRatio: false,
                    responsive: true,
                    //미입력시 X축이 default
                    plugins: {
                        legend: {
                            //미입력 시 top이 default
                            position: 'bottom',
                        },
                        // 미입력시 검은색이 default
                        datalabels: {
                            color: '#FE777B'
                        },
                        title: {
                            display: false,
                            text: 'keyword'
                        }
                    }
                }
            });

        });
    }


    //초기화
    $(function() {
        getChart1AnalysisState();
    });
</script>
</html>
