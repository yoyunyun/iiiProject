<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>健康優生網</title>
<link href="/css/styles.css" rel="stylesheet" />
<!-- <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" /> -->
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/datatables-simple-demo.js"></script>
        <script src="/js/sweetalert2.all.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body class="sb-nav-fixed">
<jsp:useBean id="u" class="tw.iiihealth.meal.meals.MealBean" scope="session" />
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<!-- Navbar Brand--> <a class="navbar-brand ps-3" href="index.html">控制中心</a>
	<!-- Sidebar Toggle-->
	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
		id="sidebarToggle" href="#!">
		<i class="fas fa-bars"></i>
	</button>
	<!-- Navbar Search-->
	<form
		class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		<div class="input-group">
			<input class="form-control" type="text" placeholder="Search for..."
				aria-label="Search for..." aria-describedby="btnNavbarSearch" />
			<button class="btn btn-primary" id="btnNavbarSearch" type="button">
				<i class="fas fa-search"></i>
			</button>
		</div>
	</form>
	<!-- Navbar-->
	<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
			aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item" href="#!">Settings</a></li>
				<li><a class="dropdown-item" href="#!">Activity Log</a></li>
				<li><hr class="dropdown-divider" /></li>
				<li><a class="dropdown-item" href="/logout">登出</a></li>
			</ul></li>
	</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
					<div class="sb-sidenav-menu-heading">會員中心</div>
					<a class="nav-link" href="/HealthProject/ManagerHealth/searchAllManagerAction.controller">
						<div class="sb-nav-link-icon">
							<i class="fas fa-table"></i>
						</div> 會員系統
					</a>
					<div class="sb-sidenav-menu-heading">長照服務</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseLayouts1" aria-expanded="false"
						aria-controls="collapseLayouts1">
						<div class="sb-nav-link-icon">
							<i class="fas fa-chart-area"></i>
						</div> 叫車系統
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseLayouts1"
						aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav"> <a class="nav-link"
							href="${pageContext.request.contextPath}/taxi/taximainpage.controller">計程車資訊</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/taxi/locmainpage.controller">店家資訊</a> </nav>
					</div>


					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseLayouts" aria-expanded="false"
						aria-controls="collapseLayouts">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> 長照系統
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseLayouts"
						aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav"> <a class="nav-link"
							href="${pageContext.request.contextPath}/helper/list">看護系統</a> <a
							class="nav-link"
							href="${pageContext.request.contextPath}/equip/findall">輔具系統</a> <a
							class="nav-link"
							href="${pageContext.request.contextPath}/order/findall">輔具訂單系統</a> </nav>
					</div>



					<div class="sb-sidenav-menu-heading">營養與藥品管理</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseLayouts3" aria-expanded="false"
						aria-controls="collapseLayouts3">
						<div class="sb-nav-link-icon">
							<i class="fas fa-tachometer-alt"></i>
						</div> 營養管理系統
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseLayouts3"
						aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav"> <a class="nav-link"
							href="${pageContext.request.contextPath}/meals/mealView.controller">營養餐管理</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/diet/dietView.controller">食品資料管理</a> </nav>
					</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseLayouts4" aria-expanded="false"
						aria-controls="collapseLayouts4">
						<div class="sb-nav-link-icon">
							<i class="fas fa-book-open"></i>
						</div> 用藥查詢系統
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseLayouts4"
						aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav"> <a class="nav-link"
							href="${pageContext.request.contextPath}/Drug/findalldrug">藥品辨識系統</a> <a class="nav-link" href="${pageContext.request.contextPath}/DrugProduct/findalldrugproduct">藥品包裝變更</a>

						</nav>
					</div>

				</div>
			</div>
			<div class="sb-sidenav-footer">
				<div class="small">Logged in as:</div>
				Start Bootstrap
			</div>
			</nav>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">營養管理系統</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 修改餐點資料
						</div>
						<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<form action="updateConfirm.controller"	method="post" id="upd" enctype="multipart/form-data">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>欄位名稱</th>
											<th>欄位資料</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>餐點名稱</td>
											<td><jsp:getProperty name="u" property="name" /></td>
										</tr>
										<tr>
											<td>上傳預覽</td>
											<td>
											修改前：<img src="${pageContext.request.contextPath}/MealImg/${u.photo}"
												onerror="this.style.display='none'" width="100px" height="100px" />
											修改後：<img id="sourceImage"  width="100px" height="100px">
											</td>
										</tr>											
										<tr>
											<td>新增照片</td>
											<td><input type="file" name="pic" accept="image/*" id="inputImageFile" /></td>
										</tr>
										<tr>
											<td>價格($NT)</td>
											<td><input type="text" id="price" name="price" value="${u.price}"></td>
										</tr>
										<tr>
											<td>主原料</td>
											<td><input type="text" id="material" name="material" value="${u.material}"></td>
										</tr>
										<tr>
											<td>熱量(kcal)</td>
											<td><input type="text" id="calories" name="calories" value="${u.calories}"></td>
										</tr>
										<tr>
											<td>蛋白質(g)</td>
											<td><input type="text" id="protein"	name="protein" value="${u.protein}"></td>
										</tr>
										<tr>
											<td>碳水化合物(g)</td>
											<td><input type="text" id="carbohydrates" name="carbohydrates" value="${u.carbohydrates}"></td>
										</tr>
										<tr>
											<td>脂肪(g)</td>
											<td><input type="text" id="fat"	name="fat" value="${u.fat}"></td>
										</tr>
										<tr>
											<td>商店編號</td>
											<td>${u.store_ID}</td>
										</tr>
										<tr>
											<td><label></label></td>
											<td>
												<input type="button" name="confirm" value="確認修改" onclick="upd()">
												<input type="button" value="取消修改" onclick="window.location.href='mealView.controller'" />
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
						<div class="col-md-6"></div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<script>
		function upd(){
			Swal.fire({
				  icon: 'success',
				  title: '修改成功',
				  showConfirmButton: false,
				  timer: 1300
				})	
				setTimeout(() => document.getElementById("upd").submit(), 1300)
		}
	</script>
	<script>

		/* 更新圖片 or 上傳圖片 */
	    $("#inputImageFile").change(function(e){
        	processImageFile(e.target.files[0]);
    	});
	    
	    
	    function processImageFile(imageObject) {
	        //顯示分析的圖片
	        var sourceImageUrl = URL.createObjectURL(imageObject);
	        //document.querySelector("#sourceImage").src = sourceImageUrl;
	        $("#sourceImage").attr('src', sourceImageUrl);
	    }
		
	</script>
</body>
</html>