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
<title>健康悠生網</title>

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
							<i class="fas fa-table me-1"></i> 新增餐點資料
						</div>
						<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<form action="addMeals.controller"	method="post" id="add" enctype="multipart/form-data">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>欄位名稱</th>
											<th>欄位資料</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>餐點名稱</td>
											<td><input type="text" id="name" name="name" required> <span id="ndsp"></span></td>
										</tr>
										<tr>
											<td>上傳預覽</td>
											<td><img id="sourceImage"  width="100px" height="100px"></td>
										</tr>											
										<tr>
											<td>新增照片</td>
											<td><input type="file" name="pic" accept="image/*" id="inputImageFile" /></td>
										</tr>
										<tr>
											<td>價格($NT)</td>
											<td><input type="text" id="price" name="price" required></td>
										</tr>
										<tr>
											<td>主原料</td>
											<td><input type="text" id="material" name="material"></td>
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
											<td>商店編號</td>
											<td><input type="radio" id="store1" name="store_ID" value="1" checked> 
												<label for="store1">1</label> 
												<input type="radio" id="store2"	name="store_ID" value="2"> 
												<label for="store2">2</label> 
												<input type="radio" id="store3" name="store_ID" value="3"> 
												<label for="store3">3</label> 
												<input type="radio" id="store4"	name="store_ID" value="4"> 
												<label for="store4">4</label> 
												<input type="radio" id="store5" name="store_ID" value="5"> 
												<label for="store5">5</label>
											</td>
										</tr>
										<tr>
											<td><label></label></td>
											<td>
											<button type="button" id="inputdata" >一鍵輸入</button>
											<input type="button" name="confirm" value="送出" onclick="add()">
											<input type="button" value="取消" onclick="window.location.href='mealView.controller'" />
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
	<script>

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
		
	</script>
	<script>
	    //一鍵輸入
	    $('#inputdata').click(function() {
	      $('#name').val("資策會養生餐"); 
	      $('#price').val(199);
	      $('#material').val("JAVA、SQL、Spring Boot");
	      $('#calories').val(1129);
	      $('#protein').val(41);
	      $('#carbohydrates').val(88);
	      $('#fat').val(19);
	      $('#store3').val(3);
	    
	    });
	</script>
</body>
</html>