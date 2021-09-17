<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
  <title>健康優生網</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
<link href="/css/styles.css" rel="stylesheet" />
        <script    src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/datatables-simple-demo.js"></script>
        <script src="/js/sweetalert2.all.min.js"></script>
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v11.0" nonce="9IolDYsC"></script>
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="https://mindmup.s3.amazonaws.com/lib/jquery.hotkeys.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.js"></script>
<link href="index.css" rel="stylesheet">
<script src="bootstrap-wysiwyg.js"></script>
<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
  <link href = "${pageContext.request.contextPath}/css/bootstrap.min.css" rel = "stylesheet" />
  <style>
  	
  	#button{
  		width:200px;
  		margin: 0 auto 20px auto;
  	}
  	
  	#myPage{
  		border-radius:10px;
  		margin:5px;
  		font-size:25px;
  		transition-duration: 0.4s;
  		border:none;
  		box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  		outline:none;

  	}
  	
  	#myPage:hover {
  		background-color: skyblue;
  		color: white;
	} 
	
	
	#cart-icon {
	  position: fixed;
	  bottom: 80px;
	  right: 10px;
	}
	
	
	#top {
	  position: fixed;
	  bottom: 170px;
	  right: 10px;
	}
	
	
	.sort{
	    position: absolute;  /*固定在網頁上不隨卷軸移動，若要隨卷軸移動用absolute*/
	    top: 118%;  /*設置垂直位置*/
	    left: -17px;  /*設置水平位置，依所放的內容多寡需要自行手動調整*/
	    background: transparent;  /*背景顏色*/
		transition-duration:1s;
	}
	
	
	.btn{
		font-size:16px;
		font-family:serif;
		border-radius:0;
	}
	
	.btn-dark{
		font-size:18px;
		font-family:serif;
	}
	
  .js-social-share {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
        -ms-flex-align: center;
            align-items: center;
    padding-left: 0;
    line-height: 1;
    list-style: none;
  }
  .js-social-share li {
    padding-right: 1rem;
    height: 22px;
  }
	 #editor {overflow:scroll; max-height:300px}
  </style>  
  
   

  
</head>
<div id="fb-root"></div>
<div id="fb-root"></div>


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
    <div class="slide-item overlay" style="background-image: url('${pageContext.request.contextPath}/images/討論.jpg')">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">留言討論區</h1>
              <p class="lead text-white mb-5">
              與其他用戶討論您所遇到的問題
              </p>
               
          </div>
        </div>
      </div>  
    </div>

        <div  class = "container">

            <div class = "text-danger" id = "descr"></div>
            <form action = "/addcomment" method = "post" class = "form">
             <br>
             <h1>留言板</h1>
            
                <input placeholder = "留言ID" name = "comment-id" id = "comment-id" type = "number"
                       class = "form-control" />
                <label for = "author">用戶名稱</label>
                <input placeholder = "留言的名稱" name = "author" id = "author" class = "form-control" />
                <label for = "aid">留言區域</label>
                <select name = "aid" id = "aid" class = "form-control form-select-button">
                    <option value = "0" selected>選擇區域</option>
                    <option value = "1">計程車專區</option>
                    <option value = "2">輔具商品專區</option>
                    <option value = "3">食品專區</option>
                </select>
                <label for = "content">留言内容</label>
                <textarea placeholder = "留言内容" rows = "3" name = "content" id = "content"
                          class = "form-control"></textarea>
               
<br>
                <button type = "button" class = "btn btn-danger" onclick = "sendComment()" id="submit">發送留言</button>
                <button type="button" class = "btn btn-danger" id="input">一鍵輸入</button>       
            </form>
            <hr>

            <h2>最新文章</h2>
            <div class = "list-group" id = "comment-list">

            </div>
        </div>
       
        
<br>

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
                        url: "/comment/all",
                        type: "post",
                        async: false,
                        dataType: "json",
                        success: function (e) {
                            var html = "";
                            if (e)
                                e.forEach(function (t) {
                                    html += '<div class="card" style="width: 70rem;">'+
                                    '<div class="card-header">'+ t.author    +
                                    '<small>    [留言ID：' + t.id + '] </small>' +
                                    '</div>'+
                                    '<ul class="list-group list-group-flush">'+
                                     '<li class="list-group-item">'+ t.content +'</li>'+
                                     '<li class="list-group-item">'+ t.time +'</li>'+
                              
                                  '</ul>'+
                                  '</div>'+
                                  '</br>'
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

            function sendComment() {
                $.ajax({
                    url: "/comment/insertComment",
                    type: "post",
                    dataType: "json",
                    async: false,
                    data: {
                        id: $("#comment-id").val() || -1,
                        aid: $("#aid").val(),
                        author: $("#author").val(),
                        content: $("#content").val(),
                    },
                    success: function (e) {
                        $("#descr").html(e.descr);
                    }
                })
                $("#aid").val(0);
                $("#content").val("");
                $("#comment-id").val("");
                getComment();
            }
            
            
</script>

    
    <!-- Footer -->


 <%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>


  </div> <!-- .site-wrap -->
<%@ include file="/WEB-INF/pages/user-js.jsp"%>

</body>
</html>