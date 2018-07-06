<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh">
    <head >
	<meta charset="utf-8" />
    <title>景点攻略 | 驴友网</title>
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/boxy,jquery.fancybox-1.3.4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/cityguide.css"  />
</head>
   
<body id="profile-homepage">
<%@include file="/including/header.jsp" %>

<div id="container">
	<div id="mainWrapper" class="cf"> 
		<!-- 主题游 begin -->  
		<div class="ui-box fn-clear">
			<div class="ui-title">
				<h2 class="ui-title-cnt fn-left"><em>主题游</em></h2>    
			</div>
			
			<ul class="hot-spots fn-clear">
				<li>
					<a href="strategy_detail.htm"><img src="../images/scene_201301102122_0.jpg" width="190" height="190" alt="梧桐山" title="梧桐山"></a>
					<p></p>
					<ul class="tag-info fn-clear">
						<li><a href="strategy_detail.htm" target="_blank">梧桐山</a></li>
						<li><a href="strategy_detail.htm" target="_blank">春天</a></li>
						<li><a href="strategy_detail.htm" target="_blank">老少皆宜</a></li>
					</ul>
				</li>
				<li class="middle">
					<a href="strategy_detail.htm"><img src="../images/scene_201301111549_1.jpg" width="190" height="190" alt="溪头村" title="溪头村"></a>
					<p class="historic"></p>
					<ul class="tag-info fn-clear">
						<li><a href="strategy_detail.htm" target="_blank">溪头村</a></li>
						<li><a href="strategy_detail.htm" target="_blank">夏天</a></li>
						<li><a href="strategy_detail.htm" target="_blank">青年</a></li>
					</ul>
				</li>
				<li>
					<a href="strategy_detail.htm"><img src="../images/41_201301181731_zhuanti.jpg" width="190" height="190" alt="阳朔" title="阳朔"></a>
					<p class="historic"></p>
					<ul class="tag-info fn-clear">
						<li><a href="strategy_detail.htm" target="_blank">阳朔</a></li>
						<li><a href="strategy_detail.htm" target="_blank">秋天</a></li>
						<li><a href="strategy_detail.htm" target="_blank">老少皆宜</a></li>
					</ul>
				</li>
				<li class="middle">
					<a href="strategy_detail.htm"><img src="../images/31_201209260852_zhuanti.jpg" width="190" height="190" alt="大望" title="大望"></a>
					<p class="tese"></p>
					<ul class="tag-info fn-clear">
						<li><a href="strategy_detail.htm" target="_blank">大望</a></li>
						<li><a href="strategy_detail.htm" target="_blank">春天</a></li>
						<li><a href="strategy_detail.htm" target="_blank">老少皆宜</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- 主题游 end -->  
		
		<div class="ui-box fn-clear">
			<div class="ui-title">
				<h2 class="ui-title-cnt fn-left"><em>时令游</em></h2>    
			</div>
			
			<ul class="hot-spots fn-clear">
				<li class="middle">
					<a href="strategy_detail.htm"><img src="../images/scene_201301102122_0.jpg" width="190" height="190" alt="梧桐山" title="梧桐山"></a>
					<ul class="tag-info fn-clear">
						<li><a href="strategy_detail.htm" target="_blank">梧桐山</a></li>
						<li><a href="strategy_detail.htm" target="_blank">春天</a></li>
						<li><a href="strategy_detail.htm" target="_blank">老少皆宜</a></li>
					</ul>
				</li>
				<li class="middle">
					<a href="strategy_detail.htm"><img src="../images/44_201211261336_zhuanti.jpg" width="190" height="190" alt="溪头村" title="溪头村"></a>
					<ul class="tag-info fn-clear">
						<li><a href="strategy_detail.htm" target="_blank">溪头村</a></li>
						<li><a href="strategy_detail.htm" target="_blank">夏天</a></li>
						<li><a href="strategy_detail.htm" target="_blank">青年</a></li>
					</ul>
				</li>
				<li class="middle">
					<a href="strategy_detail.htm"><img src="../images/41_201301181731_zhuanti.jpg" width="190" height="190" alt="阳朔" title="阳朔"></a>
					<ul class="tag-info fn-clear">
						<li><a href="strategy_detail.htm" target="_blank">阳朔</a></li>
						<li><a href="strategy_detail.htm" target="_blank">秋天</a></li>
						<li><a href="strategy_detail.htm" target="_blank">老少皆宜</a></li>
					</ul>
				</li>
				<li class="middle">
					<a href="strategy_detail.htm"><img src="../images/31_201209260852_zhuanti.jpg" width="190" height="190" alt="大望" title="大望"></a>
					<ul class="tag-info fn-clear">
						<li><a href="strategy_detail.htm" target="_blank">大望</a></li>
						<li><a href="strategy_detail.htm" target="_blank">春天</a></li>
						<li><a href="strategy_detail.htm" target="_blank">老少皆宜</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>

<%@include file="/including/footer.jsp" %>
<!-- footer end -->
</body>
</html>