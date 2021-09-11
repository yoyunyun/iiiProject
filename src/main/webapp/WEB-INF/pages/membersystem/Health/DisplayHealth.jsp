<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<script src="../js/jquery-3.6.0.js"></script>


<!-- js for modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script> 



<!-- css for modal -->			
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">


<!-- css for sweet alert2  -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<%@ include file="/WEB-INF/pages/user-header.jsp"%>



  <!-- 老人圖 -->

    <div class="slide-item overlay" style="background-image: url('${pageContext.request.contextPath}/images/meme_old_man5.jpg')">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">健康悠生伴你一生</h1>
            <p class="lead text-white mb-5">健康一生 悠活一生</p>
            <p><a href="about.html" class="btn btn-primary">關於我們</a></p>
          </div>
        </div>
      </div>  
    </div>



	<!-- 表單 -->
	   <div id="layoutSidenav_content">
		<main>
			<div class="card mb-4">
				<div class="card-header" style="margin-bottom:20px;">
					<i class="fas fa-table me-1"></i> 會員系統
				</div>

				
				
				<div class="row" style="margin-bottom:50px;">
				
				
				
					<!-- 會員資料索引 -->	
					<div class="sort btn-group-vertical" style="width:210px; line-height:50px; float:left;">
						<span class="btn btn-dark btn-lg" style="font-size:20px; display: flex; align-items: center;" class="btn btn-outline-secondary btn-lg">會員資料索引</span>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="/Member/updateMember">修改個人資料</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="/Member/updateMemberAP">修改密碼</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="/Member/gotoHealth">健康資料表</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="${pageContext.request.contextPath}/cart/order">會員訂單</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="${pageContext.request.contextPath}/cart/showcollect">會員收藏</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="#">加甚麼看你</a>
					</div>
					
					
		<!-- 表單 ajax -->	
		<div class='col-md-6' style='margin: 0 auto;' id="showContent">	</div>
		
		
	</div></div></main></div>	
		
		
		
<!-- "新增表單"的互動視窗 Modal -->

					<div class="modal fade" tabindex="-1" role="dialog" id="insertModalShow">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">新增健康資訊</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
									</button>
								</div>
							<div class="modal-body">
							
								<form id='insertHealthForm' name='insertHealthForm'>
								
									<table class="table  table-hover">
										<tr>
											<td>收縮壓:</td>
											<td>
												<input type='text' id='systolicBloodPressure' name='systolicBloodPressure'/> 
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>舒張壓:</td>
											<td>
												<input type='text' id='diastolicBloodPressure' name='diastolicBloodPressure'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>心率:</td>
											<td>
												<input type='text' id='heartRate' name='heartRate'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>飯前(空腹)血糖:</td>
											<td>
												<input type='text' id='fastingBloodSugar' name='fastingBloodSugar'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>飯後血糖:</td>
											<td>
												<input type='text' id='bloodSugarAfterMeal' name='bloodSugarAfterMeal'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>身高:</td>
											<td>
												<input type='text' id='height' name='height'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>體重:</td>
											<td>
												<input type='text' id='weight' name='weight'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>腰圍:</td>
											<td>
												<input type='text' id='waistline' name='waistline'/>
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
											<td>血氧濃度:</td>
											<td>
												<input type='text' id='oxygenSaturation' name='oxygenSaturation'/>
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
										<td>體溫:</td>
											<td>
												<input type='text' id='temperature' name='temperature'/>
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
										<td>疾病史:</td>
											<td>
												<textarea id='medicalHistory' name='medicalHistory' rows='6' cols='40' style='resize : none;' placeholder='心臟病、氣喘、腎臟病...'/></textarea>
												<span id='nameCheck'></span>
											</td>
										</tr>
									</table>
								</form>
								<button type="button" class="btn btn-default" data-bs-dismiss="modal">關閉</button>
								<button id="insertHealthBtn" type="button" data-bs-dismiss="modal" class="btn btn-primary">確認新增</button>
								<button id="onekey" type="button" class="btn btn-primary">一鍵輸入</button>
		
								</div>
							</div>
						<!-- /.modal-content -->
						</div>
					<!-- /.modal-dialog -->
					</div>
				<!-- /.modal -->
				
				
				
				<!-- "修改表單"的互動視窗 Modal -->

					<div class="modal fade" tabindex="-1" role="dialog" id="updateModalShow">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">修改健康資訊</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
									</button>
								</div>
							<div class="modal-body">
							
								<form id='updateHealthForm' name='updateHealthForm'>
								
									<table class="table  table-hover">
										<tr>
											<td>收縮壓:</td>
											<td>
												<input type='hidden' id='healthid1' name='healthid'/> 
												<input type='text' id='systolicBloodPressure1' name='systolicBloodPressure'/> 
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>舒張壓:</td>
											<td>
												<input type='text' id='diastolicBloodPressure1' name='diastolicBloodPressure'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>心率:</td>
											<td>
												<input type='text' id='heartRate1' name='heartRate'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>飯前(空腹)血糖:</td>
											<td>
												<input type='text' id='fastingBloodSugar1' name='fastingBloodSugar'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>飯後血糖:</td>
											<td>
												<input type='text' id='bloodSugarAfterMeal1' name='bloodSugarAfterMeal'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>身高:</td>
											<td>
												<input type='text' id='height1' name='height'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>體重:</td>
											<td>
												<input type='text' id='weight1' name='weight'/>
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>腰圍:</td>
											<td>
												<input type='text' id='waistline1' name='waistline'/>
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
											<td>血氧濃度:</td>
											<td>
												<input type='text' id='oxygenSaturation1' name='oxygenSaturation'/>
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
										<td>體溫:</td>
											<td>
												<input type='text' id='temperature1' name='temperature'/>
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
										<td>疾病史:</td>
											<td>
												<textarea id='medicalHistory1' name='medicalHistory' rows='6' cols='40' style='resize : none;' placeholder='心臟病、氣喘、腎臟病...'/></textarea>
												<span id='nameCheck'></span>
											</td>
										</tr>
									</table>
								</form>
								<button type="button" class="btn btn-default" data-bs-dismiss="modal">關閉</button>
								<button id="updateHealthBtn" type="button" data-bs-dismiss="modal" class="btn btn-primary">確認修改</button>
								<button id="twokey" type="button" class="btn btn-primary">一鍵輸入</button>
		
								</div>
							</div>
						<!-- /.modal-content -->
						</div>
					<!-- /.modal-dialog -->
					</div>
				<!-- /.modal -->
		
		
		
<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>
<%@ include file="/WEB-INF/pages/user-js.jsp"%>


		
		
<script type="text/javascript">




//顯示表單

$(document).ready(function(){
	load();

})



function load(){
		
		$.ajax({
			
			type:"post",
			url:"/Member/searchOneHealth",
			//dataType:'JSON',
			contentType:'application/json',
			
			success : function(data){
			     console.log("SUCCESS : "+ data);
			     
// 			     var json = JSON.stringify(data, null, 4);
			     
// 				 var parsedObjinArray = JSON.parse(json);
				 
// 				 console.log("parsedObjinArray: "+parsedObjinArray);
				 
				 
				 // 清除div下的所有子內容
				 $("#showContent").empty();
				 
				 var div =  $("#showContent");
				
				 var content =""
				 
					 if (data != ""){
						 
						 content += 
								"<h2 style='margin: 8px 150px;  text-align:center;''>健康資料表</h2><div class='card-body'><table class='table  table-hover'>"
							    +"<tr><td>收縮壓:</td><td style='text-align: center'>" + data.systolicBloodPressure + "</td></tr>"
							    +"<tr><td>舒張壓:</td><td style='text-align: center'>" + data.diastolicBloodPressure + "</td></tr>"
							    +"<tr><td>心率(心跳數):</td><td style='text-align: center'>" + data.heartRate + "</td></tr>"
							    +"<tr><td>飯前(空腹)血糖:</td><td style='text-align: center'>" + data.fastingBloodSugar + "</td></tr>"						
								+"<tr><td>飯後血糖:</td><td style='text-align: center'>" + data.bloodSugarAfterMeal + "</td></tr>"					
								+"<tr><td>身高:</td><td style='text-align: center'>" + data.height + "</td></tr>"					
								+"<tr><td>體重:</td><td style='text-align: center'>" + data.weight + "</td></tr>"					
								+"<tr><td>BMI:</td><td style='text-align: center'>" + data.bmi + "</td></tr>"					
								+"<tr><td>腰圍:</td><td style='text-align: center'>" + data.waistline + "</td></tr>"					
								+"<tr><td>血氧濃度:</td><td style='text-align: center'>" + data.oxygenSaturation + "</td></tr>"					
								+"<tr><td>體溫:</td><td style='text-align: center'>" + data.temperature + "</td></tr>"					
								+"<tr><td>疾病史:</td><td style='text-align: center'>" + data.medicalHistory + "</td></tr>"					
								+"<tr><td colspan='2' style='text-align: center'><input type='submit' class='btn' id='gotoUpdateHealthBtn' style='font-size:20px;' value='修改' /></td></tr></table>"					
								+"</div><div class='col-md-6'></div>"					
													
					 }else{
						 
						 content += 
							"<h2 style='margin: 8px 150px;  text-align:center;''>健康資料表</h2><div class='card-body'><table class='table  table-hover'>"
						    +"<tr><td>收縮壓:</td><td style='text-align: center'>請填寫資料</td></tr>"
						    +"<tr><td>舒張壓:</td><td style='text-align: center'>請填寫資料</td></tr>"
						    +"<tr><td>心率(心跳數):</td><td style='text-align: center'>請填寫資料</td></tr>"
						    +"<tr><td>飯前(空腹)血糖:</td><td style='text-align: center'>請填寫資料</td></tr>"						
							+"<tr><td>飯後血糖:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>身高:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>體重:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>BMI:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>腰圍:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>血氧濃度:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>體溫:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>疾病史:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td colspan='2' style='text-align: center'><input type='submit' class='btn' id='gotoInsertHealthBtn' style='font-size:20px;' value='新增' /></td></tr></table>"					
							+"</div><div class='col-md-6'></div>"							 
						 
						 
						 
// 						 content += 
// 								"<h2 style='margin: 8px 150px;  text-align:center;'>新增健康資訊</h2><div class='card-body'><table class='table  table-hover'>"
// 								+"<form id='insertHealthForm111' name='insertHealthForm'><tr><td>收縮壓:</td><td><input type='text' id='systolicBloodPressure' name='systolicBloodPressure'/><span id='nameCheck'></span></td></tr>"
//       							+"<tr><td>舒張壓:</td><td><input type='text' id='diastolicBloodPressure' name='diastolicBloodPressure'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>心率:</td><td><input type='text' id='heartRate' name='heartRate'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>飯前(空腹)血糖:</td><td><input type='text' id='fastingBloodSugar' name='fastingBloodSugar'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>飯後血糖:</td><td><input type='text' id='bloodSugarAfterMeal' name='bloodSugarAfterMeal'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>身高:</td><td><input type='text' id='height' name='height'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>體重:</td><td><input type='text' id='weight' name='weight'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>腰圍:</td><td><input type='text' id='waistline' name='waistline'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>血氧濃度:</td><td><input type='text' id='oxygenSaturation' name='oxygenSaturation'/><span id='nameCheck'></span></td></tr>"
//       							+"<tr><td>體溫:</td><td><input type='text' id='temperature' name='temperature'/><span id='nameCheck'></span></td></tr>"
//       							+"<tr><td>疾病史:</td><td><textarea id='medicalHistory' name='medicalHistory' rows='6' cols='40' style='resize : none;' placeholder='心臟病、氣喘、腎臟病...'/></textarea><span id='nameCheck'></span></td></tr>"
//       							+"<tr><td style='text-align: center'><input type='image' id='insertHealthBtn111' data-bs-dismiss='modal' src='${pageContext.request.contextPath}/images/update.jpg'></td></form>"
//       							+"<td style='text-align: center'><input type='submit' class='btn' style='font-size:20px;' value='取消'></td></tr></table><button id='onekey'>範例</button></div>"
//       							+"<div class='col-md-6'></div>"
					 }

				 
				 
				div.html(content);	
				
				
				

						//一鍵輸入
						$('#onekey').on('click', function oneClick() {
							console.log("一鍵輸入");
							$('#systolicBloodPressure').val(110);
							$('#diastolicBloodPressure').val(80);
							$('#heartRate').val(70);
							$('#fastingBloodSugar').val(75);
							$('#bloodSugarAfterMeal').val(120);
							$('#height').val(180);
							$('#weight').val(79);
							$('#waistline').val(68);
							$('#oxygenSaturation').val(95);
							$('#temperature').val(36.3);
							$('#medicalHistory').val('青光眼、失眠、厭食症');
						})
						
						//一鍵輸入
						$('#twokey').on('click', function twoClick() {
							console.log("一鍵輸入");
							$('#systolicBloodPressure1').val(105);
							$('#diastolicBloodPressure1').val(88);
							$('#heartRate1').val(86);
							$('#fastingBloodSugar1').val(73);
							$('#bloodSugarAfterMeal1').val(113);
							$('#height1').val(180);
							$('#weight1').val(88);
							$('#waistline1').val(68);
							$('#oxygenSaturation1').val(95);
							$('#temperature1').val(36.6);
							$('#medicalHistory1').val('青光眼、失眠、厭食症、躁鬱症、腸胃炎');
						})						
						
						
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------						
						
						// "新增"按鈕叫出 Modal
						$('#gotoInsertHealthBtn').click(function (e) {
								e.preventDefault();
								$('#insertModalShow').modal('show');
						})							

						
						
						// "確認新增"按鈕，儲存資料
						$("#insertHealthBtn").click(
								function() {
									
									let insertFormData = new FormData($('#insertHealthForm')[0]);
									console.log(insertFormData);
									$.ajax({
										url : "/Member/insertHealth",
										method : "POST",
										data : insertFormData,
										contentType : false,
										processData : false,
										success : function(res) {
											
											Swal.fire({
												  icon: 'success',
												  title: '恭喜您成功新增!!',
												  showConfirmButton: false,
												  timer: 1500
												})
										window.setTimeout(function(){location.reload()},2000)		
// 										window.location.reload();     //頁面刷新
										},
										error : function(err) {
											
											Swal.fire({
												  icon: 'error',
												  title: 'Oops...',
												  text: 'Something went wrong!',
												  footer: '<a href="">Why do I have this issue?</a>'
												})
												
											console.log('新增失敗' + err);
										}
									});

								})
								


//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------								
								
								
						// "修改"按鈕叫出 Modal
						$('#gotoUpdateHealthBtn').click(function (e) {
								e.preventDefault();
								findHealth();
								$('#updateModalShow').modal('show');
						})									
								
								
						
				
		// 啟用"修改"按鈕前置準備，尋找單筆
		function findHealth() {
			$.ajax({
				url: "/Member/searchOneHealth",
				method: "POST",
				dataType: "json",
				success: function (res) {
					
					
					$('#updateHealthForm')[0].reset();
					
					console.log(res.healthid);
					console.log(res.systolicBloodPressure);
					
					$('#healthid1').val(res.healthid);
					$('#systolicBloodPressure1').val(res.systolicBloodPressure);
					$('#diastolicBloodPressure1').val(res.diastolicBloodPressure);
					$('#heartRate1').val(res.heartRate);
					$('#fastingBloodSugar1').val(res.fastingBloodSugar);
					$('#bloodSugarAfterMeal1').val(res.bloodSugarAfterMeal);
					$('#height1').val(res.height);
					$('#weight1').val(res.weight);
					$('#waistline1').val(res.waistline);
					$('#oxygenSaturation1').val(res.oxygenSaturation);
					$('#temperature1').val(res.temperature);
					$('#medicalHistory1').val(res.medicalHistory);
	
				},
				error: function (err) {
					console.log("bbb");
					console.log(err);
				}
			});
		}								
								
								

						// "確認修改"按鈕，儲存資料
						$("#updateHealthBtn").click(
								function() {
									
									let updateFormData = new FormData($('#updateHealthForm')[0]);
									console.log(updateFormData);
									$.ajax({
										url : "/Member/updateHealth",
										method : "POST",
										data : updateFormData,
										contentType : false,
										processData : false,
										success : function(res) {
											
											Swal.fire({
												  icon: 'success',
												  title: '恭喜您成功修改!!',
												  showConfirmButton: false,
												  timer: 1500
												})
										window.setTimeout(function(){location.reload()},2000)		
									//	window.location.reload();     //頁面刷新
										},
										error : function(err) {
											
											Swal.fire({
												  icon: 'error',
												  title: 'Oops...',
												  text: 'Something went wrong!',
												  footer: '<a href="">Why do I have this issue?</a>'
												})
												
											console.log('新增失敗' + err);
										}
									});

								})
						
						
						
						
						

					},
					error : function(err) {
						console.log("error");
						console.log(err);
					}
				})
	}
</script>
	

</body>
</html>