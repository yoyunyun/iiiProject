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

<%@ include file="/WEB-INF/pages/css.jsp"%>

</head>
<body class="sb-nav-fixed">

<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">食品管理系統</h1>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 新增食品資料
						</div>
						<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<form action="addDiet.controller"	method="post" id="add">
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
											<td><input type="text" id="name" name="name" required> <span id="ndsp"></span></td>
										</tr>
										<tr>
											<td>食品分類</td>
											<td><input type="text" id="type" name="type" required></td>
										</tr>
										<tr>
											<td>熱量(kcal)</td>
											<td><input type="text" id="calories" name="calories"></td>
										</tr>
										<tr>
											<td>蛋白質(g)</td>
											<td><input type="text" id="protein" name="protein"></td>
										</tr>
										<tr>
											<td>碳水化合物(g)</td>
											<td><input type="text" id="carbohydrates" name="carbohydrates"></td>
										</tr>
										<tr>
											<td>脂肪(g)</td>
											<td><input type="text" id="fat"	name="fat"></td>
										</tr>
										<tr>
											<td>糖(h)</td>
											<td><input type="text" id="sugar" name="sugar"></td>
										</tr>
										<tr>
											<td>鈉(mg)</td>
											<td><input type="text" id="na" name="na"></td>
										</tr>
										<tr>
											<td><label></label></td>
											<td>
											<input type="button" name="confirm" value="送出" onclick="add()">
											<input type="button" value="取消" onclick="window.location.href='dietView.controller'" />
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
		//姓名
		document.getElementById("name").onblur = checkName;
		function checkName() {
			let theNameObj = document.getElementById("name");
			let theNameObjVal = theNameObj.value;
			let sp = document.getElementById("ndsp");
			let theNameObjValLen = theNameObjVal.length;
			let flag = false;
			if (theNameObjVal == "")
				sp.innerHTML = "<img src='../images/error.png'> 必填";
			else if (theNameObjValLen >= 2) {
				for (let i = 0; i < theNameObjValLen; i++) {
					let ch = theNameObjVal.charAt(i)
					let reg = /^[\u4E00-\u9FA5]+$/;
					if (reg.test(ch)) {
						flag = true;
						console.log(ch)
					} else {
						flag = false;
						break;
					}
				}
				if (flag) {
					sp.innerHTML = "<img src='../images/ok.png'> 格式正確!";
				} else {
					sp.innerHTML = "<img src='../images/error.png'> 請輸入2個字(含)以上之中文字!"
				}
			} else {
				sp.innerHTML = "<img src='../images/error.png'> 請輸入2個字(含)以上之中文字!";
			}
		}
	</script>
		<script>
		function add(){
			Swal.fire({
				  icon: 'success',
				  title: '新增成功',
				  showConfirmButton: false,
				  timer: 1300
				})	
				setTimeout(() => document.getElementById("add").submit(), 1300)
		}
	</script>
</body>
</html>