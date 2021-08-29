<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
  <style>

  	 .historyArea {width:300px;height:400px; z-index:50; position: absolute;top: 650px;bottom: 300px; left:70%; _margin-left:0px; _left:985px; _position:absolute; overflow: auto;margin-top: 100px;}
        .historyArea dl {background-color:#FFFFFF; border:0px; margin:0px; padding:0px;}
        .historyArea b {height:19px; background-color:#A0A0A0; font:12px/20px Helvetica; #font:12px/21px Helvetica; color:#FFFFFF; text-align:center; cursor:default}

        .historyArea dl {border-top:1px solid #DDDDDD; margin-top:5px; text-align:center}
        .historyArea dt a {background:transparent url(//image.momoshop.com.tw/ecm/img/cmm/shopcar/topbkimg.gif) no-repeat 10px 5px; width:100px; color:999999; font-size:11px; font-weight:bold; display: block;; margin:2px;font-family:Arial; color:#999999}
        .historyArea dd {border:1px solid #DDDDDD; border-top:0px; padding-top:5px; display:none;margin:0}
        .historyArea dd  a img{width:100%}
        .historyArea .tips {padding-top:0px;margin:0} 
        .historyArea b {display: block;}

        .historyArea  dl dd a .prdImgWrap { position:relative; display:inline-block;}
        .historyArea  dl dd a .prdImgWrap .imgTag { position:absolute; top:0; left:0; padding:0; width:32%; height:32%; z-index:2}
        .historyArea  dl dd a .prdImgWrap .imgTag img { margin:0; width:100%; height:auto}
 
 	.navFixed {          
  		position: fixed;      
  		top: 150px;
  		left: 70%;
  		bottom: 50px;}
  </style>
 
</head>
<body>
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
                <a href="services.html" class="nav-link">便利專區</a>
                <ul class="dropdown">
                  <li><a href="/taxi/fronttaximainpage.controller" class="nav-link">叫車資訊</a></li>
                  <li class="has-children">
                    <a href="/taxi/frontlocmainpage.controller">尋找附近店家</a>
                    <ul class="dropdown">
                      <li><a href="#">醫院</a></li>
                      <li><a href="#">藥局</a></li>
                      <li><a href="#">長照</a></li>
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

    <div class="slide-item overlay" style="background-image: url('/images/slider-2.jpg')">
      <div class="container">
        <div class="row justify-content-center text-center">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">便利專區</h1>
            <p class="lead text-white mb-5">提供叫車資訊、長照專車、以及相關醫療店家地址，多個相關需求一次滿足，讓長者的生活充滿便利</p>
            <p><a href="#" class="btn btn-primary">前往搜尋</a></p>
          </div>
        </div>
      </div>  
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-8 blog-content">
            <div class="row mb-5">
              <div class="col-lg-6">
                <figure><img src="/images/hospital2.png" alt="Free Website Template by Free-Template.co" class="img-fluid">
                </div>
               
              </div>
            <div id="content">
              <ul id="data">
              </ul>
             </div> 
		</div>

		<div class="historyArea" id="fixed">
        <dl>
            <dd class="tips" style="display: block;">
                <b>相關搜尋</b>
            </dd>
            <c:forEach var="ele" items="${listLoc}">
            <dd class="tips" style="display: block;">
                <a href="#" onclick="shop('${ele.id}')">
                    <h4 style="margin:10px 0 0 0">${ele.store}</h4>
                    <div class="prdImgWrap">
                        <span class="imgTag">
                        </span>                      
                        <img src="/images/hospital2.png"/>
                        <span class="icon-phone"></span>
                        <span>${ele.phone}</span><br/>
                        <span class="icon-map-marker"></span>
                        <span>${ele.city}  ${ele.town}  ${ele.address}</span>
                    </div>
                </a>
            </dd>
            </c:forEach>
        </dl>
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

<script type="text/javascript">


$(document).ready(function(){
	shop("${loc.id}");
})

function shop(id){
        $.ajax({
            type: 'post',
            url: '/taxiFront/search2/' +id,
            dataType: 'JSON',
            contentType: 'application/json',
            success: function (response) {
            	$('#data').empty();
                
				$('#data').append(
            		
   				"<p style='font-size: 35px;'>"+ (response.store)+"</p>"	+
  				"<li style='font-size: 25px;'>類別: " + (response.type) + "</li>"	+
  				"<li style='font-size: 25px;'>電話: " + (response.phone) + "</li>"	+
   				"<li style='font-size: 25px;'>營業時間: " + (response.time) + "</li>"	+
   				"<li style='font-size: 25px;'>店休日: " + (response.close_day) + "</li>"	+
   				"<li style='font-size: 25px;'>地址: " + (response.city) + (response.town) + (response.address) +"</li>" +
   				"<li style='font-size: 25px;'>簡介: " + (response.brief) + "</li>"	+
   				"<li style='font-size: 25px;'><a href='" + (response.site) + "' target='_blank'>點我前往網站</a></li><br/>"	
           		 )
                }
            
        })
}
</script>

<!-- 浮動選單 -->
<script type="text/javascript">
 var bottomH = $('body')[0].scrollHeight-$('.historyArea').height()-$('.site-footer').height()-150;
 var testH=$('.historyArea').height();
 var testH2=$('.site-footer').height();
 console.log(bottomH);
 console.log(testH);
 console.log(testH2);
 
   $(function() {
     $(window).scroll(function() {
       if ($(this).scrollTop() > 500 && $(this).scrollTop() < bottomH)  {          /* 要滑動到選單的距離 */
    	   $('.historyArea').css('top','150px');   
    	   $('.historyArea').addClass('navFixed');   /* 幫選單加上固定效果 */
       } else {
           if($(this).scrollTop() < 500){
        	   console.log('123')
        	   $('.historyArea').css('top','650px');
           }else{
        	   $('.historyArea').css('top','1100px');
           }
           $('.historyArea').removeClass('navFixed'); /* 移除選單固定效果 */
       }
     });
  });
</script> 
      

</body>
</html>