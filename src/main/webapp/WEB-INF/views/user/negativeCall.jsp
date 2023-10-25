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
        <h1 class="title"><i class="cqc-browser"></i> 분류별 부정콜 현황</h1>
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
                                <input type="hidden" id="categoryFullName">
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

        <div data-ax5layout="ax1" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;horizontal&quot;, splitter: {size: 7}}" style="height: 671px;">
            <div data-split-panel="{height: &quot;*&quot;}" id="" style="display: block; height: 671px; top: 0px;" class="split-panel-horizontal">
                <div style="" class="" data-split-panel-wrap="">
                    <div data-ax5layout="ax2" data-config="{layout:&quot;tab-panel&quot;}" data-fit-height-content="layout-view-01" style="height: 671px;">
                        <div data-tab-panel="{label: &quot;소분류별 업무&quot;, active: true}" data-tab-active="true">
                            <div style="padding:10px 0 0 0;" data-split-panel-wrap="">

                                <table border="0" width="100%" height="100%">
                                    <tbody><tr height="50%">
                                        <td width="50%" valign="top">

                                            <div class="chart_box" style="height: 300px;">
                                                <canvas id="chart1NegativeCall"></canvas>
                                            </div>
                                        </td>

                                        <td rowspan="2" valign="top">

                                            <div data-split-panel="{height: &quot;&quot;}" id="" style="height:630px; width:950px;" class="">
                                                <div style="height:630px; width:950px;" class="" data-split-panel-wrap="">

                                                    <div class="right" style="width:99.9999%; text-align: right">
                                                        <button type="button" class="btn btn-default" data-form-view-01-btn="excel_down_02">Excel</button>
                                                    </div>
                                                    <div data-ax5grid="grid-view-01" data-fit-height-content="grid-view-02" style="height: 630px;">
                                                        <div id="grid1NegativeCall" style="height: 630px;" class="ag-theme-alpine" ></div>
                                                    </div>

                                                </div>
                                            </div>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">

                                            <div class="chart_box" style="height: 300px;">
                                                <canvas id="chart2NegativeCall"></canvas>
                                            </div>

                                        </td>
                                    </tr>
                                    </tbody></table>

                            </div>
                        </div>

                        <div data-tab-panel="{label: &quot;대분류별 업무&quot;, active: false}">
                            <div style="padding:10px 0 0 0;" data-split-panel-wrap="">

                                <table border="0" width="100%" height="100%">
                                    <tbody><tr height="50%">
                                        <td width="50%" valign="top">
                                            <div id="chartContainer21">FusionCharts XT will load here!</div>
                                        </td>
                                        <td rowspan="2" valign="top">
                                            <div data-split-panel="{height: &quot;&quot;}" id="" style="height:630px; width:950px;" class="">
                                                <div style="height:630px; width:950px;" class="" data-split-panel-wrap="">

                                                    <div class="right" style="width:99.9999%; text-align: right">
                                                        <button type="button" class="btn btn-default" data-form-view-01-btn="excel_down_04">Excel</button>
                                                    </div>
                                                    <div data-ax5grid="grid-view-02" data-fit-height-content="grid-view-02" style="height: 846px;"><div data-ax5grid-container="root" data-ax5grid-instance="ax5grid-38" style="height: 846px;">
                                                        <div data-ax5grid-container="hidden">
                                                            <textarea data-ax5grid-form="clipboard"></textarea>
                                                        </div>
                                                        <div data-ax5grid-container="header">
                                                            <div data-ax5grid-panel="aside-header"></div>
                                                            <div data-ax5grid-panel="left-header"></div>
                                                            <div data-ax5grid-panel="header">
                                                                <div data-ax5grid-panel-scroll="header"><table border="0" cellpadding="0" cellspacing="0"><colgroup><col style="width:507px;"><col style="width:130px;"><col style="width:130px;"><col style="width:130px;"><col></colgroup><tbody><tr class=""><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-key="label" data-ax5grid-column-colindex="0" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;">대분류명</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="1" data-ax5grid-column-key="value" data-ax5grid-column-colindex="1" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;">Count</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="2" data-ax5grid-column-key="rate" data-ax5grid-column-colindex="2" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;">비율(%)</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="3" data-ax5grid-column-key="textValue" data-ax5grid-column-colindex="3" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;">통화내역</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" style="height: 28px;min-height: 1px;"></td></tr></tbody></table><div data-ax5grid-column-resizer="0" style="height:27px;left: 503px;"></div><div data-ax5grid-column-resizer="1" style="height:27px;left: 633px;"></div><div data-ax5grid-column-resizer="2" style="height:27px;left: 763px;"></div><div data-ax5grid-column-resizer="3" style="height:27px;left: 893px;"></div></div>
                                                            </div>
                                                            <div data-ax5grid-panel="right-header"></div>
                                                        </div>
                                                        <div data-ax5grid-container="body">
                                                            <div data-ax5grid-panel="top-aside-body"></div>
                                                            <div data-ax5grid-panel="top-left-body"></div>
                                                            <div data-ax5grid-panel="top-body">
                                                                <div data-ax5grid-panel-scroll="top-body" style="padding-left: 0px; padding-right: 0px;"></div>
                                                            </div>
                                                            <div data-ax5grid-panel="top-right-body"></div>
                                                            <div data-ax5grid-panel="aside-body">
                                                                <div data-ax5grid-panel-scroll="aside-body"></div>
                                                            </div>
                                                            <div data-ax5grid-panel="left-body">
                                                                <div data-ax5grid-panel-scroll="left-body"></div>
                                                            </div>
                                                            <div data-ax5grid-panel="body">
                                                                <div data-ax5grid-panel-scroll="body" style="padding-left: 0px; padding-right: 0px;"><div style="background:repeating-linear-gradient(to top, #fff 0px, #fff 27px, #eee 27px, #eee 28px);font-size:0;line-height:0;height: 0px;"></div><table border="0" cellpadding="0" cellspacing="0"><colgroup><col style="width:507px;"><col style="width:130px;"><col style="width:130px;"><col style="width:130px;"><col></colgroup></table></div>
                                                            </div>
                                                            <div data-ax5grid-panel="right-body">
                                                                <div data-ax5grid-panel-scroll="right-body"></div>
                                                            </div>
                                                            <div data-ax5grid-panel="bottom-aside-body"></div>
                                                            <div data-ax5grid-panel="bottom-left-body"></div>
                                                            <div data-ax5grid-panel="bottom-body">
                                                                <div data-ax5grid-panel-scroll="bottom-body" style="padding-left: 0px; padding-right: 0px;"></div>
                                                            </div>
                                                            <div data-ax5grid-panel="bottom-right-body"></div>
                                                        </div>
                                                        <div data-ax5grid-container="page">
                                                            <div data-ax5grid-page="holder">
                                                                <div data-ax5grid-page="navigation"><div data-ax5grid-page-navigation="holder">
                                                                </div></div>
                                                                <div data-ax5grid-page="status"><span> 1 - 0 of 0 &nbsp; Total 0</span></div>
                                                            </div>
                                                        </div>
                                                        <div data-ax5grid-container="scroller">
                                                            <div data-ax5grid-scroller="vertical" style="">
                                                                <div data-ax5grid-scroller="vertical-bar" style="width: 10px; left: 2px;"></div>
                                                            </div>
                                                            <div data-ax5grid-scroller="horizontal" style="">
                                                                <div data-ax5grid-scroller="horizontal-bar" style="height: 10px; top: 2px; left: 0px; width: 15px;"></div>
                                                            </div>
                                                            <div data-ax5grid-scroller="corner"></div>
                                                        </div>
                                                        <div data-ax5grid-resizer="vertical"></div>
                                                        <div data-ax5grid-resizer="horizontal"></div>
                                                    </div></div>

                                                </div>
                                            </div>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <div id="chartContainer22"> </div>
                                        </td>
                                    </tr>
                                    </tbody></table>

                            </div>
                        </div>

                        <div data-tab-panel-label-holder="ax5layout-34">
                            <div data-tab-panel-label-border="ax5layout-34"></div>
                            <div data-tab-panel-label-table="ax5layout-34">
                                <div data-tab-panel-aside="left"></div>
                                <div data-tab-panel-label="0" data-tab-active="true">
                                    <div data-tab-label="0">소분류별 업무</div>
                                </div>
                                <div data-tab-panel-label="1" data-tab-active="false">
                                    <div data-tab-label="1">대분류별 업무</div>
                                </div>
                                <div data-tab-panel-aside="right"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var negativeCall1List;
    var negativeCall2List;
    var negativeCall3List;
    var chart1NegativeCall;
    var chart2NegativeCall;


    function getNegativeCall1List() {

        var param = {
            'sentClsCd' : '300002'
        };

        commonAjax("/negativeCall/lv3List", param, function(res){
            negativeCall1List = res;
            console.log('negativeCall1List : ', negativeCall1List);

            var chartLabels = [];
            var chartData = [];
            var negativeCallTargetList = [];
            var listLength = negativeCall1List.length < 5 ? negativeCall1List.length : 5;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(negativeCall1List[i].lv3Nm);
                chartData.push(negativeCall1List[i].sumCount);

                negativeCallTargetList.push(negativeCall1List[i].lv3Cd);
            }
            getNegativeCall2List(negativeCallTargetList);

            // 차트를 그럴 영역을 dom요소로 가져온다.
            var chartArea1 = document.getElementById('chart1NegativeCall').getContext('2d');
            // 차트를 생성한다.
            chart1NegativeCall = new Chart(chartArea1, {
                // ①차트의 종류(String)
                type: 'bar',
                // ②차트의 데이터(Object)
                data: {
                    // ③x축에 들어갈 이름들(Array)
                    labels: chartLabels,
                    // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                    datasets: [
                        {
                            // ⑤dataset의 이름(String)
                            label: '소분류 별 부정콜',
                            // ⑥dataset값(Array)
                            data: chartData,
                            // ⑦dataset의 배경색(rgba값을 String으로 표현)
                            backgroundColor: [
                                //색상
                                'rgba(54, 162, 235, 0.2)',
                            ],
                            // ⑧dataset의 선 색(rgba값을 String으로 표현)
                            //borderColor: 'rgba(255, 99, 132, 1)',
                            // ⑨dataset의 선 두께(Number)
                            borderWidth: 1
                        }
                    ]
                },
                // ⑩차트의 설정(Object)
                options: {
                    maintainAspectRatio: false,
                    responsive: true,
                    scales: {
                        x: {
                            stacked: true,
                        },
                        y: {
                            stacked: true
                        }
                    },
                    //미입력시 X축이 default
                    indexAxis: 'y',
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
                            display: true,
                            text: '소분류 별 부정콜 상위 5위'
                        }
                    }
                }
            });

        });
    }

    function getNegativeCall2List(negativeCallTargetList) {
        console.log('negativeCallTargetList : ', negativeCallTargetList);
        var param = {
            'targetList': negativeCallTargetList.toString()
        };
        commonAjax("/negativeCall/lv3ChartList", param, function(res){
            negativeCall2List = res;
            console.log('negativeCall2List : ', negativeCall2List);

            var chartDataSets = [];
            var chartLabels = [];
            var counter = 0;
            for(var i=0; i<negativeCall2List.length ; i+=9){
                if(i==0){
                    chartLabels.push(negativeCall2List[i].year+'-'+negativeCall2List[i].month+'-'+negativeCall2List[i].day);
                    chartLabels.push(negativeCall2List[i+1].year+'-'+negativeCall2List[i+1].month+'-'+negativeCall2List[i+1].day);
                    chartLabels.push(negativeCall2List[i+2].year+'-'+negativeCall2List[i+2].month+'-'+negativeCall2List[i+2].day);
                    chartLabels.push(negativeCall2List[i+3].year+'-'+negativeCall2List[i+3].month+'-'+negativeCall2List[i+3].day);
                    chartLabels.push(negativeCall2List[i+4].year+'-'+negativeCall2List[i+4].month+'-'+negativeCall2List[i+4].day);
                    chartLabels.push(negativeCall2List[i+5].year+'-'+negativeCall2List[i+5].month+'-'+negativeCall2List[i+5].day);
                    chartLabels.push(negativeCall2List[i+6].year+'-'+negativeCall2List[i+6].month+'-'+negativeCall2List[i+6].day);
                    chartLabels.push(negativeCall2List[i+7].year+'-'+negativeCall2List[i+7].month+'-'+negativeCall2List[i+7].day);
                    chartLabels.push(negativeCall2List[i+8].year+'-'+negativeCall2List[i+8].month+'-'+negativeCall2List[i+8].day);
                }
                var chartData = {
                    label: negativeCall2List[i].clsLabelNm,
                    data: [
                        negativeCall2List[i].sumCount,
                        negativeCall2List[i+1].sumCount,
                        negativeCall2List[i+2].sumCount,
                        negativeCall2List[i+3].sumCount,
                        negativeCall2List[i+4].sumCount,
                        negativeCall2List[i+5].sumCount,
                        negativeCall2List[i+6].sumCount,
                        negativeCall2List[i+7].sumCount,
                        negativeCall2List[i+8].sumCount,
                    ]
                };
                chartDataSets.push(chartData);
            }
            console.log('chartDataSets : ', chartDataSets);

            var ctxhome = document.getElementById('chart2NegativeCall').getContext('2d');
            chart2NegativeCall = new Chart(ctxhome, {
                type: 'line',
                data: {
                    labels: chartLabels,
                    datasets: chartDataSets
                },

                options: {
                    maintainAspectRatio: false,
                    responsive: true,
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
                            display: true,
                            text: '소분류 별 부정콜 상위 5위'
                        }
                    }
                }
            });
        });
    }

    function getNegativeCall3List() {
        commonAjax("/negativeCall/gridList", {}, function(res){
            negativeCall3List = res;
            console.log('negativeCall3List : ', negativeCall3List);

            //start ag-grid
            var columnDefs = [
                { headerName: '소분류', field: "clsLabelNm"},
                { headerName: 'Count', field: "sumCount" },
                { headerName: '비율(%)', field: "ratio" }
            ];
            // let the grid know which columns and what data to use
            var gridOptions = {
                columnDefs: columnDefs,
                rowData: negativeCall3List,
                pagination: true,
                paginationAutoPageSize: true,
                //paginationPageSize: 10,
                defaultColDef: {
                    width: 210,
                    sortable: true,
                    resizable: true,
                    //enableRowGroup: true,
                    //enablePivot: true,
                    //enableValue: true,
                },
            };
            var gridDiv = document.querySelector('#grid1NegativeCall');
            new agGrid.Grid(gridDiv, gridOptions);
            //end ag-grid

        });
    }



    //초기화
    $(function() {
        getNegativeCall1List();
        getNegativeCall3List();
    });
</script>
</html>
