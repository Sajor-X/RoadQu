<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html  lang="zh">
<head>
	<meta charset="utf-8">
	<title>个人中心 | 驴友网</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/boxy,jquery.fancybox-1.3.4.css">
	<link  href="${pageContext.request.contextPath}/css/aboutus.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/huidong.css">
		
	<script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>
	<!-- 合并jquery and $LAB -->
	
</head>
<body>
<%@include file="/including/header.jsp" %>
<!--top end-->

<div id="container" class="fn-clear">
	<div class="bottom">
    	<div class="bottom_t"></div>
        <div class="bottom_c h650">
			<%@include file="/including/left.jsp"%>
		
		<div class="bottom_c_r">
			<h2 style="width:680px; height:40px; line-height:41px; background:#83bb4a url(../images/reg-title-bg.png) repeat-x; 
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">全部记忆</h2>
			<ul id="comment-list" class="comment-list">
				<c:forEach items="${memories}" var="memory">
				<li class="fn-clear">
					<div >
						<p>
							<a class="comment_user" href="${pageContext.request.contextPath }/memoryDetail.do?tmid=${memory.tmid}"><img width="75" height="75" alt="${memory.tmtitle}" src="${memory.tmimg}">${memory.tmtitle}</a>
							<label style="float:right"><a class="comment_user" href="#">删除</a></label>
						</p>
						<div class="comment_box">
							<div class="comment_cnt"> 
								类别：
								<c:forEach var="memoryType" items="${memoryTypeList}">
									<c:if test="${memoryType.memorytypeid==memory.memorytypeid}">
										<c:out value="${memoryType.memorytype}" />
									</c:if>
								</c:forEach>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								发布时间：<fmt:formatDate value="${memory.tmtime}" pattern="yyyy-MM-dd"/>
							</div>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
			<!--分页-->
			<div class="no-pages cf">
				<strong>1</strong> <a href="?page=2&#comment">2</a>  <a href="?page=3&#comment">3</a> <a href="?page=4&#comment">4</a><a href="?page=2&#comment" class="pageBtn">下一页 &gt;&gt;</a>				
			</div>
		</div>
	</div>
</div>
</div>
<!-- 底部footer 开始-->
<%@include file="/including/footer.jsp" %>
<!-- footer end -->

</body>
</html>