<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>  
<html  lang="zh">
<!--<![endif]-->  
<head>
	<meta charset="utf-8">  
	<title>结伴游 | 驴友网</title>
	<meta name="Keywords" content="旅游社交，在旅途中享受激情与欢乐" />  
	<meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />  
    <link rel="shortcut icon"  href="favicon.ico" />  
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/boxy,jquery.fancybox-1.3.4.css">	 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/journey.css" >
		<link rel="stylesheet"  href="${pageContext.request.contextPath }/css/search.css" /> 
    <script type="text/javascript">		
		var userjson = '';
		var c_cityinfo = '';
	</script>	
</head>

<body id="gongluo">
<%@include file="/including/header.jsp" %>

<div id="container">
	<div class="mainWrap cf">
				<div class="search-box">
					<div class="search-body">
						<ul class="search-tab">
							<li class="select" >
                				<a href="#" >目的地</a>
            				</li>
            				<li  >
                                <a href="#" >时间</a>
                            </li>
						</ul>
						<form method="get"  action="travellerSearch.do" id="f1" class="search-form">
							<input type="text" id="k2" name="tkdestination"  class=" input-search" value="" autocomplete="off">
							<input  type="submit" class="search-btn" value="搜索">
						</form>
					</div>
				</div>
				
			<div class="ui-box cf">
				<div class="ui-title">
					<h2 class="ui-title-cnt fn-left"><em>最新发布</em> (3858篇帖子)</h2>
				</div>
				<ul class=" travel-log-list gonglue-list">
					<c:forEach items="${travellers}" var="traveller">
						<li>
							<a target="_blank" href="${pageContext.request.contextPath }/travellerDetail.do?tkid=${traveller.tkid}" class="gonglue_img fn-left">
								<img src="${traveller.tkimg}" alt="${traveller.tktitle}" width="130" height="130" />
							</a>
							<div class="gonglue_info fn-left">
								<h3> <a target="_blank" href="${pageContext.request.contextPath }/travellerDetail.do?tkid=${traveller.tkid}"  title="${traveller.tktitle}">${traveller.tktitle}</a></h3>
								<p>&nbsp;&nbsp;目的地：${traveller.tkdestination}</p>
								<p>&nbsp;&nbsp;行程：<fmt:formatDate value="${traveller.tkbegintime}" pattern="yyyy-MM-dd  HH:mm"/> 至 <fmt:formatDate value="${traveller.tkaftertime}" pattern="yyyy-MM-dd  HH:mm"/></p>
								<p>&nbsp;&nbsp;发布者: <a target="_blank" href="#">${traveller.username}</a>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：<fmt:formatDate value="${traveller.tktime}" pattern="yyyy-MM-dd  HH:mm:ss"/></p>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="ui-title-subcnt fn-right">
					<a target="_blank" href="#" >+查看更多</a>
				</div>
			</div>  
		</div>
</div>

<!-- 底部footer 开始-->
<%@include file="/including/footer.jsp" %>
<!-- footer end -->
</body>
</html>