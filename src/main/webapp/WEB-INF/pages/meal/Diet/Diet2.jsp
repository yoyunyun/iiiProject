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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">   
<%-- <%@ include file="/WEB-INF/pages/css.jsp"%> --%>
    <style>
	a.disabled {
 	 pointer-events: none;
  	 cursor: default;
	}
	</style>
<link href="/css/styles.css" rel="stylesheet" />
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/js/datatables-simple-demo.js"></script>


<!--   <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet"> -->
<!--   <link rel="stylesheet" href="/fonts/icomoon/style.css"> -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
<!--   <link rel="stylesheet" href="/css/jquery-ui.css"> -->
<!--   <link rel="stylesheet" href="/css/owl.carousel.min.css"> -->
<!--   <link rel="stylesheet" href="/css/owl.theme.default.min.css"> -->

<!--   <link rel="stylesheet" href="/css/jquery.fancybox.min.css"> -->

<!--   <link rel="stylesheet" href="/css/bootstrap-datepicker.css"> -->

<!--   <link rel="stylesheet" href="/fonts/flaticon/font/flaticon.css"> -->

<!--   <link rel="stylesheet" href="/css/aos.css"> -->

  <link rel="stylesheet" href="/css/style.css">
  
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/datatables-simple-demo.js"></script>
  

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

<%@ include file="/WEB-INF/pages/user-header.jsp"%>

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
            <p><a href="${pageContext.request.contextPath}/contact" class="btn btn-primary">Contact　us</a></p>
          </div>
        </div>
      </div>  
    </div>




    <div class="site-section">
      <div class="container">
        
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
				
				<!-- ----------- -->
			    <div>
					<input type="button" value="開啟" onclick="window.open('dietTest');" />
				</div>
				    <div class="page-header">
        <h1>jQuery 購物車模組
          <div style="float: right; cursor: pointer;">
            <span class="glyphicon glyphicon-shopping-cart my-cart-icon">
            	<img src="../images/calculater01.png" width="80px">
            	<span class="badge badge-notify my-cart-badge"></span>
            </span>
          </div>
        </h1>
      </div> 
    <div class="row">
        <div class="col-sm-6 col-md-3 text-center">
          <img src="../images/功夫照燒薑汁燒肉.jpg" width="150px" height="150px">
          <br>
          功夫照燒薑汁燒肉 - <strong>$210</strong>
          <br>
          <button class="btn btn-danger my-cart-btn" data-id="1" data-name="功夫照燒薑汁燒肉" data-summary="summary 1" data-price="210" data-quantity="1" data-image="../images/功夫照燒薑汁燒肉.jpg">加入購物車</button>
        </div>
    
        <div class="col-sm-6 col-md-3 text-center">
          <img src="../images/炙燒慾望明太子嫩烤雞胸.jpg" width="150px" height="150px">
          <br>
          炙燒慾望明太子嫩烤雞胸 - <strong>$170</strong>
          <br>
          <button class="btn btn-danger my-cart-btn" data-id="2" data-name="炙燒慾望明太子嫩烤雞胸" data-summary="summary 2" data-price="170" data-quantity="1" data-image="../images/炙燒慾望明太子嫩烤雞胸.jpg">加入購物車</button>
        </div>
    
        <div class="col-sm-6 col-md-3 text-center">
          <img src="../images/黑色幽默嫩烤雞胸(墨魚口味).jpg" width="150px" height="150px">
          <br>
          黑色幽默嫩烤雞胸(墨魚口味) - <strong>$200</strong>
          <br>
          <button class="btn btn-danger my-cart-btn" data-id="3" data-name="黑色幽默嫩烤雞胸(墨魚口味)" data-summary="summary 3" data-price="200" data-quantity="1" data-image="../images/黑色幽默嫩烤雞胸(墨魚口味).jpg">加入購物車</button>
        </div>
    
        <div class="col-sm-6 col-md-3 text-center">
          <img src="../images/新疆孜然燒烤風味嫩烤雞胸.jpg" width="150px" height="150px">
          <br>
          新疆孜然燒烤風味嫩烤雞胸 - <strong>$240</strong>
          <br>
          <button class="btn btn-danger my-cart-btn" data-id="4" data-name="新疆孜然燒烤風味嫩烤雞胸" data-summary="summary 4" data-price="240" data-quantity="1" data-image="../images/新疆孜然燒烤風味嫩烤雞胸.jpg">加入購物車</button>
        </div>
    </div>
				
				
				<!-- ----------- -->
				
		</div>


        </div>
      </div>
    </div>

    
<!-- site-footer bg-light -->

<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>

  </div> <!-- .site-wrap -->
  
<!-- <script src="/js/jquery-3.3.1.min.js"></script> -->
<script src="/js/jquery-2.2.3.min.js"></script>

<script src="/js/jquery.mycart.js"></script>

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
        $(function () {

var goToCartIcon = function($addTocartBtn){
  var $cartIcon = $(".my-cart-icon");
  var $image = $('<img width="30px" height="30px" src="' + $addTocartBtn.data("image") + '"/>').css({"position": "fixed", "z-index": "999"});
  $addTocartBtn.prepend($image);
  var position = $cartIcon.position();
  $image.animate({
    top: position.top,
    left: position.left
  }, 500 , "linear", function() {
    $image.remove();
  });
}

$('.my-cart-btn').myCart({
  currencySymbol: '',
  classCartIcon: 'my-cart-icon',
  classCartBadge: 'my-cart-badge',
  classProductQuantity: 'my-product-quantity',
  classProductRemove: 'my-product-remove',
  classCheckoutCart: 'my-cart-checkout',
  affixCartIcon: true,
  showCheckoutModal: true,
  numberOfDecimals: 2,
  clickOnAddToCart: function($addTocart){
    goToCartIcon($addTocart);
  },
  afterAddOnCart: function(products, totalPrice, totalQuantity) {
    console.log("afterAddOnCart", products, totalPrice, totalQuantity);
  },
  clickOnCartIcon: function($cartIcon, products, totalPrice, totalQuantity) {
    console.log("cart icon clicked", $cartIcon, products, totalPrice, totalQuantity);
  },
  checkoutCart: function(products, totalPrice, totalQuantity) {
    var checkoutString = "總熱量: " + totalPrice + "\nTotal Quantity: " + totalQuantity;
    checkoutString += "\n\n id \t name \t summary \t price \t quantity \t image path";
    $.each(products, function(){
      checkoutString += ("\n " + this.id + " \t " + this.name + " \t " + this.summary + " \t " + this.price + " \t " + this.quantity + " \t " + this.image);
    });
    alert(checkoutString)
    console.log("checking out", products, totalPrice, totalQuantity);
  },
  getDiscountPrice: function(products, totalPrice, totalQuantity) {
    console.log("calculating discount", products, totalPrice, totalQuantity);
    return totalPrice * 0.5;
  }
});

$("#addNewProduct").click(function(event) {
  var currentElementNo = $(".row").children().length + 1;
  $(".row").append('<div class="col-md-3 text-center"><img src="images/img_empty.png" width="150px" height="150px"><br>product ' + currentElementNo + ' - <strong>$' + currentElementNo + '</strong><br><button class="btn btn-danger my-cart-btn" data-id="' + currentElementNo + '" data-name="product ' + currentElementNo + '" data-summary="summary ' + currentElementNo + '" data-price="' + currentElementNo + '" data-quantity="1" data-image="images/img_empty.png">Add to Cart</button><a href="#" class="btn btn-info">Details</a></div>')
});
});    
    </script>  

</body>
</html>