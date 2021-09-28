<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

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
								<h4 style="margin: 10px 20px; text-align: center">更新資料如下請確認</h4>
								<form id="okk" action="add" method="post">
									<table style="margin: 10px auto">
										<tr>
											<td>編號</td>
											<td>${updateTaxiC.id}</td>
											<td><input type="hidden" name="id"
												value="${updateTaxiC.id}"></td>
										</tr>
										<tr>
											<td>服務提供單位</td>
											<td>${updateTaxiC.tname}</td>
											<td><input type="hidden" name="tname"
												value="${updateTaxiC.tname}"></td>
										</tr>
										<tr>
											<td>連絡電話</td>
											<td>${updateTaxiC.phone}</td>
											<td><input type="hidden" name="phone"
												value="${updateTaxiC.phone}"></td>
										</tr>
										<tr>
											<td>地址</td>
											<td>${updateTaxiC.address}</td>
											<td><input type="hidden" name="address"
												value="${updateTaxiC.address}"></td>
										</tr>
										<tr>
											<td>服務縣市</td>
											<td>${updateTaxiC.serCity}</td>
											<td><input type="hidden" name="serCity"
												value="${updateTaxiC.serCity}"></td>
										</tr>
										<tr>
											<td>是否為長照專車</td>
											<td>${updateTaxiC.careTaxi}</td>
											<td><input type="hidden" name="careTaxi"
												value="${updateTaxiC.careTaxi}"></td>
										</tr>
									</table>
									<div class="sub" style="text-align: center">
										<input type="button" name="confirm" class="btn" value="更新" onclick="okk()">
										<input type="button" onclick="document.querySelector('#back').submit()" value="回上頁" style="margin:0 auto">
									</div>
								</form>
								
											<form id="back" action="updateback.controller" method="post">
											<input type="hidden" name="id" value="${updateTaxiC.id}">
											<input type="hidden" name="tname" value="${updateTaxiC.tname}">
											<input type="hidden" name="phone" value="${updateTaxiC.phone}">
											<input type="hidden" name="address" value="${updateTaxiC.address}">
											<input type="hidden" name="serCity" value="${updateTaxiC.serCity}">
											<input type="hidden" name="careTaxi" value="${updateTaxiC.careTaxi}">
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
			  title: '更新成功',
			  showConfirmButton: false,
			  timer: 1500
			})	
			setTimeout(() => document.getElementById("okk").submit(), 1600)
	}
	</script>		
</body>
</html>