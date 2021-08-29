<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<i class="fas fa-table me-1"></i> 計程車資訊
						<button style="text-align=right" onclick="document.querySelector('#sub').submit()">新增</button>
					</div>
						<div class="card-body">
							<form id="sub" action="add.controller" method="get">
								<input type="hidden" name="newTaxi">
							</form>
							<table id="datatablesSimple">
								<thead>

									<tr>
										<th>編號</th>
										<th>服務提供單位</th>
										<th>連絡電話</th>
										<th>地址</th>
										<th>服務縣市</th>
										<th>是否為長照專車</th>
										<th>修改</th>
										<th>刪除</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="taxi" items="${listTaxi}">
										<tr>
											<td>${taxi.id}</td>
											<td>${taxi.tname}</td>
											<td>${taxi.phone}</td>
											<td>${taxi.address}</td>
											<td>${taxi.serCity}</td>
											<td>${taxi.careTaxi}</td>
											<td>
												<form action="updateold2.controller" method="post">
													<input type="hidden" name="id" value="${taxi.id}">
													<input type="image" name="update" src="/images/update.jpg" />
												</form>
											</td>
											<td>

												<form id="delT${taxi.id}" action="delete" method="post">
													<input type="hidden" name="delete"> 
													<input type="button" class="btn" style="background-image:url(/images/delete.png);background-repeat:no-repeat;" onclick="check(${taxi.id})">
													<input type="hidden" name="selected" value="${taxi.id}">
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