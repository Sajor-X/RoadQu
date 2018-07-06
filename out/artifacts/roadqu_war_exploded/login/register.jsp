<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<meta charset="utf-8">
<title>注册 | 驴友网</title>
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
			<h2>欢迎注册驴友网</h2>
			<form id="form100"
				action="${pageContext.request.contextPath }/register.do"
				method="post" class="reg-form"
				onsubmit="return submitClick();">
				<p>
					<label for="username"><em>*</em>用户名：</label> <input name="username"
						type="text" class="input-txt" id="username" autocomplete="off"
						size="43" />
				</p>
				<p>
					<label for="password"><em>*</em>密码：</label> <input name="password"
						type="password" class="input-txt" id="password" autocomplete="off"
						size="43" />
				</p>
				<p>
					<label for="password"><em>*</em>确认密码：</label> <input
						name="repassword" type="password" class="input-txt"
						id="repassword" autocomplete="off" size="43" onblur="checkrepassword();"/>
				</p>
				<p>
					<label for="email"><em>*</em>邮箱：</label> <input name="email"
						type="text" class="input-txt" id="email" size="43">
				</p>
				<p class="checkcode">
					<label for="checkcode"><em>*</em>验证码：</label> <input
						name="checkcode" type="text" class="input-txt" id="checkcode"
						autocomplete="off"><img height="26" align="absmiddle"
						width="105" onclick="changeCheckCodeImg();" title="看不清？点击更换"
						src="${pageContext.request.contextPath}/code.do" id="checkcodeimg"><span
						onclick="changeCheckCodeImg();" class="refresh">换一换</span>
				</p>
				<p class="chcek-rule">
					<input name="agree" type="checkbox" value="1" checked /> <span
						class="fl">我同意</span><a href="#" target="_blank">《驴友网服务公约》</a>
				</p>
				<!-- <a class="regbtn" id="submit" href="javascript:void(0);" hidefocus="true">立即注册</a> -->
				<input type="submit" class="regbtn" value="立即注册" />
			</form>

			<div class="reg-notes">
				<p color="red">${msg}</p>
				<p>如果你已注册，请直接登录</p>
				<a href="${pageContext.request.contextPath }/login/login.jsp"
					class="reg-login">登录</a>
				<dl class="login-option">
					<dt>你也可以用以下方式登录</dt>
					<dd class="sina-ico">
						<a href="#">新浪微博</a>
					</dd>
					<dd>
						<a href="#">腾讯微博</a>
					</dd>
				</dl>
			</div>
		</div>
	</div>

	<%@include file="/including/footer.jsp" %>
	<script type="text/javascript">
		/* 验证码的替换 */
		function changeCheckCodeImg() {
			var num = Math.random();
			var img = document.getElementById("checkcodeimg");
			img.src = "${pageContext.request.contextPath}/code.do?id=" + num;
		}

		function checkrepassword(){
		    var password = document.getElementById("password");
		    var repassword = document.getElementById("repassword");
			if (password.value != repassword.value && password.value!="" && repassword.value != "") {
				window.alert("两次密码不一致，请重新输入");
				document.getElementById("repassword").focus();
				document.getElementById("repassword").value="";
			}
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
			if(validNull("repassword","请再次输入密码")){
				return false; 
			}
			if(validNull("email","请输入邮箱")){
				return false; 
			}
			if(validNull("checkcode","请输入验证码")){
				return false;
			}
			return true;
		}
		
		
		//判断用户名是否被占用
		$(function(){
			$("#username").blur(function(){
				var name = $("#username").val();
				if(name != "")
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath }/checkUserNameExit.do?username="+name,
					contentType:"application/json;charset=utf-8",
					success:function(data){
						if(data!=0){
							window.alert("该用户名已经被占用！请重新输入用户名");
							$("#username").val("");
							document.getElementById("username").focus();
						}
					},
					error:function(){
						alert("出错误");
					}
				});
			});
		});
		
		
		//验证验证码
		$(function(){
			$("#checkcode").blur(function(){
				var checkcode = $("#checkcode").val();
				if(checkcode != "")
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath }/checkcode.do?checkcode="+checkcode,
					contentType:"application/json;charset=utf-8",
					success:function(data){
						 if(data!=1){
							window.alert("验证码错误！请重新输入");
							$("#checkcode").val("");
						} 
					},
					error:function(){
						alert("出错误");
					}
				});
			});
		});
	</script>
	<!-- footer end -->
</body>
</html>