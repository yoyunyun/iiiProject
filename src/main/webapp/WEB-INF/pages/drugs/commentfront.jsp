<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
  <title>健康悠生網</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    

  <%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
  
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
 
 
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
  </div>
    
  <%@ include file="/WEB-INF/pages/user-header.jsp"%>


    <!-- MAIN -->
   <div class="slide-item overlay" style="background-image: url('${pageContext.request.contextPath}/images/slider-2.jpg')">
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



<div id="layoutSidenav_content">
		<main>
				<div class="card-header" style="margin-bottom:25px;">
					<i class="fas fa-table me-1"></i> 會員系統
				</div>
				
				
				<!-- 第一列 -->
				<div class=row  style="margin-bottom:30px">
				<div class="col-md-2"></div>
				<div class="col-md-9" style="margin: 0 auto;">
				
				</div>
				<div class="col-md-1"></div>
				
				</div>
				
				
				<!-- 第二列 -->
				<div class="row" style="margin-bottom:100px">
				
				<div class="col-md-2">
					<!-- 會員資料索引 -->	
					<div class="sort btn-group-vertical">
						<span class="btn btn-dark btn-lg" style="font-size:20px; display: flex; align-items: center;" class="btn btn-outline-secondary btn-lg">會員資料索引</span>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="/Member/updateMember">修改個人資料</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="/Member/updateMemberAP">修改密碼</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="#">健康資料表</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="${pageContext.request.contextPath}/cart/order">會員訂單</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="${pageContext.request.contextPath}/cart/showcollect">會員收藏</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="#">會員留言</a>
					</div>
				</div>

						<div class="col-md-9" style="margin: 0 auto;">
						<h2>會員文章</h2>
            <div class = "list-group" id = "comment-list">

            </div>
						
		
       
				</div>
				<div class="col-md-1"></div>
			</div>
		</main>
	</div>
  
     <script src = "/js/jquery-3.6.0.js"></script>
       <script src = "/js/bootstrap.min.js"></script>
      

        <script>
    
        
        $("#input").click(function(){
	    	$("#author").val("林羽墨");
	    	$("#aid").val("1");
	    	$("#content").val("司機很友善,到達快速");
	    })
	    
            function getComment() {
                $.ajax({
                        url: "/comment/front",
                        type: "post",
                        async: false,
                        dataType: "json",
                        success: function (e) {
                            var html = "";
                            if (e)
                                e.forEach(function (t) {
                                    html += '<div class="card" style="width: 70rem;">'+
                                    '<div class="card-header">'+ t.author +
                                    '<small> [留言ID：' + t.id + ']: [文章aId: '+ t.aid + ']: </small>' +
                                    '</div>'+
                                    '<ul class="list-group list-group-flush">'+
                                     '<li class="list-group-item">'+ t.content +'</li>'+
                                     '<li class="list-group-item">'+ t.time +'</li>'+
                                      
                                  '</ul>'+
                                  '</div>'+
                                  '<br>'
                                })
                            $("#comment-list").html(html);
                        },
                        error: function (e) {
                            html+= '最後一頁';
                        }
                        ,
                    }
                )
            }

            getComment();

        </script>
  
  
  
  
  <!-- Footer -->
    
  <%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>


  <%@ include file="/WEB-INF/pages/user-js.jsp"%>
	
  	
 
  <script>
  $(".delete").each(function(){
		
		var id = $(this).attr("id")
			
		$(document).on('click', "#"+ id, function() { 

			Swal.fire({
				  title: '確定刪除?',
				  text: "資料無法復原!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '刪除!',
				  cancelButtonText: '取消'
				}).then((result) => {
				  if (result.isConfirmed) {
					  
					$.ajax({
						  url: "/cart/deleteCollect",
						  type: "post",
						  data:  {
							  "eId" : id
						  },
					  	  success: function(data){
					  		 
					  		console.log(data);  
					  		 
					  		$("#"+ id).closest("tr").remove();
					  		
					  		
					  		Swal.fire({
					  		  position: 'top',
					  		  icon: 'success',
					  		  title: '資料已刪除',
					  		  showConfirmButton: false,
					  		  timer: 1500
					  		})
							  
					  	
						 }

					  })       
					   
				  }
			 })

		})

	})	
  
  
  
  </script>
</body>
</html>