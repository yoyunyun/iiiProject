<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,tw.iiihealth.meal.diet.*"%>
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
  <link href="/css/styles.css" rel="stylesheet" />
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/datatables-simple-demo.js"></script>
        <script src="/js/sweetalert2.all.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    

<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>

         <style>
        	img{
			  cursor:pointer;//滑鼠手型
			  transition:all 0.6s ease-in-out;//過渡
			}
        </style>
        <style>
	        .hel2 {
	            background-color: #FF8000;
	            margin: 35px;
	            border-radius: 20px;
	            width: 300px;
	            height: 130px;
	            float: left;
	            text-align: center;
	        }
	        .hel3 {
	            margin: 35px;
	            border-radius: 20px;
	            width: 300px;
	            height: 600px;
	            float: left;
	            text-align: center;
	        }
	        .cel{
	        	border-radius: 999em;
	        	margin: 0 auto;
	        	width: 200px;
	        	height: 200px;
	        	text-align: center;
	        }
	        .phel2 {
	            color:white;
	            margin:12px 10px;
	            padding: 0px 0px;
	            font-size: 25px;
	            font-weight: bold;
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



    <div class="slide-item overlay" style="background-image: url('../images/0408.jpg')">
      <div class="container">
        <div class="row justify-content-center text-center">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">食材 &amp; 營養</h1>
            <p class="lead text-white mb-5">
              飲食與人們的身體健康息息相關。養成良好的飲食習慣，才能真正把身體養好。如果無法攝取足夠的營養，那麼我們的身體機能只會越來越弱，
              也就更容易生病。怎麼才能吃得健康一些呢？食材是所有飲食的基礎，選好食材真的非常重要！
            </p>
            <p><a href="${pageContext.request.contextPath}/meal/Diet/ViewDietMenu.jsp" class="btn btn-primary">Contact　us</a></p>
          </div>
        </div>
      </div>  
    </div>




    <div class="site-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
            <div class="heading">
            <div class="text-center" style="margin:50px 0 100px 0;"><a style="font-weight:bold;font-size:32px;color:black;">為什麼「食」在很重要？</a></div>
    <div class="hel2">
        <p class="phel2">重視食材了解食材</p>
        <p class="phel2">讓你越吃越健康！</p>
    </div>
    <div class="hel2">
        <p class="phel2">好食材是健康源頭</p>
        <p class="phel2">亦是美味源頭！</p>
    </div>
    <div class="hel2">
        <p class="phel2">洞察加工食品的全貌</p>
        <p class="phel2">知己知彼，百戰百勝！</p>
    </div>
    <br><br><div></div>
    <div class="text-center" style="margin:270px 0 130px 0;"><a style="font-weight:bold;font-size:32px;color:black;">三大營養素</a></div>
    <div class="hel3">
        <div class="cel" style="background-image: url('../images/chicken.jpg')"></div>
        <a style="font-weight:bold;font-size:25px;color:black;">蛋白質</a>
        <p style="font-size:16px">
        蛋白質被稱為「生命的積木」之一，並不是沒有原因的。 這個巨量元素是人體細胞的主要成分，且提供重要的胺基酸，
        讓我們身體獲得精力持續運作、幫助身體復原，還可以讓我們有飽足感。
        </p>
    </div>
    <div class="hel3">
        <div class="cel" style="background-image: url('../images/carbon.jpg')"></div>
        <a style="font-weight:bold;font-size:25px;color:black;">碳水化合物</a>
        <p style="font-size:16px">
        碳水化合物對人體相當重要，在一個健康、均衡的飲食中，碳水化合物是提供人體熱量的主要能源。
        碳水化合物會在消化道先被分解為葡萄糖後，進入細胞當做能源，是維持身體功能正常運作的必須營養素。
        </p>
    </div>
    <div class="hel3">
        <div class="cel" style="background-image: url('../images/fat.jpg')"></div>
        <a style="font-weight:bold;font-size:25px;color:black;">脂肪</a>
        <p style="font-size:16px">
		脂肪是構成身體細胞的重要成分，在腦神經、肝臟、腎臟等重要器官中都含有相當的脂肪，可以保護這些臟器。
		而脂肪還可以為人體儲存備用的「能量」，等到需要時再轉換利用。

		</p>
    </div>
    <div></div>
    <div class="text-center" style="margin:200px 0 200px 0;"><a style="font-weight:bold;font-size:30px;color:#FF7575;">民以食為天，聰明選食，吃出人生精彩下半場！</a></div>
              <h2 class="text-black text-center"  style="margin:0 0 50px 0;">最新食材</h2>
            </div>
          <div class="col-10 text-center">
            <p style="font-size:18px">食物是為生物提供營養的物質，來源通常是植物、動物、菌類，包含著維生所需的營養素，如蛋白質、脂肪、水等，能夠藉由進食或飲用為生物提供營養、維持生命或愉悅的物質。生物攝取食物後，被生物的細胞同化，提供能量，維持生命及刺激成長。</p>
          </div>
        </div>
        <div class="row">


<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 食品資料庫
						</div>
						<div class="card-body">
							
							
							
					<table id="datatablesSimple">
						<thead>
							<tr>
						        <th>食品名稱</th>
						        <th>食品分類</th>
						        <th>熱量(kcal)</th>
						        <th>蛋白質</th>
						        <th>碳水化合物(g)</th>
						        <th>脂肪(g)</th>
						        <th>糖(g)</th>
						        <th>鈉(mg)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="diet" items="${queryAll}">
								<tr>
									<td>${diet.name}</td>
									<td>${diet.type}</td>
									<td>${diet.calories}</td>
									<td>${diet.protein}</td>
									<td>${diet.carbohydrates}</td>
									<td>${diet.fat}</td>
									<td>${diet.sugar}</td>
									<td>${diet.na}</td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
		</div>


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