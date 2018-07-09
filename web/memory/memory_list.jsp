<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html  lang="zh">
<head>
	<meta charset="utf-8">
	<title>旅游记忆 | 驴友网</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/boxy,jquery.fancybox-1.3.4.css">
	<link  href="${pageContext.request.contextPath }/css/aboutus.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>

</head>
<body>
<%@include file="/including/header.jsp" %>

<div id="container" class="fn-clear">
<div class="main">
	<div class="bottom">
    	<div class="bottom_t"></div>
        <div class="bottom_c h650">
       	  <div class="bottom_c_l">
           	  <div class="title01"> 记忆分类 </div>
              <div class="list01 bk">
                <ul>
					<c:forEach items="${memoryTypeList}" var="memoryType">
						<li class="un">
							<a href="#"><div class="icon_bot"><img src="../images/help12.png"></div>${memoryType.memorytype}</a>
						</li>
					</c:forEach>
                    <%--<li>--%>
						<%--<a href="#"><div class="icon_bot"><img src="../images/help13.png"></div>古镇时光</a>--%>
					<%--</li>--%>
                    <%--<li>                    --%>
						<%--<a href="#"> <div class="icon_bot"><img src="../images/help14.png"></div>吃货血拼</a>--%>
					<%--</li>--%>
                    <%--<li>                    --%>
						<%--<a href="#"> <div class="icon_bot"><img src="../images/help14.png"></div>户外撒野</a>--%>
					<%--</li>--%>
                </ul>
			</div>
		</div>
		
		<div class="bottom_c_r">
			<ul class="zhuanti-list">
				<li class="ui-box zhuanti-item">
					<a target="_blank" href="memory_detail.jsp"><img src="../images/login_poi_2013031109501.jpg" alt="惠州罗浮山" width="300" height="200"></a>
					<div class="zhuanti-info fn-right"><br /><br />
						<a href="memory_detail.jsp"><h3>惠州罗浮山</h3></a><br /><br />
						<p>类别：面朝大海&nbsp;&nbsp;&nbsp;&nbsp;发布者：禾木&nbsp;&nbsp;&nbsp;&nbsp;发布时间：2013-07-01</p>
					</div>
				</li>
				<li class="ui-box zhuanti-item">
					<a target="_blank" href="memory_detail.jsp"><img src="../images/login_poi_2013031109501.jpg" alt="惠州罗浮山" width="300" height="200"></a>
					<div class="zhuanti-info fn-right"><br /><br />
						<a href="memory_detail.jsp"><h3>惠州罗浮山</h3></a><br /><br />
						<p>类别：面朝大海&nbsp;&nbsp;&nbsp;&nbsp;发布者：禾木&nbsp;&nbsp;&nbsp;&nbsp;发布时间：2013-07-01</p>
					</div>
				</li>
				<li class="ui-box zhuanti-item">
					<a target="_blank" href="memory_detail.jsp"><img src="../images/login_poi_2013031109501.jpg" alt="惠州罗浮山" width="300" height="200"></a>
					<div class="zhuanti-info fn-right"><br /><br />
						<a href="memory_detail.jsp"><h3>惠州罗浮山</h3></a><br /><br />
						<p>类别：面朝大海&nbsp;&nbsp;&nbsp;&nbsp;发布者：禾木&nbsp;&nbsp;&nbsp;&nbsp;发布时间：2013-07-01</p>
					</div>
				</li>
			</ul>
			<!--分页-->
			<div class="no-pages">
			<strong>1</strong> <a href="#">2</a>  <a href="#">3</a>  <a href="#">4</a> <span> ... </span><a href="#">100</a><a href="#" class="pageBtn">下一页 &gt;&gt;</a> </div>
			<!--分页-->
		</div>
		</div>
        <div class="bottom_b"></div>
    </div>
</div>
</div>
<!-- 底部footer 开始-->
<%@include file="/including/footer.jsp" %>
<!-- footer end -->

</body>
</html>