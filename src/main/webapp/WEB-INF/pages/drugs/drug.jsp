<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>健康悠生網</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="../css/styles.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	
	
	<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>
		
		
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">藥物查詢系統</h1>
					<div class="row">
					   <div class="col-lg-6">
                             <div class="card mb-4">
                                   <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                       	 藥品新增數量
                                    </div>
                                    <div class="card-body"><canvas id="chart-area" width="100%" height="50"></canvas></div>
                              </div>
                      </div>
                      
                      <div class="col-lg-6">
                            <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                每月單筆查詢次數
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="50"></canvas></div>
                        </div>
                      </div>
					</div>
					<div class="card mb-4">
						<div class="card-header">

							<i class="fas fa-table me-1"></i> 藥物清單
						</div>
						<div class="card-body">
						<div>
						<form:form action="showFormForAdd" method="post">
								<input type="submit" value="新增藥品" />
						</form:form>
						<br/>
							</div>
							<c:if test="${!empty list}">
								<table id="datatablesSimple">
								<thead>
								        <tr> 
											<td>編號</td>
											<td>許可證字號</td>
											<td>中文藥名</td>
											<td>英文藥名</td>
											<td>申請商</td>
											<td>形狀</td>
											<td>顏色</td>
											<td>外型</td>
											<td>修改</td>
											<td>刪除</td>
										</tr>
								</thead>
								<c:forEach items="${list}" var="Drug">
										    <tr>
												<td>${Drug.id}</td>
												<td>${Drug.cnumber}</td>
												<td>${Drug.chinesename}</td>
												<td>${Drug.englishname}</td>
												<td>${Drug.applicant}</td>
												<td>${Drug.shape}</td>
												<td>${Drug.color}</td>
												<td>${Drug.appearance}</td>
											<td>
												<form action="showUpdate" method="post">
													<input type="hidden" name="eId" value="${Drug.id}" /> 
													<input type="image" src="/images/update.jpg" />
												</form>
											</td>
											<td>
												<form id="delT${Drug.id}" action="delete" method="post">
												<input type="button" class="btn" style="background-image:url(/images/delete.png);background-repeat:no-repeat;" onclick="check(${Drug.id})">
												<input type="hidden" name="eId" value="${Drug.id}">
											</form>
											</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>
					</div>
				</div>
			</main>
						
			
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="../js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="../js/datatables-simple-demo.js"></script>
		
		<!--  sweet alert -->
		<script src="/js/sweetalert2.all.min.js"></script>
		
		<!--  jQuery -->
		 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		 <script>
	function check(id){
	Swal.fire({
		  title: '確定刪除?',
		  text: "刪除後將無法復原!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '確定刪除',
		  cancelButtonText: '取消刪除'
		}).then((result) => {
		  if (result.isConfirmed) {
		    document.getElementById("delT"+id).submit();
		  }
		})
	}
	<!-- bar chart-->
	var ctx = document.getElementById('chart-area');

	var myChart = new Chart(ctx, {
	  type: 'bar', //圖表類型
	  data: {
	    //標題
	    labels: ['糖漿類', '膠囊類', '藥錠類', '外用藥膏', '保健藥物', '其他外用藥品'],
	    datasets: [{
	      data: [34, 55, 34, 31 , 11, 2], //資料
	      //圖表背景色
	      backgroundColor: [
	        'rgba(255, 99, 132, 0.5)',
	        'rgba(54, 162, 235, 0.5)',
	        'rgba(255, 206, 86, 0.5)',
	        'rgba(75, 192, 192, 0.5)',
	        'rgba(153, 102, 255, 0.5)',
	        'rgba(255, 159, 64, 0.5)'
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
		 legend: {
	          display: false,
	      },
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


	<!-- line chart -->
	var line = document.getElementById('myAreaChart');

	var myChart = new Chart(line, {
	  type: 'line', //圖表類型
	  data: {
	    //標題
	    labels: ['April', 'May', 'June', 'July', 'Aug'],
	    datasets: [{
	      data: [2321, 1432, 3421, 3241, 4512], //資料
	      borderColor: 'rgba(132, 193, 255, 1)',
	      fill: false,
	     
	      //外框線寬度
	      borderWidth: 1
	    }]
	  },
	  options: {
		 legend: {
	          display: false,
	      },
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
