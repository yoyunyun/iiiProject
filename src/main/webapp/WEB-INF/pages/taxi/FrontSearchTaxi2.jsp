<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Elderly &mdash; Website Template by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 <%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">

  <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
<style>
        .win td {
            padding: 5px;
        }

        .tex {
            margin: 5px;
        }

        .win tbody :hover {
            background-color: #E0E0E0;
        }

        button:hover {
            background-color: #E0E0E0;
        }
        
    </style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


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

	<%@ include file="/WEB-INF/pages/user-header.jsp"%>

    <!-- MAIN -->
    <!-- 跳出視窗開始 -->
    <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog" style="max-width: 800px; ">
                <!-- Modal content-->
                <div class="modal-content" style="border-radius: 30%;">
                    <div style="background-color: #FFFCEC;border-radius: 20px 20px 0 0;">
                        
                        <h3 class="modal-title" style="text-align: center; font-family: Verdana, Geneva, Tahoma, sans-serif;font-style: italic;text-decoration: underline; margin:20px">
                        <img src="/images/movemovetaxi.gif" style="max-width: 50px;margin:10px">預約叫車表單<img src="/images/movemovetaxi.gif" style="max-width: 50px;margin:10px"></h3>
                   		
                    <table style="margin:auto" class="win">
                        <tr>
                        <td style=" font-weight: 800;font-size:20px;">預約叫車單位:</td>
                        <td><span id="taxi" style=" font-weight: 800;font-size:20px;"></span></td>
                        <td></td>
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
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option selected>8</option>
                            <option>9</option>
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
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="yes()">確定預約</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancel()"
                        onkeypress="cancel()">取消預約</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="inputdata">一鍵輸入</button>
                    </div>
                </div>
                
                
            </div>
        </div>
<!-- 跳出視窗結束 -->
    <div class="slide-item overlay" style="background-image: url('/images/Taxi.jpg')">
      <div class="container">
        <div class="row" style="top: 300px">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">計程車資訊</h1>
            <p class="lead text-white">提供多家計程車資訊，不管是跨縣市還是長照專車，均可透過平台搜尋</p>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container" >
        <div class="row">
          <div  style="margin: 0 auto; width:100% ">
          <div>
            請選擇服務縣市: <select id="city" name="city"></select>
			</div>          
              <table id="example" class="display" style="width:100%;text-align: center;">
                <thead>
                  <tr>
                  	<th>點我預約</th>
<!--                     <th>編號</th> -->
                    <th>服務提供單位</th>
                    <th>連絡電話</th>
                    <th>地址</th>
                    <th>服務縣市</th>
                    <th>是否為長照專車</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                  	<th>預約叫車</th>
<!--                     <th>編號</th> -->
                    <th>服務提供單位</th>
                    <th>連絡電話</th>
                    <th>地址</th>
                    <th>服務縣市</th>
                    <th>是否為長照專車</th>
                  </tr>
                </tfoot>
              </table>
          </div>
        </div>
      </div>
    </div>
    

   <!-- site-footer bg-light --> 
<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>
  

  <!-- <script src="js/jquery-3.3.1.min.js"></script> -->
 <%@ include file="/WEB-INF/pages/user-js.jsp"%>
 
  <script>
  //搜尋縣市
  $("#city").on('change', function search(){
  	$.ajax({
     		type:'post',
     		url:'/taxiFront/queryfronttaxi/' +this.value,
     		dataType:'JSON',
     		contentType:'application/json',
     		success: function(data) {	   
     				$('#example').DataTable().clear().rows.add(data).draw();
     				$(".img2").on('click',imgClick);
     		}
  	});
 
  });

//起始點
  $(document).ready(function () {
  	load();
      $.getJSON('/json/taiwan_districts.json', function (data) {
          var resultText = '';
          resultText = "<option value=1>所有縣市</option>";
          for (var i = 0; i < data.length; i++) {
              resultText += "<option value='" + data[i].name + "'/>" + data[i].name
          }
          $("#city").html(resultText);
      });
      
  });

//插入計程車資訊
  function load(){
	  $('#example').DataTable({
		    "ajax": {
		            "url": '/taxiFront/queryalltest',
		            "type": 'post',   	
		            "dataSrc": function (test) {
		                 return test;
		             }  
		    },   
		    "columns": [


		        {
 				//column加入叫車圖示
		        	"data": null,
		        	render:function(data, type, row)
		            {
		              return '<input type="image" class="img2" title="點此預約" src="/images/movemovetaxi.gif" style="width:35px; " value="'+ data["tname"] +'"/>';
		            },
		            "targets": -1
		        },

		        { "data": "tname" },
		        { "data": "phone" },
		        { "data": "address" },
		        { "data": "serCity" },
		        { "data": "careTaxi" },
		    ] 
		});
	  
	setTimeout(()=>{
		$(".img2").on('click',imgClick);
	},500)
	
  }

//點擊叫出跳出頁面
  function imgClick() {
		$('#taxi').text(this.value); 
		show();
	}
 
  
</script>
 <!-- 跳出視窗function -->
 <script>
//         $(document).ready(function () {
//             var valueNum = window.sessionStorage.userdata;
//             if (valueNum != "1") {
//                 $("#myModal").modal('show');
//             }
//         });
        function cancel() {
//             window.sessionStorage.userdata = "1";
            $("#myModal").modal('hide');
        }
        function show() {
//             window.sessionStorage.userdata = "0";
            $("#myModal").modal('show');
            
        }

        //一鍵輸入
        $('#inputdata').click(function() {
          $('#loc').val("林口長庚醫院"); 
          $('#hour').val(10);
          $('#min').val(30);
          $('#passanger').val("李大雄");
          $('#tel').val("0958779623");
          $('#mail').val("iiieeit12907@gmail.com");
        
        });
        
        
        
        //Sweetalert
        function yes(){
        	Swal.fire({
        		  title: '<img src="/images/takicab-taxi-call.gif">',
        		  showConfirmButton: false,
        		  timer: 3250
        		}).then(()=> {Swal.fire({
        		  icon: 'success',
        		  title: '預約成功!',
        		  showConfirmButton: false,
        		  timer: 1500
        		})}).then(()=>{
        			cancel();
        			
        		})
        	$.ajax({
			  url: "/taxiFront/booktaxi",
			  type: "post",
			  data:  { "mail" : $('#mail').val() ,"passanger" : $('#passanger').val() },
		  	  success: function(data){
		  		console.log(data);  	
		  	  }
		})
        }
    </script>
</body>

</html>