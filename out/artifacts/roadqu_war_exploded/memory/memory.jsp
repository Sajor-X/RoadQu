<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>旅游记忆 | 驴友网</title>
    <meta name="Keywords" content="驴友网"/>
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐"/>
    <meta name="baidu-site-verification" content="fGdITGCHHMB5crjs" />
    <link rel="shortcut icon" href="favicon.ico"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" media="all"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/boxy,jquery.fancybox-1.3.4.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css" media="all">
    <script type="text/javascript">
    var userjson = '';
    var c_cityinfo = '';
</script>
<!-- 合并jquery and $LAB -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min,LAB.min.js"></script>
</head>

<body>
<%@include file="/including/header.jsp" %>
<!--top end-->

<!--main body-->
<div id="container">
<!--面朝大海-->
<div class="ui-box fn-clear">
    <div class="ui-title">
        <h2 class="ui-title-cnt fn-left"><em>面朝大海</em></h2>
        <div class="ui-title-subcnt fn-right"><a target="_blank" href="memory_list.htm">+更多</a></div>
    </div>
    <ul class="poi_hot" id="poi_hot">
		<li>
            <a target="_blank" title="惠州罗浮山" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109501.jpg" alt="惠州罗浮山" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="惠州罗浮山" href="#">惠州罗浮山</a></p>
            <div class="alpha-txt intro_info">
                <p>惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="西丽水库" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109362.jpg" alt="西丽水库" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="西丽水库" href="#">西丽水库</a></p>
            <div class="alpha-txt intro_info">
                <p>西丽水库历史悠久，风景优美，是春天骑行的好去处。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="婺源" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109523.jpg" alt="婺源" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="婺源" href="#">婺源</a></p>
            <div class="alpha-txt intro_info">
                <p>漫步在婺源油菜花田间，不知有多么的诗情画意。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="小坑国家森林公园" href="memory_detail.htm">
				<img src="../images/login_poi_2013031110074.jpg" alt="小坑国家森林公园" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="小坑国家森林公园" href="#">小坑国家森林公园</a></p>
            <div class="alpha-txt intro_info">
                <p>韶关小坑国家森林公园清新宁静，诗歌释放压力的好地方。</p>
            </div>
		</li>  
    </ul>
</div>
<!--面朝大海- end-->

<!--古镇时光-->
<div class="ui-box fn-clear">
    <div class="ui-title">
        <h2 class="ui-title-cnt fn-left"><em>古镇时光</em></h2>
        <div class="ui-title-subcnt fn-right"><a target="_blank" href="memory_list.htm">+更多</a></div>
    </div>
    <ul class="poi_hot" id="poi_hot">
		<li>
            <a target="_blank" title="惠州罗浮山" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109501.jpg" alt="惠州罗浮山" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="惠州罗浮山" href="#">惠州罗浮山</a></p>
            <div class="alpha-txt intro_info">
                <p>惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="西丽水库" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109362.jpg" alt="西丽水库" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="西丽水库" href="#">西丽水库</a></p>
            <div class="alpha-txt intro_info">
                <p>西丽水库历史悠久，风景优美，是春天骑行的好去处。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="婺源" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109523.jpg" alt="婺源" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="婺源" href="#">婺源</a></p>
            <div class="alpha-txt intro_info">
                <p>漫步在婺源油菜花田间，不知有多么的诗情画意。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="小坑国家森林公园" href="memory_detail.htm">
				<img src="../images/login_poi_2013031110074.jpg" alt="小坑国家森林公园" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="小坑国家森林公园" href="#">小坑国家森林公园</a></p>
            <div class="alpha-txt intro_info">
                <p>韶关小坑国家森林公园清新宁静，诗歌释放压力的好地方。</p>
            </div>
		</li>  
    </ul>
</div>
<!--古镇时光- end-->

<!--吃货血拼-->
<div class="ui-box fn-clear">
    <div class="ui-title">
        <h2 class="ui-title-cnt fn-left"><em>吃货血拼</em></h2>
        <div class="ui-title-subcnt fn-right"><a target="_blank" href="memory_list.htm">+更多</a></div>
    </div>
    <ul class="poi_hot" id="poi_hot">
		<li>
            <a target="_blank" title="惠州罗浮山" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109501.jpg" alt="惠州罗浮山" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="惠州罗浮山" href="#">惠州罗浮山</a></p>
            <div class="alpha-txt intro_info">
                <p>惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="西丽水库" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109362.jpg" alt="西丽水库" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="西丽水库" href="#">西丽水库</a></p>
            <div class="alpha-txt intro_info">
                <p>西丽水库历史悠久，风景优美，是春天骑行的好去处。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="婺源" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109523.jpg" alt="婺源" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="婺源" href="#">婺源</a></p>
            <div class="alpha-txt intro_info">
                <p>漫步在婺源油菜花田间，不知有多么的诗情画意。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="小坑国家森林公园" href="memory_detail.htm">
				<img src="../images/login_poi_2013031110074.jpg" alt="小坑国家森林公园" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="小坑国家森林公园" href="#">小坑国家森林公园</a></p>
            <div class="alpha-txt intro_info">
                <p>韶关小坑国家森林公园清新宁静，诗歌释放压力的好地方。</p>
            </div>
		</li>  
    </ul>
</div>
<!--吃货血拼- end-->

<!--户外撒野-->
<div class="ui-box fn-clear">
    <div class="ui-title">
        <h2 class="ui-title-cnt fn-left"><em>户外撒野</em></h2>
        <div class="ui-title-subcnt fn-right"><a target="_blank" href="memory_list.htm">+更多</a></div>
    </div>
    <ul class="poi_hot" id="poi_hot">
		<li>
            <a target="_blank" title="惠州罗浮山" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109501.jpg" alt="惠州罗浮山" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="惠州罗浮山" href="#">惠州罗浮山</a></p>
            <div class="alpha-txt intro_info">
                <p>惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="西丽水库" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109362.jpg" alt="西丽水库" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="西丽水库" href="#">西丽水库</a></p>
            <div class="alpha-txt intro_info">
                <p>西丽水库历史悠久，风景优美，是春天骑行的好去处。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="婺源" href="memory_detail.htm">
				<img src="../images/login_poi_2013031109523.jpg" alt="婺源" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="婺源" href="#">婺源</a></p>
            <div class="alpha-txt intro_info">
                <p>漫步在婺源油菜花田间，不知有多么的诗情画意。</p>
            </div>
		</li>
		<li>
            <a target="_blank" title="小坑国家森林公园" href="memory_detail.htm">
				<img src="../images/login_poi_2013031110074.jpg" alt="小坑国家森林公园" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="小坑国家森林公园" href="#">小坑国家森林公园</a></p>
            <div class="alpha-txt intro_info">
                <p>韶关小坑国家森林公园清新宁静，诗歌释放压力的好地方。</p>
            </div>
		</li>  
    </ul>
</div>
</div>
<!--户外撒野- end-->
<!--main body end-->
<%@include file="/including/footer.jsp" %>
<!-- footer end -->
</body>
</html>
