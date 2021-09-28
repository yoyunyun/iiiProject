<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>健康悠生網</title>


<style>
a.disabled {
 	pointer-events: none;
 	cursor: default;
 } 
</style>

<link href="/css/styles.css" rel="stylesheet" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/js/datatables-simple-demo.js"></script>


<!-- js for datatables -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.0/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.0/js/dataTables.bootstrap5.min.js"></script>
	
<!-- js for modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script> 
<script
	src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
<script
	src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap5.min.js"></script>


<!-- css for sweet alert2  -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>




<!-- css for datatables  -->
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
		<link rel="stylesheet"
			href="https://cdn.datatables.net/1.11.0/css/dataTables.bootstrap5.min.css">
			
			
<!-- css for modal -->			
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
		<link rel="stylesheet"
			href="https://cdn.datatables.net/1.11.0/css/dataTables.bootstrap5.min.css">
		<link rel="stylesheet"
			href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap5.min.css">

</head>





<body class="sb-nav-fixed">



<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>
		
		
		
		
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">會員系統</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">管理者介面</li>
					</ol>




				<!-- 表單總覽 -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 管理者資料表
						</div>
						
						<div class="card-body">
							<table id="managerTable" class="table table-striped table-bordered nowrap" style="width:100%">
								<thead>
									<tr>
										<th>管理者編號</th>
										<th>管理者姓名</th>
										<th>權限</th>
										<th>性別</th>
										<th>民國年</th>
										<th>月</th>
										<th>日</th>
										<th>帳號</th>
										<th>E-mail</th>
										<th>功能</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
					</div>
					
					
					
			<!-- "修改表單"的互動視窗 Modal -->
					<div class="modal fade" tabindex="-1" role="dialog"
						id="updateMtoMShow">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">修改會員資料</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close">
									</button>
								</div>
							<div class="modal-body">
								<form:form id="updateForm" modelAttribute="manager" enctype="multipart/form-data">
									<table class="table  table-hover">
										<tr>
											<td><form:label path="managername">被看護人姓名:</form:label></td>
											<td>
												<form:hidden path="managerid" value="${manager.managerid}" /> 
												<form:hidden path="manageraccount" value="${manager.manageraccount}" />
												<form:hidden path="manageremail" value="${manager.manageremail}" />
												<form:hidden path="role" value="${manager.role}" /> 
												<form:hidden path="disabled" value="${manager.disabled}" /> 
												<form:hidden path="verificationCode" value="${manager.verificationCode}" />
												<form:hidden path="accountExpired" value="${manager.accountExpired}" />
												<form:hidden path="accountLocked" value="${manager.accountLocked}" /> 
												<form:hidden path="credentialsExpired" value="${manager.credentialsExpired}" /> 
												<form:input path="managername" size="10" placeholder="例如:王衍申" autofocus="autofocus" /> 
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td><form:label path="managergender">性別:</form:label></td>
											<td><form:radiobutton path="managergender" value="男" label="男" /> 
											<form:radiobutton path="managergender" value="女" label="女" /> 
											<form:radiobutton id="other" path="managergender" value="其他" label="其他" /> 
											<span id="genderCheck"></span></td>
										</tr>
										<tr>
											<td><form:label path="manageryear">生日日期:</form:label></td>
											<td>
												 民國 <form:input path="manageryear" maxlength="3" size="3" placeholder="70" />
												  年 <form:input path="managermonth" maxlength="2" size="2" placeholder="7" />
												  月 <form:input path="managerday" maxlength="2" size="2" placeholder="7" />
												  日 <span id="birthCheck"></span>
											</td>
										</tr>
										<tr>
											<td>帳號:</td>
											<td id="accountdisplay"></td>
										</tr>
										<tr>
											<td><form:label path="managerpwd">密碼:</form:label></td>
											<td>
												<form:password path="managerpwd" maxlength="15" size="15" />
												<span id="pwd1Check"></span><br>
												<input type="checkbox" id="showPwd" />顯示密碼
											</td>
										</tr>
										<tr>
											<td>E-mail:</td>
											<td id="emaildisplay"></td>
										</tr>
									</table>
								</form:form>
								</div>
								<div class="modal-footer">
								<button type="button" class="btn btn-default" data-bs-dismiss="modal">關閉</button>
								<button id="updateSubmit" type="button" data-bs-dismiss="modal" class="btn btn-primary">確認修改</button>
								<button id="onekey" type="button" class="btn btn-primary">一鍵輸入</button>
								</div>
							</div>
						<!-- /.modal-content -->
						</div>
					<!-- /.modal-dialog -->
					</div>
				<!-- /.modal -->




					</div></main>
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
	
	
	
<script type="text/javascript">
//一鍵輸入
$('#onekey').on('click', function(){
	$('#membername').val('張美麗');
	$('#other').prop('checked',true)
	$('#memberyear').val('48');
	$('#membermonth').val('11');
	$('#memberday').val('12');
	$('#memberpwd').val('asdf1234');
	$('#pwd2').val('asdf1234');
	$('#memberphone').val('0987651822');
	$('#yesD').prop('checked',true)
})


    //顯示密碼
    document.getElementById("showPwd").onclick=showPwd;
        function showPwd(){
            let pwdType=document.getElementById("managerpwd").type;
            //pwdType現在是密碼的話，就轉成文字顯示
            if(pwdType === "password"){
                document.getElementById("managerpwd").type="text";
                document.getElementById("pwd2").type="text";
                //pwdType現在是文字的話，就轉回密碼來不顯示
            }else{
                document.getElementById("managerpwd").type="password";
                document.getElementById("pwd2").type="password";
            }
        }
</script>
	
	
	
	
	<script>

		var table;
		$(function () {
			createdatatable();
		});
		
		//datatable 
		function createdatatable() {
			table = $("#managerTable").DataTable({
				responsive: true,
				
				ajax:{
					url: "/Manager/searchAllRestManagerAction.controller",
					dataSrc: ""
				},

				rowId: "managerid",
				
				columns:[					
					{data: "managerid"},
					{data: "managername"},
					{data: "role"},
					{data: "managergender"},
					{data: "manageryear"},
					{data: "managermonth"},
					{data: "managerday"},
					{data: "manageraccount"},
					{data: "manageremail"},
					{data: "managerid"},
// 					{
//                         //這裡的data變數值為sysid，相等於row.sysid
//                         data: "formId",//資料行繫結屬性
//                         orderable: false, // 禁用排序
//                         render: function (data) { 
//                            //row指的是資料列物件 data變數相等於row.sysid
//                             return "<input type='button' onclick='editModal(" + data + ")'  value='Edit' />"
//                                 + "<input type='button' onclick='deleteModal(" + data + ")'  value='Delete' />";
//                         }
// 					}
				],
				
				
				columnDefs:[{
					targets: 9,
					orderable: false, // 禁用排序
					defaultContent: "",
					render: function (data) {
// 						return '<button id="' + data + '" onclick="editModal(this.id)"  data-bs-dismiss="modal" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i>修改</button>' 
// 						+ '<button id="' + data + '" onclick="deleteModal(this.id)"  data-bs-dismiss="modal" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i>刪除</button>';

						return '<input type="image" id="' + data + '" onclick="editModal(this.id)"  data-bs-dismiss="modal" src="${pageContext.request.contextPath}/images/update.jpg">' 
						+ '<input type="image" id="' + data + '" onclick="deleteModal(this.id)"  data-bs-dismiss="modal" src="${pageContext.request.contextPath}/images/delete.png">';
					}
				}],

// 				initComplete: function () {
// 						console.log("table created");
// 						$(".btn-info").on("click", function (e) {
// 							console.log("button clicked");
// 							console.log(e.target.id);
// 							editModal(e.target.id)});						
// 						$(".btn-danger").on("click", function (e) {
// 							console.log("button clicked2");
// 							deleteModal(e.target.id)});
// 				},
				
        responsive: {
            details: {
                display: $.fn.dataTable.Responsive.display.modal( {
                    header: function ( row ) {
                        var data = row.data();
                        return '';
                    }
                } ),
                renderer: $.fn.dataTable.Responsive.renderer.tableAll( {
                    tableClass: 'table'
                } )
            }
        },
				
	})
}
		
		
// 		// "新增"按鈕叫出 Modal
// 		$('#addTestdriveButton').click(function (e) {
// 			e.preventDefault();
// 			$('#addTestdriveModal').modal('show');
// 		})		
		
		// 1送出前總檢查 2一鍵輸入  3送出  寫在 adminTestdrive.js裡
		
		
		// "修改"按鈕抓出資料，叫出 Modal
		function editModal(memberid) {
			$('#updateForm')[0].reset();
			let fillWithOrigin = function (res) {
				$("#managerid").val(res.managerid);
				$("#managername").val(res.managername);
				$("[name=managergender]").val([res.managergender]);
				$("#manageryear").val(res.manageryear);
				$("#managermonth").val(res.managermonth);
				$("#managerday").val(res.managerday);
				$("#manageraccount").val(res.manageraccount);
				$("#accountdisplay").html(res.manageraccount);
				$("#manageremail").val(res.manageremail);
				$("#emaildisplay").val(res.manageremail);
				$("#verificationCode").val(res.verificationCode);
				$("#role").val(res.role);
				$("#disabled").val(res.disabled);
				$("#accountExpired").val(res.accountExpired);
				$("#accountLocked").val(res.accountLocked);
				$("#credentialsExpired").val(res.credentialsExpired);
			}

			findById(managerid, fillWithOrigin)
			$('#updateMtoMShow').modal('show');
			$('#updateMtoMShow').css('overflow-y', 'auto');

		}			
				
		// 啟用"修改"按鈕前置準備，尋找單筆
		function findById(managerid, fillWithOrigin) {
			$.ajax({
				url: "/Manager/searchOneManagerAction.controller/" + managerid,
				method: "GET",
				dataType: "json",
				success: function (res) {
					fillWithOrigin(res)
				},
				error: function (err) {
					alert(err)
				}
			});
		}		
		
		// "確認修改"按鈕，儲存資料
		$("#updateSubmit").click(
			function () {
				var updateFormData = new FormData($('#updateForm')[0]);
				$.ajax({
					url: "/Manager/updateManagerAction.controller",
					method: "POST",
					data: updateFormData,
					contentType: false,
					processData: false,
					success: function (res) {
						$("#updateForm")[0].reset();   // 修改的彈出model清空
						table.ajax.reload();     // data table刷新
					},
					error: function (err) {
						alert('更新失敗' + err);
					}
				});

			})

		
		

		// "刪除"按鈕按下後執行
		function deleteModal(managerid) {
			console.log('delete id=' + managerid);
			Swal.fire({
				title: '確定要刪除?',
				text: "刪除後，資料將不再存在",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '是',
				cancelButtonText: '否'
			}).then((torf) => {
				if (torf.isConfirmed) {
					$.ajax({
						url: "/Manager/deleteMtoMAction.controller/" + managerid,
						method: "POST",
						dataType: "json",
						success: function (res) {
							console.log('恭喜您成功刪除');
							table.ajax.reload();
						},
						error: function (err) {
							alert('刪除失敗' +err)
						}
					});
					Swal.fire(
						'刪除',
						'此筆紀錄已被刪除',
						'成功'
					)
				}
			})
		}
				

				
	</script>
	

</body>
</html>