<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="org.omg.CORBA.Request"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="authorityBean" class="employee.db.beans.AuthorityBean"
	scope="request" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%!public String temp1;
	boolean isSearchFlag = false;
	public int employeeId = -1;%>
<%
	if (request.getParameter("search_auth") != null) {
		isSearchFlag = true;
		employeeId = Integer.parseInt(request
				.getParameter("authEmployee"));
		authorityBean.setOut(out);
		authorityBean.setEmployeeId(employeeId);

	}
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<title>My JSP 'authority_manage.jsp' starting page</title>
<script type="text/javascript">
	function addToRole() {
		id2 = document.getElementById("add_to_role").value;
		$.post("AuthorityServlet", {
			employeeID :
<%=employeeId%>
	,
			optionID : id2
		}, function(data) {
			if (data > 0) {
				alert("添加成功!");
			} else {
				alert("添加失败!");
			}
		});

	}
	
	function deleteRole(id) {
		
		$.post("DeleteRoleServlet", {
			employeeID :
<%=employeeId%>
	,
			roleID : id
		}, function(data) {
			if (data > 0) {
				alert("删除成功!");
			} else {
				alert("删除失败!");
			}
		});

	}
</script>
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
	overflow: scroll;
}

hr {
	width: auto;
	height: 5px;
	background: black;
}

ul[type="square1"] {
	margin-top: 30px;
	text-align: center;
}

ul[type="square"] {
	margin-top: 50px;
	text-align: center;
}

th {
	width: 140px;
	border: none;
}

hr {
	width: auto;
	height: 5px;
	background: black;
}

table {
	margin-left: 5%;
	border: double;
	border-color: black;
	width: 1000px;
}
</style>



</head>
<h4>
	<a href="main_user.jsp">返回首页</a>
</h4>
<hr />
<form name="form" method="post" action="authority_manage.jsp">
	<ul type="square">
		<!-- select角色内容来自数据库，修改过后还要上传到数据库 -->
		<h3>
			员工： <select name="authEmployee" height="50" width="160">
				<%
					if (employeeId != -1) {
						authorityBean.getOptionId(employeeId);
					}
					//从authority_query跳转过来的请求
					temp1 = request.getParameter("employeeId");
					String temp = request.getParameter("employeeId");
					temp += "-" + request.getParameter("employeeName");
					temp += "-" + request.getParameter("title");
					if (temp1 != null) {
						employeeId = Integer.parseInt(temp1);
						authorityBean.setEmployeeId(employeeId);
						out.print("<option value=\"" + temp1 + "\">" + temp
								+ "</option>");

					}
					//
					authorityBean.setOut(out);
					authorityBean.employeeDisplay(employeeId);
				%>
			</select> <input name="search_auth" type="submit" value="查询"></input>
		</h3>
	</ul>
</form>
<hr />

<ul type="square1">
	<h3>员工权限</h3>
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
			if (employeeId != -1) {
				authorityBean.setOut(out);
				authorityBean.authEmployeeDisplay(false);
			}
		%>
	</table>
</ul>
<hr />
<ul type="square1">
	<h3>权限来源</h3>

	<table>
		<tr>
			<th>角色名称</th>
			<th>权限管理</th>
			<th>信息管理</th>
			<th>人事管理</th>
			<th>考勤管理</th>
			<th>培训管理</th>
			<th>考核管理</th>
			<th>奖惩管理</th>
			<th>角色管理</th>
			<th>加密系统</th>
			<th>操作</th>
		</tr>

		<%
			if (employeeId != -1) {
				authorityBean.setOut(out);
				authorityBean.authEmployeeDisplay(true);
			}
		%>
	</table>
</ul>
<hr />


<ul type="square1">
	<h3>添加到角色</h3>
	<h3>
		角色名称： <select id="add_to_role" name="add_to_role" height="50"
			width="160">
			<%
				if (employeeId != -1) {
					authorityBean.setOut(out);
					authorityBean.addToRoleDisplay();
				}
			%>
		</select> <input name="add_to_role" type="button" value="添加"
			onclick="addToRole()"></input>

	</h3>
</ul>

<body>

	<%
		employeeId = -1;
	%>
</body>
</html>
