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

<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>

        <style>
        	img{
			  cursor:pointer;//滑鼠手型
			  transition:all 0.6s ease-in-out;//過渡
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
            <p><a href="#" class="btn btn-primary">Contact　us</a></p>
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
				      alt="Image" class="img-fluid" onerror="this.style.display='none'"
				       />
<!-- 				      style="display:block" onclick="showMaxImg(this)" /> -->
<!-- 				      <img style="width:62px;height:83px;display:block" src="images/0409.png" onclick="showMaxImg(this)"> -->
              </a>
              <div class="post-meta d-flex justify-content-center">
                <span>
                  <span class="icon-truck"></span>
                  <span>Deliverable</span>
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
<%-- 			  	  價格：${meals.price}<br/> --%>
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
</body>
</html>