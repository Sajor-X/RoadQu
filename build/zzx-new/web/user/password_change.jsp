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
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">修改密码</h2>
			<form id="form100" action="${pageContext.request.contextPath}/changePassword.do" method="post" class="reg-form" >
				<p><label for="oldpassword"><em>*</em>原密码：</label>
                   <input name="oldpassword" type="password"  class="input-txt" id="oldpassword" autocomplete="off" size="43" />
                </p>
				<p><label for="password"><em>*</em>新密码：</label>
                   <input name="password" type="password"  class="input-txt" id="password" autocomplete="off" size="43" />
                </p>
				<p><label for="password"><em>*</em>确认密码：</label>
                   <input name="repassword" type="password"  class="input-txt" id="repassword" autocomplete="off" size="43" onblur="checkrepassword();"/>
                </p>
				<p style="color: #FF0000;">${msg}</p>
               	<input type="submit" value="修改" class="reg-login"/>
			</form>
		</div>
	</div>
</div>
</div>
</div>
<!-- 底部footer 开始-->
<%@include file="/including/footer.jsp" %>
<script type="text/javascript">
    function checkrepassword(){
        var password = document.getElementById("password");
        var repassword = document.getElementById("repassword");
        if (password.value != repassword.value && password.value!="" && repassword.value != "") {
            window.alert("两次密码不一致，请重新输入");
            document.getElementById("repassword").focus();
            document.getElementById("repassword").value="";
        }
    }
</script>
<!-- footer end -->

</body>
</html>