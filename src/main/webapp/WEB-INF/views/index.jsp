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
  <link rel="icon" href="data:,">
</head>

<!--chart.js-->
<script src="/js/chart.js"></script>
<script src="/js/datalabels.js"></script>
<!--grid.js-->
<script src="/js/gridjs.umd.js"></script>
<link href="/css/mermaid.min.css" rel="stylesheet"/>
<!--excel.js-->
<script src="/js/exceljs.min.js"></script>
<script src="/js/FileSaver.min.js"></script>
<!--bootstrap Treeview-->
<script src="/js/jquery-3.7.1.min.js"></script>
<script src="/js/bootstrap-treeview.js"></script>
<link href="/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/css/bootstrap-treeview.css" rel="stylesheet"/>

<!--publish css-->
<link href="/css/axboot.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="/css/popularkeyword.css">
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
    //로그인 세션 체크
    commonAjax('/sessionChk', {}, function(res){
      //console.log('sessionChk : ', res);
    });

    if(url != ''){ //이동URL이 있는 경우
      var findResult = divIdArray.indexOf(id);  //입력된 DIV ID가 있는지 검색
      if(findResult < 0){ //미생성화면 DIV ID인 경우
        /*
        $("body").append("<div class='dynamicDiv' id='"+id+"'>div "+id+"</div>"); //새로운 DIV 생성 + 추가
        var html =
                '<div class="navDiv" id="navDiv'+id+'">'
                +'<div class="navItem" id="navItem'+id+'">'+id+'</div>'
                +'<span class="navDel" id="navDel'+id+'">[x]</span>' +
                '</div>'; //새로운 DIV 네이게이션 생성
        $( "#navBar" ).append(html);  //네비게이션 추가
        */

        //입력된 menuid 가 html element id로 입력 > menuid가 기존 element id와 겹치면 동작이상 발생
        $("#content-frame-container").append("<div class='dynamicDiv' id='"+id+"'>div "+id+"</div>"); //새로운 DIV 생성 + 추가
        var html = '<span class="tab-item" style="min-width: 120px; width: auto;" id="navDiv'+id+'">'
          + '<span data-toggle="tooltip" data-placement="bottom" class="navItem" id="navItem'+id+'">'+name+'</span>'
          + '<i class="cqc-cancel3 on" data-tab-close="true" id="navDel'+id+'"></i>'
          + '</span>';
        $( "#navBar" ).append(html);  //네비게이션 추가

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

  //네비게이션 바 > 메뉴명 선택 시
  $(document).on('click', '.navItem', function() {  //class navItemXXX 선택 시
    //로그인 세션 체크
    commonAjax('/sessionChk', {}, function(res){
      //console.log('sessionChk : ', res);
    });

    var navItemId = $(this).attr("id");
    var id = navItemId.substring(7,navItemId.length);
    showOnlyDivInput(id);
  });
  //네비게이션 바 > 메뉴삭제 선택 시
  $(document).on('click', '.cqc-cancel3', function() { //class cqc-cancel3XXX 선택 시
    var delItemId = $(this).attr("id");
    var id = delItemId.substring(6,delItemId.length);
    delDivInput(id);
  });

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

</script>

<body class="ax-body frame-set" onselectstart="return false;">
<div id="ax-frame-root" class="" data-root-container="true">

  <div id="content-frame-container" class="ax-frame-contents">
    <!--
    <div>
      <div style="float:left;">
        <c:forEach items="${principal.menuList}" var="menu" varStatus="status">
          <button type="button" class="${menu.upperMenuId==null?'btn btn-primary':'btn btn-secondary'}"
                  onclick="javascript:navInit('${menu.menuId}','${menu.menuUrl}');">
              ${menu.menuName}</button>
        </c:forEach>
      </div>
    </div>
    <hr>
    <div id="navBar">
    </div>
    -->
  </div>

  <div class="ax-frame-header-tool">
    <div class="ax-split-col" style="height: 100%;">
      <div class="ax-split-panel text-align-left">
      </div>
      <div class="ax-split-panel text-align-right">
        <div class="ax-split-col ax-frame-user-info">
          <div class="ax-split-panel">
            <a href="#">${principal.username}님 로그인</a>
          </div>
          <div class="panel-split"></div>
          <div class="ax-split-panel">
            <a href="#" class="ax-frame-logout" onclick="javascript:location.href='/logout';">
              <i class="cqc-log-out"></i>
              로그아웃
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="ax-frame-header">
    <div class="ax-split-col" style="height: 100%;">
      <div class="ax-split-panel">&nbsp;</div>
      <div class="ax-split-panel cell-logo">
        <a href="#">
          <img src="/img/header-logo-hanwha.png" width="100%">
        </a>
      </div>

      <div id="ax-top-menu" class="ax-split-panel ax-split-flex">
        <div class="ax5-ui-menubar axboot">
          <div class="ax-menu-body">
            <c:forEach items="${principal.menuList}" var="menu" varStatus="status">
              <div class="ax-menu-item" data-menu-item-index="0">
              <span class="ax-menu-item-cell ax-menu-item-label" onclick="javascript:navInit('${menu.menuId}','${menu.menuName}','${menu.menuUrl}');">${menu.menuName}
                <c:if test="${empty menu.menuUrl}"><i class="cqc-chevron-down"></i></c:if>
              </span>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>

      <div class="ax-split-panel cell-aside-handle" id="ax-fullscreen-handel">
        <i class="cqc-expand icon-closed"></i>
        <i class="cqc-collapse icon-opened"></i>
      </div>
    </div>
  </div>

  <div class="ax-frame-header-tab">
    <div id="ax-frame-header-tab-container">
      <div class="tab-item-holder" style="width: auto;" id="navBar">
        <!--
        <div class="tab-item-menu" data-tab-id=""></div>
        <div class="tab-item on" data-tab-id="00-dashboard" style="min-width: 120px; width: auto;">
          <span data-toggle="tooltip" data-placement="bottom" title="" data-original-title="홈">홈</span>
        </div>

        <div class="tab-item" data-tab-id="122" style="min-width: 120px; width: auto;">
          <span data-toggle="tooltip" data-placement="bottom" title="" data-original-title="통합검색">통합검색</span>
          <i class="cqc-cancel3 on" data-tab-close="true" data-tab-id="122"></i>
        </div>
        -->
        <div class="tab-item-addon" data-tab-id=""></div>
      </div>
    </div>
  </div>

  <div class="ax-frame-foot">
    <div class="ax-split-col" style="height: 100%;">
      <div class="ax-split-panel text-align-left">   </div>
      <div class="ax-split-panel text-align-right">
        Last account activity <b id="account-activity-timer">00:29</b> ago.
      </div>
    </div>
  </div>

</div>


</body>
</html>
