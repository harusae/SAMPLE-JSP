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
  <title>통합검색</title>

</head>
<body class="ax-body" data-page-auto-height="true"><input type="hidden" id="ssMenuGrpCd" value="null">
<div id="ax-base-root" data-root-container="true">
  <div class="ax-base-title" role="page-title">
    <h1 class="title"><i class="cqc-browser"></i> 통합검색</h1>
    <p class="desc"></p>
  </div>
  <div class="ax-base-content">
    <div data-page-buttons="">
      <div class="button-warp">
        <button type="button" class="btn btn-default" data-page-btn="reload" onclick="window.location.reload();"><i class="cqc-cw"></i></button>
        <button type="button" class="btn btn-info" data-page-btn="search"><i class="cqc-magnifier"></i> 조회 </button>
        <button type="button" class="btn btn-info" data-page-btn="excel"><i class="cqc-file-excel-o"></i> 엑셀</button>
      </div>
    </div>

    <div role="page-header">
      <form name="searchAllForm" id="searchAllForm" method="post" onsubmit="return ACTIONS.dispatch(ACTIONS.PAGE_SEARCH);" style="">
        <div data-ax-tbl="" id="" class="ax-search-tbl" style="">
          <div data-ax-tr="" id="" class="" style="">
            <div data-ax-tbl="" id="" class="ax-search-tbl" style="">
              <div data-ax-tr="" id="" class="" style="">
                <div data-ax-td="" id="" class="" style=";width:850px">
                  <div data-ax-td-label="" class="" style=";width:90px">키워드</div>
                  <div data-ax-td-wrap="">

                    <div class="form-inline">
                      <div class="form-group">
                        <input type="text" id="query" class="form-control W600" placeholder="">
                      </div>
                    </div>

                  </div>
                </div>
              </div>

              <div data-ax-tr="" id="" class="" style="">
                <div data-ax-td="" id="" class="" style=";width:195px">
                  <div data-ax-td-label="" class="" style=";width:90px">콜유형</div>
                  <div data-ax-td-wrap="">

                    <select id="callType" data-ax-path="callType" class="form-control W90">
                      <option value="0|1|2">전체</option>
                      <option value="0">수신</option>
                      <option value="1">발신</option>
                      <option value="2">인 → 아웃</option>
                    </select>

                  </div>
                </div>


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

                <div data-ax-td="" id="" class="" style=";width:200px">
                  <div data-ax-td-label="" class="" style=";width:20px">~</div>
                  <div data-ax-td-wrap="">

                    <div class="input-group" data-ax5picker="date">
                      <input id="toDay" type="text" class="form-control" placeholder="yyyy/mm/dd">
                      <span class="input-group-addon"><i class="cqc-calendar"></i></span>
                      <select id="toHH" class="form-control" style="width:60px;">
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

                <div data-ax-td="" id="" class="" style=";width:270px">
                  <div data-ax-td-label="" class="" style=";width:120px">상담원</div>
                  <div data-ax-td-wrap="">

                    <div class="form-inline">
                      <div class="form-group">
                        <input type="text" id="cust_no" class="form-control W130">
                      </div>
                    </div>

                  </div>
                </div>

              </div>

              <div data-ax-tr="" id="" class="" style="">

                <div data-ax-td="" id="" class="" style=";width:195px">
                  <div data-ax-td-label="" class="" style=";width:90px">채널명</div>
                  <div data-ax-td-wrap="">

                    <select id="callType" data-ax-path="callType" class="form-control W90">
                      <option value="">전체</option>
                      <option value="A">A</option>
                      <option value="B">B</option>
                      <option value="C">C</option>
                      <option value="D">D</option>
                      <option value="H">H</option>
                    </select>

                  </div>
                </div>

                <div data-ax-td="" id="" class="" style=";width:500px">
                  <div data-ax-td-label="" class="" style=";width:90px">분류</div>
                  <div data-ax-td-wrap="">

                    <div class="form-inline">
                      <div class="form-group">
                        <select class="form-control" style="width:120px;" id="bigClass">
                          <option value="">전체</option>
                          <option value="예금">예금</option><option value="본지점 및 타기관">본지점 및 타기관</option><option value="비씨">비씨</option><option value="미분류">미분류</option><option value="인터넷뱅킹">인터넷뱅킹</option><option value="대출">대출</option><option value="사고신고">사고신고</option><option value="고객정보">고객정보</option><option value="외환">외환</option><option value="스마트뱅킹">스마트뱅킹</option><option value="자동화">자동화</option><option value="방카">방카</option><option value="보이스피싱">보이스피싱</option><option value="비대면본인인증">비대면본인인증</option></select>
                        <select class="form-control" style="width:120px;" id="midClass"><option value="">전체</option></select>
                        <select class="form-control" style="width:120px;" id="subClass">
                          <option value="">전체</option>
                        </select>
                      </div>
                    </div>

                  </div>
                </div>

                <div data-ax-td="" id="" class="" style=";width:250px">
                  <div data-ax-td-label="" class="" style="">긍부정</div>
                  <div data-ax-td-wrap="">

                    <select id="centerNm" data-ax-path="centerNm" class="form-control W120">
                      <option value="ALL">전체</option>
                      <option value="CC">긍정</option>
                      <option value="CARD">부정</option>
                    </select>

                  </div>
                </div>


              </div>
            </div>
          </div>
        </div>
      </form>
    </div>

    <div data-ax5layout="ax1" role="page-content" data-config="{layout:&quot;split-panel&quot;, orientation: &quot;horizontal&quot;, splitter: {size: 7}}" style="height: 570px;">
      <div data-split-panel="{height: &quot;*&quot;}" id="" style="padding-top: 10px; display: block; height: 570px; top: 0px;" class="split-panel-horizontal">
        <div style="padding-top: 10px;" class="" data-split-panel-wrap="">
          <div data-ax5layout="ax2" data-config="{layout:&quot;tab-panel&quot;}" data-fit-height-content="layout-view-01" style="height: 550px;">
            <div data-tab-panel="{label: &quot;상담목록&quot;, active: true}" data-tab-active="true">
              <div style="padding:10px 0 0 0;" data-split-panel-wrap="scroll">

                <div id="gridTotalCnt" style="text-align: right; padding-right : 1%;"> </div>
                <!-- 목록 -->
                <div style="position: relative:height:470px;" id="grid-parent"></div>
                <div data-ax5grid="grid-view-01" data-fit-height-content="grid-view-01" style="height: 505px;">
                  <div id="grid1SearchAll" style="height: 490px;" class="ag-theme-alpine" ></div>
                </div>

              </div>
            </div>


            <div data-tab-panel-label-holder="ax5layout-34">
              <div data-tab-panel-label-border="ax5layout-34"></div>
              <div data-tab-panel-label-table="ax5layout-34">
                <div data-tab-panel-aside="left"></div>
                <div data-tab-panel-label="0" data-tab-active="true">
                  <div data-tab-label="0">상담목록</div>
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
  var searchAllList;

  function getSearchAllList1() {
    commonAjax("http://100.80.79.22:15000/search/stt", $("#searchAllForm").serialize(), function(res){

      console.log('searchAllList res : ', res);
      searchAllList = res.collectionList[0].resultList;

      //start ag-grid
      var columnDefs = [
        { headerName: '상담ID', field: "CALL_ID"},
        { headerName: '녹취일', field: "RECORD_DT" },
        { headerName: '녹취시작', field: "RECORD_DT" },
        { headerName: '통화시간', field: "RECORD_TIME" },
        { headerName: '전문', field: "" },
        { headerName: '요약', field: "" },
        { headerName: '상담사이름', field: "AGENT_NM" },
        { headerName: '지점', field: "BLNT_BRNO_NM" },
        { headerName: '채널', field: "CHANNEL_SC_NM" },
        { headerName: '대분류', field: "LD_CLS_NM" },
        { headerName: '중분류', field: "MD_CLS_NM" },
        { headerName: '소분류', field: "SD_CLS_NM" },
        { headerName: '묵음시간', field: "MUTE_TIME" }
      ];
      // let the grid know which columns and what data to use
      var gridOptions = {
        columnDefs: columnDefs,
        rowData: searchAllList,
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
      var gridDiv = document.querySelector('#grid1SearchAll');
      new agGrid.Grid(gridDiv, gridOptions);
      //end ag-grid

    });
  }
  //초기화
  $(function() {
    getSearchAllList1();

  });
</script>

</html>
