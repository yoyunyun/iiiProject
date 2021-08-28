<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<%@ include file="/WEB-INF/pages/css.jsp"%>
</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>
	
		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 店家資訊
						<button class="btn"
										onclick="document.querySelector('#sub').submit()">新增</button>
					</div>
					<div class="card-body">

						<form id="sub" action="addloc.controller" method="get">
							
						</form>

						<table id="datatablesSimple">

							<thead>
								<tr>
									<th>編號</th>
									<th>店家名稱</th>
									<th>類別</th>
									<th>醫療類別</th>
									<th>電話</th>
									<th>營業時間</th>
									<th>店休日</th>
									<th>縣市</th>
									<th>鄉鎮市區</th>
									<th>地址</th>
									<th>簡介</th>
									<th>網站</th>
									<th>修改</th>
									<th>刪除</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="loc" items="${listLoc}">
									<tr>

										<td>${loc.id}</td>
										<td>${loc.store}</td>
										<td>${loc.type}</td>
										<td>${loc.hos_type}</td>
										<td>${loc.phone}</td>
										<td>${loc.time}</td>
										<td>${loc.close_day}</td>
										<td>${loc.city}</td>
										<td>${loc.town}</td>
										<td>${loc.address}</td>
										<td>${loc.brief}</td>
										<td>${loc.site}</td>
										<td>
											<form action="updateold.controller" method="post">
												<input type="hidden" name="id" value="${loc.id}"> 
<!-- 												<input type="submit" class="btn" name="update" value="修改"> -->
												<input type="image" name="update" src="/images/update.jpg" />
											</form>
										</td>
										<td>
											<form id="delT${loc.id}" action="deleteloc" method="post">
												<input type="button" class="btn" style="background-image:url(/images/delete.png);background-repeat:no-repeat;" onclick="check(${loc.id})">
												<input type="hidden" name="selected" value="${loc.id}">
											</form>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</main>
		
		</div>
		<!--   <div style="text-align:right; margin-right:200px; margin-top:20px"> -->
		<!-- 	<button class="btn" onclick="location.href='../login.html'">返回登入首頁</button> -->
		<!-- 	</div> -->
		
		<script>
	function check(id){
	Swal.fire({
		  title: '確定刪除?',
		  text: "刪除後將無法復原!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '是的!我要刪除!',
		  cancelButtonText: '取消刪除'
		}).then((result) => {
			if (result.isConfirmed) {
				  Swal.fire({
					  icon: 'success',
					  title: '刪除成功',
					  showConfirmButton: false,
					  timer: 1000
					})	
					setTimeout(() => document.getElementById("delT"+id).submit(), 1000)
			  }
		})
	}
	</script>
</body>
</html>