<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>健康優生網</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="../css/styles.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	
	
	<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>
		
		
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">用藥查詢系統</h1>

					<div class="card mb-4">
						<div class="card-header">
							<h2 style="text-align: center">新增藥品資料</h2>
							<form:form method="post" action="save" modelAttribute="Drug" id="submit">
								<table class="table  table-hover">
									<tr>
										<td><form:label path="id">藥品編號:</form:label></td>
										<td><form:input path="id" /></td> 
									</tr>
									<tr>
										<td><form:label path="cnumber">許可證字號:</form:label></td>
										<td><form:input path="cnumber" /></td>
									</tr>
									<tr>
										<td><form:label path="chinesename">中文藥名:</form:label></td>
										<td><form:input path="chinesename" /></td>
									</tr>
									<tr>
										<td><form:label path="englishname">英文藥名:</form:label></td>
										<td><form:input path="englishname" /></td>
									</tr>
									<tr>
										<td><form:label path="applicant">申請商:</form:label></td>
										<td><form:input path="applicant" /></td>
									</tr>
									<tr>
										<td><form:label path="shape">形狀:</form:label></td>
										<td><form:input path="shape" /></td>
									</tr>
									<tr>
										<td><form:label path="color">顏色:</form:label></td>
										<td><form:input path="color" /></td>
									</tr>
									<tr>
										<td><form:label path="appearance">外觀:</form:label></td>
										<td><form:input path="appearance" /></td>
									</tr>
									<tr>
										<td><input type="submit" value="送出" class="save"
														id="update" /></td>
										<td><input type="button" class="btn"
											onclick="history.back()" value="取消新增"></td>
									</tr>
								</table>
							</form:form>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="../js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="../js/datatables-simple-demo.js"></script>
			<!--  sweet alert -->
	<script src="/js/sweetalert2.all.min.js"></script>
	
	<!--  jQuery -->
	 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		
		<script>
		var submit = document.getElementById("submit")

		submit.onsubmit = function() {
			return false;
		}

		document.getElementById("update").onclick = function() {

			setTimeout(function() {
				submit.submit();
			}, 1400);

			Swal.fire({
				position : 'top',
				icon : 'success',
				title : '資料已更新',
				showConfirmButton : false,
				timer : 1500
			})
		}
		</script>
</body>
</html>
