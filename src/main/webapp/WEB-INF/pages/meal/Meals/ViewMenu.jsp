<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,tw.iiihealth.meal.meals.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <% --%>
<!-- // response.setContentType("text/html;charset=UTF-8"); -->
<!-- // response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 -->
<!-- // response.setHeader("Pragma", "no-cache"); // HTTP 1.0 -->
<!-- // response.setDateHeader("Expires", -1); // Prevents caching at the proxy server -->
<%-- %> --%>
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
        
</head>
<body class="sb-nav-fixed">

<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">營養管理系統</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 營養餐資料
						</div>
						<div class="card-body">
							
							<div>
								<input type="button" value="新增一筆資料" onclick="window.location.href='mealCreate.controller'" />
							</div>
							<br/>
							
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>餐點照片</th>
								<th>餐點名稱</th>
								<th>價格</th>
								<th>主原料</th>
								<th>熱量(kcal)</th>
								<th>蛋白質(g)</th>
								<th>碳水化合物(g)</th>
								<th>脂肪(g)</th>
								<th>商店編號</th>
								<th>修改</th>
								<th>刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="meals" items="${queryAll}">
								<tr>
									<td><img src="${pageContext.request.contextPath}/MealImg/${meals.photo}"
												onerror="this.style.display='none'" width="120px"
												height="120px" /></td>
									<td>${meals.name}</td>
									<td>${meals.price}</td>
									<td>${meals.material}</td>
									<td>${meals.calories}</td>
									<td>${meals.protein}</td>
									<td>${meals.carbohydrates}</td>
									<td>${meals.fat}</td>
									<td>${meals.store_ID}</td>
									<td>
										<form action="updateByName.controller" method="post">
											<input type="image" src="/images/update.jpg" />
											<input type="hidden" name="name" value="${meals.name}" /> 
										</form>
									</td>
									<td>
										<form id="delete${meals.ID}" action="deleteConfirm.controller" method="post">
											<input type="hidden" name="selected" value="${meals.ID}">
											<input type="button" class="btn" style="background-image:url(/images/delete.png);background-repeat:no-repeat;" onclick="check(${meals.ID})">
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
</body>
</html>








