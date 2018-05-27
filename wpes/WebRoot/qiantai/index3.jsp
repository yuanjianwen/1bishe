<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	<link rel="stylesheet" href="css/index.css" type="text/css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link href="<%=path %>/css/qiantai.css" rel="stylesheet" type="text/css" media="screen" />
    
    <style type="text/css">
         #bg{ display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  background-color: black;  z-index:1001;  -moz-opacity: 0.7;  opacity:.70;  filter: alpha(opacity=70);}
         #show{display: none;  position: absolute;  top: 25%;  left: 22%;  width: 53%;  height: 49%;  padding: 8px;  border: 8px solid #E8E9F7;  background-color: white;  z-index:1002;  overflow: auto;}
    </style>
    
    <script type="text/javascript">
         function showdiv() 
         {            
             document.getElementById("bg").style.display = "block";
             document.getElementById("show").style.display = "block";
         }
         function hidediv() 
         {
             document.getElementById("bg").style.display = 'none';
             document.getElementById("show").style.display = 'none';
         }
         
         //setTimeout(showdiv,200);
    </script>
  </head>
  
  <body>
	<jsp:include flush="true" page="/qiantai/inc/top.jsp"></jsp:include>
	
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="content">
					<div class="post">
						<!-- <h2 class="title"><a href="#">物品展示</a></h2> -->
						<div class="entry">
						    <table cellspacing="3" cellpadding="3" align="left">
						          <tr>
						               <c:forEach items="${requestScope.goodsNoTejiaList}" var="goods" varStatus="sta">
						                  <c:if test="${sta.index%3==0}">
						                     </tr><tr>
						                  </c:if>
						                  <td align="center">
											   <a href="<%=path %>/goodsDetailQian.action?goodsId=${goods.goodsId }">  
											      <img width="180" height="190" src="<%=path %>/${goods.goodsPic }" style="border:1px solid #ccc; padding:3px;"/>
											   </a>
											   <br/>
						                       ${goods.goodsName }
						                  </td>
						               </c:forEach>
						          </tr>
							</table>
						</div>
					</div>
				    <div style="clear: both;">&nbsp;</div>
		        </div>
				<jsp:include flush="true" page="/qiantai/inc/right.jsp"></jsp:include>
				<div style="clear: both;">&nbsp;</div>	
		    </div>
		</div>
	</div>
	
	
	
	<div id="footer-wrapper">
		<div id="footer">
			<p>Copyright (c) 2016 Sitename.com. All rights reserved. Design by <a href="<%=path %>/login.jsp">系统管理员登陆</a>.</p>
		</div>
	</div>
	
	
	<div id="bg"></div>
    <div id="show">
     <a href="#">随机推荐</a>
     <a href="#" onclick="hidediv();">关闭</a>
     <br/>
     <table cellspacing="3" cellpadding="3" align="left">
						          <tr>
						               <c:forEach items="${requestScope.tuijianList}" var="goods" varStatus="sta">
						                  <c:if test="${sta.index%4==0}">
						                     </tr><tr>
						                  </c:if>
						                  <td align="center">
											   <a href="<%=path %>/goodsDetailQian.action?goodsId=${goods.goodsId }">  
											      <img width="150" height="150" src="<%=path %>/${goods.goodsPic }" style="border:1px solid #ccc; padding:3px;"/>
											   </a>
											   <br/>
						                       ${goods.goodsName }
						                  </td>
						               </c:forEach>
						          </tr>
							</table>							          
  </div>
  </body>
</html>
