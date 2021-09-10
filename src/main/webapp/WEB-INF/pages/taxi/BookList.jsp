<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
<title>健康優生網</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>

<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>


</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">


	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border text-primary" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>


	<div class="site-wrap">

		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
	</div>

	<%@ include file="/WEB-INF/pages/user-header.jsp"%>


	<!-- MAIN -->
	<div class="slide-item overlay"
		style="background-image: url('${pageContext.request.contextPath}/images/slider-2.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 align-self-center">
					<h1 class="heading mb-3">健康悠生伴你一生</h1>
					<p class="lead text-white mb-5">健康一生 悠活一生</p>
					<p>
						<a href="about.html" class="btn btn-primary">關於我們</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- MAIN -->
    <!-- 跳出視窗開始 -->
    <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog" style="max-width: 800px; ">
                <!-- Modal content-->
                <div class="modal-content" style="border-radius: 30%;">
                    <div style="background-color: #FFFCEC;border-radius: 20px 20px 0 0;">
                        
                        <h3 class="modal-title" style="text-align: center; font-family: Verdana, Geneva, Tahoma, sans-serif;font-style: italic;text-decoration: underline; margin:20px">
                        <img src="/images/movemovetaxi.gif" style="max-width: 50px;margin:10px">修改叫車表單<img src="/images/movemovetaxi.gif" style="max-width: 50px;margin:10px"></h3>
                   		
                    <table style="margin:auto" class="win">
                    	<tr>
                        <td>訂單編號:</td>
                        <td><input type="text" id="bid" class="tex" disabled></td>
                        <td></td>
                        </tr>
                        <tr>
                        <td>預約叫車單位:</td>
<!--                         <td><span id="taxi" style=" font-weight: 800;font-size:20px;"></span></td> -->
                        <td><input type="text" id="taxi" disabled></td>
                        <td><input type="hidden" id="tid"></td>
                        </tr>
                        <tr>
                        <td>預約地點:</td>
                        <td><input type="text" id="loc" class="tex" placeholder="台北馬偕醫院"></td>
                        <td></td>
                        </tr>
                        <tr>
                        <td>預約日期:</td>
                        <td><input type="date" id="date" class="tex"></td>
                        <td></td>
                        </tr>
                        <tr>
                        <td>預約時間:</td>
                        <td><select class="tex" id="hour">
                            <option>01</option>
                            <option>02</option>
                            <option>03</option>
                            <option>04</option>
                            <option>05</option>
                            <option>06</option>
                            <option>07</option>
                            <option selected>08</option>
                            <option>09</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                            <option>17</option>
                            <option>18</option>
                            <option>19</option>
                            <option>20</option>
                            <option>21</option>
                            <option>22</option>
                            <option>23</option>
                            <option>24</option>
                        </select> : 
                        <select id="min">
                            <option>00</option>
                            <option>10</option>
                            <option>20</option>
                            <option>30</option>
                            <option>40</option>
                            <option>50</option>
                            
                        </select></td>
                        <td></td>
                        </tr>
                    <tr>
                        <td>乘客:</td>
                        <td><input type="text" id="passanger" class="tex" placeholder="王小明"></td>
                        <td>(請填寫一人做代表)</td>
                    </tr>
                    <tr>
                        <td>乘客電話</td>
                        <td><input type="text" id="tel" class="tex" placeholder="0910123456"></td>
                        <td>(乘車前司機會再次與您聯絡確認)</td>
                    </tr>
                    <tr>
                        <td>乘客信箱</td>
                        <td><input type="text" id="mail" class="tex" placeholder="aa123@gmail.com"></td>
                        <td>(預約成功通知)</td>
                    </tr>
                </table>
                    </div>
                    <div class="modal-footer" style="justify-content: center;background-color: #FFF3EE;border-radius: 0 0 20px 20px;">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="yes()">確定修改</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancel()"
                        onkeypress="cancel()">取消修改</button>
                    </div>
                </div>
                
                
            </div>
        </div>
<!-- 跳出視窗結束 -->

	<div id="layoutSidenav_content">
		<main>
			<div class="card-header" style="margin-bottom: 60px;">
				<i class="fas fa-table me-1"></i> 會員系統
			</div>


			<!-- 第一列 -->
			<div class=row style="margin-bottom: 18px">
				<div class="col-md-2"></div>
				<div class="col-md-9" style="margin: 0 auto;">
					<h3 style="text-align: center;">預約叫車訂單</h3>
				</div>
				<div class="col-md-1"></div>

			</div>


			<!-- 第二列 -->
			<div class="row" style="margin-bottom: 100px">

				<div class="col-md-2">
					<!-- 會員資料索引 -->
					<div class="sort btn-group-vertical">
						<span class="btn btn-dark btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							class="btn btn-outline-secondary btn-lg">會員資料索引</span> <a
							class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="/Member/updateMember">修改個人資料</a> <a
							class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="/Member/updateMemberAP">修改密碼</a> <a
							class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="#">健康資料表</a> <a class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="${pageContext.request.contextPath}/cart/order">會員訂單</a> <a
							class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="${pageContext.request.contextPath}/cart/showcollect">會員收藏</a>
						<a class="btn btn-outline-secondary btn-lg"
							style="font-size: 20px; display: flex; align-items: center;"
							href="#">加甚麼看你</a>
					</div>
				</div>

				<div class="col-md-9" style="margin: 0 auto;">



					<table class="table table-hover">
						<thead style="background-color: #F5F5F5">
							<tr>
								<th>訂單編號</th>
								<th>預約叫車單位</th>
								<th>預約地點</th>
								<th>預約日期</th>
								<th>預約時間</th>
								<th>乘客姓名</th>
								<th>您留下的聯絡電話</th>
								<th>您填寫的信箱</th>
								<th>修改</th>
								<th>刪除</th>
							</tr>
						</thead>

						<c:choose>
							<c:when test="${not empty Blist}">
								<c:forEach var="booking" items="${Blist}">
									<tbody>
										<tr id="${booking.book_id}">
											<td>${booking.book_id}</td>
											<td>${booking.tname}</td>
											<td>${booking.address}</td>
											<td>${booking.date}</td>
											<td>${booking.hour}:${booking.min}</td>
											<td>${booking.passenger}</td>
											<td>${booking.phone}</td>
											<td>${booking.mail}</td>
											<td><input type="image" class="updateBook" name="update" src="/images/update.jpg"  onclick="updClick(${booking.book_id})"/></td>
											<td><input type="image" src="/images/delete.png" class="delete" onclick="delcheck(${booking.book_id})"></td>
										</tr>
									</tbody>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tbody>
									<tr>
										<td colspan=7 style="text-align: center;"><span
											style="font-size: 25px;">目前沒有任何訂單喔</span></td>
									</tr>
								</tbody>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<div class="col-md-1"></div>

			</div>
		</main>
	</div>






	<!-- Footer -->

	<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>


	<%@ include file="/WEB-INF/pages/user-js.jsp"%>



<script>
	function delcheck(id){
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
				setTimeout(() => del(id), 1000)
		  }
		})
	}
	
	function del(id){
		console.log(id);
		$.ajax({
			  url: "/taxiFront/booktaxi/del/"+id,
			  type: "post",
		  	  success: function(data){
		  		  console.log(data);
		  	  }
			})
	}
	
</script>

<!-- 浮動視窗 -->
<script type="text/javascript">

function cancel() {
//  window.sessionStorage.userdata = "1";
 $("#myModal").modal('hide');
}
function show() {
//  window.sessionStorage.userdata = "0";
 $("#myModal").modal('show');
 Swal.fire({
	 position:'bottom-end',
	  title: '<img src="/images/hittaxi.gif">',
	  showConfirmButton: false,
	  backdrop: false,
	  timer: 8000
	})
}
function updClick(id) {
	let data = $('#'+id);
	$('#bid').val(data.children().eq(0).text());
	$('#taxi').val(data.children().eq(1).text());
	$('#loc').val(data.children().eq(2).text());
  	$('#date').val(data.children().eq(3).text());
  	$('#hour').val(data.children().eq(4).text().substring(0,2));
  	$('#min').val(data.children().eq(4).text().substring(3,5));
	$('#passanger').val(data.children().eq(5).text());
  	$('#tel').val(data.children().eq(6).text());
	$('#mail').val(data.children().eq(7).text());
  	
	show();
	
}


//Sweetalert
function yes(){
	Swal.fire({
		  title: '<img src="/images/takicab-taxi-call.gif">',
		  showConfirmButton: false,
		  timer: 3250
		}).then(()=> {Swal.fire({
		  icon: 'success',
		  title: '修改成功!請前往信箱確認!',
		  showConfirmButton: true,
		})}).then(()=>{
			cancel();
		})
	
	//傳給信件
	$.ajax({
	  url: "/taxiFront/booktaxi/update",
	  type: "post",
	  data:  { "mail" : $('#mail').val() , "passanger" : $('#passanger').val(),
		  		"taxi" : $('#taxi').val(), "loc" : $('#loc').val(), "date" : $('#date').val(),
		  		"hour" : $('#hour').val(), "min" : $('#min').val(), "tel" : $('#tel').val(),
		  		"bid" : $('#bid').val()},
  	  success: function(data){
  	  }
	})
}



</script>
</body>
</html>