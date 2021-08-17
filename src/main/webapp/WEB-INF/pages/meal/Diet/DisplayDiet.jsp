<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<link rel="stylesheet" href="css/style2.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增食品資料</title>
</head>
<body>
<jsp:useBean id="reg_diet" class="tw.iiihealth.meal.diet.DietBean" scope="session" />

<header>

  <h2>食品資料管理</h2>
  <a class="title" href="Meals/index.jsp">營養餐管理</a> 
  <a class="title" href="Diet/indexDiet.jsp">食品資料管理</a> 
  
</header>

   <div class="btnlo">

        <form action="Diet\indexDietMenu.jsp" method="post" class="btn">
            <input type="submit" name="asubmit" value="瀏覽食品資料庫">
        </form>
        <form action="Diet\DietForm.jsp" method="post" class="btn">
            <input type="submit" name="submit" value="新增食品資料">
        </form>
        <form action="Diet\UpdateDiet.jsp" method="post" class="btn">
            <input type="submit" name="submit" value="修改食品資料">
        </form>
        <form action="Diet\DeleteDiet.jsp" method="post" class="btn">
            <input type="submit" name="submit" value="刪除食品資料">
        </form>   
        <form action="login.html" method="post" class="btn">
            <input type="submit" name="submit" value="返回登入頁面">
        </form>   
  </div>
  
  <div class="container"> 
<h3>
新增食品資料如下請確認：
</h3>
<form action=".\DietFormServlet" method="post">
<br>食品名稱：<jsp:getProperty name="reg_diet" property="name" /><br>
<br>食物分類： ${reg_diet.type}  <br>
<br>熱量(kcal)：${reg_diet.calories} <br>
<br>蛋白質：${reg_diet.protein}<br>
<br>碳水化合物(g)：${reg_diet.carbohydrates} <br>
<br>脂肪(g)：${reg_diet.fat} <br>
<br>糖(g)：${reg_diet.sugar}<br>
<br>鈉(mg)：${reg_diet.na} <br>

<br>
<input type="submit" name="confirm" value="確認" >


</form>
</div>

</body>
</html>