<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%@ include file="/WEB-INF/pages/css.jsp"%>

</head>
<body class="sb-nav-fixed">
<jsp:useBean id="u" class="tw.iiihealth.meal.diet.DietBean" scope="session" />

<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>
  
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">食品管理系統</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 修改食品資料
						</div>
						<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<form action="updateDietConfirm.controller"	method="post" id="upd">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>欄位名稱</th>
											<th>欄位資料</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>食品名稱</td>
											<td><jsp:getProperty name="u" property="name" /></td>
										</tr>
										<tr>
											<td>食品分類</td>
											<td>${u.type}</td>
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
											<td>糖(g)</td>
											<td><input type="text" id="sugar" name="sugar" value="${u.sugar}"></td>
										</tr>
										<tr>
											<td>鈉(mg)</td>
											<td><input type="text" id="na" name="na" value="${u.na}"></td>
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
</body>
</html>