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
</head>
   
<body id="profile-homepage">
<%@include file="/including/header.jsp" %>

<div id="container">
	<div id="mainWrapper" class="cf"> 

		<c:forEach items="${strategyTypeList}" var="strategyType">
			<c:set value="0" var="flag"/>
			<div class="ui-box fn-clear">
				<div class="ui-title">
					<h2 class="ui-title-cnt fn-left"><em><c:out value="${strategyType.stypesname}"/></em></h2>
				</div>
				<ul class="hot-spots fn-clear">
					<c:forEach items="${strategies}" var="strategy">
						<c:if test="${strategy.stypesid==strategyType.stypesid and flag<4}">
							<c:set var="flag" value="${flag+1}"/>
							<li class="middle">
								<a href="${pageContext.request.contextPath}/strategyDetail.do?tsid=${strategy.tsid}"><img src="${strategy.tsimg}" width="190" height="190" alt="${strategy.tstitle}" title="${strategy.tstitle}"></a>
								<ul class="tag-info fn-clear">
									<li><a href="${pageContext.request.contextPath }/strategyDetail.do?tsid=${strategy.tsid}" target="_blank">${strategy.tstitle}</a></li>
									<li><a href="${pageContext.request.contextPath }/strategyDetail.do?tsid=${strategy.tsid}" target="_blank">${strategy.tsapptime}</a></li>
									<li><a href="${pageContext.request.contextPath }/strategyDetail.do?tsid=${strategy.tsid}" target="_blank">${strategy.tspppeople}</a></li>
								</ul>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</c:forEach>

	</div>
</div>

<%@include file="/including/footer.jsp" %>
<!-- footer end -->
</body>
</html>