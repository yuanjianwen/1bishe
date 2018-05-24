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
    
    <script language="javascript">
            function back1()
	        {
	           window.history.go(-1);
	        }
	        
	        function dd()
	        {
	            var odderFukuangfangshi=document.f.odderFukuangfangshi.value;
	            //alert(odderFukuangfangshi);
	            if(odderFukuangfangshi=="银行付款")
	            {
	                 document.getElementById("qufukuan").style.display="block";
	            }
	            if(odderFukuangfangshi=="货到付款")
	            {
	                 document.getElementById("qufukuan").style.display="none";
	            }
	        }
	        
	        function kahao()
	        {
	            var strUrl = "<%=path %>/qiantai/order/kahao.jsp";
				var ret = window.showModalDialog(strUrl,"","dialogWidth:700px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
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
						<!-- <h2 class="title"><a href="#">订单</a></h2> -->
						<div class="entry">
						    <form action="<%=path %>/orderSubmit.action" name="f" method="post">
		                        <table width="99%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">收货人帐号：</td>
					                  <td width="80%" align="left">
					                      <input type="text" readonly="readonly" value="<s:property value="#session.user.userName"/>"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">收货人姓名：</td>
					                  <td width="80%" align="left">
					                      <input type="text" readonly="readonly" value="<s:property value="#session.user.userRealname"/>"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">收货人联系电话：</td>
					                  <td width="80%" align="left">
					                      <input type="text" readonly="readonly" value="<s:property value="#session.user.userTel"/>"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">送货地址：</td>
					                  <td width="80%" align="left"><input type="text" name="odderSonghuodizhi" value="<s:property value="#session.user.userAddress"/>"/></td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">付款方式：</td>
					                  <td width="80%" align="left">
		   		                          <select name="odderFukuangfangshi" style="width:155px;" onchange="dd()">
		   		                               <option value="货到付款">货到付款</option>
		   		                               <option value="银行付款">银行付款</option>
		   		                          </select>
		   		                          <input type="button" onclick="kahao()" id="qufukuan" style="display: none" value="查看卡号"/>
		                              </td>
					              </tr>
		        				</table>
		        				<table>
		        				   <tr><td style="height: 30px;"></td></tr>
				                   <tr>
				                       <td><a href="#" onclick="back1()" style="font-family: 微软雅黑;font-size: 18px;">返回修改</a></td>
				                       <td style="width: 20px;">&nbsp;</td>
				                       <td><a href="#" onclick="javascript:document.f.submit();" style="font-family: 微软雅黑;font-size: 18px;"/>提交订单</a></td>
				                   </tr>
				               </table>
				            </form>
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
