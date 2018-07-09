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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/youhui.css" media="all">
</head>
   
<body id="profile-homepage">
<%@include file="/including/header.jsp" %>

<div id="container">
<div id="mainWrapper" class="cf"> 

	<div class="sceneInfo">
    	<div class="sceneView fn-clear ">
       		<div class="scenePic">
				<ul id="slider" class="slider">
					<li>
						<a href="#"><img src="${strategy.tsimg}" width="530" height="325" alt="${strategy.tstitle}" title="${strategy.tstitle}"></a>
						<div class="alpha-txt txt-info">
                        	<h2>${strategy.tstitle}</h2>
                        	<p>${strategy.tsdescribe}</p>
                    	</div>
                	</li>
				</ul>
			</div>
			
			<div class="sceneIntro">
				<div class="sceneIntro-head">
               		<h2 class="fn-left">${strategy.tsname}</h2>
                	<div class="scene_share">
                    	<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
                        	<span class="bds_more">分享到：</span>
                        	<a class="bds_tsina"></a>
                        	<a class="bds_tqq"></a>
                        	<a class="bds_kaixin001"></a>
                        	<a class="bds_renren"></a>
                       	 	<a class="bds_qzone"></a>
                   		</div>
                	</div>
            	</div>
				
				<p class="txt-desc-p">
                	<span class="fn-clear">${strategy.tsintro}</span>
           		</p>

            <div class="scene-subcnt">
                <ul class="guide-tag">
                    <li> <a href="javascript:;" class="wantGo" data-flag="0" data-lid="d03f8050ea1ccf438b874a53f5bdf478">想去</a><span>${strategy.tswant}</span></li>
                    <li class="gone"><a href="javascript:;" class="aleadyGo" data-flag="0" data-lid="d03f8050ea1ccf438b874a53f5bdf478">去过</a><span>${strategy.tsbeen}</span></li>
                    <li class="tuijian"><a href="#" class="share-city" id="share-city" data-cityid="291">推荐给朋友</a></li>
                </ul>
            </div>
            <div class="scoreSec">
                                <a href="javascript:void(0);" onClick="javascript:return needLogin();" class="load-gonglue-btn" >下载城市攻略</a>                <a href="javascript:void(0);" onClick="javascript:return needLogin();" class="load-map-btn" >下载旅游地图</a>                            </div>
 
        </div>
    </div>
	
	<div class="ui-box fn-clear ">
	<!-- 发帖人 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">景点：</span>
            <span class="tag-cnt fn-right" id="lyq"><a href="#" data-lyq="0">${strategy.tsname}</a></span>
        </div>
         <!--end 发帖人 -->
        <!-- 发帖人 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">类型：</span>
            <span class="tag-cnt fn-right" id="lyq"><a href="#" data-lyq="0">
                <c:forEach var="strategyType" items="${strategyTypeList}">
                    <c:if test="${strategyType.stypesid==strategy.stypesid}">
                        <c:out value="${strategyType.stypesname}" />
                    </c:if>
                </c:forEach>
            </a></span>
        </div>
         <!--end 发帖人 -->
		 
		 <!-- 目的地 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">适宜人群：</span>
            <span class="tag-cnt fn-right" id="lyq"><a href="#" class="tag-current" data-lyq="0">${strategy.tspppeople}</a></span>
        </div>
         <!--end 目的地 -->
		 
		  <!-- 行程安排 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">适宜时间：</span>
            <span class="tag-cnt fn-right" id="lyq"><a href="#" data-lyq="0">${strategy.tsapptime}</a></span>
        </div>
         <!--end 行程安排 -->
		 
		 <!-- 联系方式 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">必备装备：</span>
            <span class="tag-cnt fn-right" id="lyq"><a href="#" class="tag-current" data-lyq="0">${strategy.tsequip}</a> </span>
        </div>
         <!--end 联系方式 -->
		  <!-- 联系方式 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">注意事项：</span>
            <span class="tag-cnt fn-right" id="lyq">${strategy.tsnotice}</span>
        </div>
         <!--end 联系方式 -->
		 
		 <!-- 帖子详情 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">详情：</span>
            <span class="tag-cnt fn-right" id="lyq">${strategy.tsaddress}</span>
        </div>
         <!--end 帖子详情 -->
    </div>
</div>	
</div>
</div>

<script type="text/javascript" id="bdshare_js" data="type=tools&amp;mini=1&amp;uid=718154" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
    var bds_config = {'bdText':'我正在光临驴友网，精选的线路行程、旅游圈、专题和游记攻略，还有特色景点、住宿、美食、购物和交通服务等，可查看游玩地图，还能下载城市旅游攻略。（分享自路趣网）','bdPic':'http://www.roadqu.com/images/intro_201301102119_-1.jpg'};
    document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
</script>

<%@include file="/including/footer.jsp" %>
<!-- footer end -->
</body>
</html>