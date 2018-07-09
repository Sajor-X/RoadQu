<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html lang="zh"><!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>旅游记忆 | 驴友网</title>
        <meta name="keywords" content="旅游社交，在旅途中享受激情与欢乐" />
        <meta name="description" content="旅游社交，在旅途中享受激情与欢乐"/>
        <link rel="shortcut icon" href="${pageContext.request.contextPath }/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/boxy,jquery.fancybox-1.3.4.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/huidong.css">
        <script type="text/javascript">
			var userjson = '';
			var c_cityinfo = '';
		</script>
	</head>
    
<body>
<%@include file="/including/header.jsp" %>
<div id="container">
	<div class="ui-box fn-clear">
			<p><img src="${memory.tmimg}" style="height:200px; width:300px; float:left; padding-right:5px;" >
			&nbsp;&nbsp;&nbsp;&nbsp;标题：    <c:out value="${memory.tmtitle}" /> <br /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;类别：
				<c:forEach var="memoryType" items="${memoryTypeList}">
					<c:if test="${memoryType.memorytypeid==memory.memorytypeid}">
						<c:out value="${memoryType.memorytype}" />
					</c:if>
				</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;发布者：  <c:out value="${memory.username}" />
			&nbsp;&nbsp;&nbsp;&nbsp;发布时间：<fmt:formatDate value="${memory.tmtime}" pattern="yyyy-MM-dd"/> <br /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;内容：    <c:out value="${memory.tmcontent}" /></p>
	</div>
	<!-- 发表评论 -->
	<form action="${pageContext.request.contextPath}/addComment.do" method="post">
	<div class="ui-box fn-clear">
		<div id="comment" class="comment cnt-box fn-clear">
			<h2>发表评论</h2>
			<div class="comment_headPic fn-left">
				<a href="#"><img width="75" height="75"  src="../images/default.jpg">	</a>
			</div>
			<div class="comment_info fn-right">
			<input type="text" hidden="hidden" value="${memory.tmid}" name="tmid"/>
			<div class="cont fn-clear">
				<textarea class="talkBox" id="comment_box" style="float:left" name="commentcontent"></textarea>
				<input type="submit" class="sendBtn" value="评论">
			</div>
			</div>
		</div>				
	</div>
	</form>
	<div class="mainWrap wide-wrap fn-clear">
		<div class="main">
			<!--comments-->
			<div id="comment" class="comment cnt-box fn-clear">
				<h2>所有评论</h2>
					<ul id="comment-list" class="comment-list">

						<c:forEach items="${commentList}" var="comment">
						<li class="fn-clear">
							<div class="comment_headPic fn-left">
								<a href="#"><img width="75" height="75" alt="i闲逛" src="../images/default.jpg"> </a>
							</div>
							<div class="comment_info fn-right">
								<p>
									<a class="comment_user" href="#"> ${comment.username}</a><fmt:formatDate value="${comment.commentdate}" pattern="yyyy年MM月dd日   HH:mm:ss"/>
								</p>
								<div class="comment_box">
									<div class="SA">
										<em>◆</em><span>◆</span>
                                    </div>
									<div class="comment_cnt">${comment.commentcontent}
										<a href='#' >#一起玩旅游圈之试玩团心声#</a>
                                            
                                    </div>
                                </div>
                            </div>
                        </li>
						</c:forEach>
					</ul>
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- 底部footer 开始-->
  <%@include file="/including/footer.jsp" %>
	<!-- footer end -->
    </body>
</html>