<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
        button{
            width:75px; 
            height: 75px; 
            border-radius: 50%;
            margin:10px;
            position: relative;
            left: 1100px;
            top: -80px;
            opacity: 0.5;
        }
        
        button :hover{
        	opacity: 1;
/*         	background-color:red; */
          	border-radius: 50%; 
            box-shadow:0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
            width:75px;
            height:75px;
        }
/*         button>#hos> :hover{ */
/*         	background-color:#46A3FF; */
/*         } */
        
        #choose{
        	position: relative;
        	left: 300px;
        	top:-30px
        }
        
        body{
        	background-image: url(/images/older1.png);
            background-repeat: no-repeat;
            background-size: 500px 500px; 
            background-position: 750px 700px;
            
/*          background-attachment: fixed;  */
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
                <a href="services.html" class="nav-link">便利專區</a>
                <ul class="dropdown">
                  <li><a href="/taxi/fronttaximainpage.controller" class="nav-link">叫車資訊</a></li>
                  <li>
                    <a href="/taxi/frontlocmainpage.controller">尋找附近店家</a></li>
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
            <p><a href="#" class="btn btn-primary">尋找附近店家</a></p>
          </div>
        </div>
      </div>  
    </div>




<div style="margin: 20px; height:150px">
 <h4 style="position:relative; top:10px; left:50px">請選擇想搜尋的縣市:</h4> 
  <div id="choose">
   <select id="city" name="city"></select><select id="town" name="town"><option value=0>請選擇</option></select>
	</div>
	<button id="hos" style="background-color: #C4E1FF;" disabled><h4 style="margin: 2px 2px;">搜尋醫院</h4></button>
    <button id="med" style="background-color: #FFDCB9;"><h4 style="margin: 2px 2px;">搜尋藥局</h4></button>
    <button id="care" style="background-color: #E2C2DE;"><h4 style="margin: 2px 2px;">長照中心</h4></button>
</div> 
<div class="site-section" style="padding: 45px 0 90px 0">
      <div class="container" >
        <div class="row mb-5 justify-content-center">
          <div class="col-7 text-center">
            <div class="heading">
              <h2 class="text-black" id="title">醫院</h2>
            </div>
          </div>
        </div>
        
        <div class="row" id="insert" style="text-align: center">
        	<div id="pic"></div>
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
<script>

var cv = $("#city").val();
var tv = $("#town").val();
var tp = "醫院";

$(document).ready(function(){
	$.getJSON('/json/taiwan_districts.json',function(data){
		var resultText='';
		resultText="<option value=0>請選擇</option>";
		for(var i=0; i<data.length; i++){
			resultText+="<option value='"+data[i].name+"'>"+data[i].name +"</option>"
		}
		
		$("#city").html(resultText);
	});

$("select[name='city']").on('change',function(){
	$.getJSON('/json/taiwan_districts.json',function(data){	
		let CN=$("select[name='city']").val();		
		for(n=0; n<data.length; n++ ){
			if(CN == data[n].name){
				var resultText2='';
				resultText2="<option value=0>請選擇</option>";
				for(var j=0; j<data[n].districts.length; j++){
					resultText2+="<option value='"+data[n].districts[j].name+"'>"+data[n].districts[j].name+"</option>"
				}
							    				
			}
		}	
		$("#town").html(resultText2);
		
	});		
});
});

$(function(){
	$("#city").on('change',function(){
		cv=this.value;
		tv=0;
		search();
	})
})
$(function(){
	$("#town").on('change',function(){
		tv=this.value;
		search();
	})
})

function search(){
        $.ajax({
        	type:'post',
     		url:'/taxiFront/queryloc/' +cv+'/'+tv+'/'+tp,
     		dataType:'JSON',
     		contentType:'application/json',
            success:function(response){
            	$("#insert").empty();
                	if(response.length == 0){
                		$("#insert").append("無此地區資料");
                		$("#insert").removeClass("row")
                	}else{
                		
                $.each(response,function(index,ele){
                	$("#insert").addClass("row")
                	$("#insert").append(
                		  
            "<div class='col-12 col-sm-6 col-md-4 mb-4'>"+
            "<div class='blog-entry'>"+
              "<a href='/taxi/search/"+(ele.id)+"' class='d-block'>" +
                "<img src='/images/hospital2.png' alt='Image' class='img-fluid'></a>"+
              "<div class='post-meta d-flex justify-content-center'>" +
                "<span>"+
                	"<span class='icon-phone'></span>" +
            	 	"<span >"+ (ele.phone)+"</span><br/>" +
                	"<span class='icon-map-marker'></span>"+
                 	"<span >"+ (ele.city)+ (ele.town)+ (ele.address) +"</span>"+
                  	
                "</span>" +
              "</div>" +
              "<h2><a href='/taxiFront/search/"+(ele.id)+"' target='_blank'>"+ (ele.store) +"</a></h2>" +
              "<p>"+ (ele.brief) + "</p>" +
            "</div>" +
          "</div>"
                 ) 
              
                })
                	}
            },
            error:function(){
                alert(`發生錯誤`)
            }
        })
}

$(function () {
	$('#hos').on('click', function () {
		tp = "醫院";
		$("#insert").empty();
		$('#title').text('醫院');
		$('#hos').prop('disabled',true)
		$('#med').prop('disabled',false)
		$('#care').prop('disabled',false)
	})
})

$(function () {
	$('#med').on('click', function () {
		tp = "藥局";
		$("#insert").empty();
		$('#title').text('藥局');
		$('#hos').prop('disabled',false)
		$('#med').prop('disabled',true)
		$('#care').prop('disabled',false)
	})
})

$(function () {
	$('#care').on('click', function () {
		tp = "長照中心";
		$("#insert").empty();
		$('#title').text('長照中心');
		$('#hos').prop('disabled',false)
		$('#med').prop('disabled',false)
		$('#care').prop('disabled',true)
	})
})
</script>

</body>
</html>