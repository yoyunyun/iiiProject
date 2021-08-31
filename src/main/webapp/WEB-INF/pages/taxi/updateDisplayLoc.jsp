<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	padding:10px;
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
								<form:form id="okk" method="POST" action="addloc" modelAttribute="updatelocation">

									<table style="margin: 10px auto">
										<tbody>
											<tr>
												<td><form:label path="id">編號:</form:label></td>
												<td>${updatelocation.id}</td>
												<td><form:hidden path="id" /></td>
											</tr>
											<tr>
												<td><form:label path="photo">店家照片:</form:label></td>
												<td>${updatelocation.photo}</td>
												<td><form:hidden path="photo" /></td>
											</tr>
											<tr>
												<td><form:label path="store">店家名稱</form:label></td>
												<td>${updatelocation.store}</td>
												<td><form:hidden path="store" /></td>
											</tr>
											<tr>
												<td><form:label path="type">類別</form:label></td>
												<td>${updatelocation.type}</td>
												<td><form:hidden path="type" /></td>

											</tr>
											
											<tr>
												<td>電話</td>
												<td>${updatelocation.phone}</td>
												<td><form:hidden path="phone" /></td>
											</tr>
											<tr>
												<td>營業時間</td>
												<td>${updatelocation.time}</td>
												<td><form:hidden path="time" /></td>
											</tr>
											<tr>
												<td>店休日</td>
												<td>${updatelocation.close_day}</td>
												<td><form:hidden path="close_day" /></td>
											</tr>
											<tr>
												<td>縣市</td>
												<td>${updatelocation.city}</td>
												<td><form:hidden path="city" /></td>
											</tr>
											<tr>
												<td>鄉鎮市區</td>
												<td>${updatelocation.town}</td>
												<td><form:hidden path="town" /></td>
											</tr>
											<tr>
												<td>地址</td>
												<td>${updatelocation.address}</td>
												<td><form:hidden path="address" /></td>
											</tr>
											<tr>
												<td>簡介</td>
												<td>${updatelocation.brief}</td>
												<td><form:hidden path="brief" /></td>
											</tr>
											<tr>
												<td>網站</td>
												<td>${updatelocation.site}</td>
												<td><form:hidden path="site" /></td>
											</tr>
											<tr>
												<td>位置</td>
												<td>${locCheck.map}</td>
												<td><form:hidden path="map" /></td>
											</tr>
										</tbody>
									</table>
									<div class="sub" style="text-align: center">
										<input type="button" name="updateLoc" value="更新" style="margin:10px 25px" onclick="okk()">
										<input type="button" onclick="document.querySelector('#back').submit()" value="回上頁" style="margin:0 auto">
									</div>
								</form:form>
								<form:form id="back" method="POST" action="updatebackloc.controller" modelAttribute="updatelocation">
								<form:hidden path="id" />
								<form:hidden path="photo" />
								<form:hidden path="store" />
								<form:hidden path="type" />
								<form:hidden path="phone" />
								<form:hidden path="time" />
								<form:hidden path="close_day" />
								<form:hidden path="city" />
								<form:hidden path="town" />
								<form:hidden path="address" />
								<form:hidden path="brief" />
								<form:hidden path="site" />
								<form:hidden path="map" />
								</form:form>
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
			  title: '更新成功',
			  showConfirmButton: false,
			  timer: 1500
			})	
			setTimeout(() => document.getElementById("okk").submit(), 1600)
	}
	</script>
</body>

</html>