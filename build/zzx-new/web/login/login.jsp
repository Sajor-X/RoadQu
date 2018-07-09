<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<meta charset="utf-8">
<title>登录 | 驴友网</title>
<meta name="Keywords" content="驴友网" />
<meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/global.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/reg.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/boxy,jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
	var userjson = '';
	var c_cityinfo = '';
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
</head>

<body id="reg">
	<!--top-->
	<%@include file="/including/header.jsp" %>
	<!--top end-->
	<div id="container" class="noXtips cf">
		<div class="main">
			<h2>欢迎登录驴友网</h2>
			<form action="${pageContext.request.contextPath }/login.do"
				method="post" class="reg-form" onsubmit="return submitClick();">
				<p>
					<label for="username"><em>*</em>用户名：</label> <input name="username"
						type="text" class="input-txt" id="username" autocomplete="off"
						size="43"  value="${username}"/>
				</p>
				<p>
					<label for="password"><em>*</em>密码：</label> <input name="password"
						type="password" class="input-txt" id="password" autocomplete="off"
						size="43" />
				</p>
				<p class="checkcode">
					<label for="checkcode"><em>*</em>验证码：</label> <input
						name="checkcode" type="text" class="input-txt" id="checkcode"
						autocomplete="off"><img height="26" align="absmiddle"
						width="105" onclick="changeCheckCodeImg();" title="看不清？点击更换"
						src="${pageContext.request.contextPath}/code.do" id="checkcodeimg"><span
						onclick="changeCheckCodeImg();" class="refresh">换一换</span>
				</p>
				<input type="submit" value="登陆" class="reg-login">
			</form>

			<div class="reg-notes">
				<p style="color: #FF0000;">${msg}</p>
				<p>如果你还没有账户，请点击注册</p>
				<a
					href="${pageContext.request.contextPath }/login/register.jsp"
					class="reg-login">注册</a>
			</div>
		</div>
	</div>
<%@include file="/including/footer.jsp" %>
	
	<!-- footer end -->
	<script type="text/javascript">
		/* 验证码的替换 */
		function changeCheckCodeImg() {
			var num = Math.random();
			var img = document.getElementById("checkcodeimg");
			img.src = "${pageContext.request.contextPath}/code.do?id=" + num;
		}

		function validNull(theId, msg) {
			if (document.getElementById(theId).value == "") {
				window.alert(msg);
				document.getElementById(theId).focus();
				return true;
			}
		}
		
		
		function submitClick() {
			if (validNull("username", "请输入用户名！")) {
				return false;
			}
			if(validNull("password","请输入密码")){
				return false; 
			}
			if(validNull("checkcode","请输入验证码")){
				return false;
			}
			return true;
		}
		
		
		$(function(){
			$("#checkcode").blur(function(){
				var checkcode = $("#checkcode").val();
				if(checkcode!=""){
                    $.ajax({
                        type:"get",
                        url:"${pageContext.request.contextPath }/checkCode.do?checkcode="+checkcode,
                        contentType:"application/json;charset=UTF-8",
                        async: false,
                        cache: false,
                        timeout : 50000,
                        success:function(data){
                            if(data!=1){
                                window.alert("验证码错误！请重新输入");
                                $("#checkcode").val("");
                            }
                        },
                        // error:function(){
                        //     alert("出错误");
                        // }
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                                         // $("#p_test").innerHTML = "there is something wrong!";
                                           alert(XMLHttpRequest.status);
                                           alert(XMLHttpRequest.readyState);
                                           alert(textStatus);
                        }
                    })
				};
			});
		});
	</script>
</body>
</html>