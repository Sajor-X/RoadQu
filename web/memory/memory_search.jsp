<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html  lang="zh">
<head >
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/boxy,jquery.fancybox-1.3.4.css">
	<title>旅游记忆 | 驴友网</title> 
	<meta name="Keywords" content="旅游社交，在旅途中享受激情与欢乐" />
	<meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
	
	<link rel="stylesheet"  href="${pageContext.request.contextPath }/css/search.css" />
	<script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>
	
</head>

<body id="searchG">
<%@include file="/including/header.jsp" %>
	
	<div id="container" class='noXtips'>
		<div id="mainWrapper" class="fn-clear">
			<div class="main">
				<div class="searchResult">
					<h2>搜索到相关旅游记忆 ${memories.size()}条</h2>
					<ul id="feed_list" maxbid="" class="feed_list " >
						<c:forEach items="${memories}" var="memory">
						<li class="cf" bid="367492">
							<div class="head_pic-warp">
								<a href="${pageContext.request.contextPath }/memoryDetail.do?tmid=${memory.tmid}"><img src="${memory.tmimg}" width="110" height="110" ></a>
							</div>
							<div class="feed_content"> 
								<p class="feed-head">
									<a href="${pageContext.request.contextPath }/memoryDetail.do?tmid=${memory.tmid}">${memory.tmtitle}</a>
								</p><br />
								<div class="feed_from">
									<div class="fl">
										<cite><a href="${pageContext.request.contextPath }/memoryDetail.do?tmid=${memory.tmid}">类别：
											<c:forEach var="memoryType" items="${memoryTypeList}">
												<c:if test="${memoryType.memorytypeid==memory.memorytypeid}">
													<c:out value="${memoryType.memorytype}" />
												</c:if>
											</c:forEach>
											</a>&nbsp;&nbsp;&nbsp;&nbsp;
											  <a href="${pageContext.request.contextPath }/memoryDetail.do?tmid=${memory.tmid}">发布者：${memory.username}</a>&nbsp;&nbsp;&nbsp;&nbsp;
											  <a href="${pageContext.request.contextPath }/memoryDetail.do?tmid=${memory.tmid}">发布时间：<fmt:formatDate value="${memory.tmtime}" pattern="yyyy-MM-dd HH:mm:ss"/> </a>
										</cite> 
									</div>     
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>    
					<!--记忆列表结束-->       
					
					<!--分页-->
					<div class="no-pages">
						<strong>1</strong> <a href="#">2</a>  <a href="#">3</a>  <a href="#">4</a> <span> ... </span><a href="#">100</a><a href="#" class="pageBtn">下一页 &gt;&gt;</a> </div>
					<!--分页-->
				<!--记忆搜索结果end--> 
			</div>
		</div>
	</div>
</div>
<%@include file="/including/footer.jsp" %>
<!-- footer end -->
</div>
</body>
</html>