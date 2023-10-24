<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Document</title>

</head>
<body>

<div id="ax-base-root" data-root-container="true">
    <div class="ax-base-title" role="page-title">
        <h1 class="title" id="title">${now} 대시보드</h1>
    </div>
    <div class="ax-base-content">
        <div data-page-buttons="">
            <div class="button-warp">
                <!-- https://chequer-io.github.io/chequer-icon/demo.html -->
                <button type="button" class="btn btn-default" data-page-btn="reload" onclick="window.location.reload();"><i class="cqc-cw"></i></button>
                <button type="button" class="btn btn-default" data-page-btn="search">조회</button>
            </div>
        </div>
        <div role="page-header">
        </div>

        <!-- 2310 table 클래스 수정 및 영역 추가 -->
        <table border="0" width="100%" height="90%">
            <tbody>
            <tr height="50%">
                <td width="50%">
                    <table border="0" width="100%" height="100%" class="tbl_area">
                        <tbody>
                        <tr height="5">
                            <td colspan="2">
                                <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                                    <div class="left">
                                        <h3><i class="cqc-list"></i> 업무별순위</h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" valign="center" class="area_box">
                                <div class="chart_box" style="height: 360px;">
                                    <canvas id="test1home"></canvas>
                                </div>
                            </td>
                            <td width="1%"></td>
                            <td align="center" valign="center" class="area_box">
                                <div class="chart_box" style="height: 360px;">
                                    <div id="grid1home" style="height: 360px;" class="ag-theme-alpine" ></div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </td>
                <td width="20"> </td>
                <td>
                    <table border="0" width="100%" height="100%" class="tbl_area">
                        <tbody>
                        <tr height="5">
                            <td colspan="2">
                                <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                                    <div class="left">
                                        <h3><i class="cqc-list"></i>실시간 급상승분석</h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" valign="center" class="area_box">
                                <div class="chart_box" style="height: 360px;">
                                    <canvas id="test2home"></canvas>
                                </div>
                            </td>
                            <td width="1%"></td>
                            <td align="center" valign="center" class="area_box">
                                <div class="chart_box" style="height: 360px;">
                                    <div id="grid2home" style="height: 360px;" class="ag-theme-alpine" ></div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr height="50%">
                <td width="50%">
                    <table border="0" width="100%" height="100%" class="tbl_area mt20">
                        <tbody>
                        <tr height="5">
                            <td colspan="2">
                                <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                                    <div class="left">
                                        <h3><i class="cqc-list"></i>소분류별 부정 콜</h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" valign="center" class="area_box">
                                <div class="chart_box" style="height: 360px;">
                                    <canvas id="test3home"></canvas>
                                </div>
                            </td>
                            <td width="1%"></td>
                            <td align="center" valign="center" class="area_box">
                                <div class="chart_box" style="height: 360px;">
                                    <div id="grid3home" style="height: 360px;" class="ag-theme-alpine" ></div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </td>
                <td width="20"> </td>
                <td>
                    <table border="0" width="100%" height="100%" class="tbl_area mt20">
                        <tbody>
                        <tr height="5">
                            <td colspan="2">
                                <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                                    <div class="left">
                                        <h3><i class="cqc-list"></i>부정 키워드</h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" valign="center" class="area_box">
                                <div class="chart_box" style="height: 360px;">
                                    <canvas id="test4home"></canvas>
                                </div>
                            </td>
                            <td width="1%"></td>
                            <td align="center" valign="center" class="area_box">
                                <div class="chart_box">
                                    <div id="grid4home" style="height: 360px;" class="ag-theme-alpine" ></div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            </tbody>
        </table>


    </div>
</div>
<!--
<div id="ax-base-root" data-root-container="true">
    <div class="ax-base-title" role="page-title">
        <h1 class="title" id="title">${now} 대시보드</h1>
    </div>
    <div class="ax-base-content">
        <div data-page-buttons="">
            <div class="button-warp">
                <button type="button" class="btn btn-default" data-page-btn="reload" onclick="window.location.reload();"><i class="cqc-cw"></i></button>
                <button type="button" class="btn btn-default" data-page-btn="search">조회</button>
            </div>
        </div>
        <table border="0" width="100%" height="90%">
            <tbody><tr height="50%">
                <td width="50%">
                    <table border="0" width="100%" height="100%">
                        <tbody><tr height="5">
                            <td colspan="2">
                                <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                                    <div class="left">
                                        <h3><i class="cqc-list"></i> 업무별순위 </h3>
                                    </div>
                                </div>
                            </td>
                        </tr><tr>
                            <td width="50%" align="center" valign="top">
                                <div id="chart-Container1">
                                    <canvas id="test1home" style="display: block; box-sizing: border-box;"></canvas>
                                </div>
                            </td>
                            <td align="center" valign="top">
                                <div data-ax5grid="grid-view-01" data-fit-height-content="grid-view-01" style="width:100%; height:350px;">
                                    <div id="grid1home"></div>
                                </div>
                            </td>
                        </tr>
                        </tbody></table>
                </td>
                <td width="10"> </td>
                <td>
                    <table border="0" width="100%" height="100%">
                        <tbody><tr height="5">
                            <td colspan="2">
                                <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                                    <div class="left">
                                        <h3><i class="cqc-list"></i> 실시간 급상승분석 </h3>
                                    </div>
                                </div>
                            </td>
                        </tr><tr>
                            <td width="50%" align="center" valign="top">
                                <div id="chart-Container2">
                                    <canvas id="test2home"></canvas>
                                </div>
                            </td>
                            <td align="center" valign="top">
                                <div data-ax5grid="grid-view-02" data-fit-height-content="grid-view-02" style="width:100%; height:350px;">
                                    <div id="grid2home"></div>
                                </div>
                            </td>
                        </tr>
                        </tbody></table>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="0" width="100%" height="100%">
                        <tbody><tr height="5">
                            <td colspan="2">
                                <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                                    <div class="left">
                                        <h3><i class="cqc-list"></i> 소분류별 부정 콜 </h3>
                                    </div>
                                </div>
                            </td>
                        </tr><tr>
                            <td width="50%" align="center" valign="top">
                                <div id="chart-Container3">
                                    <canvas id="test3home"></canvas>
                                </div>
                            </td>
                            <td align="center" valign="top">
                                <div data-ax5grid="grid-view-03" data-fit-height-content="grid-view-03" style="width:100%; height:340px;">
                                    <div id="grid3home"></div>
                                </div>
                            </td>
                        </tr>
                        </tbody></table>
                </td>
                <td> </td>
                <td>
                    <table border="0" width="100%" height="100%">
                        <tbody><tr height="5">
                            <td colspan="2">
                                <div class="ax-button-group" data-fit-height-aside="grid-view-01">
                                    <div class="left">
                                        <h3><i class="cqc-list"></i> 부정 키워드 </h3>
                                    </div>
                                </div>
                            </td>
                        </tr><tr>
                            <td width="50%" align="center" valign="top">
                                <div id="chart-Container4">
                                    <canvas id="test4home"></canvas>
                                </div>
                            </td>
                            <td align="center" valign="top">
                                <div id="grid4home"style="height: 330px;" class="ag-theme-alpine" ></div>
                            </td>
                        </tr>
                        </tbody></table>
                </td>
            </tr>
            </tbody></table>


    </div>
</div>
-->
</body>

<!-- script for chart/grid (오브젝트 아래위치에서 작성해야 동작) -->
<script>
    var dataDashboard1List = [];
    var dataDashboard2List = [];
    var dataDashboard3List = [];
    var dataDashboard4List = [];



    function getDashboard1List() {
        commonAjax("/home/dashboard1", {}, function(res){
            dataDashboard1List = res;

            //start ag-grid
            var columnDefs = [
                { headerName: '대분류', field: "lv1Nm", width: 130 },
                { headerName: '중분류', field: "lv2Nm", width: 110 },
                { headerName: '소분류', field: "lv3Nm", width: 130 },
                { headerName: 'Count', field: "sumCount", width: 80 }
            ];
            // let the grid know which columns and what data to use
            var gridOptions = {
                columnDefs: columnDefs,
                rowData: dataDashboard1List,
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
            };
            var gridDiv = document.querySelector('#grid1home');
            new agGrid.Grid(gridDiv, gridOptions);
            //end ag-grid

            var chartLabels = [];
            var chartData = [];
            var listLength = dataDashboard1List.length < 10 ? dataDashboard1List.length : 10;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(dataDashboard1List[i].lv3Nm);
                chartData.push(dataDashboard1List[i].sumCount);
            }
            // 차트를 그럴 영역을 dom요소로 가져온다.
            var chartArea1home = document.getElementById('test1home').getContext('2d');
            // 차트를 생성한다.
            var chart1home = new Chart(chartArea1home, {
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
                            text: '소분류 별'
                        }
                    }
                }
            });

        });
    }

    function getDashboard2List() {
        commonAjax("/home/dashboard2", {}, function(res){
            dataDashboard2List = res;

            //start ag-grid
            var columnDefs = [
                { headerName: '키워드', field: "keyword" },
                { headerName: '상승폭', field: "sumCount" },
            ];
            // let the grid know which columns and what data to use
            var gridOptions = {
                columnDefs: columnDefs,
                rowData: dataDashboard2List,
                pagination: true,
                paginationAutoPageSize: true,
                //paginationPageSize: 10,
                defaultColDef: {
                    width: 200,
                    sortable: true,
                    resizable: true,
                    //enableRowGroup: true,
                    //enablePivot: true,
                    //enableValue: true,
                },
            };
            var gridDiv = document.querySelector('#grid2home');
            new agGrid.Grid(gridDiv, gridOptions);
            //end ag-grid

            var chartLabels = [];
            var chartData = [];
            var listLength =dataDashboard2List.length < 10 ? dataDashboard2List.length : 10;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(dataDashboard2List[i].keyword);
                chartData.push(dataDashboard2List[i].sumCount);
            }

            // 차트를 그럴 영역을 dom요소로 가져온다.
            var chartArea2home = document.getElementById('test2home').getContext('2d');
            // 차트를 생성한다.
            var chart2home = new Chart(chartArea2home, {
                // ①차트의 종류(String)
                type: 'bar',
                // ②차트의 데이터(Object)
                data: {
                    // ③x축에 들어갈 이름들(Array)
                    labels: chartLabels,
                    // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                    datasets: [{
                        // ⑤dataset의 이름(String)
                        label: '급상승 키워드',
                        // ⑥dataset값(Array)
                        data: chartData,
                        // ⑦dataset의 배경색(rgba값을 String으로 표현)
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
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
                    //indexAxis: 'y',
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
                            text: '급상승 키워드 상위10위'
                        }
                    }
                }
            });

        });
    }

    function getDashboard3List() {
        commonAjax("/home/dashboard3", {}, function(res){
            dataDashboard3List = res;

            //start ag-grid
            var columnDefs = [
                { headerName: '소분류', field: "lv3Nm" },
                { headerName: 'Count', field: "sumCount" },
            ];
            // let the grid know which columns and what data to use
            var gridOptions = {
                columnDefs: columnDefs,
                rowData: dataDashboard3List,
                pagination: true,
                paginationAutoPageSize: true,
                //paginationPageSize: 10,
                defaultColDef: {
                    width: 200,
                    sortable: true,
                    resizable: true,
                    //enableRowGroup: true,
                    //enablePivot: true,
                    //enableValue: true,
                },
            };
            var gridDiv = document.querySelector('#grid3home');
            new agGrid.Grid(gridDiv, gridOptions);
            //end ag-grid


            var chartLabels = [];
            var chartData = [];
            var listLength =dataDashboard3List.length < 10 ? dataDashboard3List.length : 10;
            for(var i=0; i<listLength ; i++){
                chartLabels.push(dataDashboard3List[i].lv3Nm);
                chartData.push(dataDashboard3List[i].sumCount);
            }
            // 차트를 그럴 영역을 dom요소로 가져온다.
            var chartArea3home = document.getElementById('test3home').getContext('2d');
            // 차트를 생성한다.
            var chart3home = new Chart(chartArea3home, {
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
                            label: '소분류 별 부정 콜',
                            // ⑥dataset값(Array)
                            data: chartData,
                            // ⑦dataset의 배경색(rgba값을 String으로 표현)
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                            ],
                            // ⑧dataset의 선 색(rgba값을 String으로 표현)
                            //borderColor: 'rgba(255, 99, 132, 1)',
                            // ⑨dataset의 선 두께(Number)
                            borderWidth: 1
                        }
                        /*
                        ,{
                            // ⑤dataset의 이름(String)
                            label: 'test3b',
                            // ⑥dataset값(Array)
                            data: [8, 1, 9, 11, -2, -4],
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
                        */
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
                            text: '소분류 별 부정 콜'
                        }
                    }
                },
            });

            /*
            document.getElementById('test3home').onclick = function(evt) {
                var points = chart3home.getElementsAtEventForMode(evt, 'nearest', { intersect: true }, true);

                if (points.length) {
                    var firstPoint = points[0];
                    var label = chart3home.data.labels[firstPoint.index];
                    var value = chart3home.data.datasets[firstPoint.datasetIndex].data[firstPoint.index];

                    //console.log(label);
                    //console.log(value);
                    alert(label);
                }
            };
            */
        });
    }

    function getDashboard4List() {
        commonAjax("/home/dashboard4", {}, function(res){
            dataDashboard4List = res;
            console.log('dataDashboard4List : ', dataDashboard4List);
            //start ag-grid
            var columnDefs = [
                { headerName: '키워드', field: "keyword", width: 80  },
                { headerName: '금일', field: "sumCountToday", width: 70  },
                { headerName: 'D-1', field: "sumCountTodayBefore1", width: 70  },
                { headerName: 'D-2', field: "sumCountTodayBefore2", width: 70  },
                { headerName: 'D-3', field: "sumCountTodayBefore3", width: 70  },
                { headerName: 'D-4', field: "sumCountTodayBefore4", width: 70  },
                { headerName: 'D-5', field: "sumCountTodayBefore5", width: 70  },
                { headerName: 'D-6', field: "sumCountTodayBefore6", width: 70  },
                { headerName: 'D-7', field: "sumCountTodayBefore7", width: 70  },
                { headerName: 'D-8', field: "sumCountTodayBefore8", width: 70  },
            ];
            // let the grid know which columns and what data to use
            var gridOptions = {
                columnDefs: columnDefs,
                rowData: dataDashboard4List,
                pagination: true,
                paginationAutoPageSize: true,
                //paginationPageSize: 10,
                defaultColDef: {
                    width: 200,
                    sortable: true,
                    resizable: true,
                    //enableRowGroup: true,
                    //enablePivot: true,
                    //enableValue: true,
                },
            };
            var gridDiv = document.querySelector('#grid4home');
            new agGrid.Grid(gridDiv, gridOptions);
            //end ag-grid

            var chartLabels = ['D-8','D-7','D-6','D-5','D-4','D-3','D-2', 'D-1', '금일'];
            var chartDataSets = [];
            var listLength =dataDashboard4List.length < 10 ? dataDashboard4List.length : 10;
            for(var i=0; i<listLength ; i++){
                var dataset = {
                    label: dataDashboard4List[i].keyword,
                    data: [
                        dataDashboard4List[i].sumCountTodayBefore8,
                        dataDashboard4List[i].sumCountTodayBefore7,
                        dataDashboard4List[i].sumCountTodayBefore6,
                        dataDashboard4List[i].sumCountTodayBefore5,
                        dataDashboard4List[i].sumCountTodayBefore4,
                        dataDashboard4List[i].sumCountTodayBefore3,
                        dataDashboard4List[i].sumCountTodayBefore2,
                        dataDashboard4List[i].sumCountTodayBefore1,
                        dataDashboard4List[i].sumCountToday
                    ]
                }
                chartDataSets.push(dataset);
            }

            var ctxhome = document.getElementById('test4home').getContext('2d');
            var test4home = new Chart(ctxhome, {
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
                            display: false
                        }
                    }
                }
            });


        });
    }

    // onclick 이벤트 처리
    //초기화
    $(function() {
        getDashboard1List();
        getDashboard2List();
        getDashboard3List();
        getDashboard4List();
    });
</script>

</html>