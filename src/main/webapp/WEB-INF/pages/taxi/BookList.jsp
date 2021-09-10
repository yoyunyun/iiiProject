<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
<title>健康優生網</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>

<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>


</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">


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
	<div class="slide-item overlay"
		style="background-image: url('${pageContext.request.contextPath}/images/slider-2.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 align-self-center">
					<h1 class="heading mb-3">健康悠生伴你一生</h1>
					<p class="lead text-white mb-5">健康一生 悠活一生</p>
					<p>
						<a href="about.html" class="btn btn-primary">關於我們</a>
					</p>
				</div>
			</div>
		</div>
	</div>



	<div id="layoutSidenav_content">
		<main>
			<div class="card-header" style="margin-bottom: 60px;">
				<i class="fas fa-table me-1"></i> 會員系統
			</div>


			<!-- 第一列 -->
			<div class=row style="margin-bottom: 18px">
				<div class="col-md-2"></div>
				<div class="col-md-9" style="margin: 0 auto;">
					<h3 style="text-align: center;">預約叫車訂單</h3>
				</div>
				<div class="col-md-1"></div>

			</div>


			<!-- 第二列 -->
			<div class="row" style="margin-bottom: 100px">

				<div class="col-md-2">
					<!-- 會員資料索引 -->
					<div class="sort btn-group-vertical">
						<span class="btn btn-dark btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							class="btn btn-outline-secondary btn-lg">會員資料索引</span> <a
							class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="/Member/updateMember">修改個人資料</a> <a
							class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="/Member/updateMemberAP">修改密碼</a> <a
							class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="#">健康資料表</a> <a class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="${pageContext.request.contextPath}/cart/order">會員訂單</a> <a
							class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="${pageContext.request.contextPath}/cart/showcollect">會員收藏</a>
						<a class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="#">加甚麼看你</a>
					</div>
				</div>

				<div class="col-md-9" style="margin: 0 auto;">



					<table class="table table-hover">
						<thead style="background-color: #F5F5F5">
							<tr>
								<th>訂單編號</th>
								<th>預約叫車單位</th>
								<th>預約地點</th>
								<th>預約日期</th>
								<th>預約時間</th>
								<th>乘客姓名</th>
								<th>您留下的聯絡電話</th>
								<th>您填寫的信箱</th>
								<th>修改</th>
								<th>刪除</th>
							</tr>
						</thead>

						<c:choose>
							<c:when test="${not empty Blist}">
								<c:forEach var="booking" items="${Blist}">
									<tbody>
										<tr>
											<td>${booking.book_id}</td>
											<td>${booking.tname}</td>
											<td>${booking.address}</td>
											<td>${booking.date}</td>
											<td>${booking.hour}:${booking.min}</td>
											<td>${booking.passenger}</td>
											<td>${booking.phone}</td>
											<td>${booking.mail}</td>
											<td>
												<form action="updateold2.controller" method="post">
													<input type="hidden" name="id" value="${taxi.id}">
													<input type="image" name="update" src="/images/update.jpg" />
												</form>
											</td>
											<td>

												<form id="delT${taxi.id}" action="delete" method="post">
													<input type="hidden" name="delete"> <input
														type="button" class="btn"
														style="background-image: url(/images/delete.png); background-repeat: no-repeat;"
														onclick="check(${taxi.id})"> <input type="hidden"
														name="selected" value="${taxi.id}">
												</form>
											</td>
<!-- 											<td><input type="image" src="/images/delete.png" -->
<%-- 												id="${booking.book_id}" class="delete"></td> --%>
										</tr>
									</tbody>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tbody>
									<tr>
										<td colspan=7 style="text-align: center;"><span
											style="font-size: 25px;">目前沒有任何訂單喔</span></td>
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
	function check(id){
	Swal.fire({
		  title: '確定刪除?',
		  text: "刪除後將無法復原!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '是的!我要刪除!',
		  cancelButtonText: '取消刪除'
		}).then((result) => {
		  if (result.isConfirmed) {
			  Swal.fire({
				  icon: 'success',
				  title: '刪除成功',
				  showConfirmButton: false,
				  timer: 1000
				})	
				setTimeout(() => document.getElementById("delT"+id).submit(), 1000)
		  }
		})
	}
	
</script>
</body>
</html>