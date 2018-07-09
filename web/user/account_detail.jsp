<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html  lang="zh">
<head>
	<meta charset="utf-8">
	<title>个人中心 | 驴友网</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/boxy,jquery.fancybox-1.3.4.css">
	<link href="${pageContext.request.contextPath }/css/aboutus.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reg.css"  />
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
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">基本信息</h2>
			<form id="form100" action="login.htm" method="post" class="reg-form" >
				<p><label for="nickname"><em>*</em>性别：</label>
                   <input type="radio" name="optionsRadios" ><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;男</font>&nbsp;&nbsp;&nbsp;&nbsp;  
				   <input type="radio" name="optionsRadios"><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;女</font>  
                </p>
				<p><label for="nickname"><em>*</em>生日：</label>
                   <input type="text" class="input-txt" autocomplete="off" size="43" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </p>
				<p><label for="nickname"><em>*</em>所在地：</label>
                   <input type="text"  class="input-txt" id="password" autocomplete="off" size="43" />
                </p>
				<p><label for="nickname"><em>*</em>QQ：</label>
                   <input  type="text"  class="input-txt" id="password" autocomplete="off" size="43" />
                </p>
				<p><label for="nickname"><em>*</em>电话号码：</label>
                   <input type="text"  class="input-txt" id="password" autocomplete="off" size="43" />
                </p>
				<p><label for="nickname"><em>*</em>爱好：</label>
                   <input type="text"  class="input-txt" id="password" autocomplete="off" size="43" />
                </p>
				<p><label for="nickname"><em>*</em>个人简介：</label>
                   <textarea rows="5" cols="60" id="nickname"  size="43" ></textarea>
                </p><p></p>
               	<a href="../index.htm" class="reg-login">修改</a>
			</form>
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