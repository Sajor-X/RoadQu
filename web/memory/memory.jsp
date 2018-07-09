<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>旅游记忆 | 驴友网</title>
    <meta name="Keywords" content="驴友网"/>
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐"/>
    <meta name="baidu-site-verification" content="fGdITGCHHMB5crjs" />
    <link rel="shortcut icon" href="favicon.ico"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" media="all"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/boxy,jquery.fancybox-1.3.4.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css" media="all">
    <script type="text/javascript">
    var userjson = '';
    var c_cityinfo = '';
</script>
<!-- 合并jquery and $LAB -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min,LAB.min.js"></script>
</head>

<body>
<%@include file="/including/header.jsp" %>
<!--top end-->

<!--main body-->
<div id="container">
    <c:forEach items="${memoryTypeList}" var="memoryType">
        <c:set value="0" var="flag"/>
        <!--面朝大海-->
        <div class="ui-box fn-clear">
            <div class="ui-title">
                <h2 class="ui-title-cnt fn-left"><em><c:out value="${memoryType.memorytype}"/></em></h2>
                <div class="ui-title-subcnt fn-right"><a target="_blank" href="memoryList.do?memorytypeid=${memoryType.memorytypeid}&page=1">+更多</a></div>
            </div>
            <ul class="poi_hot" id="poi_hot">
                <c:forEach items="${memories}" var="memory" >
                    <c:if test="${memory.memorytypeid==memoryType.memorytypeid and flag<4}">
                        <c:set var="flag" value="${flag+1}"/>
                        <li>
                            <a target="_blank" title="<c:out value='${memory.tmtitle}'/>" href="/memoryDetail.do?tmid=${memory.tmid}">
                                <img src="<c:out value='${memory.tmimg}'/>" alt="<c:out value="${memory.tmtitle}"/>" width="221" height="300">
                            </a>
                            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="<c:out value='${memory.tmtitle}'/>" href="#"><c:out value='${memory.tmtitle}'/></a></p>
                            <div class="alpha-txt intro_info">
                                <p><c:out value="${memory.tmcontent}"/></p>
                            </div>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <!--面朝大海- end-->
    </c:forEach>
</div>

<!--main body end-->
<%@include file="/including/footer.jsp" %>
<!-- footer end -->
</body>
</html>
