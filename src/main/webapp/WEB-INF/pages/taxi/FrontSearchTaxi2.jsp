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

    <div class="slide-item overlay" style="background-image: url('images/slider-2.jpg')">
      <div class="container">
        <div class="row justify-content-center text-center">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">便利專區</h1>
            <p class="lead text-white">提供叫車資訊、長照專車、以及相關醫療店家地址，多個生活需求一次滿足，讓長者的生活充滿便利</p>
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
              <table id="example" class="display" style="width:100%">
                <thead>
                  <tr>
                    <th>編號</th>
                    <th>服務提供單位</th>
                    <th>連絡電話</th>
                    <th>地址</th>
                    <th>服務縣市</th>
                    <th>是否為長照專車</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>編號</th>
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
  var city=[];
  $("#city").on('change', function search(){
  	$.ajax({
     		type:'post',
     		url:'/taxiFront/queryfronttaxi/' +this.value,
     		dataType:'JSON',
     		contentType:'application/json',
     		success: function(data) {	   		
  	   		city=[];
  	   		for(var i in data){
  		   		var obj= Object.values(data[i])
  		   		city.push(obj);
  	   		}
  			$('#example').DataTable().clear().rows.add(city).draw();
  	   		
     		}
  	});

  });


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

  function load(){
  	
  $('#example').DataTable({
      "ajax": {
              "url": '/taxiFront/queryalltest',
              "type": 'post',   	
              "dataSrc": function (data) {
              	city=[];
      	   		for(var i in data){
      		   		var obj= Object.values(data[i])
      		   		city.push(obj);
      	   		}
      		   	return city;
               }  
      }   
  });
  }
 
</script>

</body>

</html>