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
        function buy1()
        {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            <s:else>
                 document.buy.submit();
            </s:else>
        }
        
        function pingjiaAll(goodsId)
        {
            var strUrl = "<%=path %>/pingjiaAll.action?goodsId="+goodsId;
            var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:300px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
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
						<p class="meta">澳门科技大学</p>
						<div class="entry">
							<p>订单嘎嘎嘎嘎嘎嘎嘎嘎嘎个te designed by FreeCssTemplree template is rse, so you’re prd you keep the links in the footer intact. Aside from that, have fun wi</p>
							<p>Sibus semper urna. Pellentesque ornare, orci in felis. Donec ut ante. In id eros. Suspendisse lacus turpis, cursus egestas at sem.</p>
						</div>
					</div> -->
					<div class="post">
						<!-- <h2 class="title"><a href="#">物品详细信息</a></h2> -->
						<div class="entry">
						    <form action="<%=path %>/addToCart.action" method="post" name="buy">
								<table width="100%" border="0">
								    <tr>
								       <td align="left"><img style="border:1px solid #ccc; padding:3px;" src="<%=path %>/<s:property value="#request.goods.goodsPic"/>" width="350" height="230"/><hr/></td>
								    </tr>
								    <tr>
								       <td align="left">物品名称：<s:property value="#request.goods.goodsName"/><hr/></td>
								    </tr>
								    <!-- <tr>
								       <td align="left">卖家信息：
								          <s:property value="#request.goods.maijia.mingcheng"/>
								          <hr/>
								       </td>
								    </tr> -->
								    <tr>
								       <td align="left">物品介绍:<s:property value="#request.goods.goodsMiaoshu" escape="false"/><hr/></td>
								    </tr>
								    <tr>
								       <td align="left">购买价格:<s:property value="#request.goods.goodsTejia"/><hr/></td>
								    </tr>
								    <!-- <tr>
								       <td align="left">数量：<input type="text" name="quantity" value="1" size="8" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/><hr/></td>
								    </tr> -->
								    <tr>
								       <td align="left">
								           <input type="hidden" name="goodsId" value="<s:property value="#request.goods.goodsId"/>"/>
								           <input type="button" value="购买" style="width: 140px;height: 30px;" onclick="buy1()"/>
								       </td>
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
