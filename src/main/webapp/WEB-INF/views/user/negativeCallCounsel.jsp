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
        <h1 class="title"><i class="cqc-browser"></i> 상담사 별 부정콜 현황</h1>
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
                        <div data-tab-panel="{label: &quot;상담사 별 업무&quot;, active: true}" data-tab-active="true">
                            <div style="padding:10px 0 0 0;" data-split-panel-wrap="">

                                <table border="0" width="100%" height="100%">
                                    <tbody><tr height="50%">
                                        <td width="50%" valign="top">

                                            <div class="chart_box" style="height: 300px;">
                                                <canvas id="chart1NegativeCallCounsel"></canvas>
                                            </div>
                                        </td>

                                        <td rowspan="2" valign="top">

                                            <div data-split-panel="{height: &quot;&quot;}" id="" style="height:630px; width:950px;" class="">
                                                <div style="height:630px; width:950px;" class="" data-split-panel-wrap="">

                                                    <div class="right" style="width:99.9999%; text-align: right">
                                                        <button type="button" class="btn btn-default" data-form-view-01-btn="excel_down_02">Excel</button>
                                                    </div>
                                                    <div data-ax5grid="grid-view-01" data-fit-height-content="grid-view-02" style="height: 630px;">
                                                        <div id="grid1NegativeCallCounsel" style="height: 590px;" class="ag-theme-alpine" ></div>
                                                    </div>

                                                </div>
                                            </div>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">

                                            <div class="chart_box" style="height: 300px;">
                                                <canvas id="chart2NegativeCallCounsel"></canvas>
                                            </div>

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
                                    <div data-tab-label="0">상담사 별 업무</div>
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
    var negativeCallCounselList;
    var negativeCallCounselList2;
    var negativeCallCounselList3;
    var chart1NegativeCallCounsel;
    var chart2NegativeCallCounsel;


    function getNegativeCallCounselList() {

        var param = {
            'sentClsCd' : '300002'
        };

        commonAjax("/negativeCallCounsel/list1", param, function(res){
            negativeCallCounselList = res;
            console.log('negativeCallCounselList : ', negativeCallCounselList);

            var chartLabels = [];
            var chartData = [];
            var negativeCallCounselTargetList = [];
            var listLength = negativeCallCounselList.length < 5 ? negativeCallCounselList.length : 5;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(negativeCallCounselList[i].agentNm);
                chartData.push(negativeCallCounselList[i].sumCount);

                negativeCallCounselTargetList.push(negativeCallCounselList[i].agentId);
            }
            getNegativeCallCounselList2(negativeCallCounselTargetList);

            // 차트를 그럴 영역을 dom요소로 가져온다.
            var chartArea1 = document.getElementById('chart1NegativeCallCounsel').getContext('2d');
            // 차트를 생성한다.
            chart1NegativeCallCounsel = new Chart(chartArea1, {
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

    function getNegativeCallCounselList2(negativeCallCounselTargetList) {
        console.log('negativeCallCounselTargetList : ', negativeCallCounselTargetList);
        var param = {
            'targetList': negativeCallCounselTargetList.toString()
        };
        commonAjax("/negativeCallCounsel/list2", param, function(res){
            negativeCallCounselList2 = res;
            console.log('negativeCallCounselList2 : ', negativeCallCounselList2);

            var chartDataSets = [];
            var chartLabels = [];
            var data = [];
            for(var i=0; i<negativeCallCounselList2.length ; i++){
                if(i==0){
                    chartLabels.push(negativeCallCounselList2[i].year+'-'+negativeCallCounselList2[i].month+'-'+negativeCallCounselList2[i].day);
                    chartLabels.push(negativeCallCounselList2[i+1].year+'-'+negativeCallCounselList2[i+1].month+'-'+negativeCallCounselList2[i+1].day);
                    chartLabels.push(negativeCallCounselList2[i+2].year+'-'+negativeCallCounselList2[i+2].month+'-'+negativeCallCounselList2[i+2].day);
                    chartLabels.push(negativeCallCounselList2[i+3].year+'-'+negativeCallCounselList2[i+3].month+'-'+negativeCallCounselList2[i+3].day);
                    chartLabels.push(negativeCallCounselList2[i+4].year+'-'+negativeCallCounselList2[i+4].month+'-'+negativeCallCounselList2[i+4].day);
                    chartLabels.push(negativeCallCounselList2[i+5].year+'-'+negativeCallCounselList2[i+5].month+'-'+negativeCallCounselList2[i+5].day);
                    chartLabels.push(negativeCallCounselList2[i+6].year+'-'+negativeCallCounselList2[i+6].month+'-'+negativeCallCounselList2[i+6].day);
                    chartLabels.push(negativeCallCounselList2[i+7].year+'-'+negativeCallCounselList2[i+7].month+'-'+negativeCallCounselList2[i+7].day);
                    chartLabels.push(negativeCallCounselList2[i+8].year+'-'+negativeCallCounselList2[i+8].month+'-'+negativeCallCounselList2[i+8].day);
                }

                if(negativeCallCounselList2[i] != null){
                    data.push(negativeCallCounselList2[i].sumCount);
                }

                if(i%9 == 8){
                    var chartData = {
                        label: negativeCallCounselList2[i].agentNm,
                        data: data
                    };
                    chartDataSets.push(chartData);
                    data = [];
                }


            }
            /*
            for(var i=0; i<negativeCallCounselList2.length ; i+=9){
                if(i==0){
                    chartLabels.push(negativeCallCounselList2[i].year+'-'+negativeCallCounselList2[i].month+'-'+negativeCallCounselList2[i].day);
                    chartLabels.push(negativeCallCounselList2[i+1].year+'-'+negativeCallCounselList2[i+1].month+'-'+negativeCallCounselList2[i+1].day);
                    chartLabels.push(negativeCallCounselList2[i+2].year+'-'+negativeCallCounselList2[i+2].month+'-'+negativeCallCounselList2[i+2].day);
                    chartLabels.push(negativeCallCounselList2[i+3].year+'-'+negativeCallCounselList2[i+3].month+'-'+negativeCallCounselList2[i+3].day);
                    chartLabels.push(negativeCallCounselList2[i+4].year+'-'+negativeCallCounselList2[i+4].month+'-'+negativeCallCounselList2[i+4].day);
                    chartLabels.push(negativeCallCounselList2[i+5].year+'-'+negativeCallCounselList2[i+5].month+'-'+negativeCallCounselList2[i+5].day);
                    chartLabels.push(negativeCallCounselList2[i+6].year+'-'+negativeCallCounselList2[i+6].month+'-'+negativeCallCounselList2[i+6].day);
                    chartLabels.push(negativeCallCounselList2[i+7].year+'-'+negativeCallCounselList2[i+7].month+'-'+negativeCallCounselList2[i+7].day);
                    chartLabels.push(negativeCallCounselList2[i+8].year+'-'+negativeCallCounselList2[i+8].month+'-'+negativeCallCounselList2[i+8].day);
                }
                console.log('negativeCallCounselList2[i+8] :',negativeCallCounselList2[i+8] != null);
                var chartData = {
                    label: negativeCallCounselList2[i].agentNm,
                    data: [
                        negativeCallCounselList2[i].sumCount,
                        negativeCallCounselList2[i+1].sumCount,
                        negativeCallCounselList2[i+2].sumCount,
                        negativeCallCounselList2[i+3].sumCount,
                        negativeCallCounselList2[i+4].sumCount,
                        negativeCallCounselList2[i+5].sumCount,
                        negativeCallCounselList2[i+6].sumCount,
                        negativeCallCounselList2[i+7].sumCount,
                        negativeCallCounselList2[i+8].sumCount,
                    ]
                };
                chartDataSets.push(chartData);
            }
            */
            console.log('chartDataSets : ', chartDataSets);

            var ctxhome = document.getElementById('chart2NegativeCallCounsel').getContext('2d');
            chart2NegativeCallCounsel = new Chart(ctxhome, {
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

    function getNegativeCallCounselList3() {
        commonAjax("/negativeCallCounsel/list3", {}, function(res){
            negativeCallCounselList3 = res;
            console.log('negativeCallCounselList3 : ', negativeCallCounselList3);

            //start ag-grid
            var columnDefs = [
                { headerName: '상담사명', field: "agentNm"},
                { headerName: 'Count', field: "sumCount" },
                { headerName: '비율(%)', field: "ratio" }
            ];
            // let the grid know which columns and what data to use
            var gridOptions = {
                columnDefs: columnDefs,
                rowData: negativeCallCounselList3,
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
            var gridDiv = document.querySelector('#grid1NegativeCallCounsel');
            new agGrid.Grid(gridDiv, gridOptions);
            //end ag-grid

        });
    }



    //초기화
    $(function() {
        getNegativeCallCounselList();
        getNegativeCallCounselList3();
    });
</script>
</html>
