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
    <title>상담 현황</title>

</head>
<body class="ax-body " data-page-auto-height="true">
<div id="ax-base-root" data-root-container="true">
    <div class="ax-base-title" role="page-title">
        <h1 class="title"><i class="cqc-browser"></i> 관심 키워드 분석</h1>
        <p class="desc"></p>
    </div>
    <div class="ax-base-content">
        <div data-page-buttons="">
            <div class="button-warp">
                <button type="button" class="btn btn-default" data-page-btn="reload" onclick="window.location.reload();"><i class="cqc-cw"></i></button>
                <button type="button" class="btn btn-info" data-page-btn="search"><i class="cqc-magnifier"></i> 조회 </button>
            </div>
        </div>

        <div id="part" role="page-header">
            <form name="searchView0" id="searchView0" method="post" onsubmit="return ACTIONS.dispatch(ACTIONS.PAGE_SEARCH);" style="">

                <input type="hidden" id="periodType" value="day">
                <input type="hidden" id="selectedKeyword">
                <input type="hidden" id="yesterDayHHMISS">
                <input type="hidden" id="fromDay" value="2018-06-28">
                <input type="hidden" id="toDay" value="2018-06-30">

                <div data-ax-tbl="" class="ax-search-tbl" style="">
                    <div data-ax-tr="" class="" style="">
                        <div data-ax-td="" class="" style=";width:175px">
                            <div data-ax-td-label="" class="" style=";width:80px">파트</div>
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
        </div>

        <div data-ax5layout="ax1" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;horizontal&quot;, splitter: {size: 7}}" style="height: 734px;">
            <div data-split-panel="{height: &quot;48%&quot;}" style="padding-bottom: 5px; display: block; height: 352.32px; top: 0px;" class="split-panel-horizontal">
                <div style="padding-bottom: 5px;" class="" data-split-panel-wrap="">

                    <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                        <div class="left" style="width:30%;">
                            <h3><i class="cqc-list"></i> 실시간 키워드 </h3>
                        </div>
                        <div class="right" style="width:17%;">
                            <button type="button" class="btn btn-default" data-form-view-01-btn="excel_down_01">Excel</button>
                        </div>
                        <div class="right" style="width:40%;"> </div>
                        <div class="right" style="width:100px;">

                            <select class="form-control null " id="negType" name="negType"><option value="DAY">일별</option><option value="MONTH">월별</option></select>
                        </div>
                    </div>

                    <div data-ax5layout="ax2" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 734px;">
                        <div data-split-panel="{width: &quot;40%&quot;}" class="split-panel-vertical" style="display: block; width: 900px; left: 0px;">
                            <div style="padding-right:5px; height: 350px;" class="" data-split-panel-wrap="">

                                <div data-ax5grid="grid-view-01" data-fit-height-content="grid-view-01" style="height: 310px;">
                                    <div id="grid1InterestKeyword" style="height: 310px;" class="ag-theme-alpine" ></div>
                                </div>
                            </div>
                        </div>

                        <div data-split-panel="{width: &quot;60%&quot;}" class="split-panel-vertical" style="display: block; width: 900px; left: 1000px;">
                            <div style="padding-left: 5px; height: 771px;" class="" data-split-panel-wrap="">

                                <div style="height: 310px;">
                                    <canvas id="chart1InterestKeyword"></canvas>
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
                        <div class="right" style="width:17%;">
                            <button type="button" class="btn btn-default" data-form-view-01-btn="excel_down_02">Excel</button>
                        </div>
                        <div class="right" style="width:40%;"> </div>
                        <div class="right" style="width: 100px;">

                            <select class="form-control null " id="intType"><option value="DAY">일별</option><option value="MONTH">월별</option></select>
                        </div>
                    </div>

                    <div data-ax5layout="ax3" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 734px;">
                        <div data-split-panel="{width: &quot;40%&quot;}" class="split-panel-vertical" style="display: block; width: 900px; left: 0px;">
                            <div style="padding-right: 5px; height: 350px;" class="" data-split-panel-wrap="">

                                <div data-ax5grid="grid-view-02" data-fit-height-content="grid-view-02" style="height: 310px;">
                                    <div id="grid2InterestKeyword" style="height: 310px;" class="ag-theme-alpine" ></div>
                                </div>

                            </div>
                        </div>

                        <div data-split-panel="{width: &quot;60%&quot;}" class="split-panel-vertical" style="display: block; width: 900px; left: 1000px;">
                            <div style="padding-left: 5px; height: 771px;" class="" data-split-panel-wrap="">

                                <div style="height: 310px;">
                                    <canvas id="chart2InterestKeyword"></canvas>
                                </div>

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
    var interestKeywordList1;
    var interestKeywordList2;
    var chart1InterestKeyword;
    var interestKeywordList3;
    var interestKeywordList4;
    var chart2InterestKeyword;

    function getInterestKeywordList1(){
        commonAjax("/interestKeyword/list1", {}, function(res){
            interestKeywordList1 = res;
            console.log('interestKeywordList1 : ',interestKeywordList1);



            //start ag-grid
            var columnDefs = [
                { headerName: '키워드', field: "keyword"},
                { headerName: '건수', field: "sumCountToday"},
                { headerName: '전일건수', field: "sumCountYesterday"},
                { headerName: '전주평균건수', field: "sumCountBeforeWeekAvr", width: 120 },
                { headerName: '전주 동요일건수', field: "sumCountBeforeWeekDay", width: 140 },
            ];
            // let the grid know which columns and what data to use
            var gridOptions = {
                columnDefs: columnDefs,
                rowData: interestKeywordList1,
                pagination: true,
                paginationAutoPageSize: true,
                //paginationPageSize: 10,
                defaultColDef: {
                    width: 110,
                    sortable: true,
                    resizable: true,
                    //enableRowGroup: true,
                    //enablePivot: true,
                    //enableValue: true,
                },
                onCellClicked: (event) => {
                    console.log(event.data);
                    updateChart1InterestKeyword(event.data.keyword);
                },

            };
            var gridDiv = document.querySelector('#grid1InterestKeyword');
            new agGrid.Grid(gridDiv, gridOptions);
            //end ag-grid

            getChart1InterestKeyword(interestKeywordList1[0].keyword);
        });
    }
    function getChart1InterestKeyword(keyword){

        var param = {
            'keyword' : keyword
        };

        commonAjax("/interestKeyword/list2", param, function(res){
            interestKeywordList2 = res;
            console.log('interestKeywordList2 : ',interestKeywordList2);

            var chartLabels = [];
            var chartData = [];
            var listLength =interestKeywordList2.length < 10 ? interestKeywordList2.length : 10;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(interestKeywordList2[i].year+'-'+interestKeywordList2[i].month+'-'+interestKeywordList2[i].day);
                chartData.push(interestKeywordList2[i].sumCount);
            }
            // 차트를 그럴 영역을 dom요소로 가져온다.
            var chartArea1home = document.getElementById('chart1InterestKeyword').getContext('2d');
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
                        label: keyword,
                        // ⑥dataset값(Array)
                        data: chartData,
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
    function updateChart1InterestKeyword(keyword){

        var param = {
            'keyword' : keyword
        };

        commonAjax("/interestKeyword/list2", param, function(res){
            interestKeywordList2 = res;
            console.log('interestKeywordList2 : ',interestKeywordList2);

            var chartLabels = [];
            var chartData = [];
            var listLength =interestKeywordList2.length < 10 ? interestKeywordList2.length : 10;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(interestKeywordList2[i].year+'-'+interestKeywordList2[i].month+'-'+interestKeywordList2[i].day);
                chartData.push(interestKeywordList2[i].sumCount);
            }

            chart1InterestKeyword.data.datasets[0].label = keyword;
            chart1InterestKeyword.data.labels = chartLabels;
            chart1InterestKeyword.data.datasets[0].data = chartData;
            chart1InterestKeyword.update();

        });
    }

    function getInterestKeywordList3(){
        commonAjax("/interestKeyword/list3", {}, function(res){
            interestKeywordList3 = res;
            console.log('interestKeywordList3 : ',interestKeywordList3);

            //start ag-grid
            var columnDefs = [
                { headerName: '키워드', field: "keyword"},
                { headerName: '건수', field: "sumCountToday"},
                { headerName: '전일건수', field: "sumCountYesterday"},
                { headerName: '전주평균건수', field: "sumCountBeforeWeekAvr", width: 120 },
                { headerName: '전주 동요일건수', field: "sumCountBeforeWeekDay", width: 140 },
            ];
            // let the grid know which columns and what data to use
            var gridOptions = {
                columnDefs: columnDefs,
                rowData: interestKeywordList3,
                pagination: true,
                paginationAutoPageSize: true,
                //paginationPageSize: 10,
                defaultColDef: {
                    width: 110,
                    sortable: true,
                    resizable: true,
                    //enableRowGroup: true,
                    //enablePivot: true,
                    //enableValue: true,
                },
                onCellClicked: (event) => {
                    console.log(event.data);
                    updateChart2InterestKeyword(event.data.keyword);
                },

            };
            var gridDiv = document.querySelector('#grid2InterestKeyword');
            new agGrid.Grid(gridDiv, gridOptions);
            //end ag-grid

            getChart2InterestKeyword(interestKeywordList3[0].keyword);
        });
    }
    function getChart2InterestKeyword(keyword){

        var param = {
            'keyword' : keyword
        };

        commonAjax("/interestKeyword/list4", param, function(res){
            interestKeywordList4 = res;
            console.log('interestKeywordList4 : ',interestKeywordList4);

            var chartLabels = [];
            var chartData = [];
            var listLength =interestKeywordList4.length < 10 ? interestKeywordList4.length : 10;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(interestKeywordList4[i].year+'-'+interestKeywordList4[i].month+'-'+interestKeywordList4[i].day);
                chartData.push(interestKeywordList4[i].sumCount);
            }
            // 차트를 그럴 영역을 dom요소로 가져온다.
            var chartArea2home = document.getElementById('chart2InterestKeyword').getContext('2d');
            // 차트를 생성한다.
            chart2InterestKeyword = new Chart(chartArea2home, {
                // ①차트의 종류(String)
                type: 'line',
                // ②차트의 데이터(Object)
                data: {
                    // ③x축에 들어갈 이름들(Array)
                    labels: chartLabels,
                    // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                    datasets: [{
                        // ⑤dataset의 이름(String)
                        label: keyword,
                        // ⑥dataset값(Array)
                        data: chartData,
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
    function updateChart2InterestKeyword(keyword){

        var param = {
            'keyword' : keyword
        };

        commonAjax("/interestKeyword/list4", param, function(res){
            interestKeywordList4 = res;
            console.log('interestKeywordList4 : ',interestKeywordList4);

            var chartLabels = [];
            var chartData = [];
            var listLength =interestKeywordList4.length < 10 ? interestKeywordList4.length : 10;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(interestKeywordList4[i].year+'-'+interestKeywordList4[i].month+'-'+interestKeywordList4[i].day);
                chartData.push(interestKeywordList4[i].sumCount);
            }

            chart2InterestKeyword.data.datasets[0].label = keyword;
            chart2InterestKeyword.data.labels = chartLabels;
            chart2InterestKeyword.data.datasets[0].data = chartData;
            chart2InterestKeyword.update();

        });
    }


    //초기화
    $(function() {
        getInterestKeywordList1();
        getInterestKeywordList3();
    });

</script>
</html>
