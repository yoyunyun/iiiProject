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
<title>健康優生網</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="../css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="../js/function.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="../js/jquery-3.6.0.js"></script>
</head>

<body class="sb-nav-fixed">
	
		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 會員系統
						</div>
						<div class="row">
							
							<div class="col-md-6">
								<h2 style="margin: 8px 150px">修改密碼</h2>
								<div class="card-body">
										<table class="table  table-hover">
									<form:form method="POST" action="/Member/displayUpdateMemberAP" modelAttribute="member" enctype="multipart/form-data">
											<tr>
												<td><form:label path="memberaccount">帳號:</form:label></td>
												<td>
													<form:hidden path="memberid" value="${member.memberid}" />
													<form:hidden path="verificationCode" value="${member.verificationCode}" />
													<form:hidden path="role" value="${member.role}" />
													<form:hidden path="disabled" value="${member.disabled}" />
													<form:hidden path="accountExpired" value="${member.accountExpired}" />
													<form:hidden path="accountLocked" value="${member.accountLocked}" />
													<form:hidden path="credentialsExpired" value="${member.credentialsExpired}" />
													<form:hidden path="membername" value="${member.membername}" />
													<form:hidden path="membergender" value="${member.membergender}" />
													<form:hidden path="memberyear" value="${member.memberyear}" />
													<form:hidden path="membermonth" value="${member.membermonth}" />
													<form:hidden path="memberday" value="${member.memberday}" />
													<form:hidden path="memberemail" value="${member.memberemail}" />
													<form:hidden path="memberphone" value="${member.memberphone}" />
													<form:hidden path="membercity" value="${member.membercity}" />
													<form:hidden path="membertown" value="${member.membertown}" />
													<form:hidden path="memberaddress" value="${member.memberaddress}" />
													<form:hidden path="handbook" value="${member.handbook}" />
													<form:hidden path="dementia" value="${member.dementia}" />
													<form:hidden path="memberphoto" value="${member.memberphoto}" />
													<form:input path="memberaccount" maxlength="15" size="15" />
													<span id="accountCheck"></span>
												</td>
											</tr>
											<tr>
												<td><form:label path="memberpwd">密碼:</form:label></td>
												<td>
													<form:password path="memberpwd" maxlength="15" size="15" />
													<span id="pwd1Check"></span><br>
													<input type="checkbox" id="showPwd" />顯示密碼
												</td>
											</tr>
											<tr>
												<td><label id="pwd2">確認密碼:</label></td>
												<td>
													<input type="password" id="pwd2" maxlength="15" size="15" />
													<span id="pwd2Check"></span>
												</td>
											</tr>
											<tr>
												<td style="text-align: center">
													<input type="submit" class="btn" value="送出" />
												</td>
									</form:form>
												<td>
													<form action="/Member/searchOneMemberAction.controller" method="post">
														<input type="submit" class="btn" value="取消">
													</form>
												</td>
											</tr>
										</table>
								</div>
								<div class="col-md-6"></div>
							</div>
						</div>
					</div>
			</main>
		</div>

<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			crossorigin="anonymous"></script>
		<script src="../js/scripts.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
			crossorigin="anonymous"></script>
		<script src="../js/datatables-simple-demo.js"></script>
		<script type="text/javascript">
	$(document).ready(function(){
		$.getJSON('/json/taiwan_districts.json',function(data){
			var resultText='';
			resultText="<option value=0>請選擇</option>";
			for(var i=0; i<data.length; i++){
				resultText+="<option value='"+data[i].name+"'/>"+data[i].name
			}
			
			$("#membercity").html(resultText);
		});

	$("select[name='membercity']").on('change',function(){
		$.getJSON('/json/taiwan_districts.json',function(data){	
			let CN=$("select[name='membercity']").val();		
			for(n=0; n<data.length; n++ ){
    			if(CN == data[n].name){
    				var resultText2='';
    				for(var j=0; j<data[n].districts.length; j++){
    					resultText2+="<option value='"+data[n].districts[j].name+"'/>"+data[n].districts[j].name
    				}
    							    				
    			}
    		}	
			$("#membertown").html(resultText2);
		});		
	});
	
	});
	
	
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

		
		
		if (true){
			document.getElementById("newLoc").submit();
		}else{
			alert("請輸入完整資訊");
		}
		
	}
	</script>
</body>
</html>