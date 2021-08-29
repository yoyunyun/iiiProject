<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
  <title>健康優生網</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    

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
    <div class="slide-item overlay" style="background-image: url('${pageContext.request.contextPath}/images/slider-2.jpg')">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">健康悠生伴你一生</h1>
            <p class="lead text-white mb-5">健康一生 悠活一生</p>
            <p><a href="about.html" class="btn btn-primary">關於我們</a></p>
          </div>
        </div>
      </div>  
    </div>
    
    

  <main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">藥物查詢系統</h1>
					<div class="card mb-4">
						<div class="card-header">

							<i class="fas fa-table me-1"></i> 藥物清單
						</div>
						<div class="card-body">
							<c:if test="${!empty list}">
								<table width="100%" style="table-layout:fixed line-height:25px;">
								        <tr> 
											<td>編號</td>
											<td>許可證字號</td>
											<td>中文藥名</td>
											<td>英文藥名</td>
											<td>申請商</td>
											<td>形狀</td>
											<td>顏色</td>
											<td>外型</td>
										</tr>
								
								<c:forEach items="${list}" var="Drug">
										    <tr>
												<td>${Drug.id}</td>
												<td>${Drug.cnumber}</td>
												<td>${Drug.chinesename}</td>
												<td>${Drug.englishname}</td>
												<td>${Drug.applicant}</td>
												<td>${Drug.shape}</td>
												<td>${Drug.color}</td>
												<td>${Drug.appearance}</td>
											
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>
					</div>
				</div>
			</main>
    
    
    
    <!-- Footer -->


   <%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>


  </div> <!-- .site-wrap -->

<%@ include file="/WEB-INF/pages/user-js.jsp"%>

</body>
</html>