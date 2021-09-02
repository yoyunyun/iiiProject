<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Elderly &mdash; Website Template by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--   <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css" -->
<!--         integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA==" -->
<!--         crossorigin="" /> -->
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

  <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 載入 Leaflet.js -->
 <style>
        html,
        body {
            width: 100%;
            height: 100%;
        }

		#MapFrame{
			width: 100%;
			height: 600px;
		}

        #myMap {
            width: 100%;
            height: 100%;
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

	<%@ include file="/WEB-INF/pages/user-header.jsp"%>

    <!-- MAIN -->

    <div class="slide-item overlay" style="background-image: url('/images/Taxi.jpg')">
      <div class="container">
        <div class="row" style="top: 300px">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">計程車資訊</h1>
            <p class="lead text-white">提供多家計程車資訊，不管是跨縣市還是長照專車，均可透過平台搜尋</p>
          </div>
        </div>
      </div>
    </div>

<!--     地圖載入到div -->
    <div id="MapFrame">
    <div id="myMap"></div>
    </div>
    
    	<script>

	
	//多個標記點
		const data = [
            { name: "計程車A", local: [24.9573, 121.19431] },
            { name: "計程車B", local: [24.96253, 121.16635] },
            { name: "計程車C", local: [24.96822, 121.18665] },
            { name: "計程車D", local: [24.95935, 121.17017] }
        ];
		//function裡的L要另外設參數才會作用，否則會無法觸發動作
		var maplibrary = L;
		
        // 設定地圖中心點與放大倍率
        const map = maplibrary.map("myMap", {
            gestureHandling: true
        }).setView([24.9678, 121.1916], 15);
        

        //建立地標
        var marker = maplibrary.marker([24.9678, 121.1916]);
        marker.addTo(map);

        // 載入圖資
        
        maplibrary.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '<a href="https://www.openstreetmap.org/">OSM</a>',
            
        }).addTo(map);

//         data.forEach(item => {

// 	            const myIcon = maplibrary.icon({
// 	                iconUrl: '/images/taxi_icon.png',  //設定 icon 圖片路徑
// 	                iconSize: [60, 50],      //資料為陣列，設定寬度與高度   
// 	                iconAnchor: [30, 25],    //資料為陣列，設定 icon 的 X 軸與 Y 軸偏移量
// 	                popupAnchor: [-3, -76],  //資料為陣列，設定彈跳視窗的 X 軸與 Y 軸偏移量

// 	            });
// 	            var test=maplibrary.marker(item.local, {
// 	                title: item.name,
// 	                icon: myIcon
// 	            })
// 	                test.addTo(map)
// 	                .bindPopup(item.name);
// 	        	});
    
	
	function search() {
		$.ajax({
     		type:'post',
     		url:'/taximap/querytaximap/',
     		dataType:'JSON',
     		contentType:'application/json',
     		success: function(result) {	   		
  	   			newdata=[];
  	   			for(var i in result){
  	   				let m = result[i].map.split(',');
  	   				
  		   			newdata.push(
  		   				{name: result[i].name,license: result[i].license,phone: result[i].phone,
  		   					company: result[i].company,service: result[i].service, local: m}
  		   			)
  	   			}

  	   			newdata.forEach(item => {

	            const myIcon = L.icon({
	                iconUrl: '/images/taxi_icon.png',  //設定 icon 圖片路徑
	                iconSize: [60, 50],      //資料為陣列，設定寬度與高度   
	                iconAnchor: [30, 25],    //資料為陣列，設定 icon 的 X 軸與 Y 軸偏移量
	                popupAnchor: [-3, -76],  //資料為陣列，設定彈跳視窗的 X 軸與 Y 軸偏移量

	            });
	            var test=maplibrary.marker(item.local, {
	                title: item.name,
	                icon: myIcon
	            })
	            	let list = "服務狀態: "+item.service+"<br/>駕駛: "+item.name+"<br/>車牌: "+item.license+"<br/>所屬公司: "+item.company+
	            				"<br/>電話: "+item.phone;
	                test.addTo(map)
	                .bindPopup(list);
	        	});
  	   			
  	   			return data;
     		}
  	});
		
	};

	
	$(document).ready(function(){
		search();
	})

</script>
    
<!--     <script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js" integrity="sha512-nMMmRyTVoLYqjP9hrbed9S+FzjZHW5gY1TWCHA5ckwXZBadntCNs8kEqAWdrb9O7rxbCaA4lKTIWjDXZxflOcA==" crossorigin=""></script> -->

<script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
    integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
    crossorigin="">
    </script>


<!-- site-footer bg-light --> 
<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>
  

  <!-- <script src="js/jquery-3.3.1.min.js"></script> -->
 <%@ include file="/WEB-INF/pages/user-js.jsp"%>
 


</body>

</html>