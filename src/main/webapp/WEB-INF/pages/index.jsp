<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <title>Elderly &mdash; Website Template by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
	<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
	
<style>


</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>


  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>

   <%@ include file="/WEB-INF/pages/user-header.jsp"%>

    <!-- MAIN -->
   <div class="slide-item overlay" style="background-image: url('images/slider-1.jpg')">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">健康悠生伴你一生</h1>
            <p class="lead text-white mb-5">健康一生 悠活一生</p>
            <p><a href="about.html" class="btn btn-primary">關於我們</a></p>
          </div>
        </div>
      </div>  
    </div>

   


    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3">
            <div class="service">
              <a href="/taxiFront/fronttaximainpage.controller" class="d-block"><img src="images/Taxi2.jpg" alt="Image" class="img-fluid"></a>
              <div class="service-inner">
                <h3>便利專區</h3>
                <p>醫療搜尋/叫車服務</p>
              </div>
            </div>
          </div>
          <div class="col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3">
            <div class="service">
              <a href="${pageContext.request.contextPath}/consumer/toTheFrontPage" class="d-block"><img src="images/wheelchair.jpg" alt="Image" class="img-fluid"></a>
              <div class="service-inner">
                <h3>長者專區</h3>
                <p>輔具購買</p>
              </div>
            </div>
          </div>
          <div class="col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3">
            <div class="service">
              <a href="mealIndex.controller" class="d-block"><img src="images/0409.png" alt="Image" class="img-fluid"></a>
              <div class="service-inner">
                <h3>營養專區</h3>
                <p>營養餐/食品資料</p>
              </div>
            </div>
          </div>
          <div class="col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3">
            <div class="service">
              <a href="${pageContext.request.contextPath}/Drugfront/findalldrugFront" class="d-block"><img src="images/藥物系統.jpg" alt="Image" class="img-fluid"></a>
              <div class="service-inner">
                <h3>用藥查詢</h3>
                <p>藥品辨識/藥品包裝</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

   


<!-- site-footer bg-light -->

<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>
</div> <!-- .site-wrap -->

<script src="js/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/pages/user-js.jsp"%>



</body>
</html>