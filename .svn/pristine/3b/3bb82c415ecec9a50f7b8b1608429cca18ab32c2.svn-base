<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="roleDeleteBean"
	class="employee.db.beans.RoleDeleteBean" scope="page" />
<jsp:useBean id="roleQueryBean" class="employee.db.beans.RoleQueryBean"
	scope="page" />
<%!public boolean isSearcFlag = false;
	public int roleId;
	boolean isOk = false;%>
<%
	if (request.getParameter("search_role") != null) {
		isSearcFlag = true;
		roleId = Integer.parseInt(request.getParameter("role"));
	}

	if (request.getParameter("okBtn") != null) {
		//删除操作

		isOk=roleDeleteBean.deleteRole(roleId);
		if (isOk) {
			out.println("<script>alert('恭喜您删除成功!');</script>");
		} else {
			out.println("<script>alert('删除失败!');</script>");
		}

	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'role_add.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style>
body {
	background: url(images/main_content.jpg);
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: Helvetica;
}

ul[type="square"] {
	margin-top: 50px;
	text-align: center;
}

ul[type="square1"] {
	margin-top: 30px;
	text-align: center;
}

select {
	width: 150px;
	height: 30px;
	font-size: 20;
}

input[type="button"] {
	width: 100px;
	height: 30px;
	font-size: 20;
}

hr {
	width: auto;
	height: 5px;
	background: black;
}

table {
	margin-left: 10%;
	border: double;
	border-color: black;
	width: 1000px;
}

th {
	width: 120px;
	border: none;
}
</style>
</head>
<body>
	<a href="main_user.jsp">返回首页</a>
	<hr />
	<form name="form" method="post" action="role_delete.jsp">
		<ul type="square">
			<!-- select角色内容来自数据库，修改过后还要上传到数据库 -->

			<h3>
				要删除的角色： <select name="role" height="50" width="160">
					<%
						roleQueryBean.setOut(out);
						if (isSearcFlag) {
							roleQueryBean.getOptionId(roleId);
						}
						roleQueryBean.roleQueryDisplay(roleId);
					%>
				</select> <input name="search_role" type="submit" value="查询"></input>
			</h3>
		</ul>
	</form>
	<hr />

	<ul type="square1">
		<h3>删除角色</h3>
		<form name="form1" method="post" action="role_delete.jsp">
			<table>
				<tr>
					<th>角色名称</th>
					<th>信息管理</th>
					<th>信息管理</th>
					<th>人事管理</th>
					<th>考勤管理</th>
					<th>培训管理</th>
					<th>考核管理</th>
					<th>奖惩管理</th>
					<th>角色管理</th>
					<th>加密系统</th>
				</tr>
				<%
					if (isSearcFlag == true) {
						roleDeleteBean.setOut(out);
						roleDeleteBean.authorityDisplay(roleId);
					}
				%>
			</table>
			<br /> <br /> <input name="okBtn" type="submit" value="确认删除"></input>
		</form>
	</ul>
</body>
</html>
