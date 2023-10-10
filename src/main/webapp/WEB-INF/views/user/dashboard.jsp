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
                                <div data-ax5grid="grid-view-04" data-fit-height-content="grid-view-04" style="width:100%; height:355px;">
                                    <div id="grid4home"></div>
                                </div>
                            </td>
                        </tr>
                        </tbody></table>
                </td>
            </tr>
            </tbody></table>


    </div>
</div>

</body>

<!-- script for chart/grid (오브젝트 아래위치에서 작성해야 동작) -->
<script>

    var dataTest = [
        ["존", "john@example.com", "(353) 01 222 3333"],
        ["마크", "mark@gmail.com", "(01) 22 888 4444"],
        ["eoin", "eoin@gmail.com", "0097 22 654 00033"],
        ["sarah", "sarahcdd@gmail.com", "+322 876 1233"],
        ["afshin", "afshin@mail.com", "(353) 22 87 8356"],
        ["존2", "john@example.com", "(353) 01 222 3333"],
        ["마크2", "mark@gmail.com", "(01) 22 888 4444"],
        ["eoin2", "eoin@gmail.com", "0097 22 654 00033"],
        ["sarah2", "sarahcdd@gmail.com", "+322 876 1233"],
        ["afshin2", "afshin@mail.com", "(353) 22 87 8356"],
        ["존3", "john@example.com", "(353) 01 222 3333"],
        ["마크3", "mark@gmail.com", "(01) 22 888 4444"],
        ["eoin3", "eoin@gmail.com", "0097 22 654 00033"],
        ["sarah3", "sarahcdd@gmail.com", "+322 876 1233"],
        ["afshin3", "afshin@mail.com", "(353) 22 87 8356"]
    ];

    function onBtnExport() {

        var wb = new ExcelJS.Workbook();
        var workbookName = "Sample Workbook Generated by ExcelJS.xlsx";
        var worksheetName = "Demo Worksheet";
        var ws = wb.addWorksheet(worksheetName,
            {
                properties: {
                    tabColor: {argb:'FFFF0000'}
                }
            }
        );
        ws.columns = [
            {
                key: "이름 ",
                header: "이름",
                width: 20
            },
            {
                key: "이메일",
                header: "이메일",
                width: 15,
                style: { numFmt: '"£"#,##0.00;[Red]-"£"#,##0.00' }
            },
            {
                key: "연락처",
                header: "연락처",
                width: 30,
                outlineLevel: 1 ,
                hidden: false
            },
        ];
        ws.addRows(dataTest);
        wb.xlsx.writeBuffer()
            .then(function(buffer) {
                saveAs(
                    new Blob([buffer], { type: "application/octet-stream" }),
                    workbookName
                );
            });

    }


    var gridTest1home = new gridjs.Grid({
        columns: ["Name", "Email", "Phone Number"],
        data: dataTest,
        pagination: {
            limit: 3
        },
        resizable: true,
        search: true,
        sort: true
    }).render(document.getElementById("grid1home"));
    var gridTest2home = new gridjs.Grid({
        columns: ["Name", "Email", "Phone Number"],
        data: dataTest,
        pagination: {
            limit: 3
        },
        resizable: true,
        search: true,
        sort: true
    }).render(document.getElementById("grid2home"));
    var gridTest3home = new gridjs.Grid({
        columns: ["Name", "Email", "Phone Number"],
        data: dataTest,
        pagination: {
            limit: 3
        },
        resizable: true,
        search: true,
        sort: true
    }).render(document.getElementById("grid3home"));
    var gridTest4home = new gridjs.Grid({
        columns: ["Name", "Email", "Phone Number"],
        data: dataTest,
        pagination: {
            limit: 3
        },
        resizable: true,
        search: true,
        sort: true
    }).render(document.getElementById("grid4home"));


    // 차트를 그럴 영역을 dom요소로 가져온다.
    var chartArea1home = document.getElementById('test1home').getContext('2d');
    // 차트를 생성한다.
    var testChart1home = new Chart(chartArea1home, {
        // ①차트의 종류(String)
        //type: 'bar',
        type: 'doughnut',
        // ②차트의 데이터(Object)
        data: {
            // ③x축에 들어갈 이름들(Array)
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
            datasets: [{
                // ⑤dataset의 이름(String)
                label: 'test1',
                // ⑥dataset값(Array)
                data: [12, 19, 3, 5, 2, 3],
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
                }
            }
        },
        plugins: [ChartDataLabels]
    });

    // 차트를 그럴 영역을 dom요소로 가져온다.
    var chartArea2home = document.getElementById('test2home').getContext('2d');
    // 차트를 생성한다.
    var testChart2home = new Chart(chartArea2home, {
        // ①차트의 종류(String)
        type: 'bar',
        // ②차트의 데이터(Object)
        data: {
            // ③x축에 들어갈 이름들(Array)
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
            datasets: [{
                // ⑤dataset의 이름(String)
                label: 'test2',
                // ⑥dataset값(Array)
                data: [12, 19, 3, 5, 2, 3],
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
                }
            }
        },
        plugins: [ChartDataLabels]
    });


    // 차트를 그럴 영역을 dom요소로 가져온다.
    var chartArea3home = document.getElementById('test3home').getContext('2d');
    // 차트를 생성한다.
    var testChart3home = new Chart(chartArea3home, {
        // ①차트의 종류(String)
        type: 'bar',
        // ②차트의 데이터(Object)
        data: {
            // ③x축에 들어갈 이름들(Array)
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
            datasets: [
                {
                    // ⑤dataset의 이름(String)
                    label: 'test3a',
                    // ⑥dataset값(Array)
                    data: [12, 19, 3, 5, 2, 3],
                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                    backgroundColor: [
                        //색상
                        'rgba(255, 99, 132, 0.2)',
                    ],
                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                    //borderColor: 'rgba(255, 99, 132, 1)',
                    // ⑨dataset의 선 두께(Number)
                    borderWidth: 1
                },
                {
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
            ]
        },
        // ⑩차트의 설정(Object)
        options: {
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
                }
            }
        },
        plugins: [ChartDataLabels]
    });
    // onclick 이벤트 처리
    document.getElementById('test3home').onclick = function(evt) {
        var points = testChart3home.getElementsAtEventForMode(evt, 'nearest', { intersect: true }, true);

        if (points.length) {
            var firstPoint = points[0];
            var label = testChart3.data.labels[firstPoint.index];
            var value = testChart3.data.datasets[firstPoint.datasetIndex].data[firstPoint.index];

            //console.log(label);
            //console.log(value);
            alert(label);
        }
    };


    function addZero(i) {
        var rtn = i + 100;
        return rtn.toString().substr(1, 3);
    }

    var monthList = [];
    var monthData = [50,60,70,45,50,66];

    var dt = new Date();
    var year = dt.getFullYear();
    var mon = addZero(eval(dt.getMonth()+1));
    var now = year+mon;

    for(var i = (now - 5); i <= now; i++){
        var format =  i;
        monthList.push(format);
    }

    var ctxhome = document.getElementById('test4home').getContext('2d');
    var test4home = new Chart(ctxhome, {
        type: 'line',
        data: {
            labels: monthList,
            datasets: [
                {
                    // ⑤dataset의 이름(String)
                    label: 'test3a',
                    // ⑥dataset값(Array)
                    data: [12, 19, 3, 5, 2, 3],
                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                    backgroundColor: [
                        //색상
                        'rgba(255, 99, 132, 0.5)',
                    ],
                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                    borderColor: 'rgba(255, 99, 132, 1)',
                    // ⑨dataset의 선 두께(Number)
                    borderWidth: 1
                },
                {
                    // ⑤dataset의 이름(String)
                    label: 'test3b',
                    // ⑥dataset값(Array)
                    data: [8, 1, 9, 11, -2, -4],
                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                    backgroundColor: [
                        //색상
                        'rgba(54, 162, 235, 0.5)',
                    ],
                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                    borderColor: 'rgba(54, 162, 235, 1)',
                    // ⑨dataset의 선 두께(Number)
                    borderWidth: 1
                }
            ]
        },

        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });
</script>

</html>