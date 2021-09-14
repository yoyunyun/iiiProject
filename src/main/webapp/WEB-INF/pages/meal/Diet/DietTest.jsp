<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,tw.iiihealth.meal.diet.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>健康優生網-食品計算機</title>
<!-- 使用絕對路徑引入 jQuery庫文件 -->
    <link href="/css/bootstrap.min.css" rel="stylesheet" />


    <style>
	a.disabled {
 	 pointer-events: none;
  	 cursor: default;
	}
	</style>
	<style>
	body{
	margin:0px;
	padding:0px;
	background-attachment:fixed;
	background-color: rgba(0, 0, 0, .6);
	background-image: url('../images/food01.jpg');
	background-size: cover;
	}        
	</style>
<link href="/css/styles.css" rel="stylesheet" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/js/datatables-simple-demo.js"></script>
<script src="/js/sweetalert2.all.min.js"></script>


    <script src="/js/jquery-2.2.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.mycart.js"></script>

    <style>
        h1{text-align:center;}
        p{text-align:center;}
        .badge-notify{
            background:red;
            position:relative;
            top: -20px;
            right: 10px;
        }
        .my-cart-icon-affix {
            position: fixed;
            z-index: 999;
        }
    </style>
</head>
<body >

    
    <div class="page-header ">
    	<a href="dietIndex.controller" style="color:white;font-weight:bolder;font-size:25px;position:absolute;right:0;top:0">回食品資料</a>
    	<h1 style="margin:100px 0;color:black;font-weight:bolder;">食品計算機</h1>
    		<div style="text-align:center;margin-bottom:100px">
    	    <p class="lead text-black mb-5"  style="margin:0 auto; width:800px;font-weight:bolder;">
              飲食與人們的身體健康息息相關。養成良好的飲食習慣，才能真正把身體養好。如果無法攝取足夠的營養，那麼我們的身體機能只會越來越弱，
              也就更容易生病。怎麼才能吃得健康一些呢？食材是所有飲食的基礎，選好食材真的非常重要！
            </p>
    		</div>
        <h4>
          <div style="cursor: pointer;  
					  position: fixed;
					  top: 10%;
					  width: 8em;
					  margin-top: -2.5em;">
            <span class="glyphicon glyphicon-shopping-cart my-cart-icon">
            	<img src="../images/calculater02.png" width="80px">
            	<span class="badge badge-notify my-cart-badge"></span>
            </span>
          </div>
        </h4>
      </div> 
    <div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4" style="width:1200px">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 食品資料庫（表為每100公克含量）
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
						        <th></th>
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
									<td><button class="btn btn-danger my-cart-btn" 
												data-id="${diet.ID}" 
												data-protein="${diet.protein}" 
												data-carbohydrates="${diet.carbohydrates}" 
												data-fat="${diet.fat}" 
												data-sugar="${diet.sugar}" 
												data-na="${diet.na}" 
												data-name="${diet.name}" 
												data-summary="summary 4" 
												data-price="${diet.calories}" 
												data-quantity="1" 
												data-image="../images/kcal02.png">點擊加入</button></td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
		</div>
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
  }, 1000 , "linear", function() {
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
    var checkoutString = "總熱量: " + totalPrice ;
    checkoutString += "\n\n 食品名稱 \t 熱量 \t 蛋白質 \t 碳水化合物 \t 脂肪 \t 糖 \t 鈉 ";
    $.each(products, function(){
      checkoutString += ("\n " + this.name + " \t " + this.price + " \t " + this.protein + " \t " + this.carbohydrates + " \t " + this.fat + " \t " + this.sugar + " \t " + this.na);
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