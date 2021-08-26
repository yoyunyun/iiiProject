<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,tw.iiihealth.meal.diet.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
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
</head>
<body class="sb-nav-fixed">
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
					<h1 class="mt-4">食品管理系統</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 食品資料庫
						</div>
						<div class="card-body">
							
							<div>
								<input type="button" value="新增一筆資料" onclick="window.location.href='dietCreate.controller'" />
								<input type="button" value="查詢分類資料" onclick="window.location.href='dietViewIndex.controller'" />
							</div>
							<br/>
							
							
					<table id="datatablesSimple">
						<thead>
							<tr>
						        <th>食品名稱</th>
						        <th>食品分類</th>
						        <th>熱量(kcal)</th>
						        <th>蛋白質</th>
						        <th>碳水化合物(g)</th>
						        <th>脂肪(g)</th>
						        <th>糖(g)</th>
						        <th>鈉(mg)</th>
								<th>修改</th>
								<th>刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="diet" items="${queryAll}">
								<tr>
									<td>${diet.name}</td>
									<td>${diet.type}</td>
									<td>${diet.calories}</td>
									<td>${diet.protein}</td>
									<td>${diet.carbohydrates}</td>
									<td>${diet.fat}</td>
									<td>${diet.sugar}</td>
									<td>${diet.na}</td>
									<td>
										<form action="updateDietByName.controller" method="post">
											<input type="image" src="/images/update.jpg" />
											<input type="hidden" name="name" value="${diet.name}" /> 
										</form>
									</td>
									<td>
										<form id="delete${diet.ID}" action="deleteDietConfirm.controller" method="post">
											<input type="hidden" name="selected" value="${diet.ID}">
											<input type="button" class="btn" style="background-image:url(/images/delete.png);background-repeat:no-repeat;" onclick="check(${diet.ID})">
										</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
		</div>
				<script>
					function check(id){
						Swal.fire({
							  title: '確定刪除?',
							  text: "資料將無法復原!",
							  icon: 'warning',
							  showCancelButton: true,
							  confirmButtonColor: '#3085d6',
							  cancelButtonColor: '#d33',
							  confirmButtonText: '刪除',
							  cancelButtonText: '取消'
							}).then((result) => {
								  if (result.isConfirmed) {
									  Swal.fire({
										  icon: 'success',
										  title: '刪除成功',
										  showConfirmButton: false,
										  timer: 1300
										})	
										setTimeout(() => document.getElementById("delete"+id).submit(), 1300)
								  }
							})
					}
	</script>




<!-- <table> -->
<!-- <thead> -->
<!--     <tr> -->
<!--         <th>食品名稱</th> -->
<!--         <th>食品分類</th> -->
<!--         <th>熱量(kcal)</th> -->
<!--         <th>蛋白質</th> -->
<!--         <th>碳水化合物(g)</th> -->
<!--         <th>脂肪(g)</th> -->
<!--         <th>糖(g)</th> -->
<!--         <th>鈉(mg)</th> -->
<!--     </tr> -->
<!-- </thead> -->
<!-- <tbody> -->
<%-- <%   --%>
<!-- // List<DietBean> DB = (List<DietBean>) session.getAttribute("queryAll"); -->
<!-- // for (DietBean item : DB) { -->
<%-- %> --%>
<!--     <tr> -->
<%--         <td><%=item.getName() %></td> --%>
<%--         <td><%=item.getType() %></td> --%>
<%--         <td><%=item.getCalories() %></td> --%>
<%--         <td><%=item.getProtein() %></td> --%>
<%--         <td><%=item.getCarbohydrates() %></td> --%>
<%--         <td><%=item.getFat() %></td> --%>
<%--         <td><%=item.getSugar() %></td> --%>
<%--         <td><%=item.getNa() %></td> --%>
<!--     </tr> -->
<%-- <% --%>
<!-- // } -->
<!-- // session.invalidate(); -->
<%-- %> --%>
<!-- </tbody> -->
<!-- </table> -->
<!-- </fieldset> -->


<!-- </form> -->

<!-- 			</div> -->
<!-- 			</main> -->
<!-- 		</div> -->


</body>
</html>








