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
            <p><a href="#" class="btn btn-primary">Get In Touch</a></p>
          </div>
        </div>
      </div>  
    </div>




    <div class="site-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
          <div class="col-7 text-center">
            <div class="heading">
              <h2 class="text-black">最新菜單</h2>
            </div>
            <p>餐盒均附營養米飯、配菜、蛋，配菜依照當令季節時蔬略有不同，會不定期更換，皆採現場製作配菜為主。</p>
          </div>
        </div>
        <div class="row">
<!--           <div class="col-12 col-sm-6 col-md-4 mb-4"> -->
<!--             <div class="blog-entry"> -->
<!--               <a href="#" class="d-block"> -->
<!--                 <img src="../images/功夫照燒薑汁燒肉.jpg" alt="Image" class="img-fluid"> -->
<!--               </a> -->
<!--               <div class="post-meta d-flex justify-content-center"> -->
<!--                 <span> -->
<!--                   <span class="icon-calendar"></span> -->
<!--                   <span>23 Jul</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-user"></span> -->
<!--                   <span>Admin</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-comment"></span> -->
<!--                   <span>2 Comments</span> -->
<!--                 </span> -->
<!--               </div> -->
<!--               <h2><a href="#">功夫照燒薑汁燒肉</a></h2> -->
<!--               <p>價格：$245，主原料：水、薑、松阪肉。</p> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-12 col-sm-6 col-md-4 mb-4"> -->
<!--             <div class="blog-entry"> -->
<!--               <a href="#" class="d-block"> -->
<!--                 <img src="../images/炙燒慾望明太子嫩烤雞胸.jpg" alt="Image" class="img-fluid"> -->
<!--               </a> -->
<!--               <div class="post-meta d-flex justify-content-center"> -->
<!--                 <span> -->
<!--                   <span class="icon-calendar"></span> -->
<!--                   <span>23 Jul</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-user"></span> -->
<!--                   <span>Admin</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-comment"></span> -->
<!--                   <span>2 Comments</span> -->
<!--                 </span> -->
<!--               </div> -->
<!--               <h2><a href="#">炙燒慾望明太子嫩烤雞胸</a></h2> -->
<!--               <p>餐盒均附營養米飯、配菜、蛋，配菜依照當令季節時蔬略有不同，會不定期更換，皆採現場製作配菜為主。</p> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-12 col-sm-6 col-md-4 mb-4"> -->
<!--             <div class="blog-entry"> -->
<!--               <a href="#" class="d-block"> -->
<!--                 <img src="../images/厚切嫩煎板腱牛排.jpg" alt="Image" class="img-fluid"> -->
<!--               </a> -->
<!--               <div class="post-meta d-flex justify-content-center"> -->
<!--                 <span> -->
<!--                   <span class="icon-calendar"></span> -->
<!--                   <span>23 Jul</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-user"></span> -->
<!--                   <span>Admin</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-comment"></span> -->
<!--                   <span>2 Comments</span> -->
<!--                 </span> -->
<!--               </div> -->
<!--               <h2><a href="#">厚切嫩煎板腱牛排</a></h2> -->
<!--               <p>餐盒均附營養米飯、配菜、蛋，配菜依照當令季節時蔬略有不同，會不定期更換，皆採現場製作配菜為主。</p> -->
<!--             </div> -->
<!--           </div> -->

<table >
	<thead></thead>
	<tbody>
		<c:forEach var="meals" items="${queryAll}">
          <div class="col-12 col-sm-6 col-md-4 mb-4">
            <div class="blog-entry">
              <a href="#" class="d-block">
<!--                 <img src="../images/義式番茄紅醬乳酪嫩烤雞胸.jpg" alt="Image" class="img-fluid"> -->
              	<img src="${pageContext.request.contextPath}/MealImg/${meals.photo}"
				      alt="Image" class="img-fluid" onerror="this.style.display='none'" />
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
              <h2><a href="#">${meals.name}</a></h2>
              <p>餐盒均附營養米飯、配菜、蛋，配菜依照當令季節時蔬略有不同，會不定期更換，皆採現場製作配菜為主。</p>
            </div>
          </div>
       </c:forEach>
	</tbody>
</table>
<!--           <div class="col-12 col-sm-6 col-md-4 mb-4"> -->
<!--             <div class="blog-entry"> -->
<!--               <a href="#" class="d-block"> -->
<!--                 <img src="../images/新潮韓式辣味噌雞腿排.jpg" alt="Image" class="img-fluid"> -->
<!--               </a> -->
<!--               <div class="post-meta d-flex justify-content-center"> -->
<!--                 <span> -->
<!--                   <span class="icon-calendar"></span> -->
<!--                   <span>23 Jul</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-user"></span> -->
<!--                   <span>Admin</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-comment"></span> -->
<!--                   <span>2 Comments</span> -->
<!--                 </span> -->
<!--               </div> -->
<!--               <h2><a href="#">新潮韓式辣味噌雞腿排</a></h2> -->
<!--               <p>餐盒均附營養米飯、配菜、蛋，配菜依照當令季節時蔬略有不同，會不定期更換，皆採現場製作配菜為主。</p> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-12 col-sm-6 col-md-4 mb-4"> -->
<!--             <div class="blog-entry"> -->
<!--               <a href="#" class="d-block"> -->
<!--                 <img src="../images/新疆孜然燒烤風味嫩烤雞胸.jpg" alt="Image" class="img-fluid"> -->
<!--               </a> -->
<!--               <div class="post-meta d-flex justify-content-center"> -->
<!--                 <span> -->
<!--                   <span class="icon-calendar"></span> -->
<!--                   <span>23 Jul</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-user"></span> -->
<!--                   <span>Admin</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-comment"></span> -->
<!--                   <span>2 Comments</span> -->
<!--                 </span> -->
<!--               </div> -->
<!--               <h2><a href="#">新疆孜然燒烤風味嫩烤雞胸</a></h2> -->
<!--               <p>餐盒均附營養米飯、配菜、蛋，配菜依照當令季節時蔬略有不同，會不定期更換，皆採現場製作配菜為主。</p> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-12 col-sm-6 col-md-4 mb-4"> -->
<!--             <div class="blog-entry"> -->
<!--               <a href="#" class="d-block"> -->
<!--                 <img src="../images/黑色幽默嫩烤雞胸(墨魚口味).jpg" alt="Image" class="img-fluid"> -->
<!--               </a> -->
<!--               <div class="post-meta d-flex justify-content-center"> -->
<!--                 <span> -->
<!--                   <span class="icon-calendar"></span> -->
<!--                   <span>23 Jul</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-user"></span> -->
<!--                   <span>Admin</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-comment"></span> -->
<!--                   <span>2 Comments</span> -->
<!--                 </span> -->
<!--               </div> -->
<!--               <h2><a href="#">黑色幽默嫩烤雞胸(墨魚口味)</a></h2> -->
<!--               <p>餐盒均附營養米飯、配菜、蛋，配菜依照當令季節時蔬略有不同，會不定期更換，皆採現場製作配菜為主。</p> -->
<!--             </div> -->
<!--           </div> -->


<!--           <div class="col-12 col-sm-6 col-md-4 mb-4"> -->
<!--             <div class="blog-entry"> -->
<!--               <a href="#" class="d-block"> -->
<!--                 <img src="../images/黑鑽松露起司脆皮雞腿排.jpg" alt="Image" class="img-fluid"> -->
<!--               </a> -->
<!--               <div class="post-meta d-flex justify-content-center"> -->
<!--                 <span> -->
<!--                   <span class="icon-calendar"></span> -->
<!--                   <span>23 Jul</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-user"></span> -->
<!--                   <span>Admin</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-comment"></span> -->
<!--                   <span>2 Comments</span> -->
<!--                 </span> -->
<!--               </div> -->
<!--               <h2><a href="#">黑鑽松露起司脆皮雞腿排</a></h2> -->
<!--               <p>餐盒均附營養米飯、配菜、蛋，配菜依照當令季節時蔬略有不同，會不定期更換，皆採現場製作配菜為主。</p> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-12 col-sm-6 col-md-4 mb-4"> -->
<!--             <div class="blog-entry"> -->
<!--               <a href="#" class="d-block"> -->
<!--                 <img src="../images/泰享受酸辣雞腿排.jpg" alt="Image" class="img-fluid"> -->
<!--               </a> -->
<!--               <div class="post-meta d-flex justify-content-center"> -->
<!--                 <span> -->
<!--                   <span class="icon-calendar"></span> -->
<!--                   <span>23 Jul</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-user"></span> -->
<!--                   <span>Admin</span> -->
<!--                 </span> -->
<!--                 <span> -->
<!--                   <span class="icon-comment"></span> -->
<!--                   <span>2 Comments</span> -->
<!--                 </span> -->
<!--               </div> -->
<!--               <h2><a href="#">泰享受酸辣雞腿排</a></h2> -->
<!--               <p>餐盒均附營養米飯、配菜、蛋，配菜依照當令季節時蔬略有不同，會不定期更換，皆採現場製作配菜為主。</p> -->
<!--             </div> -->
<!--           </div> -->



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


</body>
</html>