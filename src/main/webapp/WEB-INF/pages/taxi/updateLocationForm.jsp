<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

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

<script type="text/javascript" src="../js/function.js"></script>
<style>
	td{
	max-width: 200px;
	min-width:110px;
	}
</style>
</head>
<body class="sb-nav-fixed">
	
		<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>	
		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 店家資訊
						</div>
						<div class="row">

							<div class="col-md-6">
								<h2 style="margin: 8px 100px">請更新註冊資料</h2>
								<div class="card-body">
									<form:form id="sub" method="POST"
										action="updatecheck.controller" enctype="multipart/form-data"
										modelAttribute="updatelocation">
										<table class="table  table-hover">
											<tr>
												<td><form:label path="id">編號:</form:label></td>
												<td><form:input path="id" readonly="true" /></td>
												<td><form:hidden path="id" /></td>

											</tr>
											<tr>
											<td>上傳預覽</td>
											<td><img id="sourceImage"  width="100px" height="100px"></td>
											</tr>
											<tr>
												<td><form:label path="photo">店家照片:</form:label></td>
												<td><input type="file" name="pic" accept="image/*" id="inputImageFile" /></td>
											</tr>
											<tr>
												<td><form:label path="store">店家名稱:</form:label></td>
												<td><form:input path="store" onblur="Onblur(this,sp1)"/></td>
												<td><span id="idsp1"></span></td>
											</tr>
											<tr>
												<td><form:label path="type">類別:</form:label></td>
												<td><form:select path="type" >
														<form:option value="-1" label="--請選擇--" />
														<form:options items="${typeItems}" />
													</form:select></td>
												<td><span id="idsp2"></span></td>
											</tr>
										
											<tr>
												<td><form:label path="phone">電話:</form:label></td>
												<td><form:input path="phone" onblur="Onblur(this,sp3)"/></td>
												<td><span id="idsp3"></span></td>
											</tr>
											<tr>
												<td><form:label path="time">營業時間:</form:label></td>
												<td><form:input path="time" /></td>
											</tr>
											<tr>
												<td><form:label path="close_day">店休日:</form:label></td>
												<td><form:input path="close_day" /></td>
											</tr>
											<tr>

												<td><form:label path="city">縣市:</form:label></td>
												<td><form:select path="city">
													</form:select></td>
													<td><span id="idsp4"></span></td>
											</tr>
											<tr>

												<td><form:label path="town">鄉鎮市區:</form:label></td>
												<td><form:select path="town">
													<option value=0>請選擇</option>
													</form:select></td>
													<td><span id="idsp5"></span></td>
											</tr>
											<tr>
												<td><form:label path="address">地址:</form:label></td>
												<td><form:input path="address" onblur="Onblur(this,sp6)"/></td>
												<td><span id="idsp6"></span></td>
											</tr>
											<tr>
												<td><form:label path="brief">簡介:</form:label></td>
												<td><form:input path="brief" /></td>
											</tr>
											<tr>
												<td><form:label path="site">網址:</form:label></td>
												<td><form:input path="site" /></td>
											</tr>
											<tr>
												<td><form:label path="map">位置:</form:label></td>
												<td><form:input path="map" /></td>
											</tr>
											<tr>
												<td style="text-align: center"><input type="button" value="送出" onclick="CheckandSub()"/></td>
												<td><a href="${pageContext.request.contextPath}/taxi/locmainpage.controller">取消</a></td>
											</tr>
										</table>
									</form:form>
								</div>
								<div class="col-md-6"></div>
							</div>
						</div>
					</div>
			</main>
		</div>
		
<script src="../js/jquery-3.6.0.js"></script>
		<script type="text/javascript">
		
	var cn = "${updatelocation.city}"
	var tn = "${updatelocation.town}"
		
	$(document).ready(function(){
		$.getJSON('/json/taiwan_districts.json',function(data){
			var resultText='';
			resultText="<option value=0>請選擇</option>";
			for(var i=0; i<data.length; i++){
				if(cn == (data[i].name)){
					resultText+="<option value='"+data[i].name+"' selected>"+data[i].name+"</option>"
				}else{
					resultText+="<option value='"+data[i].name+"'>"+data[i].name+"</option>"
				}
			}
			$("#city").html(resultText);
			let CN=$("select[name='city']").val();		
			for(n=0; n<data.length; n++ ){
    			if(CN == data[n].name){
    				var resultText2='';
    				for(var j=0; j<data[n].districts.length; j++){
    					if(tn == data[n].districts[j].name){
    						resultText2+="<option value='"+data[n].districts[j].name+"' selected>"+data[n].districts[j].name+"</option>"
    					}else{
    						resultText2+="<option value='"+data[n].districts[j].name+"'>"+data[n].districts[j].name+"</option>"
    					}
    				}
    			}
    		}	
			$("#town").html(resultText2);
		});

	$("select[name='city']").on('change',function(){
		$.getJSON('/json/taiwan_districts.json',function(data){	
			let CN=$("select[name='city']").val();		
			for(n=0; n<data.length; n++ ){
    			if(CN == data[n].name){
    				var resultText2='';
    				for(var j=0; j<data[n].districts.length; j++){
    					resultText2+="<option value='"+data[n].districts[j].name+"'>"+data[n].districts[j].name+"</option>"
    				}
    							    				
    			}
    		}	
			$("#town").html(resultText2);
		});		
	});
	});
	
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
	let sp1=document.getElementById("idsp1");
	let sp3=document.getElementById("idsp3");
	let sp6=document.getElementById("idsp6");
	let type=document.getElementsByName("type")[0];
	let city=document.getElementsByName("city")[0];
	let town=document.getElementsByName("town")[0];
	
	
	function CheckandSub(){
		let flag1= Onblur(document.getElementById("store"),sp1);
		let flag2= phoneCheck(document.getElementById("phone"),sp3);
		let flag3= addressCheck(document.getElementById("address"),sp6);
		let flag4= checksel(type,idsp2);
		let flag5= checksel(city,idsp4);
		let flag6= checksel(town,idsp5);
		
		
		if (flag1 & flag2 & flag3 & flag4 & flag5 & flag6){
			document.getElementById("sub").submit();
		}else{
			alert("請輸入完整資訊");
		}
		
	}
	</script>
</body>
</html>