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
      <form name="searchView0" id="searchView0" method="post" onsubmit="return ACTIONS.dispatch(ACTIONS.PAGE_SEARCH);" style="">
        <input type="hidden" name="recordplayer" id="recordplayer">
        <input type="hidden" id="userId">
        <input type="hidden" id="docId">
        <input type="hidden" id="kwd">
        <div data-ax-tbl="" id="" class="ax-search-tbl" style="">
          <div data-ax-tr="" id="" class="" style="">
            <div data-ax-tbl="" id="" class="ax-search-tbl" style="">
              <div data-ax-tr="" id="" class="" style="">
                <div data-ax-td="" id="" class="" style=";width:850px">
                  <div data-ax-td-label="" class="" style=";width:90px">키워드</div>
                  <div data-ax-td-wrap="">

                    <div class="form-inline">
                      <div class="form-group">
                        <input type="text" id="searchWord" class="form-control W600" placeholder="">
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

                <div data-ax-td="" id="" class="" style=";width:180px">
                  <div data-ax-td-label="" class="" style=";width:80px">기간유형</div>
                  <div data-ax-td-wrap="">

                    <select id="periodType" data-ax-path="periodType" class="form-control W80">
                      <option value="day">일별</option>
                      <option value="month">월별</option>
                      <!-- <option value="time">시간대별</option> -->
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
                  <div data-ax-td-label="" class="" style=";width:120px">고객번호</div>
                  <div data-ax-td-wrap="">

                    <div class="form-inline">
                      <div class="form-group">
                        <input type="text" id="cust_no" class="form-control W130">
                      </div>
                    </div>

                  </div>
                </div>

                <div data-ax-td="" id="" class="" style=";width:300px">
                  <div data-ax-td-label="" class="" style="">전화번호</div>
                  <div data-ax-td-wrap="">

                    <div class="form-inline">
                      <div class="form-group">
                        <input type="text" id="cust_tel" class="form-control W130">
                      </div>
                    </div>

                  </div>
                </div>

              </div>

              <div data-ax-tr="" id="" class="" style="">
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
                  <div data-ax-td-label="" class="" style="">센터</div>
                  <div data-ax-td-wrap="">

                    <select id="centerNm" data-ax-path="centerNm" class="form-control W120">
                      <option value="ALL">전체</option>
                      <option value="CC">고객상담부</option>
                      <option value="CARD">카드사업단</option>
                    </select>

                  </div>
                </div>

                <div data-ax-td="part" id="part" class="" style=";width:190px">
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

                <div data-ax-td="" id="" class="" style=";width:260px">
                  <div data-ax-td-label="" class="" style="">상담사명</div>
                  <div data-ax-td-wrap="">

                    <input type="text" id="user_nm" class="form-control W120">

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
            <div data-tab-panel="{label: &quot;녹취리스트&quot;, active: true}" data-tab-active="true">
              <div style="padding:10px 0 0 0;" data-split-panel-wrap="scroll">

                <div id="gridTotalCnt" style="text-align: right; padding-right : 1%;"> </div>
                <!-- 목록 -->
                <div style="position: relative:height:470px;" id="grid-parent"></div>
                <div data-ax5grid="grid-view-01" data-fit-height-content="grid-view-01" style="height: 505px;"><div data-ax5grid-container="root" data-ax5grid-instance="ax5grid-37" style="height: 505px;">
                  <div data-ax5grid-container="hidden">
                    <textarea data-ax5grid-form="clipboard"></textarea>
                  </div>
                  <div data-ax5grid-container="header" style="height: 28px;">
                    <div data-ax5grid-panel="aside-header" style="display: none;"></div>
                    <div data-ax5grid-panel="left-header" style="display: none;"></div>
                    <div data-ax5grid-panel="header" style="left: 0px; width: 1193px; height: 28px;">
                      <div data-ax5grid-panel-scroll="header"><table border="0" cellpadding="0" cellspacing="0"><colgroup><col style="width:60px;"><col style="width:150px;"><col style="width:100px;"><col style="width:100px;"><col style="width:150px;"><col style="width:100px;"><col style="width:100px;"><col style="width:100px;"><col style="width:150px;"><col style="width:150px;"><col style="width:100px;"><col style="width:100px;"><col style="width:150px;"><col style="width:150px;"><col style="width:150px;"><col style="width:150px;"><col style="width:150px;"><col style="width:100px;"><col style="width:100px;"><col></colgroup><tbody><tr class=""><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="0" data-ax5grid-column-key="no" data-ax5grid-column-colindex="0" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="0" data-ax5grid-column-sort-order=""></span>&nbsp;</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="1" data-ax5grid-column-key="docId" data-ax5grid-column-colindex="1" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="1" data-ax5grid-column-sort-order=""></span>DOCID</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="2" data-ax5grid-column-key="date" data-ax5grid-column-colindex="2" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="2" data-ax5grid-column-sort-order=""></span>녹취일</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="3" data-ax5grid-column-key="stime" data-ax5grid-column-colindex="3" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="3" data-ax5grid-column-sort-order=""></span>녹취시작</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="4" data-ax5grid-column-key="duration" data-ax5grid-column-colindex="4" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="4" data-ax5grid-column-sort-order=""></span>통화시간</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="5" data-ax5grid-column-key="textValue" data-ax5grid-column-colindex="5" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="5" data-ax5grid-column-sort-order=""></span>통화내역</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="6" data-ax5grid-column-key="summary" data-ax5grid-column-colindex="6" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="6" data-ax5grid-column-sort-order=""></span>전문</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="7" data-ax5grid-column-key="outGb" data-ax5grid-column-colindex="7" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="7" data-ax5grid-column-sort-order=""></span>콜유형</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="8" data-ax5grid-column-key="userId" data-ax5grid-column-colindex="8" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="8" data-ax5grid-column-sort-order=""></span>상담사행번</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="9" data-ax5grid-column-key="userName" data-ax5grid-column-colindex="9" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="9" data-ax5grid-column-sort-order=""></span>상담사이름</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="10" data-ax5grid-column-key="custNo" data-ax5grid-column-colindex="10" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="10" data-ax5grid-column-sort-order=""></span>고객번호</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="11" data-ax5grid-column-key="custTel" data-ax5grid-column-colindex="11" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="11" data-ax5grid-column-sort-order=""></span>고객전화번호</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="12" data-ax5grid-column-key="groupName" data-ax5grid-column-colindex="12" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="12" data-ax5grid-column-sort-order=""></span>센터</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="13" data-ax5grid-column-key="groupId" data-ax5grid-column-colindex="13" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="13" data-ax5grid-column-sort-order=""></span>파트</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="14" data-ax5grid-column-key="tacategory1" data-ax5grid-column-colindex="14" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="14" data-ax5grid-column-sort-order=""></span>대분류</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="15" data-ax5grid-column-key="tacategory2" data-ax5grid-column-colindex="15" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="15" data-ax5grid-column-sort-order=""></span>중분류</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="16" data-ax5grid-column-key="tacategory3" data-ax5grid-column-colindex="16" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="16" data-ax5grid-column-sort-order=""></span>소분류</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="17" data-ax5grid-column-key="muteCount" data-ax5grid-column-colindex="17" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="17" data-ax5grid-column-sort-order=""></span>묵음횟수</span></td><td data-ax5grid-column-attr="default" data-ax5grid-column-row="0" data-ax5grid-column-col="18" data-ax5grid-column-key="muteTime" data-ax5grid-column-colindex="18" data-ax5grid-column-rowindex="0" colspan="1" rowspan="1" class="hasBorder isLastColumn " style="height: 27px;min-height: 1px;"><span data-ax5grid-cellholder="" data-ax5grid-text-align="center" style="height: 27px;line-height: 21px;"><span data-ax5grid-column-sort="18" data-ax5grid-column-sort-order=""></span>묵음시간</span></td><td data-ax5grid-column-row="null" data-ax5grid-column-col="null" style="height: 28px;min-height: 1px;"></td></tr></tbody></table><div data-ax5grid-column-resizer="0" style="height:27px;left: 56px;"></div><div data-ax5grid-column-resizer="1" style="height:27px;left: 206px;"></div><div data-ax5grid-column-resizer="2" style="height:27px;left: 306px;"></div><div data-ax5grid-column-resizer="3" style="height:27px;left: 406px;"></div><div data-ax5grid-column-resizer="4" style="height:27px;left: 556px;"></div><div data-ax5grid-column-resizer="5" style="height:27px;left: 656px;"></div><div data-ax5grid-column-resizer="6" style="height:27px;left: 756px;"></div><div data-ax5grid-column-resizer="7" style="height:27px;left: 856px;"></div><div data-ax5grid-column-resizer="8" style="height:27px;left: 1006px;"></div><div data-ax5grid-column-resizer="9" style="height:27px;left: 1156px;"></div><div data-ax5grid-column-resizer="10" style="height:27px;left: 1256px;"></div><div data-ax5grid-column-resizer="11" style="height:27px;left: 1356px;"></div><div data-ax5grid-column-resizer="12" style="height:27px;left: 1506px;"></div><div data-ax5grid-column-resizer="13" style="height:27px;left: 1656px;"></div><div data-ax5grid-column-resizer="14" style="height:27px;left: 1806px;"></div><div data-ax5grid-column-resizer="15" style="height:27px;left: 1956px;"></div><div data-ax5grid-column-resizer="16" style="height:27px;left: 2106px;"></div><div data-ax5grid-column-resizer="17" style="height:27px;left: 2206px;"></div><div data-ax5grid-column-resizer="18" style="height:27px;left: 2306px;"></div></div>
                    </div>
                    <div data-ax5grid-panel="right-header" style="display: none;"></div>
                  </div>
                  <div data-ax5grid-container="body" style="height: 430px;">
                    <div data-ax5grid-panel="top-aside-body" style="display: none;"></div>
                    <div data-ax5grid-panel="top-left-body" style="display: none;"></div>
                    <div data-ax5grid-panel="top-body" style="display: none;">
                      <div data-ax5grid-panel-scroll="top-body"></div>
                    </div>
                    <div data-ax5grid-panel="top-right-body" style="display: none;"></div>
                    <div data-ax5grid-panel="aside-body" style="display: none;">
                      <div data-ax5grid-panel-scroll="aside-body"></div>
                    </div>
                    <div data-ax5grid-panel="left-body" style="display: none;">
                      <div data-ax5grid-panel-scroll="left-body"></div>
                    </div>
                    <div data-ax5grid-panel="body" style="left: 0px; width: 1193px; top: 0px; height: 430px;">
                      <div data-ax5grid-panel-scroll="body"></div>
                    </div>
                    <div data-ax5grid-panel="right-body" style="display: none;">
                      <div data-ax5grid-panel-scroll="right-body"></div>
                    </div>
                    <div data-ax5grid-panel="bottom-aside-body" style="display: none;"></div>
                    <div data-ax5grid-panel="bottom-left-body" style="display: none;"></div>
                    <div data-ax5grid-panel="bottom-body" style="display: none;">
                      <div data-ax5grid-panel-scroll="bottom-body"></div>
                    </div>
                    <div data-ax5grid-panel="bottom-right-body" style="display: none;"></div>
                  </div>
                  <div data-ax5grid-container="page" style="height: 30px;">
                    <div data-ax5grid-page="holder">
                      <div data-ax5grid-page="navigation"></div>
                      <div data-ax5grid-page="status"></div>
                    </div>
                  </div>
                  <div data-ax5grid-container="scroller">
                    <div data-ax5grid-scroller="vertical" style="display: none;">
                      <div data-ax5grid-scroller="vertical-bar" style="width: 10px; left: 2px;"></div>
                    </div>
                    <div data-ax5grid-scroller="horizontal" style="display: block; width: 1193px; height: 15px; right: 0px; bottom: 30px;">
                      <div data-ax5grid-scroller="horizontal-bar" style="height: 10px; top: 2px; left: 0px; width: 616.125px;"></div>
                    </div>
                    <div data-ax5grid-scroller="corner" style="display: none;"></div>
                  </div>
                  <div data-ax5grid-resizer="vertical"></div>
                  <div data-ax5grid-resizer="horizontal"></div>
                </div></div>

              </div>
            </div>

            <div data-tab-panel="{label: &quot;키워드추이&quot;, active: false}">
              <div style="padding:10px 0 0 0;" data-split-panel-wrap="scroll">

                <div id="chart-container">FusionCharts XT will load here!</div>

              </div>
            </div>

            <div data-tab-panel-label-holder="ax5layout-34">
              <div data-tab-panel-label-border="ax5layout-34"></div>
              <div data-tab-panel-label-table="ax5layout-34">
                <div data-tab-panel-aside="left"></div>
                <div data-tab-panel-label="0" data-tab-active="true">
                  <div data-tab-label="0">녹취리스트</div>
                </div>
                <div data-tab-panel-label="1" data-tab-active="false">
                  <div data-tab-label="1">키워드추이</div>
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
</html>
