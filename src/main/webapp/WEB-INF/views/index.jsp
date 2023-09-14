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
<!--
  웹화면 작성 시 주의점
    > home.jsp를 메인페이지 + 타 페이지는 DIV로 하위페이지 형식으로 읽어오는 원페이지 형식의 구조인 관계로
      1페이지에서 모든 element가 처리되니 모든 element의 id와 function이 unique해야 정상동작한다.
      겹치는 id를 사용하면 동작이상이 발생하니 id가 겹치지 않도록 주의요망.
-->

<script type="text/javascript">

  //표시한 화면 DIV ID 목록
  var divIdArray = [];
  function navInit(id, url){


    //입력된 DIV ID가 있는지 검색
    var findResult = divIdArray.indexOf(id);
    if(findResult < 0 && url != ''){ //미생성화면 DIV ID인 경우
      //새로운 DIV 생성 + 추가
      $("body").append("<div class='dynamicDiv' id='"+id+"'>div "+id+"</div>");
      //새로운 DIV 네이게이션 생성
      var html =
              '<div class="navDiv" id="navDiv'+id+'">'
              +'<div class="navItem" id="navItem'+id+'">'+id+'</div>'
              +'<span class="navDel" id="navDel'+id+'">[x]</span>' +
              '</div>';
      //네비게이션 추가
      $( "#navBar" ).append(html);
      //생성한 DIV ID 저장
      divIdArray.push(id);
      //생성한 DIV에 페이지 로드
      $('#'+id).load(url);

    }
    //입력된 DIV ID에 해당하는 화면만 show 처리
    showOnlyDivInput(id);

  }
  //네비게이션 바 > 메뉴명 선택 시
  $(document).on('click', '.navItem', function() {
    var navItemId = $(this).attr("id");
    var id = navItemId.substring(7,navItemId.length);
    showOnlyDivInput(id);
  });
  //네비게이션 바 > 메뉴삭제 선택 시
  $(document).on('click', '.navDel', function() {
    var delItemId = $(this).attr("id");
    var id = delItemId.substring(6,delItemId.length);
    delDivInput(id);
  });

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

</script>

<body>
<div>
  <div style="float:left;">
    <c:forEach items="${principal.menuList}" var="menu" varStatus="status">
      <button type="button" class="${menu.upperMenuId==null?'btn btn-primary':'btn btn-secondary'}"
              onclick="javascript:navInit('${menu.menuId}','${menu.menuUrl}');">
          ${menu.menuName}</button>
    </c:forEach>
  </div>
  <div style="float:right;">
    <button type="button" class="btn btn-secondary" onclick="javascript:navInit('HOME','/test');">HOME</button>
    <button type="button" class="btn btn-secondary" onclick="javascript:navInit('MENU','/manage/menu');">메뉴관리</button>
    <button type="button" class="btn btn-secondary" onclick="javascript:navInit('MENUAUTH','/manage/menu/auth');">권한 별 메뉴관리</button>
    <button type="button" class="btn btn-primary" onclick="javascript:location.href='/logout';">로그아웃</button>
  </div>
</div>
<br>
<hr>

<div id="navBar">
</div>
<hr>

</body>
</html>
