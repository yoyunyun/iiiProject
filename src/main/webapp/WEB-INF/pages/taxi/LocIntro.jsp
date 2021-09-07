<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Elderly &mdash; Website Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css"
        integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
        crossorigin=""/>
  <link rel="stylesheet" href="//unpkg.com/leaflet-gesture-handling/dist/leaflet-gesture-handling.min.css"
        type="text/css">
  <script src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js"
          integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg=="
          crossorigin=""></script>
  <script src="//unpkg.com/leaflet-gesture-handling"></script>

<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
<style>
/* 浮動視窗 */
.historyArea {
	width: 300px;
	height: 400px;
	z-index: 99;
	position: absolute;
	top: 650px;
	bottom: 300px;
	left: 70%;
	_margin-left: 0px;
	_left: 985px;
	_position: absolute;
	overflow: auto;
	margin-top: 100px;
}

.historyArea dl {
	background-color: #FFFFFF;
	border: 0px;
	margin: 0px;
	padding: 0px;
}

.historyArea b {
	height: 19px;
	background-color: #A0A0A0;
	font: 12px/20px Helvetica; #
	font: 12px/21px Helvetica;
	color: #FFFFFF;
	text-align: center;
	cursor: default
}

.historyArea dl {
	border-top: 1px solid #DDDDDD;
	margin-top: 5px;
	text-align: center
}

.historyArea dt a {
	background: transparent
		url(//image.momoshop.com.tw/ecm/img/cmm/shopcar/topbkimg.gif)
		no-repeat 10px 5px;
	width: 100px;
	color: 999999;
	font-size: 11px;
	font-weight: bold;
	display: block;;
	margin: 2px;
	font-family: Arial;
	color: #999999
}

.historyArea dd {
	border: 1px solid #DDDDDD;
	border-top: 0px;
	padding-top: 5px;
	display: none;
	margin: 0
}

.historyArea dd  a img {
	width: 100%
}

.historyArea .tips {
	padding-top: 0px;
	margin: 0
}

.historyArea b {
	display: block;
}

.historyArea  dl dd a .prdImgWrap {
	position: relative;
	display: inline-block;
}

.historyArea  dl dd a .prdImgWrap .imgTag {
	position: absolute;
	top: 0;
	left: 0;
	padding: 0;
	width: 32%;
	height: 32%;
	z-index: 2
}

.historyArea  dl dd a .prdImgWrap .imgTag img {
	margin: 0;
	width: 100%;
	height: auto
}

.navFixed {
	position: fixed;
	top: 150px;
	left: 70%;
	bottom: 50px;
}

/* 頁面list */

#data li{
	margin: 10px;
}

/* 計程車地圖  */
#MapFrame{
			width: 100%;
			height: 600px;
		}

#myMap {
            width: 100%;
            height: 100%;
        }

      	.titleG{
            color: green;
            text-align: center;
            font-style: oblique;
            font-weight: bolder;
        }

        .titleR{
            color: red;
            text-align: center;
            font-weight: bolder;
        }
        .titleO{
            color:orange;
            text-align: center;
            font-weight: bolder;
        }
        
/* openstreetmap 改z-index */
div.leaflet-pane {
    /*border: 5px solid red;*/
    z-index: 40;
}

div.leaflet-tile-pane {
    /*border: 5px solid black;*/
    z-index: 20;
}

div.leaflet-shadow-pane {
    /*border: 5px solid orange;*/
    z-index: 50;
}

div.leaflet-overlay-pane {
    /*border: 5px solid orange;*/
    z-index: 40;
}
div.leaflet-marker-pane {
	z-index: 60;
}

div.leaflet-tooltip-pane {
    /*border: 5px solid blue;*/
    z-index: 65;

}
div.leaflet-popup-pane {
    /*border: 5px solid blue;*/
    z-index: 70;

}
</style>

</head>
<body>

	<%@ include file="/WEB-INF/pages/user-header.jsp"%>

	<!-- MAIN -->

	<div class="slide-item overlay"
		style="background-image: url('/images/location2.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 align-self-center">
					<h1 class="heading mb-3">醫療機構資訊</h1>
					<p class="lead text-white mb-5">提供相關醫療店家地址，包含醫院、藥局、長照中心，多個相關需求一次滿足，讓長者的生活充滿便利</p>
					<p>
						<a href="#start" class="btn btn-primary">尋找醫療機構</a>
					</p>

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
							<figure>
								<img src="/images/hospital2.png"
									alt="Free Website Template by Free-Template.co"
									class="img-fluid">
							</figure>
						</div>
					</div>
					<div id="content">
					<ul id="data">
						<li style="font-size: 35px;"></li>
						<li style="font-size: 25px;"></li>
						<li style='font-size: 25px;'></li>
						<li style='font-size: 25px;'></li>
						<li style='font-size: 25px;'></li>
						<li style='font-size: 25px;'></li>
						<li style='font-size: 25px;'></li>
						<li style='font-size: 25px;'>
						<a id="site" href='' target='_blank'>點我前往網站</a></li>
						<li style='font-size: 25px;'>位置: </li>
						<div id='MapFrame' style="z-index:1"><div id='myMap'></div></div>
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
									<h4 style="margin: 10px 0 0 0">${ele.store}</h4>
									<div class="prdImgWrap">
										<span class="imgTag"> </span> <img
											src="${pageContext.request.contextPath}/LocationImg/${ele.photo}" />
										<span class="icon-phone"></span> <span>${ele.phone}</span><br />
										<span class="icon-map-marker"></span> <span>${ele.city}
											${ele.town} ${ele.address}</span>
									</div>
								</a>
							</dd>
						</c:forEach>
					</dl>
				</div>

				<!-- site-footer bg-light -->

				<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>

			</div>
		</div>
	</div>
	<!-- .site-wrap -->


	<script src="/js/jquery-3.3.1.min.js"></script>
	<%@ include file="/WEB-INF/pages/user-js.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			shop("${loc.id}");
		})

		function shop(id) {
			$.ajax({
				type : 'post',
				url : '/taxiFront/search2/' + id,
				dataType : 'JSON',
				contentType : 'application/json',
				success : function(response) {

					$( "#data" ).children("li").first().text(response.store).next("li").text("類別: "+response.type)
					.next("li").text("電話: "+response.phone).next("li").text("營業時間: "+response.time).next("li").text("店休日: "+response.close_day)
					.next("li").text("地址: "+response.city+response.town+response.address).next("li").text("簡介: "+response.brief)
					
					$("#site").attr("href",response.site)
					
					let m = response.map.split(',');
					map.setView(m,15);
					marker.setLatLng(m);
					
// 					$('#data').empty();
//  					$('#data').append(

// 							"<p style='font-size: 35px;'>" + (response.store)
// 									+ "</p>"
// 									+ "<li style='font-size: 25px;'>類別: "
// 									+ (response.type) + "</li><br/>"
// 									+ "<li style='font-size: 25px;'>電話: "
// 									+ (response.phone) + "</li><br/>"
// 									+ "<li style='font-size: 25px;'>營業時間: "
// 									+ (response.time) + "</li><br/>"
// 									+ "<li style='font-size: 25px;'>店休日: "
// 									+ (response.close_day) + "</li><br/>"
// 									+ "<li style='font-size: 25px;'>地址: "
// 									+ (response.city) + (response.town)
// 									+ (response.address) + "</li><br/>"
// 									+ "<li style='font-size: 25px;'>簡介: "
// 									+ (response.brief) + "</li><br/>"
// 									+ "<li style='font-size: 25px;'><a href='"
// 									+ (response.site)
// 									+ "' target='_blank'>點我前往網站</a></li><br/>"
// 									+ "<li style='font-size: 25px;'>位置: </li>"
// 									+ "<div id='MapFrame'><div id='myMap'></div></div>"
// 							)
				  
				}

			})
		}
	</script>

	<!-- 浮動選單 -->
	<script type="text/javascript">
		var bottomH = $('body')[0].scrollHeight - $('.historyArea').height()
				- $('.site-footer').height() - 150;
		var testH = $('.historyArea').height();
		var testH2 = $('.site-footer').height();

		$(function() {
			$(window).scroll(
					function() {
						if ($(this).scrollTop() > 500
								&& $(this).scrollTop() < bottomH) { /* 要滑動到選單的距離 */
							$('.historyArea').css('top', '150px');
							$('.historyArea').addClass('navFixed'); /* 幫選單加上固定效果 */
						} else {
							if ($(this).scrollTop() <= 500) {
								$('.historyArea').css('top', '650px');
							} else {
								$('.historyArea').css('top', '1100px');
							}
							$('.historyArea').removeClass('navFixed'); /* 移除選單固定效果 */
						}
					});
		});
	</script>
	
	<script>
	//map
		
		//function裡的L要另外設參數才會作用，否則會無法觸發動作
		var maplibrary = L;
		
        // 設定地圖中心點與放大倍率
        const map = maplibrary.map("myMap", {
            gestureHandling: true
        }).setView([24.9678, 121.1916], 15);
       



        // 載入圖資
        map.createPane('lab');
		map.getPane('lab').style.zIndex = 20;
        maplibrary.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '©OpenStreetMap, ©CartoDB',
        pane:'lab'  
        }).addTo(map);
        
      //建立地標
        var marker = maplibrary.marker([24.9678, 121.1916]);
        marker.addTo(map);

		//建立marker layer
		var markers = maplibrary.layerGroup().addTo(map);
	
	function search() {
		$.ajax({
     		type:'post',
     		url:'/taximap/querytaximap/',
     		dataType:'JSON',
     		contentType:'application/json',
     		success: function(result) {	   		
  	   			newdata=[];
  	   			markers.clearLayers();
  	   			for(var i in result){
  	   				let m = result[i].map.split(',');
  	   				
  		   			newdata.push(
  		   				{name: result[i].name,license: result[i].license,phone: result[i].phone,
  		   					company: result[i].company,service: result[i].service, local: m}
  		   			)
  	   			}
				
  	   			newdata.forEach(item => {

	            const myIcon = L.icon({
	                iconUrl: '/images/movemovetaxi.gif',  //設定 icon 圖片路徑
	                iconSize: [60, 50],      //資料為陣列，設定寬度與高度   
	                iconAnchor: [30, 25],    //資料為陣列，設定 icon 的 X 軸與 Y 軸偏移量
	                popupAnchor: [5, -20],  //資料為陣列，設定彈跳視窗的 X 軸與 Y 軸偏移量

	            });
	            
	            var test=maplibrary.marker(item.local, {
	                title: item.name,
	                icon: myIcon
	            })
	            	let ser = item.service;
	            	let list = "";
	            	if(ser == "可預約"){
	            		myIcon.options.iconUrl ='/images/moveGreen.gif';
	            		list += "<h6 class='titleG'> "+item.service+"</h6><br/>駕駛: "+item.name+"<br/>車牌: "+item.license+"<br/>所屬公司: "+item.company+
	            				"<br/>電話: <a href='tel:"+item.phone+"'>"+item.phone+"</a>";
	            	}else if (ser == "已預約"){
	            		myIcon.options.iconUrl ='/images/moveOrg.gif';
	            		list += "<h6 class='titleO'> "+item.service+"</h6><br/>駕駛: "+item.name+"<br/>車牌: "+item.license+"<br/>所屬公司: "+item.company+
	            				"<br/>電話: <a href='tel:"+item.phone+"'>"+item.phone+"</a>";
	            	}else{
	            		myIcon.options.iconUrl ='/images/moveRed.gif';
	            		list += "<h6 class='titleR'> "+item.service+"</h6><br/>駕駛: "+item.name+"<br/>車牌: "+item.license+"<br/>所屬公司: "+item.company+
	            				"<br/>電話: <a href='tel:"+item.phone+"'>"+item.phone+"</a>";
	            	}
	                
	            	test.addTo(markers)
	                .bindPopup(list);
	        	});
  	   			
     		}
  	});
		setTimeout(() => {
			time(1);
		}, 2500);
		
	};
	
	//設定每5秒呼叫一次
	function time(move){
		$.ajax({
     		type:'post',
     		url:'/taximap/movetaximap/'+move,
     		dataType:'JSON',
     		contentType:'application/json',
     		success: function(result) {
     			
     			}
     		});
		setTimeout(() => {
			search();
		}, 2500);
	}

	
	$(document).ready(function(){
		search();
	})
		

</script>
</body>
</html>