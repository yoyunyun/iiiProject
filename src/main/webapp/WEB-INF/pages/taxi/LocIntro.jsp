<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <title>Elderly &mdash; Website Template by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    

	<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
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
  
<%@ include file="/WEB-INF/pages/user-header.jsp"%>

    <!-- MAIN -->

    <div class="slide-item overlay" style="background-image: url('/images/location2.jpg')">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">醫療機構資訊</h1>
            <p class="lead text-white mb-5">提供相關醫療店家地址，包含醫院、藥局、長照中心，多個相關需求一次滿足，讓長者的生活充滿便利</p>
            <p><a href="#start" class="btn btn-primary">尋找醫療機構</a></p>
          
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

      <!-- site-footer bg-light -->

<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>

      </div> <!-- .site-wrap -->
      

      <script src="/js/jquery-3.3.1.min.js"></script>
      <%@ include file="/WEB-INF/pages/user-js.jsp"%>

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
           if($(this).scrollTop() <= 500){
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