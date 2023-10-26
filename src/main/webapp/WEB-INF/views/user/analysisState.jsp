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
            <div data-split-panel="{width: &quot;43%&quot;}" id="" class="split-panel-vertical" style="display: block; width: 1023.26px; left: 0px;">
                <div style="padding-right: 3px;" class="" data-split-panel-wrap="">

                    <div data-split-panel="{height: &quot;50%&quot;}" style="padding-top: 5px; display: block; height: 381.68px; top: 352.32px;" class="split-panel-horizontal">
                        <div style="padding-top: 5px;" class="" data-split-panel-wrap="">

                            <div data-ax5layout="ax3" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 734px;">
                                <div data-split-panel="{width: &quot;40%&quot;}" class="split-panel-vertical" style="display: block; width: 872.8px; left: 0px;">
                                    <div style="padding-right: 5px; height: 350px;" class="" data-split-panel-wrap="">

                                        <div style="height: 350px;">
                                            <canvas id="chart1AnalysisState"></canvas>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div data-split-panel="{height: &quot;50%&quot;}" style="padding-top: 5px; display: block; height: 381.68px; top: 352.32px;" class="split-panel-horizontal">
                        <div style="padding-top: 5px;" class="" data-split-panel-wrap="">


                            <div data-ax5layout="ax3" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 734px;">
                                <div data-split-panel="{width: &quot;40%&quot;}" class="split-panel-vertical" style="display: block; width: 872.8px; left: 0px;">
                                    <div style="padding-right: 5px; height: 350px;" class="" data-split-panel-wrap="">

                                        <div style="height: 350px;">
                                            <canvas id="chart2AnalysisState"></canvas>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>




                </div>
            </div>


            <div data-split-panel="{width: &quot;*&quot;}" id="" class="split-panel-vertical" style="display: block; width: 801.74px; left: 1023.26px;">
                <div style="padding-left: 3px;" class="" data-split-panel-wrap="">

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
    var analysisStateList1=[];
    var analysisStateList2=[];
    var chart1AnalysisState;
    var chart2AnalysisState;
    var chart3AnalysisState;

    var analysisStateFlag1 = false;
    var analysisStateFlag2 = false;


    function getChart1AnalysisState(){

        var param = {
            'sentClsCd' : '300001'
        };

        commonAjax("/analysisState/list1", param, function(res){
            analysisStateList1 = res;
            console.log('analysisStateList1 : ',analysisStateList1);
            analysisStateFlag1 = true;
            getChart3AnalysisState();

            var chartLabels = [];
            var chartData = [];
            var listLength =analysisStateList1.length < 10 ? analysisStateList1.length : 10;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(analysisStateList1[i].year+'-'+analysisStateList1[i].month+'-'+analysisStateList1[i].day);
                chartData.push(analysisStateList1[i].sumCount);
            }
            // 차트를 그럴 영역을 dom요소로 가져온다.
            var chartArea1home = document.getElementById('chart1AnalysisState').getContext('2d');
            // 차트를 생성한다.
            chart1AnalysisState = new Chart(chartArea1home, {
                // ①차트의 종류(String)
                type: 'line',
                // ②차트의 데이터(Object)
                data: {
                    // ③x축에 들어갈 이름들(Array)
                    labels: chartLabels,
                    // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                    datasets: [{
                        // ⑤dataset의 이름(String)
                        label: '긍정 콜 트렌드',
                        // ⑥dataset값(Array)
                        data: chartData,
                        // ⑦dataset의 배경색(rgba값을 String으로 표현)
                        backgroundColor: [
                            //색상
                            'rgba(54, 162, 235, 0.5)',
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
                            display: true,
                            text: '긍정 콜 트렌드'
                        }
                    }
                }
            });

        });
    }

    function getChart2AnalysisState(){

        var param = {
            'sentClsCd' : '300002'
        };

        commonAjax("/analysisState/list1", param, function(res){
            analysisStateList2 = res;
            console.log('analysisStateList2 : ',analysisStateList2);
            analysisStateFlag2 = true;
            getChart3AnalysisState();

            var chartLabels = [];
            var chartData = [];
            var listLength =analysisStateList2.length < 10 ? analysisStateList2.length : 10;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(analysisStateList2[i].year+'-'+analysisStateList2[i].month+'-'+analysisStateList2[i].day);
                chartData.push(analysisStateList2[i].sumCount);
            }
            // 차트를 그럴 영역을 dom요소로 가져온다.
            var chartArea1home = document.getElementById('chart2AnalysisState').getContext('2d');
            // 차트를 생성한다.
            chart2AnalysisState = new Chart(chartArea1home, {
                // ①차트의 종류(String)
                type: 'line',
                // ②차트의 데이터(Object)
                data: {
                    // ③x축에 들어갈 이름들(Array)
                    labels: chartLabels,
                    // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                    datasets: [{
                        // ⑤dataset의 이름(String)
                        label: '부정 콜 트렌드',
                        // ⑥dataset값(Array)
                        data: chartData,
                        // ⑦dataset의 배경색(rgba값을 String으로 표현)
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.5)',
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
                            display: true,
                            text: '부정 콜 트렌드'
                        }
                    }
                }
            });

        });


    }

    function getChart3AnalysisState(){
        if(!analysisStateFlag1 || !analysisStateFlag2){
            return false;
        }

        var positive = 0;
        var negative = 0;

        for(var i=0; i<analysisStateList1.length; i++){
            positive += analysisStateList1[i].sumCount;
        }
        for(var j=0; j< analysisStateList2.length; j++){
            negative += analysisStateList2[j].sumCount;
        }

        positive = (positive / (positive + negative)) * 100 ;
        negative = (negative / (positive + negative)) * 100 ;

        var chartLabels = [];
        var chartData = [];
        chartLabels.push('긍정');
        chartData.push(positive);
        chartLabels.push('부정');
        chartData.push(negative);

        // 차트를 그럴 영역을 dom요소로 가져온다.
        var chartArea1 = document.getElementById('chart3AnalysisState').getContext('2d');
        // 차트를 생성한다.
        chart3AnalysisState = new Chart(chartArea1, {
            // ①차트의 종류(String)
            //type: 'bar',
            type: 'doughnut',
            // ②차트의 데이터(Object)
            data: {
                // ③x축에 들어갈 이름들(Array)
                labels: chartLabels,
                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                datasets: [{
                    // ⑤dataset의 이름(String)
                    label: 'test1',
                    // ⑥dataset값(Array)
                    data: chartData,
                }]
            },
            // ⑩차트의 설정(Object)
            options: {
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
                        display: true,
                        text: '긍부정 콜 비율'
                    }
                }
            }
        });


    }

    //초기화
    $(function() {
        getChart1AnalysisState();
        getChart2AnalysisState();
    });
</script>
</html>
