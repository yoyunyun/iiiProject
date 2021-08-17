<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="../css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="../js/function.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous">
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	td{
	max-width: 200px;
	min-width:110px;
	}
</style>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">控制中心</a>
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
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="../Member/PostLoginAP">登出</a></li>
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
                            <a class="nav-link" href="../Member/searchAllHealthAction.controller">  >
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                會員系統
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
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="../taxi/taximainpage.controller">計程車資訊</a>
								<a class="nav-link" href="../taxi/locmainpage.controller">店家資訊</a>
							</nav>
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
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${pageContext.request.contextPath}/helper/list">看護系統</a>
									<a class="nav-link" href="${pageContext.request.contextPath}/equip/list">輔具系統</a> 
									<a class="nav-link" href="${pageContext.request.contextPath}/order/list">輔具訂單系統</a>
                                </nav>
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
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link"  href="../meals/mealView.controller">營養餐管理</a> 
								<a class="nav-link"  href="../diet/dietView.controller">食品資料管理</a>

							</nav>
						</div>
						<a class="nav-link collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts4" aria-expanded="false"
							aria-controls="collapseLayouts4">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 用藥查詢系統
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="../Drugs/Drugs">藥品辨識系統</a> 
									<a class="nav-link" href="../Drugs/DrugsProduct">藥品包裝變更</a>
                          
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
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 計程車資訊
						</div>
						<div class="row">

							<div class="col-md-9">
							<h2 style="margin: 8px 100px">請填寫註冊資料</h2>
								<div class="card-body">
								<form:form id="newTX" action="addcheck.controller"
									method="post" modelAttribute="addtaxi">
									
									<table class="table  table-hover">
									<tr>
										<td><form:label path="tname">服務提供單位:</form:label></td> 
										<td><form:input path="tname" onblur="Onblur(this,sp1)" autofocus="autofocus"/></td> 
										<td><span id="idsp1"></span></td>
									</tr>
									<tr>								
										<td><form:label path="phone">聯絡電話:</form:label></td>
												<td><form:input path="phone" onblur="Onblur(this,sp2)"/></td>
												<td><span id="idsp2"></span></td>
									</tr>
									<tr>
												<td><form:label path="address">地址:</form:label></td>
												<td><form:input path="address" onblur="Onblur(this,sp3)"/></td>
												<td><span id="idsp3"></span></td>
											</tr>
										<tr>
											<td><form:label path="serCity">服務縣市:</form:label></td>																				
											<td><div id="result"></div></td>
											
											<td><span id="idsp4"></span></td>
										</tr>




										<tr>
										<td><form:label path="careTaxi">是否為長照專車:</form:label></td>
										<td><form:radiobutton path="careTaxi" value="Yes" label="是" /> 
											<form:radiobutton path="careTaxi" value="No" label="否" /></td>
										<td><span id="idsp5"></span><td>
									</tr>

				
									<tr>
										<td style="text-align: center"><input type="button" onclick="CheckandSub()" value="送出" ></td>
										<td><a href="../taxi/taximainpage.controller">取消</a></td>
									</tr>
									</table>
								</form:form>
							</div>
							<div class="col-md-6"></div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			crossorigin="anonymous"></script>
		<script src="../js/scripts.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
			crossorigin="anonymous"></script>
		<script src="../js/datatables-simple-demo.js"></script>
		<script type="text/javascript">
// 	$(document).ready(function() {
// 	$.getJSON('/json/taiwan_districts.json',function(data) {
// 	var resultText = '';
// 	for (var i = 0; i < data.length; i++) {
// 	resultText += "<label><input type='checkbox' name='serCity' value='"+data[i].name+"'/>"+ data[i].name+"</label>"
// 	}
// 	$("#result").html(resultText);
// 	});
// });
	$(document).ready(function() {
		$.getJSON('/json/taiwan_districts.json',function(data) {
		var resultText = '';
		
		let cityName= "${newTaxiC.serCity}";
		for (var i = 0; i < data.length; i++) {
			
			if((cityName.indexOf(data[i].name))>=0){
				resultText += "<label><input type='checkbox' name='serCity' value='"+data[i].name+"' checked/>"+ data[i].name+"</label>"						
			}else{
				resultText += "<label><input type='checkbox' name='serCity' value='"+data[i].name+"'/>"+ data[i].name+"</label>"
			}
			
		}
		$("#result").html(resultText);
		
		});
	});
</script>
		<script>
			let sp1 = document.getElementById("idsp1");
			let sp2 = document.getElementById("idsp2");
			let sp3 = document.getElementById("idsp3");
			let cityN = document.getElementsByName("serCity");
			let careTX = document.getElementsByName("careTaxi");

			function CheckandSub() {
				let flag1 = Onblur(document.getElementById("tname"), sp1);
				let flag2 = phoneCheck(document.getElementById("phone"), sp2);
				let flag3 = addressCheck(document.getElementById("address"),
						sp3);
				// 		let flag4= checkckbox(cityN,idsp4);
				let flag5 = checkradio(careTX, idsp5);

				if (flag1 & flag2 & flag3 & flag5) {
					document.getElementById("newTX").submit();
				} else {
					alert("請輸入完整資訊");
				}

			}
		</script>
</body>
</html>