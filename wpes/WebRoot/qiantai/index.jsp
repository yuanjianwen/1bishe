<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/reset.css">
    <link href="<%=path %>/css/qiantai.css" rel="stylesheet" type="text/css" media="screen" >
    <link href="<%=path %>/css/qiantai.css" rel="stylesheet" type="text/css" media="screen" >
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    
    
    
    <style>
       

        @font-face {
            font-family: 'iconfont';
            src: url('fonts/iconfont.eot');
            src: url('fonts/iconfont.eot?#iefix') format('embedded-opentype'),
            url('fonts/iconfont.woff') format('woff'),
            url('fonts/iconfont.ttf') format('truetype'),
            url('fonts/iconfont.svg#iconfont') format('svg');
        }

        .ico {
            font-family: 'iconfont';
            font-size: 50px;
            font-style: normal;
            cursor: pointer;
            color: black;
        }

        .clickMe {
            font-size: 14px;
            font-weight: 700;
            color: #9D875D;
            position: absolute;
            top: -20px;
            left: 60px;
            animation: clickme 3s linear infinite;
        }

        @keyframes clickme {
            0% {
                left: 10%;
                top:10%;
            }
            50% {
                left: 0%;
                top:-20%;
            }
            100%{
                left:10%;
                top:10%;
            }
        }
    </style>
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
    
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script>
        $(function () {
            var timerId = null;
            var indexNow = 0;
            var len = $(".box-img").children().length;
            $(".box-img>img:eq(0)").css("opacity", "1");
            $(".box1").mouseover(function () {
                $("#left").css("display", "block");
                $("#right").css("display", "block");
                clearInterval(timerId);
                timerId = null;
            });
            timerId = setInterval(autoPlay, 1000);
            $(".box1").mouseout(function () {
                $("#left").css("display", "none");
                $("#right").css("display", "none");
                timerId = setInterval(autoPlay, 1000);
            });
            $("#LU>li").click(function () {
                indexNow = $(this).index();
                $(this).addClass("current1").siblings("li").removeClass("current1");
                $(".box-img>img:eq(" + indexNow + ")").animate({"opacity": 1}).siblings("img").animate({"opacity": 0});
            });
            $("#left").click(function () {
                indexNow--;
                if (indexNow == -1) {
                    indexNow = 4;
                }
                $("#LU>li:eq(" + indexNow + ")").click();
            });
            $("#right").click(function () {
                indexNow++;
                if (indexNow == 5) {
                    indexNow = 0;
                }
                $("#LU>li:eq(" + indexNow + ")").click();
            });
            function autoPlay() {
                indexNow++;
                if (indexNow >= len) {
                    indexNow = 0;
                }
                $("#LU>li:eq(" + indexNow + ")").addClass("current1").siblings("li").removeClass("current1");
                $(".box-img>img:eq(" + indexNow + ")").animate({"opacity": 1}).siblings("img").animate({"opacity": 0});
            }

            $(".ico").click(function () {
                $(".erweima").animate({"height": 125}, 1000, function () {
                    $(".mark").show();
                })
            });
            $(".mark").click(function () {
                $(".erweima").animate({"height": 0}, 1000, function () {
                    $(".mark").hide();
                })
            });
        });
    </script>
</head>
<body>
<!--导航栏部分开始-->
<jsp:include flush="true" page="/qiantai/inc/top.jsp"></jsp:include>
<!--导航栏部分结束-->
<!--中间开始部分-->
<div class="banner">
    <div class="banner-in w ">
        <div class="banner-in-top ">
	        <div class=" search">
	        	<div class="input-group">
			      <input type="text" class="form-control" placeholder="Search for...">
			      <span class="input-group-btn">
			        <button class="btn btn-default" type="button">Go!</button>
			      </span>
			    </div><!-- /input-group -->
	                
	        </div>
	        
            <div class="banner-in-topl ">
                <i class="ico">&#xe602;</i>
                <span class="clickMe">ClickMe</span>
                <img src="images/erweima.jpg" alt="" class="erweima">
                <span class="mark">
                    ×
                </span>
            </div>
            
        </div>
        <div class="video">
            <div class="video-l">
                <div class="box1">
                    <div class="box-img">
                        <img src="gameimg/26_0_s2.png" alt="" width="916px" height="420px">
                        <img src="gameimg/27_1_s2.png" alt="" width="916px" height="420px">
                        <img src="gameimg/29_1_s2.png" alt="" width="916px" height="420px">
                        <img src="gameimg/28_1_s2.png" alt="" width="916px" height="420px">
                        <img src="gameimg/27_5_s2.png" alt="" width="916px" height="420px">
                    </div>
                    <ul id="LU">
                        <li class="current1">1</li>
                        <li>2</li>
                        <li>3</li>
                        <li>4</li>
                        <li>5</li>
                    </ul>
                    <span id="left"></span>
                    <span id="right"></span>
                </div>
            </div>
            <div class="video-r">
                <div class="video-r-top">
                    <span class="tv"></span>
                    <span class="wenzi">Recommandation</span>
                </div>
                <div id="box" class="box">
                    <ul class="sel" id="sel">
                    	<c:forEach items="${requestScope.goodsNoTejiaList}" var="goods" varStatus="sta">
                    	<c:if test="${sta.index<15}">
                        <li>
                            <div class="selImg" >
                            	<a href="<%=path %>/goodsDetailQian.action?goodsId=${goods.goodsId }">  
									<img src="<%=path %>/${goods.goodsPic }" width="96px" height="54px" alt="">
								</a>
                            </div>
                            <span>
                            ${goods.goodsName }
                                <br>
                            </span>
                            
                        </li>
                        </c:if>
                    	</c:forEach>    
                    </ul>
                    <div class="scroll" id="scroll">
                        <div class="bar" id="bar">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--中间结束部分-->
<!--推荐部分开始-->
<div class="recommend">
    <div class="rec-in w">
        <div class="rec-in-l">
            <div class="rec-second-Top">
                <h1>New Goods</h1>
                
            </div>
                <span id="more">
                    See More
                </span>
            <div id="uL">
                <div class="uL1">
                    <ul class="rec-second" id="shadow">
             			<c:forEach items="${requestScope.goodsNoTejiaList}" var="goods" varStatus="sta">
             				<c:if test="${sta.index< 9 }">
                    			<c:if test="${(sta.index+1)%4 == 0 }">
                    				</ul><ul class="rec-second" id="shadow">
                    		</c:if>
                        <li>
                        	<a href="<%=path %>/goodsDetailQian.action?goodsId=${goods.goodsId }">  
									<img src="<%=path %>/${goods.goodsPic }" width="190px" height="107px" alt="">
								</a>
                            <p>${goods.goodsName }</p>
                            <p class="pb">
                                <span class="pl"></span>
                                <span class="pw1">3.4万</span>
                                <span class="pw2">4个月以前</span>
                            </p>
                        </li>
                        </c:if>
                    	</c:forEach> 
                    </ul>
                </div>
            </div>
        </div>
        <div class="rec-in-r">
            <div class="rec-in-rTop" id="recR">
                <h1>Sales</h1>
                <ul>
                    <li class="current">Today</li>
                    <li>Week</li>
                    <li>Month</li>
                </ul>
            </div>
            <div class="content" id="Content">
                <ul class="contentShow">
                    <li style="height: 80px" class="paddF">
                        <img src="gameimg/14_s1.png" alt="" width="142px" height="80px">
                        <div class="san">
                            <span>1</span>
                        </div>
                        <p>游戏录出CG大片!3A革新</p>
                        <p>MOBA《虚幻争霸》12.14开启</p>
                        <p>
                            <span class="pl"></span>
                            <span class="pW">49</span>
                        </p>
                    </li>
                    <li class="paddTop" style="height: 96px">
                        <img src="gameimg/27_2_s1.png" alt="" width="142px" height="80px">
                        <div class="san1">
                            <span>2</span>
                        </div>
                        <p>游戏录出CG大片!3A革新</p>
                        <p>MOBA《虚幻争霸》12.14开启</p>
                        <p>
                            <span class="pl"></span>
                            <span class="pW">49</span>
                        </p>
                    </li>
                    <li class="paddTop" style="height: 96px">
                        <img src="gameimg/23_s1.png" alt="" width="142px" height="80px">
                        <div class="san2">
                            <span>3</span>
                        </div>
                        <p>游戏录出CG大片!3A革新</p>
                        <p>MOBA《虚幻争霸》12.14开启</p>
                        <p>
                            <span class="pl"></span>
                            <span class="pW">49</span>
                        </p>
                    </li>
                    <li>
                        <span class="order">4</span>
                        《虚幻争霸》丛林魔抢 英氪Zink宣...
                        <span class="playH"></span>
                        2
                    </li>
                    <li>
                        <span class="order">5</span>
                        《虚幻争霸》丛林魔抢 英氪Zink宣...
                        <span class="playH"></span>
                        11
                    </li>
                    <li>
                        <span class="order">6</span>
                        《虚幻争霸》丛林魔抢 英氪Zink宣...
                        <span class="playH"></span>
                        14
                    </li>
                    <li>
                        <span class="order">7</span>
                        《虚幻争霸》丛林魔抢 英氪Zink宣...
                        <span class="playH"></span>
                        31
                    </li>
                </ul>
                <ul>
                    <li style="height: 80px" class="paddF">
                        <img src="gameimg/27_4_s1.png" alt="" width="142px" height="80px">
                        <div class="san">
                            <span>1</span>
                        </div>
                        <p>《虚幻争霸》:最美MOBA战场</p>
                        <p>等待你带来最激烈的战斗</p>
                        <p>
                            <span class="pl"></span>
                            <span class="pW">666</span>
                        </p>
                    </li>
                    <li class="paddTop" style="height: 96px">
                        <img src="gameimg/1_s1_s1.png" alt="" width="142px" height="80px">
                        <div class="san1">
                            <span>2</span>
                        </div>
                        <p>《虚幻争霸》:最美MOBA战场</p>
                        <p>等待你带来最激烈的战斗</p>
                        <p>
                            <span class="pl"></span>
                            <span class="pW">666</span>
                        </p>
                    </li>
                    <li class="paddTop" style="height: 96px">
                        <img src="gameimg/26_0_s1.png" alt="" width="142px" height="80px">
                        <div class="san2">
                            <span>3</span>
                        </div>
                        <p>《虚幻争霸》:最美MOBA战场</p>
                        <p>等待你带来最激烈的战斗</p>
                        <p>
                            <span class="pl"></span>
                            <span class="pW">666</span>
                        </p>
                    </li>
                    <li>
                        <span class="order">4</span>
                        史诗MOBA《虚幻争霸》地图升级...
                        <span class="playH"></span>
                        200
                    </li>
                    <li>
                        <span class="order">5</span>
                        史诗MOBA《虚幻争霸》地图升级...
                        <span class="playH"></span>
                        110
                    </li>
                    <li>
                        <span class="order">6</span>
                        史诗MOBA《虚幻争霸》地图升级...
                        <span class="playH"></span>
                        140
                    </li>
                    <li>
                        <span class="order">7</span>
                        史诗MOBA《虚幻争霸》地图升级...
                        <span class="playH"></span>
                        310
                    </li>
                </ul>
                <ul>
                    <li style="height: 80px" class="paddF">
                        <img src="gameimg/25_0_s1.png" alt="" width="142px" height="80px">
                        <div class="san">
                            <span>1</span>
                        </div>
                        <p>《虚幻争霸》齐天大圣孙悟空</p>
                        <p>Wukong宣传视频</p>
                        <p>
                            <span class="pl"></span>
                            <span class="pW">666</span>
                        </p>
                    </li>
                    <li class="paddTop" style="height: 96px">
                        <img src="gameimg/27_1_s1.png" alt="" width="142px" height="80px">
                        <div class="san1">
                            <span>2</span>
                        </div>
                        <p>《虚幻争霸》齐天大圣孙悟空</p>
                        <p>Wukong宣传视频</p>
                        <p>
                            <span class="pl"></span>
                            <span class="pW">666</span>
                        </p>
                    </li>
                    <li class="paddTop" style="height: 96px">
                        <img src="gameimg/22_s1.png" alt="" width="142px" height="80px">
                        <div class="san2">
                            <span>3</span>
                        </div>
                        <p>《虚幻争霸》齐天大圣孙悟空</p>
                        <p>Wukong宣传视频</p>
                        <p>
                            <span class="pl"></span>
                            <span class="pW">666</span>
                        </p>
                    </li>
                    <li>
                        <span class="order">4</span>
                        《虚幻争霸》年度版冰雪奇缘...
                        <span class="playH"></span>
                        100
                    </li>
                    <li>
                        <span class="order">5</span>
                        《虚幻争霸》年度版冰雪奇缘...
                        <span class="playH"></span>
                        100
                    </li>
                    <li>
                        <span class="order">6</span>
                        《虚幻争霸》年度版冰雪奇缘...
                        <span class="playH"></span>
                        100
                    </li>
                    <li>
                        <span class="order">7</span>
                        《虚幻争霸》年度版冰雪奇缘...
                        <span class="playH"></span>
                        100
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--推荐部分结束-->
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
<!--script部分-->
<script src="js/common.js"></script>
<script src="js/index.js"></script>

</body>
</html>
