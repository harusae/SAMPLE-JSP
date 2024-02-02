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
  <title>TA</title>
</head>

<link
        href="https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css"
        rel="stylesheet"
/>
<script src="/js/jquery-3.7.1.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
        integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer"
></script>
<!--chart.js-->
<script src="/js/chart.js"></script>
<script src="/js/datalabels.js"></script>
<!--grid.js-->
<script src="/js/gridjs.umd.js"></script>
<script src="/js/selection.umd.js"></script>
<link href="/css/mermaid.min.css" rel="stylesheet"/>
<!--excel.js-->
<script src="/js/exceljs.min.js"></script>
<script src="/js/FileSaver.min.js"></script>
<!--bootstrap Treeview-->
<script src="/js/bootstrap-treeview.js"></script>
<link href="/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/css/bootstrap-treeview.css" rel="stylesheet"/>
<!--aggrid-->
<script src="/js/ag-grid-community.min.js"></script>
<link rel="stylesheet" href="/css/ag-grid.css"/>
<link rel="stylesheet" href="/css/ag-theme-alpine.css"/>

<!--publish css-->
<link rel="stylesheet" href="/css/axboot.css"/>
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="css/new_page.css">
<link rel="stylesheet" href="font-awesome/css/all.min.css">


<!--
  웹화면 작성 시 주의점
    > home.jsp를 메인페이지 + 타 페이지는 DIV로 하위페이지 형식으로 읽어오는 원페이지 형식의 구조인 관계로
      1페이지에서 모든 element가 처리되니 모든 element의 id와 function이 unique해야 정상동작한다.
      겹치는 id를 사용하면 동작이상이 발생하니 id가 겹치지 않도록 주의요망.
-->

<script type="text/javascript">

  //표시한 화면 DIV ID 목록
  var divIdArray = [];

  //DIV에 하위페이지 로드/이동 처리
  function navInit(id, name, url){
      console.log('navInit id : ', id);
      console.log('navInit name : ', name);
      console.log('navInit url : ', url);

    $('.depth02_list.m02').hide();    //메뉴바 하위메뉴 비표시처리
    //로그인 세션 체크
    commonAjax('/sessionChk', {}, function(res){
      //console.log('sessionChk : ', res);
    });

    if(url != ''){ //이동URL이 있는 경우
      var findResult = divIdArray.indexOf(id);  //입력된 DIV ID가 있는지 검색
      if(findResult < 0){ //미생성화면 DIV ID인 경우

        //입력된 menuid를 html element id로 생성 > menuid가 기존 element id와 겹치면 동작이상 발생
        $("#content-frame-container").append("<div class='dynamicDiv' id='"+id+"'>div "+id+"</div>"); //새로운 DIV 생성 + 추가
        /*
        var html = '<span class="tab-item" style="min-width: 120px; width: auto;" id="navDiv'+id+'">'
          + '<span data-toggle="tooltip" data-placement="bottom" class="navItem" id="navItem'+id+'">'+name+'</span>'
          + '<i class="cqc-cancel3 on" data-tab-close="true" id="navDel'+id+'"></i>'
          + '</span>';
        $( "#navBar" ).append(html);  //네비게이션 추가
        */
        var tmpLi =
            '<li id="navDiv'+id+'">' +
            '<a href="#" class="tab_link">' +
            '<span class="navItem" id="navItem'+id+'">'+name+'</span>' +
            '<i class="fas fa-times" id="navDel'+id+'"></i>' +
            '</a>' +
            '</li>';

        $( "#navBar1" ).append(tmpLi);


        divIdArray.push(id);  //생성한 DIV ID 저장
        try{
          $('#'+id).load(url);  //생성한 DIV에 페이지 로드
        }
        catch(e){
          console.log('subDiv e:', e);
        }
      }
      //입력된 DIV ID에 해당하는 화면만 show 처리
      showOnlyDivInput(id);
    }
  }
  //선택한 ID의 DIV만 표시
  function showOnlyDivInput(id){
    $('.depth02_list.m02').hide();    //메뉴바 하위메뉴 비표시처리
    for(var i=0; i<divIdArray.length; i++ ){
      if(id == divIdArray[i]){
        $('#'+ divIdArray[i]).show();
      }
      else{
        $('#'+ divIdArray[i]).hide();
      }
    }
  }
  //선택한 ID의 DIV 삭제
  function delDivInput(id){
    var isShowed = $('#'+id).is(':visible');
    $('#'+id).remove();
    $('#navDiv'+id).remove();
    divIdArray = divIdArray.filter((element) => element !== id);

    if(isShowed){
      if(divIdArray.length > 0){
        showOnlyDivInput(divIdArray[divIdArray.length-1]);
      }
    }
  }


  //메뉴 > 상위메뉴 선택 시
  $(document).on('click', '.depth01', function() { //class depth01 선택 시
      var menuBarMenuId = $(this).attr("id");
      if(menuBarMenuId != null){
          console.log('menuBarMenuId : ', menuBarMenuId);
          var menuBarUlId = menuBarMenuId.substring(7,menuBarMenuId.length);
          var ulFlag = $('#depth2_'+menuBarUlId).css('display');
          //console.log('ulFlag : ', ulFlag);

          $('.depth02_list.m02').hide();    //메뉴바 하위메뉴 비표시처리
          if ( ulFlag === 'none' ) {
              $('#depth2_'+menuBarUlId).show();
          } else {
              $('#depth2_'+menuBarUlId).hide();
          }
      }
  });

  //네비게이션 바 > 메뉴명 선택 시
  $(document).on('click', '.navItem', function() {  //class navItemXXX 선택 시
    commonAjax('/sessionChk', {}, function(res){
      //console.log('sessionChk : ', res);
    });

    var navItemId = $(this).attr("id");
    var id = navItemId.substring(7,navItemId.length);
    showOnlyDivInput(id);
  });
  //네비게이션 바 > 메뉴삭제 선택 시
  $(document).on('click', '.fas.fa-times', function() { //class fas fa-times 선택 시
      console.log($(this).attr("id"));
      var delItemId = $(this).attr("id");
      var id = delItemId.substring(6,delItemId.length);
      delDivInput(id);
  });
  /*
  //네비게이션 바 > 메뉴삭제 선택 시
  $(document).on('click', '.cqc-cancel3', function() { //class cqc-cancel3XXX 선택 시
      console.log($(this).attr("id"));
      var delItemId = $(this).attr("id");
      var id = delItemId.substring(6,delItemId.length);
      delDivInput(id);
  });
  */
  //비동기통신 시 세션체크필요 > 공통모듈로 호출
  function commonAjax(url, param, callback, errCallback){
    $.ajax({
      url : url,
      type : "post",
      data : param,
      success : function(res){
        return callback(res);
      },
      error : function (error){
        //console.log('error : ', error);
        if(error.status == '401'){
          console.log('error status : ', error.status);
          alert('로그인이 필요합니다.');
          location.href = '/';
        }
        else if(error.status == '403'){
          console.log('error status : ', error.status);
          alert('권한이 필요합니다.');
        }
        else{
          errCallback(error);
        }
      }
    });
  }
  //초기화
  $(function() {
    navInit('home', '대시보드', '/home');
  });
</script>
<body class="ax-body " data-page-auto-height="true">

    <div class="wrap">
        <div class="util_area">
            <ul class="util_box" onclick="javascript:location.href='/logout';">
                <li><a href="#" class="txt"><span class="fw">${principal.username} </span>님 로그인</a></li>
                <li>
                    <a href="#" class="btn logout"><i class="fas fa-sign-in-alt"></i>로그아웃</a>
                </li>
            </ul>
        </div>
        <div class="header">
            <h1 class="h_logo"><a href="#"><img src="/img/img01.jpg" alt="Pixabay로부터 입수된 alhh님의 이미지 입니다." style="width:150px; height:40px;"></a></h1>
            <div class="menu_total_wrap">
                <ul class="gnb_menu">
                    <c:set var="firstLi" value="Y"/>
                    <c:set var="lastLi" value="Y"/>
                    <c:set var="firstUl" value="N"/>
                    <c:set var="lastUl" value="N"/>
                <c:forEach items="${principal.menuList}" var="menu" varStatus="status">
                    <script>
                        //console.log("menu : ", '${menu}');
                        //console.log("firstLi : ", '${firstLi}');
                        //console.log("lastLi : ", '${lastLi}');
                        //console.log("firstUl : ", '${firstUl}');
                        //console.log("lastUl : ", '${lastUl}');
                    </script>
                    <c:if test="${menu.upperMenuId == null and lastUl == 'Y'}">
                    </ul>
                    </li>
                        <c:set var="firstLi" value="Y"/>
                        <c:set var="lastLi" value="Y"/>
                        <c:set var="firstUl" value="N"/>
                        <c:set var="lastUl" value="N"/>
                    </c:if>

                    <c:if test="${firstLi == 'Y'}">
                    <li>
                        <c:set var="firstLi" value="Y"/>
                        <c:set var="lastLi" value="Y"/>
                        <c:set var="firstUl" value="N"/>
                        <c:set var="lastUl" value="N"/>
                    </c:if>

                    <!-- 최상위메뉴 + 하위메뉴가 없는 경우 -->
                    <c:if test="${menu.upperMenuId == null and menu.menuUrl != null}">
                    <a href="#" class="depth01" onclick="javascript:navInit('${menu.menuId}','${menu.menuName}','${menu.menuUrl}');">${menu.menuName}</a>
                    </c:if>

                    <!-- 최상위메뉴 + 하위메뉴가 있는 경우 -->
                    <c:if test="${menu.upperMenuId == null and menu.menuUrl == null}">
                        <c:set var="firstLi" value="N"/>
                        <c:set var="lastLi" value="N"/>
                        <c:set var="firstUl" value="Y"/>
                        <c:set var="lastUl" value="N"/>
                    <a href="#" class="depth01" id="depth1_${menu.menuId}" onclick="javascript:navInit('${menu.menuId}','${menu.menuName}','${menu.menuUrl}');">${menu.menuName}</a>
                    </c:if>

                    <c:if test="${menu.upperMenuId != null}">
                    <!-- 하위메뉴인 경우 -->
                    <c:if test="${firstUl == 'Y'}">
                        <c:set var="firstUl" value="N"/>
                        <c:set var="lastUl" value="Y"/>
                    <ul class="depth02_list m02" id="depth2_${menu.upperMenuId}" style="display:none">
                        </c:if>
                        <li><a href="#" class="depth02_link" onclick="javascript:navInit('${menu.menuId}','${menu.menuName}','${menu.menuUrl}');">${menu.menuName}</a></li>
                        </c:if>


                        <c:if test="${lastLi == 'Y'}">
                            </li>
                        </c:if>
                 </c:forEach>
                        <!--
                        <li>
                            <a href="#" class="depth01 on">상담현황<i class="fas fa-angle-up"></i></a>
                            <ul class="depth02_list m02">
                                <li><a href="#" class="depth02_link on">실시간 키워드 순위</a></li>
                                <li><a href="#" class="depth02_link">관심 키워드 분석</a></li>
                            </ul>
                        </li>
                        -->
                    </ul>
            </div>
        </div>
        <div class="header_tab">
            <ul class="tab_list" id="navBar1">
                <!--
                <li><a href="#" class="tab_link"><span>홈</span></a></li>
                <li>
                    <a href="#" class="tab_link on">
                        <span>실시간 키워드 순위</span><i class="fas fa-times"></i>
                    </a>
                </li>
                -->
            </ul>
        </div>
    </div>

    <div id="content-frame-container">
    </div>

</body>
</html>
