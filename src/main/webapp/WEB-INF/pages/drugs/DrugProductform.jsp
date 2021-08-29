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
<title>健康優生網</title>
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
			
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">藥品管理系統</h1>


					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 藥品資料
						</div>
						<div class="card-body">


							<div class="row">

								<div class="col-md-6">
									<form:form action="save" modelAttribute="DrugProduct"
										method="post" enctype="multipart/form-data" id="submit">

										<form:hidden path="id" />
										<form:hidden path="beforechange" />
                                        <form:hidden path="afterchange" />
										<table class="table table-hover">
											<thead>
												<tr>
													<th>欄位名稱</th>
													<th>欄位資料</th>
												</tr>
											</thead>
											<tbody>
										
												<tr>
													<td><label>日期</label></td>
													<td><form:input path="releasedate" /></td>
												</tr>
												<tr>
													<td>商品照片</td>
													<td><img src="${pageContext.request.contextPath}/DrugProductImg/${equip.beforechange}"
														onerror="this.style.display='none'" width="100px" height="100px" >
													</td>
												</tr>
												<tr>
													<td>上傳預覽</td>
													<td><img id="sourceImage"  width="300px" height="200px"></td>
												</tr>
												<tr>
													<td>新增照片</td>
													<td><input type="file" name="pic" accept="image/*" id="inputImageFile" /></td>
												</tr>
												<tr>
													<td>藥品照片</td>
													<td><img src="${pageContext.request.contextPath}/DrugProductImg/${equip.afterchange}"
														onerror="this.style.display='none'" width="100px" height="100px" >
													</td>
												</tr>
												<tr>
													<td>上傳預覽</td>
													<td><img id="sourceImage2"  width="300px" height="200px"></td>
												</tr>
												<tr>
													<td>藥品照片</td>
													<td><input type="file" name="pic2" accept="image/*" id="inputImageFile2" /></td>
												</tr>
												
												<tr>
													<td><label>藥物名稱:</label></td>
													<td><form:input path="drugname" /></td>
												</tr>
												<tr>
													<td><label>藥品敘述:</label></td>
													<td><form:input path="direction" /></td>
												</tr>
													<td><label></label></td>
													<td><input type="submit" value="提交" class="save"
														id="update" /></td>
												</tr>
												<tr>
													<td><label></label></td>
													<td><p>
															<a href="${pageContext.request.contextPath}/drug/findalldrug">返回主頁</a>
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</form:form>
								</div>
								<div class="col-md-6"></div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="/js/datatables-simple-demo.js"></script>

	<!--  sweet alert -->
	<script src="/js/sweetalert2.all.min.js"></script>
	
	<!--  jQuery -->
	 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

	<script>
		var submit = document.getElementById("submit")

		submit.onsubmit = function() {
			return false;
		}

		document.getElementById("update").onclick = function() {

			setTimeout(function() {
				submit.submit();
			}, 1400);

			Swal.fire({
				position : 'top',
				icon : 'success',
				title : '資料已更新',
				showConfirmButton : false,
				timer : 1500
			})
		}
		
		
		
		/* 更新圖片 or 上傳圖片 */
	    $("#inputImageFile").change(function(e){
        	processImageFile(e.target.files[0]);
    	});
	    
	    
	    function processImageFile(imageObject) {
	        //顯示分析的圖片
	        var sourceImageUrl = URL.createObjectURL(imageObject);
	        //document.querySelector("#sourceImage").src = sourceImageUrl;
	        $("#sourceImage").attr('src', sourceImageUrl);
	    }
	    
	    
	    $("#inputImageFile2").change(function(a){
        	processImageFile2(a.target.files[0]);
    	});
	    
	    
	    function processImageFile2(imageObject2) {
	        //顯示分析的圖片
	        var sourceImageUrl2 = URL.createObjectURL(imageObject2);
	        //document.querySelector("#sourceImage").src = sourceImageUrl;
	        $("#sourceImage2").attr('src', sourceImageUrl2);
	    }
		
	</script>
</body>
</html>
