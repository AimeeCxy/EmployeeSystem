<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="roleQueryBean" class="employee.db.beans.RoleQueryBean"
	scope="page" />
<%!public boolean isSearcFlag = false;
	public int roleId=-1;%>
<%
	if (request.getParameter("search_role") != null) {
		isSearcFlag = true;
		roleId = Integer.parseInt(request.getParameter("role"));
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="<%=basePath%>">

<title>role_query.jsp</title>

<style>
body {
	background: url(images/main_content.jpg);
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: Helvetica;
	overflow: scroll;
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
	margin-left: 16%;
	border: double;
	border-color: black;
	width: 800px;
}

th {
	width: 120px;
	border: none;
}
</style>
</head>

<body>
	<h3>返回首页</h3>
	<hr />
	<form name="form" method="post" action="role_query.jsp">
		<ul type="square">
			<h2>
				查询角色： <select name="role" >
					<%
					
						roleQueryBean.setOut(out);
						if (isSearcFlag) {
							roleQueryBean.getOptionId(roleId);
						}
						
					String	temp1 = request.getParameter("roleId1");
					String temp = request.getParameter("roleName1");
					if (temp1 != null) {
						roleId = Integer.parseInt(temp1);
						out.print("<option value=\"" + temp1 + "\">" + temp
								+ "</option>");
					}
						roleQueryBean.roleQueryDisplay(roleId);
					%>
				</select> <input name="search_role" type="submit" value="查询"></input>
			</h2>
		</ul>
	</form>
	<hr />
	<ul type="square1">
		<h3>
			角色权限
			<table>
				<tr>
					<th>权限管理</th>
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
				if(roleId!=-1){
					roleQueryBean.setOut(out);
					roleQueryBean.authorityDisplay(roleId);
					}
				%>
			</table>
		</h3>
	</ul>



	<hr />

	<ul type="square1">
		<h3>角色成员</h3>
		<table>
			<tr>
				<th>员工ID</th>
				<th>姓名</th>
				<th>部门</th>
				<th>职位</th>
			</tr>
			<%
			if(roleId!=-1){
				roleQueryBean.setOut(out);
				roleQueryBean.employeesDisplay(roleId);
				}
			%>
		</table>
	</ul>
<%roleId=-1; %>
</body>
</html>
