<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
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
<title>健康優生網</title>
<%@ include file="/WEB-INF/pages/css.jsp"%>
<script type="text/javascript" src="/js/function.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	td{
	max-width: 200px;
	min-width:110px;
	}
</style>
</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>
		<div id="layoutSidenav_content" style="margin:1px">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 計程車資訊
						</div>
						<div class="row">

							<div class="col-md-9">
							<h2 style="margin: 8px 100px">請填寫註冊資料</h2>
								<div class="card-body">
								<form:form id="newTX" action="addcheck.controller"
									method="post" modelAttribute="addtaxi">
									
									<table class="table  table-hover">
									<tr>
										<td><form:label path="tname">服務提供單位:</form:label></td> 
										<td><form:input path="tname" onblur="Onblur(this,sp1)" autofocus="autofocus"/></td> 
										<td><span id="idsp1"></span></td>
									</tr>
									<tr>								
										<td><form:label path="phone">聯絡電話:</form:label></td>
										<td><form:input path="phone" onblur="Onblur(this,sp2)"/></td>
										<td><span id="idsp2"></span></td>
									</tr>
									<tr>
												<td><form:label path="address">地址:</form:label></td>
												<td><form:input path="address" onblur="Onblur(this,sp3)"/></td>
												<td><span id="idsp3"></span></td>
											</tr>
										<tr>
											<td><form:label path="serCity">服務縣市:</form:label></td>																				
											<td><div id="result"></div></td>
											
											<td><span id="idsp4"></span></td>
										</tr>




										<tr>
										<td><form:label path="careTaxi">是否為長照專車:</form:label></td>
										<td><form:radiobutton path="careTaxi" value="Yes" label="是" /> 
											<form:radiobutton path="careTaxi" value="No" label="否" /></td>
										<td><span id="idsp5"></span><td>
									</tr>
									
							

				
									<tr>
										<td style="text-align: center"><input type="button" onclick="CheckandSub()" value="送出" ></td>
										<td><a href="${pageContext.request.contextPath}/taxi/taximainpage.controller">取消</a></td>
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
	
		<script type="text/javascript">

	$(document).ready(function() {
		$.getJSON('/json/taiwan_districts.json',function(data) {
		var resultText = '';
		
		let cityName= "${newTaxiC.serCity}";
		for (var i = 0; i < data.length; i++) {
			
			if((cityName.indexOf(data[i].name))>=0){
				resultText += "<label><input type='checkbox' name='serCity' value='"+data[i].name+"' checked/>"+ data[i].name+"</label>"						
			}else{
				resultText += "<label><input type='checkbox' name='serCity' value='"+data[i].name+"'/>"+ data[i].name+"</label>"
			}
			
		}
		$("#result").html(resultText);
		
		});
	});
</script>
		<script>
			let sp1 = document.getElementById("idsp1");
			let sp2 = document.getElementById("idsp2");
			let sp3 = document.getElementById("idsp3");
			let cityN = document.getElementsByName("serCity");
			let careTX = document.getElementsByName("careTaxi");

			function CheckandSub() {
				let flag1 = Onblur(document.getElementById("tname"), sp1);
				let flag2 = phoneCheck(document.getElementById("phone"), sp2);
				let flag3 = addressCheck(document.getElementById("address"),sp3);
				let flag4= checkckbox(cityN,idsp4);
				let flag5 = checkradio(careTX, idsp5);

				if (flag1 & flag2 & flag3 & flag4 & flag5) {
					document.getElementById("newTX").submit();
				} else {
					alert("請輸入完整資訊");
				}

			}
		</script>
</body>
</html>