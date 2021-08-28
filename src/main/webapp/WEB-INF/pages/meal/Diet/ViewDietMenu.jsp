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

<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>
  
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








