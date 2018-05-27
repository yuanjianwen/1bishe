<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" href="<%=path %>/css/index.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/reset.css"/>
	<link href="<%=path %>/css/qiantai.css" rel="stylesheet" type="text/css" media="screen" />

    <script type="text/javascript">
	        function myCart()
	        {
	            <c:if test="${sessionScope.userType !=2 }">
	                  alert("请先登录");
	            </c:if>
	            
	            <c:if test="${sessionScope.userType ==2 }">
	                 var s="<%=path %>/myCart.action";
	                 window.location.href=s;
	            </c:if>
	        }
	        
	        function myOrder()
	        {
	            <c:if test="${sessionScope.userType !=2 }">
	                  alert("请先登录");
	            </c:if>
	            
	            <c:if test="${sessionScope.userType ==2 }">
	                 var s="<%=path %>/myOrder.action";
	                 window.location.href=s;
	            </c:if>
	        }
	        
	        
	        function maijiaReg()
	        {
	            var url="<%=path %>/qiantai/maijia/maijiaReg.jsp";
	            window.location.href=url;
	        }
	        
	        function userReg()
	        {
	            var url="<%=path %>/qiantai/userinfo/userReg.jsp";
	            window.location.href=url;
	        }
    </script>
    
  </head>
  
  <body>
	
	
	<div class="nav">
	    <div class="nav-in w">
	        <div class="nav-in-log">
	            <img src="images/logo.png" height="90" alt="">
	        </div>
	        <div class="nav-in-r">
	            <ul id="navLan">
	                <li><a href="<%=path %>/index.action" style="font-size: 15px;font-family: 微软雅黑;">系统首页</a></li>
					<li><a href="#" onClick="maijiaReg()" style="font-size: 15px;font-family: 微软雅黑;">卖家注册</a></li>
					<li><a href="#" onClick="userReg()" style="font-size: 15px;font-family: 微软雅黑;">用户注册</a></li>
					<c:if test="${sessionScope.userType !=2 }">
					<li><a href="<%=path %>/qiantai/userinfo/userLogin.jsp" style="font-size: 15px;font-family: 微软雅黑;">用户登陆</a></li>
					</c:if>
					
					
					<c:if test="${sessionScope.userType ==2 }">
					<li><a href="#" style="font-size: 15px;font-family: 微软雅黑;">欢迎您：${sessionScope.user.userName }</a></li>
					<li><a href="<%=path %>/userLogout.action" style="font-size: 15px;font-family: 微软雅黑;">注销退出</a></li>
					<li><a href="#" onClick="myCart()" style="font-size: 15px;font-family: 微软雅黑;">我的购物车</a></li>
					<li><a href="#" onClick="myOrder()" style="font-size: 15px;font-family: 微软雅黑;">我的订单</a></li>
					</c:if>
	            </ul>
	        </div>
	    </div>
	</div>
	
	
  </body>
</html>
