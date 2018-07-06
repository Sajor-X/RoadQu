<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<form method="get"  action="traveller_search.htm" id="f1" class="search-form">
							<input type="text" id="k2" name="k"  class=" input-search" value="" autocomplete="off">
							<input  type="submit" class="search-btn" value="搜索">
						</form>
					</div>
				</div>
				
			<div class="ui-box cf">
				<div class="ui-title">
					<h2 class="ui-title-cnt fn-left"><em>最新发布</em> (3858篇帖子)</h2>
				</div>
				<ul class=" travel-log-list gonglue-list">
					<li>
						<a target="_blank" href="#" class="gonglue_img fn-left">
							<img src="../images/3aedfe2ee2f96e8778c5a61176f0d6ed_c.jpg" alt="【2013年7月1日-2013年7月5日】苏州行" width="130" height="130" /> 
						</a>
						<div class="gonglue_info fn-left">
							<h3> <a target="_blank" href="traveller_detail.htm"  title="【2013年7月1日-2013年7月5日】苏州行">【2013年7月1日-2013年7月5日】苏州行</a></h3>
							<p>&nbsp;&nbsp;目的地：苏州</p>
							<p>&nbsp;&nbsp;行程：2013年7月1日 至 2013年7月5日</p>
							<p>&nbsp;&nbsp;发布者: <a target="_blank" href="#">路趣小游</a>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：2013-03-15 16:51:22</p>	
						</div>
					</li>
					<li>
						<a target="_blank" href="#" class="gonglue_img fn-left">
							<img src="../images/76ca11b55c7c0d0e7f35d45949b0289b_c.jpg" alt="【2013年7月2日-2013年7月2日】百侯镇" width="130" height="130" /> 
						</a>
						<div class="gonglue_info fn-left">
							<h3> <a target="_blank" href="traveller_detail.htm"  title="【2013年7月1日-2013年7月5日】苏州行">【2013年7月1日-2013年7月5日】百侯镇</a></h3>
							<p>&nbsp;&nbsp;目的地：百侯镇</p>
							<p>&nbsp;&nbsp;行程：2013年7月1日 至 2013年7月5日</p>
							<p>&nbsp;&nbsp;发布者: <a target="_blank" href="#">路趣小游</a>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：2013-03-15 16:51:22</p>	
						</div>
					</li>
					<li>
						<a target="_blank" href="#" class="gonglue_img fn-left">
							<img src="../images/e15faad1da662c685aff6d2d0ae13ce2_c.jpg" alt="【2013年7月2日-2013年7月2日】婺源" width="130" height="130" /> 
						</a>
						<div class="gonglue_info fn-left">
							<h3> <a target="_blank" href="traveller_detail.htm"  title="【2013年7月1日-2013年7月5日】婺源">【2013年7月1日-2013年7月5日】婺源</a></h3>
							<p>&nbsp;&nbsp;目的地：婺源</p>
							<p>&nbsp;&nbsp;行程：2013年7月1日 至 2013年7月5日</p>
							<p>&nbsp;&nbsp;发布者: <a target="_blank" href="#">路趣小游</a>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：2013-03-15 16:51:22</p>	
						</div>
					</li>
					<li>
						<a target="_blank" href="#" class="gonglue_img fn-left">
							<img src="../images/6f2c19ed430e457235c76dff76a7ce57_c.jpg" alt="【2013年7月2日-2013年7月2日】深圳" width="130" height="130" /> 
						</a>
						<div class="gonglue_info fn-left">
							<h3> <a target="_blank" href="traveller_detail.htm"  title="【2013年7月1日-2013年7月5日】深圳">【2013年7月1日-2013年7月5日】深圳</a></h3>
							<p>&nbsp;&nbsp;目的地：深圳</p>
							<p>&nbsp;&nbsp;行程：2013年7月1日 至 2013年7月5日</p>
							<p>&nbsp;&nbsp;发布者: <a target="_blank" href="#">路趣小游</a>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：2013-03-15 16:51:22</p>	
						</div>
					</li>
					<li>
						<a target="_blank" href="#" class="gonglue_img fn-left">
							<img src="../images/3771bde6633cf9e9b78636f1c91010de_c.jpg" alt="【2013年7月2日-2013年7月2日】碉堡楼" width="130" height="130" /> 
						</a>
						<div class="gonglue_info fn-left">
							<h3> <a target="_blank" href="#"  title="【2013年7月1日-2013年7月5日】碉堡楼">【2013年7月1日-2013年7月5日】碉堡楼</a></h3>
							<p>&nbsp;&nbsp;目的地：碉堡楼</p>
							<p>&nbsp;&nbsp;行程：2013年7月1日 至 2013年7月5日</p>
							<p>&nbsp;&nbsp;发布者: <a target="_blank" href="#">路趣小游</a>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：2013-03-15 16:51:22</p>		
						</div>
					</li>
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