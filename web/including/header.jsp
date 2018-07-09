<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header">
    <div class="headWrap">
        <div class="headTop fn-clear">
            <h1 class="logo">
                <a href="index.htm" title="驴友网" style="float: left;" >驴友网</a>
            </h1>
            <h2 class="slogan" title="在旅途中相遇">在旅途中相遇</h2>

           <div class="loginInfo">                
                <ul class="not_login">
                	<c:if test="${empty user }">
                   		<li style="float:right"><a href="${pageContext.request.contextPath }/login/register.jsp" class="btn_reg">注册</a></li>
                    	<li  style="float:right"><a href="${pageContext.request.contextPath }/login/login.jsp"  id="top-nav-login" class="btn_login">登录</a></li>
                	</c:if>
                	<c:if test="${!empty user }">
                		<li style="float:right"><a href="${pageContext.request.contextPath }/exit.do">注销</a></li>
						<li style="float:right"><a href="#">好友申请（0）</a>&nbsp;&nbsp;&nbsp;</li>
						<li style="float:right"><a href="#">站内信（0）</a>&nbsp;&nbsp;&nbsp;</li>
						<li style="float:right"><a href="${pageContext.request.contextPath }/user/account_detail.jsp">${user.username }</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
               		</c:if>
                </ul>
            </div>
        </div>
        <ul class="dropdown">
            <li class="current">
                <a href="${pageContext.request.contextPath }/index.jsp" >首页</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath }/memory.do">旅游记忆</a>
            </li>
            <li>
				<a href="${pageContext.request.contextPath }/traveller.do">结伴游</a>
			</li>
            <li>
				<a href="${pageContext.request.contextPath }/strategy.do">景点攻略</a>
			</li>
		</ul>
				 
		<div class="navSearch">
			<form action="${pageContext.request.contextPath }/memorySearch.do" method="get" id="searchForm" target="_blank">
				<input name="key" type="text" class="top-search-input" id="searchKey" placeholder="搜索旅游记忆"  maxlength="50" autocomplete="off"/>
                <input name="" type="submit" value="搜索" class="search_btn">
            </form>
			<div id="keyword_tip_content"></div>
		</div>
	</div>
</div>
</body>
</html>