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

  <link rel="stylesheet" type="text/css" href="/css/popularkeyword.css">
</head>

<body class="ax-body " data-page-auto-height="true">
<div id="ax-base-root" data-root-container="true">
  <div class="ax-base-title" role="page-title">
    <h1 class="title"><i class="cqc-browser"></i> 실시간 키워드 순위</h1>
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
            <div data-ax-td="" id="" class="" style=";width:280px">
              <div data-ax-td-label="" class="" style="">기간선택</div>
              <div data-ax-td-wrap="">

                <div class="input-group" data-ax5picker="date">
                  <input id="fromDay" type="text" class="form-control" placeholder="yyyy/mm/dd">
                  <span class="input-group-addon"><i class="cqc-calendar"></i></span>
                  <select id="fromHH" class="form-control" style="width:60px;">
                    <option value="" selected="">시간</option>
                    <option value="000000">00시</option>
                    <option value="010000">01시</option>
                    <option value="020000">02시</option>
                    <option value="030000">03시</option>
                    <option value="040000">04시</option>
                    <option value="050000">05시</option>
                    <option value="060000">06시</option>
                    <option value="070000">07시</option>
                    <option value="080000">08시</option>
                    <option value="090000">09시</option>
                    <option value="100000">10시</option>
                    <option value="110000">11시</option>
                    <option value="120000">12시</option>
                    <option value="130000">13시</option>
                    <option value="140000">14시</option>
                    <option value="150000">15시</option>
                    <option value="160000">16시</option>
                    <option value="170000">17시</option>
                    <option value="180000">18시</option>
                    <option value="190000">19시</option>
                    <option value="200000">20시</option>
                    <option value="210000">21시</option>
                    <option value="220000">22시</option>
                    <option value="230000">23시</option>
                  </select>
                </div>

              </div>
            </div>

            <div data-ax-td="" id="" class="" style=";width:276px">
              <div data-ax-td-label="" class="" style=";width:20px">~</div>
              <div data-ax-td-wrap="">

                <div class="input-group" data-ax5picker="date">
                  <input id="toDay" type="text" class="form-control W80" placeholder="yyyy/mm/dd">
                  <span class="input-group-addon"><i class="cqc-calendar"></i></span>
                  <select id="toHH" class="form-control W65">
                    <option value="" selected="">시간</option>
                    <option value="000000">00시</option>
                    <option value="010000">01시</option>
                    <option value="020000">02시</option>
                    <option value="030000">03시</option>
                    <option value="040000">04시</option>
                    <option value="050000">05시</option>
                    <option value="060000">06시</option>
                    <option value="070000">07시</option>
                    <option value="080000">08시</option>
                    <option value="090000">09시</option>
                    <option value="100000">10시</option>
                    <option value="110000">11시</option>
                    <option value="120000">12시</option>
                    <option value="130000">13시</option>
                    <option value="140000">14시</option>
                    <option value="150000">15시</option>
                    <option value="160000">16시</option>
                    <option value="170000">17시</option>
                    <option value="180000">18시</option>
                    <option value="190000">19시</option>
                    <option value="200000">20시</option>
                    <option value="210000">21시</option>
                    <option value="220000">22시</option>
                    <option value="230000">23시</option>
                  </select>
                  <select id="periodSetting" data-ax-path="periodType" class="form-control W70">
                    <option value="today" selected="">당일</option>
                    <option value="week">일주일</option>
                    <option value="mon">일개월</option>
                  </select>
                </div>

              </div>
            </div>
            <input type="hidden" name="periodType" id="periodType" value="day">

          </div>
        </div>
      </form>
    </div>

    <div data-ax5layout="ax1" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;vertical&quot;, splitter: {size: 7}}" style="height: 734px;">
      <div data-split-panel="{width: &quot;43%&quot;}" id="" class="split-panel-vertical" style="display: block; width: 1223.26px; left: 0px;">
        <div style="padding-right: 3px;" class="" data-split-panel-wrap="">
          <div class="ax-button-group" data-fit-height-aside="left-view-01">
            <div class="left">
              <h2><i class="cqc-list"></i> 실시간 키워드 순위 (파트별)</h2>
            </div>
          </div>

          <div data-fit-height-content="left-view-01" style="height: 694px;">
            <div id="wrap">
              <div class="content">
                <section class="major">
                  <div class="all">
                    <table style="width: 100%; height: 100%;">
                      <tbody id="realtimeKeywordTbody">
                      <tr>
                        <td></td>
                        <td id="tit_1">
                          <ul id="realtimeKeywordHeaderUl">
                            <!--
                            <li>예금</li>
                            <li>대출</li>
                            <li>비씨</li>
                            <li>멀티</li>
                            <li>자동화</li>
                            <li>인뱅</li>
                            <li>영업점</li>
                            <li>자동화</li>d
                            <li>인뱅</li>
                            <li>영업점</li>
                            -->
                          </ul>
                        </td>
                      </tr>
                      <!--
                      <tr>
                        <td id="nb" style="width: 3.5%;"><p>1</p></td>
                        <td style="width: 96.5%;">
                          <ul>

                            <li><p id="jaSave0">고객</p><strong class="tt_r" id="jaSavec0">382</strong></li>
                            <li><p id="jaLoan0">고객</p><strong class="tt_g" id="jaLoanc0">67</strong></li>
                            <li><p id="jaBC0">고객</p><strong class="tt_o" id="jaBCc0">268</strong></li>
                            <li><p id="jaMulti0">고객</p><strong class="tt_b" id="jaMultic0">146</strong></li>
                            <li><p id="jaAuto0">고객</p><strong class="tt_s" id="jaAutoc0">22</strong></li>
                            <li><p id="jaInt0">고객</p><strong class="tt_r" id="jaIntc0">61</strong></li>
                            <li><p id="jaSale0">고객</p><strong class="tt_g" id="jaSalec0">163</strong></li>
                            <li><p id="jaAuto0">고객</p><strong class="tt_s" id="jaAutoc0">22</strong></li>
                            <li><p id="jaInt0">고객</p><strong class="tt_r" id="jaIntc0">61</strong></li>
                            <li><p id="jaSale0">고객</p><strong class="tt_g" id="jaSalec0">163</strong></li>
                          </ul>
                        </td>
                      </tr>
                      -->
                      </tbody></table>

                  </div>

                </section>

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
            <canvas id="realtimeKeywordChart1"></canvas>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>
</body>
<script>
  var realtimeKeywordLv1List;
  var realtimeKeywordDataList;
  var realtimeKeywordChartData;

  function getRealtimeKeywordLv1List(){

    commonAjax("/realtimeKeyword/lv1List", {}, function(res){
      realtimeKeywordLv1List = res;
      //console.log('realtimeKeywordLv1List : ',realtimeKeywordLv1List) ;
      for(var i=0; i<10; i++){
        var tmpLv1Nm = realtimeKeywordLv1List[i] =='undefined' ? '-' : realtimeKeywordLv1List[i].lv1Nm;
        var tmpHeaderLi = '<li>'+ tmpLv1Nm +'</li>';
        $('#realtimeKeywordHeaderUl').append(tmpHeaderLi);
      }

    });
  }

  function getRealtimeKeywordInfo(){

    commonAjax("/realtimeKeyword/getData", {}, function(res){
      realtimeKeywordDataList = res;
      //console.log('realtimeKeywordDataList : ',realtimeKeywordDataList) ;
      //console.log('realtimeKeywordDataList[0][0][0] : ',realtimeKeywordDataList[0][0][0]) ;
      for(var i=0; i<10; i++){
        var tmpTr = '<tr>';
        tmpTr += '<td id="nb" style="width: 3.5%;"><p>'+ i +'</p></td>';
        tmpTr += '<td style="width: 96.5%;">';
        tmpTr += '<ul>';

        tmpTr += '<li><p id="jaSave0">'+realtimeKeywordDataList[i][0][0]+'</p><strong class="tt_r" id="jaSavec0">'+realtimeKeywordDataList[i][0][1]+'</strong></li>';
        tmpTr += '<li><p id="jaLoan0">'+realtimeKeywordDataList[i][1][0]+'</p><strong class="tt_g" id="jaLoanc0">'+realtimeKeywordDataList[i][1][1]+'</strong></li>';
        tmpTr += '<li><p id="jaBC0">'+realtimeKeywordDataList[i][2][0]+'</p><strong class="tt_o" id="jaBCc0">'+realtimeKeywordDataList[i][2][1]+'</strong></li>';
        tmpTr += '<li><p id="jaMulti0">'+realtimeKeywordDataList[i][3][0]+'</p><strong class="tt_b" id="jaMultic0">'+realtimeKeywordDataList[i][3][1]+'</strong></li>';
        tmpTr += '<li><p id="jaAuto0">'+realtimeKeywordDataList[i][4][0]+'</p><strong class="tt_s" id="jaAutoc0">'+realtimeKeywordDataList[i][4][1]+'</strong></li>';
        tmpTr += '<li><p id="jaInt0">'+realtimeKeywordDataList[i][5][0]+'</p><strong class="tt_r" id="jaIntc0">'+realtimeKeywordDataList[i][5][1]+'</strong></li>';
        tmpTr += '<li><p id="jaSale0">'+realtimeKeywordDataList[i][6][0]+'</p><strong class="tt_g" id="jaSalec0">'+realtimeKeywordDataList[i][6][1]+'</strong></li>';
        tmpTr += '<li><p id="jaAuto0">'+realtimeKeywordDataList[i][7][0]+'</p><strong class="tt_s" id="jaAutoc0">'+realtimeKeywordDataList[i][7][1]+'</strong></li>';
        tmpTr += '<li><p id="jaInt0">'+realtimeKeywordDataList[i][8][0]+'</p><strong class="tt_r" id="jaIntc0">'+realtimeKeywordDataList[i][8][1]+'</strong></li>';
        tmpTr += '<li><p id="jaSale0">'+realtimeKeywordDataList[i][9][0]+'</p><strong class="tt_g" id="jaSalec0">'+realtimeKeywordDataList[i][9][1]+'</strong></li>';

        tmpTr += '</ul>';
        tmpTr += '</td>';
        tmpTr += '</tr>';

        $('#realtimeKeywordTbody').append(tmpTr);
      }
    });
  }

  function getRealtimeKeywordLv1ChartList(){

    commonAjax("/realtimeKeyword/lv1ChartList", {}, function(res){
      realtimeKeywordChartData = res;
      //console.log('realtimeKeywordChartData : ',realtimeKeywordChartData) ;

      var chartLabels = [];
      var chartData = [];
      var listLength =realtimeKeywordChartData.length < 10 ? realtimeKeywordChartData.length : 10;
      for(var i=0; i<listLength ; i++){
        chartLabels.push(realtimeKeywordChartData[i].lv1Nm);
        chartData.push(realtimeKeywordChartData[i].sumCount);
      }
      // 차트를 그럴 영역을 dom요소로 가져온다.
      var chartArea1 = document.getElementById('realtimeKeywordChart1').getContext('2d');
      // 차트를 생성한다.
      var chart1 = new Chart(chartArea1, {
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
            },
            title: {
              display: true,
              text: '대분류 별'
            }
          }
        }
      });


    });
  }

  //초기화
  $(function() {
    getRealtimeKeywordLv1List();
    getRealtimeKeywordInfo();
    getRealtimeKeywordLv1ChartList();
  });

</script>
</html>
