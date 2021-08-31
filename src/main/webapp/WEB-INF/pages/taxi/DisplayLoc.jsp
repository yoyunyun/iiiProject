<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>健康優生網</title>
<%@ include file="/WEB-INF/pages/css.jsp"%>
<style>
td{
	padding:10px 20px;
	border-bottom: 1px solid #D0D0D0;
	}
</style>
	

</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>
		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 店家資訊
						</div>
						<div class="row">
							<div class="col-md-6">
								<h4 style="margin: 10px 20px; text-align: center">登記資料如下請確認</h4>
								<div class="card-body">

									<form action="addloc" method="post" enctype="multipart/form-data" id="okk">
										<table style="margin: 10px auto">
											<tr>
												<td>店家照片</td>
												<td>${locCheck.photo}</td>
												<td><input type="hidden" name="photo"
													value="${locCheck.photo}"></td>
											</tr>
											<tr>
												<td>店家名稱</td>
												<td>${locCheck.store}</td>
												<td><input type="hidden" name="store"
													value="${locCheck.store}"></td>
											</tr>
											<tr>
												<td>類別</td>
												<td>${locCheck.type}</td>
												<td><input type="hidden" name="type"
													value="${locCheck.type}"></td>
											</tr>
											
											<tr>
												<td>電話</td>
												<td>${locCheck.phone}</td>
												<td><input type="hidden" name="phone"
													value="${locCheck.phone}"></td>
											</tr>
											<tr>
												<td>營業時間</td>
												<td>${locCheck.time}</td>
												<td><input type="hidden" name="time"
													value="${locCheck.time}"></td>
											</tr>
											<tr>
												<td>店休日</td>
												<td>${locCheck.close_day}</td>
												<td><input type="hidden" name="close_day"
													value="${locCheck.close_day}"></td>
											</tr>
											<tr>
												<td>縣市</td>
												<td>${locCheck.city}</td>
												<td><input type="hidden" name="city"
													value="${locCheck.city}"></td>
											</tr>
											<tr>
												<td>鄉鎮市區</td>
												<td>${locCheck.town}</td>
												<td><input type="hidden" name="town"
													value="${locCheck.town}"></td>
											</tr>
											<tr>
												<td>地址</td>
												<td>${locCheck.address}</td>
												<td><input type="hidden" name="address"
													value="${locCheck.address}"></td>
											</tr>
											<tr>
												<td>簡介</td>
												<td>${locCheck.brief}</td>
												<td><input type="hidden" name="brief"
													value="${locCheck.brief}"></td>
											</tr>
											<tr>
												<td>網站</td>
												<td>${locCheck.site}</td>
												<td><input type="hidden" name="site"
													value="${locCheck.site}"></td>
											</tr>
											<tr>
												<td>位置</td>
												<td>${locCheck.map}</td>
												<td><input type="hidden" name="map"
													value="${locCheck.map}"></td>
											</tr>
										</table>
										<div class="sub" style="text-align: center">
											<input type="button" name="confirm" value="確認" style="margin:10px 25px" onclick="okk()">
											<input type="button" onclick="document.querySelector('#back').submit()" value="回上頁" style="margin:10px 25px">
										</div>
									</form>
									<form id="back" action="addback" method="post">
										<input type="hidden" name="photo" value="${locCheck.photo}">
										<input type="hidden" name="store" value="${locCheck.store}">
										<input type="hidden" name="type" value="${locCheck.type}">
										<input type="hidden" name="phone" value="${locCheck.phone}">
										<input type="hidden" name="time" value="${locCheck.time}">
										<input type="hidden" name="close_day" value="${locCheck.close_day}">
										<input type="hidden" name="city" value="${locCheck.city}">
										<input type="hidden" name="town" value="${locCheck.town}">
										<input type="hidden" name="address" value="${locCheck.address}">
										<input type="hidden" name="brief" value="${locCheck.brief}">
										<input type="hidden" name="site" value="${locCheck.site}">
										<input type="hidden" name="map" value="${locCheck.map}">
									
									</form>
								</div>
							</div>
							<div class="col-md-6"></div>
						</div>
					</div>
			</main>
		</div>
		
		<script src="../js/sweetalert2.all.min.js"></script>
		<script>
	function okk(){
		Swal.fire({
			  icon: 'success',
			  title: '新增成功',
			  showConfirmButton: false,
			  timer: 1500
			})	
			setTimeout(() => document.getElementById("okk").submit(), 1600)
	}
	</script>
</body>

</html>