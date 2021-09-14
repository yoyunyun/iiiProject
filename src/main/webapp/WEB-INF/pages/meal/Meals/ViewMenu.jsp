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
					<h1 class="mt-4" style="margin:50px 0">營養管理系統</h1>
						<div style="margin:0 0 100px 100px;display: inline-block">
							<img src="../images/meal01.png" width="420px">
						</div>
						<div style="width:600px;display: inline-block ;float:left" >
							<canvas id="myChart" height="200"></canvas>
						</div>
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
	<script>
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
	  type: 'bar', //圖表類型
	  data: {
	    //標題
	    labels: ['牛肉類', '雞肉類', '豬肉類', '羊肉類', '海鮮類', '其他'],
	    datasets: [{
	      label: '# 營養餐類型', //標籤
	      data: [3, 7, 2, 1, 1, 3], //資料
	      //圖表背景色
	      backgroundColor: [
	        'rgba(255, 99, 132, 0.2)',
	        'rgba(54, 162, 235, 0.2)',
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)',
	        'rgba(153, 102, 255, 0.2)',
	        'rgba(255, 159, 64, 0.2)'
	      ],
	      //圖表外框線色
	      borderColor: [
	        'rgba(255, 99, 132, 1)',
	        'rgba(54, 162, 235, 1)',
	        'rgba(255, 206, 86, 1)',
	        'rgba(75, 192, 192, 1)',
	        'rgba(153, 102, 255, 1)',
	        'rgba(255, 159, 64, 1)'
	      ],
	      //外框線寬度
	      borderWidth: 1
	    }]
	  },
	  options: {
	    scales: {
	      yAxes: [{
	        ticks: {
	          beginAtZero: true,
	          responsive: true //符合響應式
	        }
	      }]
	    }
	  }
	});
	</script>
</body>
</html>








