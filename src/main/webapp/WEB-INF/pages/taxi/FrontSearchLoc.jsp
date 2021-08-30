<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Elderly &mdash; Website Template by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    

<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
 

<style>
        button{
            width:75px; 
            height: 75px; 
            border-radius: 50%;
            margin:10px;
            position: relative;
            left: 1100px;
            top: -80px;
            opacity: 0.5;
            
        }
        
        .buttonshd:hover{
        	box-shadow:0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
            
        }
/*         button>#hos> :hover{ */
/*         	background-color:#46A3FF; */
/*         } */
        
        #choose{
        	position: relative;
        	left: 300px;
        	top:-30px
        }
        
        body{
        	background-image: url(/images/older1.png);
            background-repeat: no-repeat;
            background-size: 500px 500px; 
            background-position: 750px 700px;
            
/*          background-attachment: fixed;  */
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



    <div class="slide-item overlay" style="background-image: url('/images/location.jpg')">
      <div class="container">
        <div class="row justify-content-center text-center">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">醫療機構資訊</h1>
            <p class="lead text-white mb-5">提供相關醫療店家地址，包含醫院、藥局、長照中心，多個相關需求一次滿足，讓長者的生活充滿便利</p>
            <p><a href="#start" class="btn btn-primary">尋找醫療機構</a></p>
          
          </div>
        </div>
      </div>  
    </div>




<div id="start" style="margin: 20px; height:150px">
 <h4 style="position:relative; top:10px; left:50px">請選擇想搜尋的縣市:</h4> 
  <div id="choose">
   <select id="city" name="city"></select><select id="town" name="town"><option value=0>請選擇</option></select>
	</div>
	<button class="buttonshd" id="hos" style="background-color: #C4E1FF;" disabled><h4 style="margin: 2px 2px;">搜尋醫院</h4></button>
    <button class="buttonshd" id="med" style="background-color: #FFDCB9;"><h4 style="margin: 2px 2px;">搜尋藥局</h4></button>
    <button class="buttonshd" id="care" style="background-color: #E2C2DE;"><h4 style="margin: 2px 2px;">長照中心</h4></button>
</div> 
<div class="site-section" style="padding: 45px 0 90px 0">
      <div class="container" >
        <div class="row mb-5 justify-content-center">
          <div class="col-7 text-center">
            <div class="heading">
              <h2 class="text-black" id="title">醫院</h2>
            </div>
          </div>
        </div>
        
        <div class="row" id="insert" style="text-align: center">
        	<div id="pic"></div>
          </div>
          
          </div>
        </div>

    


       
<!-- site-footer bg-light -->

<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>

  </div> <!-- .site-wrap -->

  <script src="/js/jquery-3.3.1.min.js"></script>
 <%@ include file="/WEB-INF/pages/user-js.jsp"%>
<script>

var cv = $("#city").val();
var tv = $("#town").val();
var tp = "醫院";

$(document).ready(function(){
	$.getJSON('/json/taiwan_districts.json',function(data){
		var resultText='';
		resultText="<option value=0>請選擇</option>";
		for(var i=0; i<data.length; i++){
			resultText+="<option value='"+data[i].name+"'>"+data[i].name +"</option>"
		}
		
		$("#city").html(resultText);
	});

$("select[name='city']").on('change',function(){
	$.getJSON('/json/taiwan_districts.json',function(data){	
		let CN=$("select[name='city']").val();		
		for(n=0; n<data.length; n++ ){
			if(CN == data[n].name){
				var resultText2='';
				resultText2="<option value=0>請選擇</option>";
				for(var j=0; j<data[n].districts.length; j++){
					resultText2+="<option value='"+data[n].districts[j].name+"'>"+data[n].districts[j].name+"</option>"
				}
							    				
			}
		}	
		$("#town").html(resultText2);
		
	});		
});
});

$(function(){
	$("#city").on('change',function(){
		cv=this.value;
		tv=0;
		search();
	})
})
$(function(){
	$("#town").on('change',function(){
		tv=this.value;
		search();
	})
})

function search(){
        $.ajax({
        	type:'post',
     		url:'/taxiFront/queryloc/' +cv+'/'+tv+'/'+tp,
     		dataType:'JSON',
     		contentType:'application/json',
            success:function(response){
            	$("#insert").empty();
                	if(response.length == 0){
                		$("#insert").append("無此地區資料");
                		$("#insert").removeClass("row")
                	}else{
                		
                $.each(response,function(index,ele){
                	$("#insert").addClass("row")
                	$("#insert").append(
                		  
            "<div class='col-12 col-sm-6 col-md-4 mb-4'>"+
            "<div class='blog-entry'>"+
              "<a href='/taxi/search/"+(ele.id)+"' class='d-block'>" +
                "<img src='/images/hospital2.png' alt='Image' class='img-fluid'></a>"+
              "<div class='post-meta d-flex justify-content-center'>" +
                "<span>"+
                	"<span class='icon-phone'></span>" +
            	 	"<span >"+ (ele.phone)+"</span><br/>" +
                	"<span class='icon-map-marker'></span>"+
                 	"<span >"+ (ele.city)+ (ele.town)+ (ele.address) +"</span>"+
                  	
                "</span>" +
              "</div>" +
              "<h2><a href='/taxiFront/search/"+(ele.id)+"' target='_blank'>"+ (ele.store) +"</a></h2>" +
              "<p>"+ (ele.brief) + "</p>" +
            "</div>" +
          "</div>"
                 ) 
              
                })
                	}
            },
            error:function(){
                alert(`發生錯誤`)
            }
        })
}

$(function () {
	$('#hos').on('click', function () {
		tp = "醫院";
		$("#insert").empty();
		$('#title').text('醫院');
		$('#hos').prop('disabled',true)
		$('#med').prop('disabled',false)
		$('#care').prop('disabled',false)
	})
})

$(function () {
	$('#med').on('click', function () {
		tp = "藥局";
		$("#insert").empty();
		$('#title').text('藥局');
		$('#hos').prop('disabled',false)
		$('#med').prop('disabled',true)
		$('#care').prop('disabled',false)
	})
})

$(function () {
	$('#care').on('click', function () {
		tp = "長照";
		$("#insert").empty();
		$('#title').text('長照中心');
		$('#hos').prop('disabled',false)
		$('#med').prop('disabled',false)
		$('#care').prop('disabled',true)
	})
})
</script>

</body>
</html>