<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
  <title>健康悠生網</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    

  <%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
  
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
 <style>
 .heart{
		-webkit-filter:opacity(0.2);
		width: 44px;
		cursor:pointer
		}
	
		.heart:hover{
		-webkit-filter:opacity(1);
		width: 44px;
		cursor:pointer
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



<div id="layoutSidenav_content">
		<main>
				<div class="card-header" style="margin-bottom:25px;">
					<i class="fas fa-table me-1"></i> 會員系統
				</div>
				
				
				<!-- 第一列 -->
				<div class=row  style="margin-bottom:30px">
				<div class="col-md-2"></div>
				<div class="col-md-9" style="margin: 0 auto;">
					<h3 style="text-align:center;">會員店家收藏</h3>
				</div>
				<div class="col-md-1"></div>
				
				</div>
				
				
				<!-- 第二列 -->
				<div class="row" style="margin-bottom:100px">
				
				<div class="col-md-2">
					<!-- 會員資料索引 -->	
					<%@ include file="/WEB-INF/pages/Member-index.jsp"%>
				</div>

						<div class="col-md-9 " style="margin: 0 auto;">
						
						
						
						<table class="table table-hover" style="text-align:center">
							<thead>
								<tr class="table-primary">
									<th>照片</th>
									<th>名稱</th>
									<th>類型</th>
									<th>電話</th>
									<th>網站</th>
									<th>取消收藏</th>
									
								</tr>
							</thead>
					
						<c:choose>
						<c:when test="${not empty list}">
							<tbody id="datalist">
							<c:forEach var="loc" items="${list}">
								<tr>
									<td>
										<a href="/taxiFront/search/${loc.id}" target='_blank' >
											<img src="${pageContext.request.contextPath}/LocationImg/${loc.photo}"
												onerror="this.style.display='none'" width="120px"
												height="120px" />
										</a>	
									</td>
									<td><a href="/taxiFront/search/${loc.id}" target='_blank'>${loc.store}</a></td>
									<td>${loc.type}</td>
									<td>${loc.phone}</td>
									<td><a href="${loc.site}" target='_blank'>前往網站</a></td>
									<td><input type="image" src="/images/heart.png" id="${loc.id}" class='heart' onclick='delcheck("${loc.id}")'></td>
								</tr>
							</c:forEach>
							</tbody>
						</c:when>
			            <c:otherwise>
							<tbody>
								<tr>
									<td colspan=6 style="text-align:center;"> <span style="font-size:25px;">目前沒有任何收藏喔</span> </td>
								</tr>
							</tbody>
						</c:otherwise>
						</c:choose>
					</table>
				</div>
				<div class="col-md-1"></div>

			</div>
		</main>
	</div>
  
  
  
  
  
  
  <!-- Footer -->
    
  <%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>


  <%@ include file="/WEB-INF/pages/user-js.jsp"%>
	
  	
 
 <script>
	function delcheck(id){
	Swal.fire({
		  title: '確定取消收藏?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '是的!我要取消!',
		  cancelButtonText: '返回'
		}).then((result) => {
		  if (result.isConfirmed) {
			  del(id);
			  Swal.fire({
				  icon: 'success',
				  title: '確定取消收藏',
				  showConfirmButton: false,
				  timer: 1000
				})
		  }
		})
	}
	
	function del(id){
		$.ajax({
			  url: '/taxiFront/booktaxi/cancelcollect/'+id,
			  type: "get",
			  success: function(data){
			  		 $('#datalist').empty();
			  		  for (var i in data){
			  			  $('#datalist').append(
			  					"<tr>"+
								"<td><a href='/taxiFront/search/"+(data[i].id)+"' target='_blank'>"+
								"<img src='${pageContext.request.contextPath}/LocationImg/"+(data[i].photo)+"' onerror='${pageContext.request.contextPath}/images/hospital2.png' width='120px' height='120px' />"+
								"</a></td>"+
								"<td><a href='/taxiFront/search/"+(data[i].id)+"' target='_blank'>"+(data[i].store)+"</a></td>"+
								"<td>"+(data[i].type)+"</td>"+
								"<td>"+(data[i].phone)+"</td>"+
								"<td><a href='"+(data[i].site)+"' target='_blank'>前往網站</a></td>"+
								"<td><input type='image' class='heart' src='/images/heart.png' onclick='delcheck("+(data[i].id)+")'></td>"+
							"</tr>"	  
			  			  )
			  		  }
			  	  }
			})
	}
	
</script>

</body>
</html>