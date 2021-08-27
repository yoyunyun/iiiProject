<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,tw.iiihealth.meal.meals.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>健康優生網</title>
</head>
<head>
  <title>Elderly &mdash; Website Template by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    

  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/fonts/icomoon/style.css">

  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/jquery-ui.css">
  <link rel="stylesheet" href="/css/owl.carousel.min.css">
  <link rel="stylesheet" href="/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="/css/owl.theme.default.min.css">

  <link rel="stylesheet" href="/css/jquery.fancybox.min.css">

  <link rel="stylesheet" href="/css/bootstrap-datepicker.css">

  <link rel="stylesheet" href="/fonts/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="/css/aos.css">

  <link rel="stylesheet" href="/css/style.css">
  
  		<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/datatables-simple-demo.js"></script>
        <script src="/js/sweetalert2.all.min.js"></script>
        <style>
        	img{
			  cursor:pointer;//滑鼠手型
			  transition:all 0.6s ease-in-out;//過渡
			}
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

    
    <header class="site-navbar light js-sticky-header site-navbar-target" role="banner">

      <div class="container">
        <div class="row align-items-center">

          <div class="col-6 col-xl-2">
            <div class="mb-0 site-logo"><a href="index.html" class="mb-0">Elderly<span class="text-primary">.</span> </a></div>
          </div>

          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li><a href="index.html" class="active nav-link">首頁</a></li>


                <li class="has-children">
                  <a href="services.html" class="nav-link">叫車專區</a>
                  <ul class="dropdown">
                    <li><a href="#" class="nav-link">附近店家資訊</a></li>
                    <li class="has-children">
                      <a href="#">我要叫車</a>
                      <ul class="dropdown">
                        <li><a href="#">立即叫車</a></li>
                        <li><a href="#">預約叫車</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>

                <li class="has-children">
                  <a href="services.html" class="nav-link">長者專區</a>
                  <ul class="dropdown">
                    <li><a href="#" class="nav-link">看護服務</a></li>
                    <li><a href="#" class="nav-link">輔具購買</a></li>
                  </ul>
                </li>


                 <li class="has-children">
                  <a href="services.html" class="nav-link">營養專區</a>
                  <ul class="dropdown">
                    <li><a href="#" class="nav-link">營養餐</a></li>
                    <li><a href="#" class="nav-link">食品資料</a></li>
                  </ul>
                </li>


                <li class="has-children">
                  <a href="services.html" class="nav-link">用藥查詢</a>
                  <ul class="dropdown">
                    <li><a href="#" class="nav-link">藥品辨識</a></li>
                    <li><a href="#" class="nav-link">藥品包裝</a></li>
                  </ul>
                </li>

                <!-- <li><a href="contact.html" class="nav-link">會員登入</a></li> -->
                <li class="has-children">
                  <a href="services.html" class="nav-link">登入</a>
                  <ul class="dropdown">
                    <li><a href="#" class="nav-link">會員登入</a></li>
                    <li><a href="#" class="nav-link">廠商登入</a></li>
                  </ul>
                </li>
                
                <li><a href="about.html" class="nav-link">關於我們</a></li>
                <li><a href="contact.html" class="nav-link">聯絡我們</a></li>
              </ul>

            </nav>
          </div>


          <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle float-right"><span class="icon-menu h3 text-white"></span></a></div>

        </div>
      </div>

    </header>


    <!-- MAIN -->



    <div class="slide-item overlay" style="background-image: url('../images/0409.png')">
      <div class="container">
        <div class="row justify-content-center text-center">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">健康 &amp; 飲食</h1>
            <p class="lead text-white mb-5">
              遠離疾病最好的方法就在於日常的保健，而正確的自食卻不啻為最經濟實惠的保健方法。
              健康與飲食的重要掌控在你我之間，絕不能夠輕視這個議題。 
            </p>
            <p><a href="#" class="btn btn-primary">Contact us</a></p>
          </div>
        </div>
      </div>  
    </div>




    <div class="site-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
          <div class="col-10 text-center">
            <div class="heading">
              <h2 class="text-black">最新菜單</h2>
            </div>
            <p>餐盒均附營養米飯、配菜、蛋，配菜依照當令季節時蔬略有不同，會不定期更換，皆採現場製作配菜為主。</p>
<!--             <span class="1" style="color:blue"></span> -->
            <div class="flip" style="float:right"><input type="button" value="詳細資訊(展開/收合)"></div>
          </div>
        </div>
        <div class="row">

<table >
	<thead></thead>
	<tbody>
		<c:forEach var="meals" items="${queryAll}">
          <div class="col-12 col-sm-6 col-md-4 mb-4">
            <div class="blog-entry">
<!--             <a data-fancybox="gallery" href="images/0409.png"><img src="images/泰享受酸辣雞腿排.jpg" width="300"></a> -->
              <a class="d-block" data-fancybox="gallery" href="${pageContext.request.contextPath}/MealImg/${meals.photo}">
              	<img src="${pageContext.request.contextPath}/MealImg/${meals.photo}"
				      alt="Image" class="img-fluid" onerror="this.style.display='none'"
				       />
<!-- 				      style="display:block" onclick="showMaxImg(this)" /> -->
<!-- 				      <img style="width:62px;height:83px;display:block" src="images/0409.png" onclick="showMaxImg(this)"> -->
              </a>
              <div class="post-meta d-flex justify-content-center">
                <span>
                  <span class="icon-calendar"></span>
                  <span>23 Jul</span>
                </span>
                <span>
                  <span class="icon-user"></span>
                  <span>Admin</span>
                </span>
                <span>
                  <span class="icon-comment"></span>
                  <span>2 Comments</span>
                </span>
              </div>
              <h2><a style="color: #2894FF;">${meals.name}</a></h2>
			  <div class="panel" style="display:none">
			  	  價格：${meals.price}<br/>
			  	  主原料：${meals.material}<br/>
			  	  熱量(kcal)：${meals.calories}<br/>
			  	  蛋白質(g)：${meals.protein}<br/>
			  	  碳水化合物(g)：${meals.carbohydrates}<br/>
			  	  脂肪(g)：${meals.fat}
			  </div>

            </div>
          </div>
       </c:forEach>
      <div class="modal fade bs-example-modal-lg text-center" id="imgModal" tabindex="-1" role="dialog" data-toggle="modal" aria-labelledby="myLargeModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg" style="display:inline-block;width:auto;">
         	 <div class="modal-content">
              	<div id="imgshow"></div>
           	 </div>
         </div>
      </div>
	</tbody>
</table>

        </div>
      </div>
    </div>

    


    <div class="site-footer bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <h2 class="footer-heading mb-4">About</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi cumque tenetur inventore veniam, hic vel ipsa necessitatibus ducimus architecto fugiat!</p>
            <div class="my-5 social">
              <a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
            </div>
          </div>
          <div class="col-lg-8">
            <div class="row">
              <div class="col-lg-4">
                <h2 class="footer-heading mb-4">Quick Links</h2>
                <ul class="list-unstyled">
                  <li><a href="#">Amazing Atmosphere</a></li>
                  <li><a href="#">Caring Staff</a></li>
                  <li><a href="#">FAQs</a></li>
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Contact Us</a></li>
                </ul>
              </div>
              <div class="col-lg-4">
                <h2 class="footer-heading mb-4">Helpful Link</h2>
                <ul class="list-unstyled">
                  <li><a href="#">Hospice Care</a></li>
                  <li><a href="#">Excellent Cuisine</a></li>
                  <li><a href="#">Privacy</a></li>
                  <li><a href="#">Terms</a></li>
                </ul>
              </div>
              <div class="col-lg-4">
                <h2 class="footer-heading mb-4">Resources</h2>
                <ul class="list-unstyled">
                  <li><a href="#">Health Care</a></li>
                  <li><a href="#">Elderly Care</a></li>
                  <li><a href="#">Care with Love</a></li>
                  <li><a href="#">Quality Care</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="row text-center">
          <div class="col-md-12">
            <div class="border-top pt-5">
              <p class="copyright"><small>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></small></p>

              </div>
            </div>

          </div>
        </div>
      </div>

  </div> <!-- .site-wrap -->
  

  

  <script src="/js/jquery-3.3.1.min.js"></script>
  <script src="/js/jquery-ui.js"></script>
  <script src="/js/popper.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/jquery.countdown.min.js"></script>
  <script src="/js/jquery.easing.1.3.js"></script>
  <script src="/js/aos.js"></script>
  <script src="/js/jquery.waypoints.min.js"></script>
  <script src="/js/jquery.animateNumber.min.js"></script>
  <script src="/js/jquery.fancybox.min.js"></script>
  <script src="/js/jquery.sticky.js"></script>
  <script src="/js/isotope.pkgd.min.js"></script>


  <script src="/js/main.js"></script>
  <script>
	  $(function(){
		  $(".flip").click(function(){
		      $(".panel").slideToggle("slow");
		      $(".xs1").toggle();
		      $(".xs2").toggle();
		  });});
  </script>
  <script>
    function showMaxImg(obj){
        var src=$(obj).attr("src");
        $("#imgModal").find("#imgshow")
                      .html("<img src='"+src+"' class='carousel-inner img-responsive img-rounded' data-dismiss='modal'>");
        $("#imgModal").modal('show');
    }
  </script>
</body>
</html>