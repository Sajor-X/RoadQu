<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="bottom_c_l">
    <div class="title01"> 动态</div>
    <div class="list01 bk">
        <ul>
            <li>
                <a href="${pageContext.request.contextPath }/user/state.jsp">
                    <div class="icon_bot"><img src="../images/help13.png"></div>
                    我的动态</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath }/user/state_friend.jsp">
                    <div class="icon_bot"><img src="../images/help13.png"></div>
                    好友动态</a>
            </li>
        </ul>
    </div>
    <div class="title01"> 我的记忆</div>
    <div class="list01 bk">
        <ul>
            <li>
                <a href="${pageContext.request.contextPath }/user/memory_add.jsp">
                    <div class="icon_bot"><img src="../images/help12.png"></div>
                    发布新记忆</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath }/memoryForMe.do?page=1">
                    <div class="icon_bot"><img src="../images/help14.png"></div>
                    全部记忆</a>
            </li>
        </ul>
    </div>
    <div class="title01"> 相约驴友</div>
    <div class="list01 bk">
        <ul>
            <li>
                <a href="${pageContext.request.contextPath }/user/traveller_add.jsp">
                    <div class="icon_bot"><img src="../images/help12.png"></div>
                    发起旅游</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath }/travellerForMe.do?page=1">
                    <div class="icon_bot"><img src="../images/help13.png"></div>
                    我发起的旅游</a>
            </li>
        </ul>
    </div>
    <div class="title01"> 我的好友</div>
    <div class="list01 bk">
        <ul>
            <li>
                <a href="${pageContext.request.contextPath }/user/friend.jsp">
                    <div class="icon_bot"><img src="../images/help12.png"></div>
                    好友列表</a>
            </li>
        </ul>
    </div>
    <div class="title01">账号管理</div>
    <div class="list01 bk">
        <ul>
            <li>
                <a href="${pageContext.request.contextPath }/user/account_detail.jsp">
                    <div class="icon_bot"><img src="../images/help12.png"></div>
                    基本信息</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath }/user/img_change.jsp">
                    <div class="icon_bot"><img src="../images/help13.png"></div>
                    修改头像</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath }/user/password_change.jsp">
                    <div class="icon_bot"><img src="../images/help14.png"></div>
                    修改密码</a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
