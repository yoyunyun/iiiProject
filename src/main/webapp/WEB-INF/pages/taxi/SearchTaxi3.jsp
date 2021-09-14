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
			
			<!--圖表 -->
			<div class="container-fluid px-4">
					<h1 class="mt-4">計程車管理系統</h1>
					
					<div class="row">
					   <div class="col-lg-6">
                             <div class="card mb-4">
                                   <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                       	 本月TOP5熱門預約叫車
                                    </div>
                                    <div class="card-body"><canvas id="chart-area" width="100%" height="50"></canvas></div>
                              </div>
                      </div>
                      
                      <div class="col-lg-6">
                            <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-pie me-1"></i>
                                各縣市叫車比例(%)
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="50"></canvas></div>
                        </div>
                      </div>
					</div>
			
			
			
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
	
	
	
	<!-- bar chart-->
	var ctx = document.getElementById('chart-area');

	var myChart = new Chart(ctx, {
	  type: 'bar', //圖表類型
	  data: {
	    //標題
	    labels: ['生通股份有限公司', '福倫交通股份有限公司', '婦安衛星車隊', '運將車隊', '大中華國際租賃有限公司'],
	    datasets: [{
	      data: [11658, 10421, 9201, 8652, 7011], //資料
	      //圖表背景色
	      backgroundColor: [
	        'rgba(255, 99, 132, 0.5)',
	        'rgba(54, 162, 235, 0.5)',
	        'rgba(255, 206, 86, 0.5)',
	        'rgba(75, 192, 192, 0.5)',
	        'rgba(153, 102, 255, 0.5)',
	        
	      ],
	      //圖表外框線色
	      borderColor: [
	        'rgba(255, 99, 132, 1)',
	        'rgba(54, 162, 235, 1)',
	        'rgba(255, 206, 86, 1)',
	        'rgba(75, 192, 192, 1)',
	        'rgba(153, 102, 255, 1)',
	        
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
	    xAxes: [{
           ticks: {
               fontSize: 15, //字體大小
               
              }
           }],
	      yAxes: [{
	        ticks: {
	        	fontSize: 15, //字體大小
	          beginAtZero: true,
	          responsive: true //符合響應式
	          
	        }
	      }]
	    }
	  }
	});


	<!-- pie chart -->
	var line = document.getElementById('myAreaChart');

	var myChart = new Chart(line, {
	  type: 'pie', //圖表類型
	  data: {
	    //標題
	    labels: ['新北市', '高雄市', '台北市', '桃園市', '台中市','台南市','其他'],
	    datasets: [{
	      data: [13, 8, 10, 11, 9, 6, 43], //資料
	      backgroundColor: [
	    	  'rgba(255, 159, 64, 1)',
	         'rgba(38, 198, 218, 1)',
	         'rgba(138, 178, 248, 1)',
	         'rgba(255, 100, 200, 1)',
	         'rgba(116, 96, 238, 1)',
	         'rgba(173, 92, 210, 1)',
	         'rgba(227, 247, 227, 1)',
	         
	       ],
	      borderColor: 'rgba(0, 0, 0, 0.3)',
	     
	      //外框線寬度
	      borderWidth: 1
	    }]
	  },
	  options: {
		 legend: {
	          position: 'bottom',
// 	          align: 'center',
	          maxWidth: 0.5,
	         
	      },
		     
	  }
	});
	
	</script>
	
</body>
</html>