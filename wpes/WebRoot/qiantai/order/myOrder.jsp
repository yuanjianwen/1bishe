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
	
    <link href="<%=path %>/css/qiantai.css" rel="stylesheet" type="text/css" media="screen" />
    
    <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	<script type="text/javascript">
        function orderDel(orderId)
        {
            var url="<%=path %>/orderDel.action?orderId="+orderId;
            window.location.href=url;
        }
        
        function orderDetail(orderId)
        {
                 var url="<%=path %>/orderDetail.action?orderId="+orderId;
                 var n="";
                 var w="800px";
                 var h="400px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
			     openWin(url,n,w,h,s);
        }
    </script>
    
  </head>
  
  <body>
	<jsp:include flush="true" page="/qiantai/inc/top.jsp"></jsp:include>
	
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="content">
					<!-- <div class="post">
						<h2 class="title"><a href="#">企业介绍</a></h2>
						<p class="meta">我们企业在青岛市</p>
						<div class="entry">
							<p>订单嘎嘎嘎嘎嘎嘎嘎嘎嘎个te designed by FreeCssTemplree template is rse, so you’re prd you keep the links in the footer intact. Aside from that, have fun wi</p>
							<p>Sibus semper urna. Pellentesque ornare, orci in felis. Donec ut ante. In id eros. Suspendisse lacus turpis, cursus egestas at sem.</p>
						</div>
					</div> -->
					<div class="post">
						<!-- <h2 class="title"><a href="#">我的订单</a></h2> -->
						<div class="entry">
						    <table width="99%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
				                <tr align="center" bgcolor="#FAFAF1" height="22">
					                  <td>订单编号</td>
					                  <td>金额</td>
					                  <td>下单日期</td>
					                  <td>编辑</td>
				                </tr>
							    <s:iterator value="#request.orderList" id="order">
							    <tr align='center' bgcolor="#FFFFFF" height="22">
									  <td>
										<s:property value="#order.orderBianhao"/>
									  </td>
									  <td>￥<s:property value="#order.orderJine"/><br/></td>
									  <td><s:property value="#order.orderDate"/></td>
									  <td>
									      <a href="#" onclick="orderDetail(<s:property value="#order.orderId"/>)">订单明细</a>
									      &nbsp;&nbsp;
									      <a href="#" onclick="orderDel(<s:property value="#order.orderId"/>)">删除</a>
									  </td>
							    </tr>
							    </s:iterator>
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
  </body>
</html>
