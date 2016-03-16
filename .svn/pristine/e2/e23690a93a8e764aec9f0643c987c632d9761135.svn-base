<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>提示信息</title>
	</head>
  
	<body>
		<%=request.getAttribute("message")%>
		<br/>
		<a href="<%=path%>/<%=request.getAttribute("url")%>">返回</a>
	</body>
</html>