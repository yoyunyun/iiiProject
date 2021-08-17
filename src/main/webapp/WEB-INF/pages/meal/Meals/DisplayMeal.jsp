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
<title>新增餐點</title>
</head>
<body>
<jsp:useBean id="reg_meal" class="tw.iiihealth.meal.meals.MealBean" scope="session" />

<header>

  <h2>營養餐管理</h2>
  <a class="title" href="mealIndex.controller">營養餐管理</a> 
  <a class="title" href="dietIndex.controller">食品資料管理</a> 
  
</header>
  
  <div class="btnlo">

        <form action="mealView.controller" method="get" class="btn">
            <input type="submit" name="asubmit" value="瀏覽菜單">
        </form>
        <form action="mealCreate.controller" method="get" class="btn">
            <input type="submit" name="submit" value="新增餐點">
        </form>
        <form action="mealUpdate.controller" method="get" class="btn">
            <input type="submit" name="submit" value="修改餐點">
        </form>
        <form action="mealDelete.controller" method="get" class="btn">
            <input type="submit" name="submit" value="刪除餐點">
        </form>
        <form action="login.html" method="post" class="btn">
            <input type="submit" name="submit" value="返回登入頁面">
        </form>   
   
  </div>
  
  <div class="container">

<h3>
新增餐點資料如下請確認：
</h3>
<form action=".\MealFormServlet" method="post">
<br>餐點名稱：<jsp:getProperty name="reg_meal" property="name" /><br>
<br>價格($NT)： ${reg_meal.price}  <br>
<br>主原料：${reg_meal.material} <br>
<br>熱量(kcal)：${reg_meal.calories} <br>
<br>蛋白質(g)：${reg_meal.protein}<br>
<br>碳水化合物(g)：${reg_meal.carbohydrates} <br>
<br>脂肪(g)：${reg_meal.fat} <br>
<br>商店編號：${reg_meal.store_ID}<br>

<br>
<input type="submit" name="confirm" value="確認新增" >


</form>

</div>
</body>
</html>