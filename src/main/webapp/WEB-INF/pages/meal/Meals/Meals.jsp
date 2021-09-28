<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,tw.iiihealth.meal.meals.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>健康悠生網</title>
</head>
<head>
  <title>Elderly &mdash; Website Template by Colorlib</title>
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
        .win td {
            padding: 5px;
        }

        .tex {
            margin: 5px;
        }

        .win tbody :hover {
            background-color: #E0E0E0;
        }

        button:hover {
            background-color: #E0E0E0;
        }
        
    </style>
            <style>
        .hel {
            background-color: #66B3FF;
            margin: 35px;
            border-radius: 20px;
            width: 300px;
            height: 130px;
            float: left;
            text-align: center;
        }
        .phel {
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

    
<%@ include file="/WEB-INF/pages/user-header.jsp"%>


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
            <p><a href="${pageContext.request.contextPath}/contact" class="btn btn-primary">Contact　us</a></p>
          </div>
        </div>
      </div>  
    </div>




    <div class="site-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
            <div class="heading">
            <div class="text-center" style="margin:50px 0 100px 0;"><a style="font-weight:bold;font-size:32px;color:black;">你也有這些困擾嗎？</a></div>
    <div class="hel">
        <p class="phel">慢性疾病的飲食控制？</p>
        <p class="phel">健身增肌控糖餐食？</p>
    </div>
    <div class="hel">
        <p class="phel">咀嚼吞嚥開始退化？</p>
        <p class="phel">限鈉磷鉀飲食如何吃？</p>
    </div>
    <div class="hel">
        <p class="phel">追求健康不知從何開始？</p>
        <p class="phel">孝親照護餐點好難選？</p>
    </div>
    <br><br><div></div>
    <div class="text-center" style="margin:270px 0 130px 0;"><a style="font-weight:bold;font-size:30px;color:#FF7575;">健康養生餐是你最好的選擇！</a></div>
              <h2 class="text-black text-center" style="margin:0 0 50px 0;">最新菜單</h2>
            </div>
          <div class="col-10 text-center">
            <p style="font-size:18px">餐盒均附營養米飯、配菜、蛋，配菜依照當令季節時蔬略有不同，會不定期更換，皆採現場製作配菜為主。</p>
<!--             <span class="1" style="color:blue"></span> -->
            <div class="flip" style="float:right;margin:50px 0 0 0;"><input type="button" value="詳細資訊(展開/收合)"></div>
          </div>
        </div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="color:red;" id="exampleModalLabel">　　　　　　　　　　本檔優惠!!炙燒慾望明太子嫩烤雞胸-團購表單</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table style="margin:auto" class="win">
                        <tr>
                        <td style=" font-weight: 800;font-size:20px;">預約訂購商品:</td>
                        <td><img src="/images/炙燒慾望明太子嫩烤雞胸.jpg" width="200px"></td><br/>
                        <td style="color:red;">限時優惠:$1299 (10份/組)</td>
                        </tr>
                        <tr>
                        <td>預訂組數:</td>
                        <td><select class="tex" id="quy">
                            <option selected>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option></select>
                        <td>每位限購10組!</td>
                        </tr>
                    <tr>
                        <td>客戶大名:</td>
                        <td><input type="text" id="name" class="tex" placeholder="必填"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>客戶電話:</td>
                        <td><input type="text" id="phone" class="tex" placeholder="必填"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>客戶信箱:</td>
                        <td><input type="text" id="mail" class="tex" placeholder="必填"></td>
                        <td></td>
                    </tr>
                </table>
      </div>
      <div class="modal-footer">
        <form action="mealIndex.controller"	method="post" id="add" enctype="multipart/form-data">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
        <button type="button" class="btn btn-primary" onclick="add()">送出</button>
        <button type="button" class="btn btn-primary" id="inputdata">一鍵輸入</button>
        </form>
      </div>
    </div>
  </div>
</div>


          <!-- Button trigger modal -->
        <div class="settime" endtime="2021-9-25 00:16:00" style="text-align:left; color:red;font-size:25px;margin:30px 0">
        </div>
        <div class="settime" endtime="2021-9-16 00:16:00" style="color:red;font-size:25px;margin:30px 0">
        </div>
<!-- 			<button style="border:none;" type="button" class="" data-toggle="modal" data-target="#exampleModal" font-size="25px"> -->
<!-- 			   <input type="image" src="/images/fire01.gif" width="100px"> -->
<!-- 			</button> -->
        
        
        
        
<div class="row">
<table >
	<thead></thead>
	<tbody>
		<c:forEach var="meals" items="${queryAll}">
          <div class="col-12 col-sm-6 col-md-4 mb-4">
            <div class="blog-entry">
<!--             <a data-fancybox="gallery" href="images/0409.png"><img src="images/泰享受酸辣雞腿排.jpg" width="300"></a> -->
              <a class="d-block" data-fancybox="gallery" data-caption="${meals.name}" href="${pageContext.request.contextPath}/MealImg/${meals.photo}">
              	<img src="${pageContext.request.contextPath}/MealImg/${meals.photo}"
				      alt="Image" class="img-fluid" onerror="this.style.display='none'"/>
<!-- 				      style="display:block" onclick="showMaxImg(this)" /> -->
<!-- 				      <img style="width:62px;height:83px;display:block" src="images/0409.png" onclick="showMaxImg(this)"> -->
              </a>
              <div class="post-meta d-flex justify-content-center">
                <span>
                  <span class="icon-truck"></span>
                  <span style="font-size:8px">Deliverable</span>
                </span>
                <span>
                  <span class="icon-dollar"></span>
                  <span>NT:${meals.price}</span>
                </span>
                <span>
                  <span class="icon-thumbs-o-up"></span>
                  <span>${meals.ID} likes</span>
                </span>
              </div>
              <h2><a style="color: #2894FF;">${meals.name}</a></h2>
			  <div class="panel" style="display:none">
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

    
<!-- site-footer bg-light -->

<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>

  </div> <!-- .site-wrap -->
  
<script src="/js/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/pages/user-js.jsp"%>
  
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
  <script>
	  $(function() {
		    updateEndTime();
		})
		//倒數計時函數
		function updateEndTime() {
		    var date = new Date();
		    var time = date.getTime(); 
		    $(".settime").each(function(i) {
		        var endDate = this.getAttribute("endTime"); //结束
		        //轉換為時間日期類型
		        var endDate1 = eval('new Date(' + endDate.replace(/\d+(?=-[^-]+$)/, function(a) {
		            return parseInt(a, 10) - 1;
		        }).match(/\d+/g) + ')');
		        var endTime = endDate1.getTime(); //结束時間毫秒數
		        var lag = (endTime - time) / 1000; //當前時間和結束時間之間的秒數
		        if (lag > 0) {
		            var second = Math.floor(lag % 60);
		            var minite = Math.floor((lag / 60) % 60);
		            var hour = Math.floor((lag / 3600) % 24);
		            var day = Math.floor((lag / 3600) / 24);
		            $(this).html("距離團購結束的時間：" + day + "天" + hour + "小時" + minite + "分" + second + "秒" +
					'<button style="border:none;" type="button"  data-toggle="modal" data-target="#exampleModal" font-size="25px">' +
// 					   '<input type="image" src="/images/fire02.png" width="30px">' +
					   '<a style="color:blue;font-weight: bold">→→→點此訂購!!!<a>' +
					'</button>');
		        } else
		            $(this).html("團購已經結束了！下檔優惠敬請期待！");
		    });
		    setTimeout("updateEndTime()", 1000);
		}
  </script>
  <script>
//插入計程車資訊
  function load(){
	  $('#example').DataTable({
		    "ajax": {
		            "url": '/taxiFront/queryalltest',
		            "type": 'post',   	
		            "dataSrc": function (test) {
		                 return test;
		             }  
		    },   
		    "columns": [


		        {
 				//column加入叫車圖示
		        	"data": null,
		        	render:function(data, type, row)
		            {
		              return '<input type="image" class="img2" title="點此預約" src="/images/movemovetaxi.gif" style="width:35px; " value="'+ data["tname"] +'"/>';
		            },
		            "targets": -1
		        },

		        { "data": "tname" },
		        { "data": "phone" },
		        { "data": "address" },
		        { "data": "serCity" },
		        { "data": "careTaxi" },
		    ] 
		});
	  
	setTimeout(()=>{
		$(".img2").on('click',imgClick);
	},500)
	
  }

//點擊叫出跳出頁面
  function imgClick() {
	  	$('#taxi').val(this.value);
// 		$('#tid').val($(this).prev().val());  //<input type="hidden" class="tid" value="'+ data["id"] +'">
	  $.ajax({
   		type:'get',
   		url:'/taxiFront/booktaxi/checklogin',
   		success: function(data) {
   			if(data == "success"){
				show();
   			}else{
   				Swal.fire({
					  icon: 'error',
					  title: 'Oops...',
					  text: '請先登入會員!',
				}).then(()=>{
					window.location.href='/taxiFront/booktaxi/fronttaximainpage.controller';
				})
				
   			}
   		}
	});
	}
 
</script>
 <script>
        function cancel() {
            $("#myModal").modal('hide');
        }
        function show() {
            $("#myModal").modal('show');
            
        }

        
        //Sweetalert
        function yes(){
        	Swal.fire({
        		  title: '<img src="/images/takicab-taxi-call.gif">',
        		  showConfirmButton: false,
        		  timer: 3250
        		}).then(()=> {Swal.fire({
        		  icon: 'success',
        		  title: '預約成功!請前往信箱確認!如未收到信件，請前往會員中心查詢，感謝',
        		  showConfirmButton: true,
        		})}).then(()=>{
        			cancel();
        		})
        	
        	//傳給信件
        	$.ajax({
			  url: "/taxiFront/booktaxi",
			  type: "post",
			  data:  { "mail" : $('#mail').val() , "passanger" : $('#passanger').val(),
				  		"taxi" : $('#taxi').val(), "loc" : $('#loc').val(), "date" : $('#date').val(),
				  		"hour" : $('#hour').val(), "min" : $('#min').val(), "tel" : $('#tel').val(),
				  	},
		  	  success: function(data){
		  	  }
			})
			
			
        }
    </script>
		<script>
		function add(){
			Swal.fire({
				  icon: 'success',
				  title: '訂購成功,後續將由人員主動與您聯繫確認!',
				  showConfirmButton: false,
				  timer: 1300
				})	
				setTimeout(() => document.getElementById("add").submit(), 1500)
		}
	</script>
	<script>
	    //一鍵輸入
	    $('#inputdata').click(function() {
	      $('#quy').val(3); 
	      $('#name').val("林小伸");
	      $('#phone').val("0988123456");
	      $('#mail').val("EEIT12907@gmail.com");
	    
	    });
	</script>
</body>
</html>