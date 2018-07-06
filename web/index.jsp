<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
    <title>首页 | 驴友网</title>
    <meta name="Keywords" content="驴友网"/>
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
    <meta name="baidu-site-verification" content="fGdITGCHHMB5crjs" />
    <link rel="shortcut icon" href="favicon.ico"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" media="all"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/boxy,jquery.fancybox-1.3.4.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/cityguide.css"  />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css" media="all">
    <script type="text/javascript">
    var userjson = '';
    var c_cityinfo = '';
</script>
<!-- 合并jquery and $LAB -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min,LAB.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
</head>

<body>
	<%@include file="including/header.jsp" %>
<!--top end-->
<!--main body-->
<div id="container">
<div id="mainWrapper" class="cf">
	<ul class="city-select">
        <li class="current">
        <a href="city/shenzhen">深圳市</a>
        <p>4634个景点</p>
    	</li>
        <li>
        	<a href="city/guangzhou">广州市</a>
        	<p>3742个景点</p>
    	</li>
        <li>
			<a href="city/huizhou">惠州市</a>
			<p>1193个景点</p>
    	</li>
        <li>
			<a href="city/zhuhai">珠海市</a>
			<p>1490个景点</p>
    	</li>
        <li>
			<a href="city/foshan">佛山市</a>
			<p>1880个景点</p>
    	</li>
        <li>
			<a href="city/shaoguan">韶关市</a>
			<p>838个景点</p>
    	</li>
			<li class="coming_soon">
			<a href="#">其他城市统计中...</a>
    	</li>
	</ul>	

<div class="sceneInfo">
    <div class="sceneView fn-clear ">
        <div class="scenePic">
			<ul id="slider" class="slider">
            	<li>
					<a href="">
						<img src="images/intro_201301102119_-1.jpg" width="530" height="325" alt="观澜版画村 画中有话" title="观澜版画村 画中有话">
					</a>
                    <div class="alpha-txt txt-info">
                        <h2>观澜版画村 画中有话</h2>
                        <p>久负盛名客家小村，都市繁华深处的一块净土，深圳最美丽的乡村。</p>
                    </div>
                </li>
             </ul>
		</div>
        <div class="sceneIntro">
            <div class="sceneIntro-head">
                <h2 class="fn-left">系统公告</h2></div>
			
			<p><span class="fn-clear">欢迎进入驴友网，更多公告信息动态更新......</span></p><br />
				
            <div class="scene-subcnt">
                <ul class="guide-tag">
                    <li> <a href="#" class="wantGo" >不经意间，只一眼，所有小时候的记忆呼之欲出</a></li>
                    <li class="gone"><a href="#" class="aleadyGo" >古城小巷，隐匿多少失落的历史光阴，发现历史与禅意</a></li>
                    <li class="tuijian"><a href="#" class="share-city" id="share-city">久负盛名客家小村，都市繁华深处的一块净土</a></li>
                </ul>
            </div>
			
			
			<div class="scoreSec"><br /><br /><br /><br /><br />
				<ul class="scene-thumbnail" id="scene-thumbnail">
					<li>
						<a href="images/5f45080874b9502e80cbfcc3e10c6dd3-175-175.jpg" target="_blank"
						   rel="gallery" class="thumbnail">
							<img src="images/5f45080874b9502e80cbfcc3e10c6dd3-175-175_c.jpg" alt="teamleader" width="70" height="70"></a>
					</li>
					<li>
						<a href="images/8ec44886bac029c30e931b67be5922ec-175-175.jpg" target="_blank"
						   rel="gallery" class="thumbnail">
							<img src="images/8ec44886bac029c30e931b67be5922ec-175-175_c.jpg" alt="teamleader" width="70" height="70"></a>
					</li>
					<li>
						<a href="images/d28a4f38621a9c8c7cfce41ddc367a68-175-175.jpg" target="_blank"
						   rel="gallery" class="thumbnail">
							<img src="${pageContext.request.contextPath }/images/d28a4f38621a9c8c7cfce41ddc367a68-175-175_c.jpg" alt="小u" width="70" height="70"></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/images/f7896dc56b2f4d349da6a945d10b2546-175-175.jpg" target="_blank"
						   rel="gallery" class="thumbnail">
							<img src="${pageContext.request.contextPath }/images/f7896dc56b2f4d349da6a945d10b2546-175-175_c.jpg" alt="teamleader" width="70" height="70"></a>
					</li>
					<li class="more-link">
						<a href="city/pic/shenzhen">更多图片</a>
					</li>
				</ul>
			</div>
		</div>
    </div>
</div>

<!--热门旅游记忆-->
<div class="ui-box fn-clear">
    <div class="ui-title">
        <h2 class="ui-title-cnt fn-left"><em>旅游记忆</em></h2>
        <div class="ui-title-subcnt fn-right"><a target="_blank" href="memory/memory.htm">+更多</a></div>
    </div>
    <ul class="poi_hot" id="poi_hot">
		<li>
            <a title="惠州罗浮山" href="memory/memory_detail.htm">
				<img src="${pageContext.request.contextPath }/images/login_poi_2013031109501.jpg" alt="惠州罗浮山" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="惠州罗浮山" href="#">惠州罗浮山</a></p>
            <div class="alpha-txt intro_info">
                <p>惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。</p>
            </div>
		</li>
		<li>
            <a title="西丽水库" href="memory/memory_detail.htm">
				<img src="${pageContext.request.contextPath }/images/login_poi_2013031109362.jpg" alt="西丽水库" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="西丽水库" href="#">西丽水库</a></p>
            <div class="alpha-txt intro_info">
                <p>西丽水库历史悠久，风景优美，是春天骑行的好去处。</p>
            </div>
		</li>
		<li>
            <a title="婺源" href="memory/memory_detail.htm">
				<img src="${pageContext.request.contextPath }/images/login_poi_2013031109523.jpg" alt="婺源" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="婺源" href="#">婺源</a></p>
            <div class="alpha-txt intro_info">
                <p>漫步在婺源油菜花田间，不知有多么的诗情画意。</p>
            </div>
		</li>
		<li>
            <a title="小坑国家森林公园" href="memory/memory_detail.htm">
				<img src="${pageContext.request.contextPath }/images/login_poi_2013031110074.jpg" alt="小坑国家森林公园" width="221" height="300">
            </a>
            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="小坑国家森林公园" href="#">小坑国家森林公园</a></p>
            <div class="alpha-txt intro_info">
                <p>韶关小坑国家森林公园清新宁静，诗歌释放压力的好地方。</p>
            </div>
		</li>  
    </ul>
</div>
<!--热门旅游记忆- end-->

<div class="ui-box fn-clear">
    <div class="ui-title">
        <h2 class="ui-title-cnt fn-left"><em>友情链接</em></h2>
        <div class="ui-title-subcnt fn-right"><a href="#">+ 更多</a></div>
    </div>
    <div class="friend-link">
        <div class="link-list" id="link-list">
			<!--第一屏-->
			<div>
				<ul>
					<li><a href="http://www.roadqu.com/apps/qunawan/" target="_blank">今天去哪玩?</a></li>
                    <li><a href="品味旅游网 " target="_blank">品味旅游网 </a></li>
                    <li><a href="http://www.redidai.com" target="_blank">热地带旅行网</a></li>
                    <li><a href="http://www.maidou.cn " target="_blank">旅游网</a></li>
                    <li><a href="http://gz.ganji.com/tejiajipiao/" target="_blank">广州特价机票</a></li>
                    <li><a href="http://tukeq.com" target="_blank">途客圈旅行网</a></li>
                    <li><a href="http://www.vaazaa.com" target="_blank">四川旅游</a></li>
                    <li><a href="http://home.sz.soufun.com" target="_blank">深圳家居</a></li>
                    <li><a href="http://huoche.mipang.com" target="_blank">火车票查询</a></li>
                    <li><a href="http://www.cnutg.com" target="_blank">旅游攻略网</a></li>
                    <li><a href="http://www.dgairport.cn/ " target="_blank">机票预定查询</a></li>
					<li><a href="http://sz.esf.focus.cn/" target="_blank">深圳二手房</a></li>
                    <li><a href="http://gz.58.com/nongjiale/" target="_blank">广州农家乐</a></li>
                    <li><a href="http://www.wuyuan168.com/" target="_blank">婺源旅游</a></li>
                    <li><a href="http://www.tourye.com" target="_blank">陶冶户外</a></li>
                    <li><a href="http://www.szwalking.com" target="_blank">深圳徒步网</a></li>
                    <li><a href="http://www.roadqu.com/interest/11" target="_blank">亲子旅游</a></li>
                    <li><a href="http://www.taiwandao.tw" target="_blank">台湾旅游</a></li>
                    <li><a href="http://taiguo.mipang.com" target="_blank">泰国旅游</a></li>
                    <li><a href="http://www.tianqiyubao.cn" target="_blank">天气预报</a></li>
                    <li><a href="http://www.cnutg.com" target="_blank">特价机票网</a></li>
                    <li><a href="http://www.iqiyi.com/lvyou/" target="_blank">爱奇艺旅游</a></li>
                    <li><a href="http://www.jhgl.cn/" target="_blank">嘉华国旅</a></li>
                    <li><a href="http://piao.gaotie.cn" target="_blank">网上订票</a></li>
                    <li><a href="http://shenzhen.qd8.com.cn" target="_blank">深圳分类信息</a></li>
                    <li><a href="http://travel.poco.cn/" target="_blank">poco旅游</a></li>
                    <li><a href="http://www.17u.com/tickets/ " target="_blank">景点门票 </a></li>
                    <li><a href="http://www.roadqu.com/lvyouquan/" target="_blank">旅游圈</a></li>
				</ul>
			</div>
			<div>
				<ul>
					<li><a href="http://www.roadqu.com/interest/" target="_blank">旅游社区</a></li>
					<li><a href="http://www.roadqu.com/book/list" target="_blank">温泉门票优惠</a></li>
					<li><a href="http://www.roadqu.com/city/" target="_blank">城市导游</a></li>
					<li><a href="http://www.roadqu.com/event/" target="_blank">休闲旅游</a></li>
					<li><a href="http://www.roadqu.com/journey/" target="_blank">旅游攻略</a></li>
					<li><a href="http://chat.uzai.com/" target="_blank">悠哉旅游社区</a></li>
					<li><a href="http://www.roadqu.com/book/" target="_blank">广东温泉预订</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--友情链接 end-->
</div>
</div>
<!--main body end-->
<%@include file="including/footer.jsp" %>


<!-- STUFF YOU NEED FOR BEAUTYTIPS -->
<!--[if IE]>
<script src="/static/js/excanvas.js" type="text/javascript" charset="utf-8"></script><![endif]-->
<!-- /STUFF -->

<!-- 图片加载透明文字开始 -->
<script type="text/javascript">
    $(document).ready(function () {

        // 幻灯片
        $("#poi_hot li,#wanfa_pic li:first").hover(function () {
            var $this = $(this);
            $this.find('div.intro_info').show();

        }, function () {
            var $this = $(this);
            $this.find('div.intro_info').hide();

        })
        $LAB.script("js/jquery.bxSlider.min.js")
                .wait(function () {
                    $('#slider').bxSlider({ auto:true, pager:true});
                    $('#link-list').bxSlider({ speed:1000});
                })
        $("#guide_nav li").hover(function () {
            var $this = $(this);
            $this.addClass("guide_nav_item_hover");


        }, function () {
            var $this = $(this);
            $this.removeClass("guide_nav_item_hover");

        })

        //youhui pop

        var isInDiscountCard = false;


        $("#youhui-hot>li").bt(
                {
                    fill:'#FFFFFF',
                    strokeStyle:'#BFBFA8',
                    cornerRadius:5,
                    padding:20,
                    width:285,
                    spikeLength:10,
                    spikeGirth:10,
                    ajaxPath:["$(this).attr('data-href')"],
                    closeWhenOthersOpen:true,


                    hideTip:function (box, callback) {
                        if (!isInDiscountCard) {
                            $(box).hide();

                            callback();
                        }
                    },
                    hoverIntentOpts:{
                        interval:300,
                        timeout:1000
                    }

                });

        $('#pop-discount').live('mouseenter', function () {

            isInDiscountCard = true;
        });

        $('#pop-discount').live('mouseleave', function () {

            isInDiscountCard = false;
            $("#container").trigger('click');
        });

    });
	
    
    
    /* 获取 */
</script>
<!-- 图片加载透明文字结束 -->
</body>
</html>
