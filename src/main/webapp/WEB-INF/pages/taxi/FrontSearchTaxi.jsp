<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
	
<script type="text/javascript">
var indexPage = 1;
// var sear=document.querySelector('#search').val;
$(document).ready(function(){
    load(indexPage);
});

function change(page){
	
	$('#search').val("");
   		indexPage = page;
  		load(indexPage);
		
}

function load(indexPage){
	
$.ajax({
   type:'post',
   url:'/taxiFront/queryfronttaxibypage/' + indexPage,
   dataType:'JSON',
   contentType:'application/json',
   success: function(data) {
     var json = JSON.stringify(data, null, 4);
     console.log("SUCCESS : ", json);
     var parsedObjinArray = JSON.parse(json);
     $('#showproduct').empty(""); //清空table內的資料
    
       if(json=null){
         $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
       }else{
         var table = $('#showproduct');
         table.append("<tr id='ptitle'><th>編號</th><th>服務提供單位</th><th>連絡電話</th><th>地址</th><th>服務縣市</th><th>是否為長照專車</th><th/><th/></tr>");
         $.each(parsedObjinArray,function(i,n){
            var tr = "<tr align='center'>" + "<td>" + n.id + "</td>" + "<td>" + n.tname + "</td>" + 
            			"<td>" + n.phone + "</td>" +"<td>" + n.address + "</td>" + "<td>" + n.serCity + "</td>" + 
            			"<td>" + n.careTaxi + "</td>" +"<td><a href='../taxi/updateold.controller/"+n.id+"'><img src='update.png'/></a></td>" +
            			"<td><img src='delete.png'/></td>"+"</tr>";
           table.append(tr);
       });
    }
},
error: function() {
    console.log("error");
}
});
}

function query(search,indexPage){

	$.ajax({	
		   type:'get',
		   url:'/taxiFront/query/' +search+'/' +indexPage ,
		   dataType:'JSON',
		   contentType:'application/json',
		   success: function(data) {
		    var json = JSON.stringify(data, null, 4);
		    var parsedObjinArray = JSON.parse(json);
		    $('#showproduct').empty("");  //清空table內的資料
		       if(json=null){
		         $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
		       }else{
		    	   var table = $('#showproduct');
		           table.append("<tr id='ptitle'><th>編號</th><th>服務提供單位</th><th>連絡電話</th><th>地址</th><th>服務縣市</th><th>是否為長照專車</th><th/><th/></tr>");
		           $.each(parsedObjinArray,function(i,n){
		              var tr = "<tr align='center'>" + "<td>" + n.id + "</td>" +
		                       "<td>" + n.tname + "</td>" + "<td>" + n.phone + "</td>" +
		                       "<td>" + n.address + "</td>" + "<td>" + n.serCity + "</td>" +
		                       "<td>" + n.careTaxi + "</td>" +"<td><img src='update.png'/></td>" +"<td><img src='delete.png'/></td>"+"</tr>";
		             table.append(tr);
		       });
		    }
		},
		error: function() {
		    console.log("error");
		}
		});
		   }

</script> 
</head>
<body >

		<div >
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 計程車資訊
						<a href="../taxi/add.controller">新增</a>
					</div>
						<div class="card-body">	
							<div id="productListTitle">單筆查詢:
							<input id="search" type="text" >				
							<img src="a.jpg" onclick="query(document.querySelector('#search').value,1)"/>
							</div>
							<button id="showall" value="顯示所有資訊" onclick="change(1)">顯示所有資訊</button>
							<table id="showproduct" border="1">
							</table>
							<table id="showpage">
<!-- 							<tr> -->
<%-- 							<td>Total Pages:${totalPages} Total Records:${totalElement}</td> --%>
<!-- 							<td colspan="3" align="right">Previous  -->
<%-- 							<c:forEach var="i" begin="1" end="${totalPages}" step="1"> --%>
<%-- 							<button id="myPage" value="${i}" onclick="change(${i})">${i}</button> --%>
<%-- 							</c:forEach>Next --%>
<!-- 							</td> -->
<!-- 							</tr> -->
							</table>
							
						</div>
					</div>
			</main>
			
		</div>
				            		 
<%-- 		            		 "<c:forEach var='i' begin='1' end='"+${totalPages}+"' step='1'>"+ --%>
<%-- 		            		 "<button id='myPage' value='${i}' onclick='change(${i})'>${i}</button>"+ --%>
<%--  		            		 "</c:forEach>Next</tr></td>"); --%>
		
		<script src="../js/sweetalert2.all.min.js"></script>
		<script type="text/javascript">
var indexPage = 1;
// var sear=document.querySelector('#search').val;
$(document).ready(function(){
    load(indexPage);
});

function change(page){
	
	$('#search').val("");
   		indexPage = page;
  		load(indexPage);
		
}

function load(indexPage){
	
$.ajax({
   type:'post',
   url:'/taxiFront/queryfronttaxibypage/' + indexPage,
   dataType:'JSON',
   contentType:'application/json',
   success: function(data) {
     var json = JSON.stringify(data, null, 4);
     console.log("SUCCESS : ", json);
     var parsedObjinArray = JSON.parse(json);
     $('#showproduct').empty(""); //清空table內的資料
    
       if(json=null){
         $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
       }else{
         var table = $('#showproduct');
         table.append("<tr id='ptitle'><th>編號</th><th>服務提供單位</th><th>連絡電話</th><th>地址</th><th>服務縣市</th><th>是否為長照專車</th><th/><th/></tr>");
         $.each(parsedObjinArray,function(i,n){
            var tr = "<tr align='center'>" + "<td>" + n.id + "</td>" + "<td>" + n.tname + "</td>" + 
            			"<td>" + n.phone + "</td>" +"<td>" + n.address + "</td>" + "<td>" + n.serCity + "</td>" + 
            			"<td>" + n.careTaxi +"</tr>";
           table.append(tr);
       });
    }
},
error: function() {
    console.log("error");
}
});
}

function query(search,indexPage){

	$.ajax({	
		   type:'get',
		   url:'/taxiFront/queryfronttaxi/' +search+'/' +indexPage ,
		   dataType:'JSON',
		   contentType:'application/json',
		   success: function(data) {
		    var json = JSON.stringify(data, null, 4);
		    var parsedObjinArray = JSON.parse(json);
		    $('#showproduct').empty(""); //清空table內的資料
		       if(json=null){
		         $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
		       }else{
		    	   var table1 = $('#showproduct');
		           table1.append("<tr id='ptitle'><th>編號</th><th>服務提供單位</th><th>連絡電話</th><th>地址</th><th>服務縣市</th><th>是否為長照專車</th><th/><th/></tr>");
		           $.each(parsedObjinArray,function(i,n){
		              var tr = "<tr align='center'>" + "<td>" + n.id + "</td>" +
		                       "<td>" + n.tname + "</td>" + "<td>" + n.phone + "</td>" +
		                       "<td>" + n.address + "</td>" + "<td>" + n.serCity + "</td>" +
		                       "<td>" + n.careTaxi +"</tr>";
		             table1.append(tr);
		       });
		             
		             var table2 = $('#showpage');
		             table2.append("<tr><td>Total Pages:${totalPages} Total Records:${totalElement}</td>"+
		            		 "<td colspan='3' align='right'>Previous"+
		            		 "<div class='pagebutton'></div>");
		             var page ="${totalPages}";
// 		             var button = $(".pagebutton");
					 
		             $(".pagebutton").each(function(){
		            	 
		            	for (i=1;i<3;i++){
		             	$(this).append("<button value='"+i+"' onclick='change("+i+")'>"+i+"</button>");
		            	}
		             	table2.append("Next</td></tr>");
		             })
		            		
		             
						
		    }
		},
		error: function() {
		    console.log("error");
		}
		});
		   }

</script> 
		<script>
	function check(id){
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
		    document.getElementById("delT"+id).submit();
		  }
		})
	}
	</script>
	
</body>
</html>