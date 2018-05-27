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
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>

	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"/>
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
	
	
	
	<!-- 	底部开始 -->
<div class="footer">
    <div class="footer-in w">
        <div class="wei">
            <div class="footer-in-l">
                <h4>Leave A Message Online</h4>
                <textarea placeholder="Input your contents please:"></textarea>
                <input type="submit" value="" />
            </div>
            <div class="footer-in-r">
                <h4>Contact Us:</h4>
                <p>Phone Number：(+853)60944070</p>
                <p>Email：gamemarket@gamil.com</p>
                <p>Address：MUST,WeilongRoad,Macao</p>
            </div>
        </div>
        <div class="footer-in-b">
            <div>
            <a href="#">About Us</a>
            <a href="#">Contact Us</a>
            <a href="#">Friendly Links</a>
            <a href="#">Join Us</a>
            </div>
            <p>Copyright©2018 Upay. All Rights Reserved By Our Company</p>
        </div>
    </div>

</div>
<!-- 底部结束 -->
  </body>
</html>
