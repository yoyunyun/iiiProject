<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="/js/function.js"></script>

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

							<div class="col-md-6">
							<h4 style="margin: 8px 100px">請更新註冊資料</h4>
								<div class="card-body">
								<form id="sub" action="/taxi/update.controller" method="post">
									
									<table class="table  table-hover">
									<tr>
										<td>編號:</td>
										<td> ${oldTaxi.id} </td>
										<td><input type="hidden" name="id"
											value="${oldTaxi.id}"></td>
									</tr>
									<tr>
										<td><label for="taxi">服務提供單位:</label></td> 
										<td><input type="text" id="tname" name="tname" onblur="Onblur(this,sp1)"
											autofocus value="${oldTaxi.tname}"></td> 
											<td><span id="idsp1"></span></td>
									</tr>
									<tr>
										<td><label for="phoneNum" >連絡電話:</label></td> 
										<td><input type="text" id="phone" name="phone"
											onblur="Onblur(this,sp2)" value="${oldTaxi.phone}"></td> 
											<td><span id="idsp2"></span></td>
									</tr>
									<tr>
										<td><label for="address">地址:</label></td> 
										<td><input type="text" id="address" name="address"
											onblur="Onblur(this,sp3)" value="${oldTaxi.address}"></td>
										<td><span id="idsp3"></span></td>
									</tr>
									<tr>
										<td><label for="serCity">服務縣市:</label></td>
											<td><div id="serCity" name="serCity"></div></td>
											<td><span id="idsp4"></span></td>
									</tr>
									
									<tr>
										<td><label for="careTaxi">是否為長照專車:</label></td> 
										<td><label>
											<input type="radio" id="Yes" name="careTaxi" value="Yes">是
										</label> 
										<label> 
										<input type="radio" id="No" name="careTaxi"
											value="No">否</td>
										</label></td>
										<script type="text/javascript">
											if ("${oldTaxi.careTaxi}" == "Yes")
												document.getElementById("Yes").checked = true;

											if ("${oldTaxi.careTaxi}" == "No")
												document.getElementById("No").checked = true;
										</script>

										<span id="idsp5"></span>
									</tr>
								
									<tr>
										<td style="text-align: center"><input type="button" onclick="CheckandSub()" value="更新"></td>
										<td><a href="${pageContext.request.contextPath}/taxi/taximainpage.controller">取消</a></td>
									</tr>
									</table>
								</form>
							</div>
							</div>
							<div class="col-md-6"></div>
						</div>
					</div>
				</div>
			</main>
		</div>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script type="text/javascript">
	$(document).ready(function() {
	$.getJSON('/json/taiwan_districts.json',function(data) {
	var resultText = '';
	
	let cityName= "${oldTaxi.serCity}";
	for (var i = 0; i < data.length; i++) {
		
		if((cityName.indexOf(data[i].name))>=0){
			resultText += "<label><input type='checkbox' name='serCity' value='"+data[i].name+"' checked/>"+ data[i].name+"</label>"						
		}else{
			resultText += "<label><input type='checkbox' name='serCity' value='"+data[i].name+"'/>"+ data[i].name+"</label>"
		}
		
	}
	$("#serCity").html(resultText);
	
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
				let flag3 = addressCheck(document.getElementById("address"),
						sp3);
				let flag4= checkckbox(cityN,idsp4);
				let flag5 = checkradio(careTX, idsp5);

				if (flag1 & flag2 & flag3 & flag4 & flag5) {
					document.querySelector('#sub').submit();
				} else {
					alert("請輸入完整資訊");
				}

			}
		</script>
</body>
</html>

