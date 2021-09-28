<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
  <title>健康悠生網</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
<link href="/css/styles.css" rel="stylesheet" />
        <script    src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/datatables-simple-demo.js"></script>
        <script src="/js/sweetalert2.all.min.js"></script>
<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
  
  <style>
  	
  	#button{
  		width:200px;
  		margin: 0 auto 20px auto;
  	}
  	
  	#myPage{
  		border-radius:10px;
  		margin:5px;
  		font-size:25px;
  		transition-duration: 0.4s;
  		border:none;
  		box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  		outline:none;

  	}
  	
  	#myPage:hover {
  		background-color: skyblue;
  		color: white;
	} 
	
	
	#cart-icon {
	  position: fixed;
	  bottom: 80px;
	  right: 10px;
	}
	
	
	#top {
	  position: fixed;
	  bottom: 170px;
	  right: 10px;
	}
	
	
	.sort{
	    position: absolute;  /*固定在網頁上不隨卷軸移動，若要隨卷軸移動用absolute*/
	    top: 118%;  /*設置垂直位置*/
	    left: -17px;  /*設置水平位置，依所放的內容多寡需要自行手動調整*/
	    background: transparent;  /*背景顏色*/
		transition-duration:1s;
	}
	
	
	.btn{
		font-size:16px;
		font-family:serif;
		border-radius:0;
	}
	
	.btn-dark{
		font-size:18px;
		font-family:serif;
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
    <div class="slide-item overlay" style="background-image: url('${pageContext.request.contextPath}/images/藥物產品.jpg')">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">藥物包裝</h1>
            <p class="lead text-white mb-5">幫助您查詢近期藥物變更資訊</p>
           
          </div>
        </div>
      </div>  
    </div>
    
    

  <main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">藥品查詢系統</h1>


					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 藥品資料
						</div>
						<div class="card-body">
							
							<br/>


							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>更改日期</th>
										<th>更改前照片</th>
										<th>更改後照片</th>
										<th>藥品名稱</th>
										<th>更改描述</th>
			                        </tr>
								</thead>


								<tbody>
									<c:forEach var="drugproduct" items="${list}">

							
										<tr>
											<td>${drugproduct.releasedate}</td>
											<td><img src="${pageContext.request.contextPath}/DrugProductImg/${drugproduct.beforechange}"
												onerror="this.style.display='none'" width="120px"
												height="120px" /></td>
											<td><img src="${pageContext.request.contextPath}/DrugProductImg/${drugproduct.afterchange}"
												onerror="this.style.display='none'" width="120px"
												height="120px" /></td>
											<td>${drugproduct.drugname}</td>
											<td>${drugproduct.direction}</td>
									</tr>

									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
    
    
    
    <!-- Footer -->


<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>

  </div> <!-- .site-wrap -->
<script src="/js/jquery-3.6.0.js"></script>
<%@ include file="/WEB-INF/pages/user-js.jsp"%>

</body>
</html>