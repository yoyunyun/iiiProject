<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>健康優生網</title>

    <!-- Icons font CSS-->
    <link href="${pageContext.request.contextPath}/memberInsert/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/memberInsert/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="${pageContext.request.contextPath}/memberInsert/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/memberInsert/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="${pageContext.request.contextPath}/memberInsert/css/main.css" rel="stylesheet" media="all">
</head>

<body>
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">會員註冊</h2>
                </div>
                <div class="card-body">
                
                <form:form id="form1" method="POST" action="/HealthProject/displayInsertMember" modelAttribute="member" enctype="multipart/form-data" onsubmit="return checkSubBtn();">
                       
                       
                       <!-- 被看護人姓名 -->
                        <div class="form-row">
                            <div class="name">
<%--                             	<form:label path="membername">被看護人姓名:</form:label> --%>
                            	被看護人姓名:
                            </div>
                            <div class="value">
                                <div class="input-group">
<%--                                 <form:input path="membername" class="input--style-5" size="10"/> --%>
                                    <input class="input--style-5" type="text" name="company">
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- 性別 -->
                        <div class="form-row p-t-20">
<%--                        		<form:label class="label label--block" path="membergender">性別:</form:label> --%>
                            <label class="label label--block">性別:</label>
                            <div class="p-t-15">
                                <label class="radio-container m-r-55">
<%--                                 	<form:radiobutton path="membergender" value="男" label="男" /> --%>
                                    <input type="radio" name="exist">男
                                    <span class="checkmark"></span>
                                </label>
                                <label class="radio-container m-r-55">
<%--                                     <form:radiobutton path="membergender" value="女" label="女" /> --%>
                                    <input type="radio" name="exist">女
                                    <span class="checkmark"></span>
                                </label>
                                 <label class="radio-container m-r-55">
<%--                                     <form:radiobutton path="membergender" value="其他" label="其他" /> --%>
                                    <input type="radio" name="exist">其他
                                    <span class="checkmark"></span>
                                </label>
                                    <span id="genderCheck"></span>
                            </div>
                        </div>
                        
                        
						<!-- 生日日期 -->
                        <div class="form-row m-b-55">
<!--                             <div class="name"> -->
<%--                            		<form:label path="memberyear">生日日期:</form:label> --%>
<!--                             </div> -->
                            <div class="name">生日日期:</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-3">
                                        <div class="input-group-desc">
<%--                                         	<form:input class="input--style-5" path="memberyear" placeholder="70" /> --%>
                                            <input class="input--style-5" type="text" name="memberyear">
                                            <label class="label--desc">民國年</label>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="input-group-desc">
<%--                                         	<form:input class="input--style-5" path="membermonth" placeholder="7" /> --%>
                                            <input class="input--style-5" type="text" name="membermonth">
                                            <label class="label--desc">月</label>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="input-group-desc">
<%--                                         	<form:input class="input--style-5" path="membermonth" placeholder="7" /> --%>
                                            <input class="input--style-5" type="text" name="membermonth">
                                            <label class="label--desc">日</label>
                                        </div>
                                    </div>
                                    <span id="birthCheck"></span>
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- 帳號 -->
                        <div class="form-row">
<!--                         <div class="name"> -->
<%--                         	<form:label path="memberaccount">帳號:</form:label> --%>
<!--                         </div> -->
                            <div class="name">帳號</div>
                            <div class="value">
                                <div class="input-group">
<%--                                 	<form:input path="memberaccount"/> --%>
                                    <input class="input--style-5" type="text" name="memberaccount">
                                    <span id="accountCheck"></span>
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- 密碼 -->
                        <div class="form-row">
<!--                         <div class="name"> -->
<%--                         	<form:label path="memberpwd">密碼:</form:label> --%>
<!--                         </div> -->
                            <div class="name">密碼</div>
                            <div class="value">
                                <div class="input-group">
<%--                                 	<form:password path="memberpwd"/> --%>
                                    <input class="input--style-5" type="password" name="memberpwd">
                                    <span id="pwd1Check"></span>
                                </div>
                            </div>
                        </div>
									<div><input type="checkbox" id="showPwd" />顯示密碼</div>
                        
                        
                        <!-- Email -->
                        <div class="form-row">
                            <div class="name">Email</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="email" name="email">
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">Phone</div>
                            <div class="value">
                                <div class="row row-refine">
                                    <div class="col-3">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="area_code">
                                            <label class="label--desc">Area Code</label>
                                        </div>
                                    </div>
                                    <div class="col-9">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="phone">
                                            <label class="label--desc">Phone Number</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Subject</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="subject">
                                            <option disabled="disabled" selected="selected">Choose option</option>
                                            <option>Subject 1</option>
                                            <option>Subject 2</option>
                                            <option>Subject 3</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form:form>
                        <div style="display: inline-block;">
                            <button class="btn btn--radius-2 btn--red" type="submit" id="btn">送出</button>
						</div>
						<div style="display: inline-block;">
							<form action="/HealthProject" method="post">
								<button class="btn btn--radius-2 btn--red" type="submit" id="btn">取消</button>
							</form>
						</div>
                </div>
            </div>
        </div>

    <!-- Jquery JS-->
    <script src="${pageContext.request.contextPath}/memberInsert/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="${pageContext.request.contextPath}/memberInsert/vendor/select2/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/memberInsert/vendor/datepicker/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/memberInsert/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="${pageContext.request.contextPath}/memberInsert/js/global.js"></script>

</body>

</html>
