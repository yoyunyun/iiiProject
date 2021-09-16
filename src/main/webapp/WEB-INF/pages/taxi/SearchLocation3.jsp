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
			
			<!--圖表 -->
			<div class="container-fluid px-4">
					<h1 class="mt-4">店家管理系統</h1>
					
					<div class="row">
					   <div class="col-lg-6">
                             <div class="card mb-4">
                                   <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                       	 最多收藏數
                                    </div>
                                    <div class="card-body"><canvas id="chart-area" width="100%" height="50"></canvas></div>
                              </div>
                      </div>
                      
                      <div class="col-lg-6">
                            <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-pie me-1"></i>
                                叫車熱點
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="50"></canvas></div>
                        </div>
                      </div>
					</div>
			
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 店家資訊
						<button class="btn"
										onclick="document.querySelector('#sub').submit()">新增</button>
					</div>
					<div class="card-body">

						<form id="sub" action="addloc.controller" method="get">
							
						</form>

						<table id="datatablesSimple" >

							<thead>
								<tr>
<!-- 									<th>編號</th> -->
									<th>店家照片</th>
									<th>店家名稱</th>
									<th>類別</th>									
									<th>電話</th>
									<th>營業時間</th>
									<th>店休日</th>
									<th>縣市</th>
									<th>鄉鎮市區</th>
									<th>地址</th>
<!-- 									<th>簡介</th> -->
<!-- 									<th>網站</th> -->
<!-- 									<th>位置</th> -->
									<th>修改</th>
									<th>刪除</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="loc" items="${listLoc}">
									<tr>

<%-- 										<td>${loc.id}</td> --%>
										<td><img src="${pageContext.request.contextPath}/LocationImg/${loc.photo}"
												onerror="this.src='${pageContext.request.contextPath}/images/hospital2.png'" width="120px"
												height="120px" /></td>
												
										<td>${loc.store}</td>
										<td>${loc.type}</td>
										<td>${loc.phone}</td>
										<td>${loc.time}</td>
										<td>${loc.close_day}</td>
										<td>${loc.city}</td>
										<td>${loc.town}</td>
										<td>${loc.address}</td>
<%-- 										<td>${loc.brief}</td> --%>
<%-- 										<td>${loc.site}</td> --%>
<%-- 										<td>${loc.map}</td> --%>
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
	    labels: ['林口長庚紀念醫院', '高雄長庚紀念醫院', '臺大醫院', '中國醫藥大學附設醫院', '台北榮民總醫院'],
	    datasets: [{
	      data: [1658, 1321, 920, 852, 701], //資料
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
	    labels: ['林口長庚紀念醫院', '高雄長庚紀念醫院', '三軍總醫院', '桃園長庚紀念醫院', '中國醫藥大學附設醫院','其他'],
	    datasets: [{
	      data: [1001, 800, 710, 611, 509, 2689], //資料
	      backgroundColor: [
	    	  'rgba(255, 159, 64, 1)',
	         'rgba(38, 198, 218, 1)',
	         'rgba(138, 178, 248, 1)',
	         'rgba(255, 100, 200, 1)',
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
	
	<!-- pie -->
	option = {
		    title: {
		        text: '某站点用户访问来源',
		        subtext: '纯属虚构',
		        left: 'center'
		    },
		    tooltip: {
		        trigger: 'item'
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		    },
		    series: [
		        {
		            name: '访问来源',
		            type: 'pie',
		            radius: '50%',
		            data: [
		                {value: 1048, name: '搜索引擎'},
		                {value: 735, name: '直接访问'},
		                {value: 580, name: '邮件营销'},
		                {value: 484, name: '联盟广告'},
		                {value: 300, name: '视频广告'}
		            ],
		            emphasis: {
		                itemStyle: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	</script>
</body>
</html>