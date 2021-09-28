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
<title>健康悠生網</title>
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
		<div id="layoutSidenav_content" style="margin:1px">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 計程車資訊
						</div>
						<div class="row">
							
							<div class="col-md-6">
								<h4 style="margin: 10px 20px; text-align: center">登記資料如下請確認</h4>
								<div class="card-body">
									
									<form action="add" method="post" id="okk">
										<table style="margin: 10px auto">
										
											<tr>
												<td>服務提供單位</td>
												<td>${newTaxiC.tname}</td>
												<td><input type="hidden" name="tname"
													value="${newTaxiC.tname}"></td>
											</tr>
											<tr>
												<td>連絡電話</td>
												<td>${newTaxiC.phone}</td>
												<td><input type="hidden" name="phone"
													value="${newTaxiC.phone}"></td>
											</tr>
											<tr>
												<td>地址</td>
												<td>${newTaxiC.address}</td>
												<td><input type="hidden" name="address"
													value="${newTaxiC.address}"></td>
											</tr>
											<tr>
												<td>服務縣市</td>
												<td>${newTaxiC.serCity}</td>
												<td><input type="hidden" name="serCity"
													value="${newTaxiC.serCity}"></td>
											</tr>
											<tr>
												<td>是否為長照專車</td>
												<td>${newTaxiC.careTaxi}</td>
												<td><input type="hidden" name="careTaxi"
													value="${newTaxiC.careTaxi}"></td>
											</tr>
										</table>
										<div class="sub" style="text-align: center">
											<input type="button" name="confirm" class="btn" value="確認" onclick="okk()">
											<input type="button" onclick="document.querySelector('#back').submit()" value="回上頁" style="margin:0 auto">
										</div>
									</form>
									
											<form id="back" action="addback.controller" method="post">
											<input type="hidden" name="tname" value="${newTaxiC.tname}">
											<input type="hidden" name="phone" value="${newTaxiC.phone}">
											<input type="hidden" name="address" value="${newTaxiC.address}">
											<input type="hidden" name="serCity" value="${newTaxiC.serCity}">
											<input type="hidden" name="careTaxi" value="${newTaxiC.careTaxi}">
											</form>
											
								</div>
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