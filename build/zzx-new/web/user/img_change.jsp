<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html  lang="zh">
<head>
	<meta charset="utf-8">
	<title>个人中心 | 驴友网</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/boxy,jquery.fancybox-1.3.4.css">
	<link href="${pageContext.request.contextPath}/css/aboutus.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reg.css"  />
	
	<script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>
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
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">修改头像</h2>
			<ul class="zhuanti-list">
				<li class="ui-box zhuanti-item">
				<form method="post" action="#" >
				<caption>
				 <strong class="title2">当前我的头像</strong><br /><br />
				 <p>如果你还没有设置自己的头像，系统会显示为默认头像，你需要自己上传一张新照片来作为自己的个人头像。</p><br />
				 <img src="http://avatar.8264.com/data/avatar/037/83/56/87_avatar_big.jpg" onerror="this.onerror=null;this.src='http://ucenter.8264.com/images/noavatar_big.gif'" />
				</caption><br /><br />
				<caption>
	            <strong class="title2">设置我的新头像</strong><br /><br />
	            <p>请选择一个新照片进行上传编辑。头像保存后，你可能需要刷新一下本页面(按F5键)，才能查看最新的头像效果。</p><br />
	              <embed width="450" height="253" scale="exactfit" src="http://ucenter.8264.com/images/camera.swf?inajax=1&appid=31&input=0897cG7VoeiI86Vp06jxHbg%2FFcTkRVWiJn4wPV1WyYvzDkjULGqqTJlbnDJB%2FOFxB9%2BwQiylSFGfBhFlYU6qFiqoIcZM2wv%2FIVPOWN3ju%2FLuH0XyoSTNPwSIiBofsvOE&agent=f95939cecaed79637c97e29779031c0e&ucapi=ucenter.8264.com&avatartype=virtual&uploadSize=2048" name="mycamera" quality="high" bgcolor="#ffffff" wmode="transparent" menu="false" swliveconnect="true" allowscriptaccess="always" type="application/x-shockwave-flash"/>                  
	             
	            </caption>
				<script type="text/javascript">document.write(AC_FL_RunContent('width','450','height','253','scale','exactfit','src','http://ucenter.8264.com/images/camera.swf?inajax=1&appid=31&input=0897cG7VoeiI86Vp06jxHbg%2FFcTkRVWiJn4wPV1WyYvzDkjULGqqTJlbnDJB%2FOFxB9%2BwQiylSFGfBhFlYU6qFiqoIcZM2wv%2FIVPOWN3ju%2FLuH0XyoSTNPwSIiBofsvOE&agent=f95939cecaed79637c97e29779031c0e&ucapi=ucenter.8264.com&avatartype=virtual&uploadSize=2048','id','mycamera','name','mycamera','quality','high','bgcolor','#ffffff','wmode','transparent','menu','false','swLiveConnect','true','allowScriptAccess','always'));
	            </script>
				<input type="hidden" name="formhash" value="ce9e05e1" />  
				</form>		
				</li>		

			</ul>

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