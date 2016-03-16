<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="roleQueryBean" class="employee.db.beans.RoleQueryBean"
	scope="page" />
<jsp:useBean id="roleEditBean" class="employee.db.beans.RoleEditBean"
	scope="page" />
<%!public boolean isSearcFlag = false;

	boolean isOk = false;
	public int roleId;
	public String a;%>
<%
	if (request.getParameter("search_role") != null) {
		isSearcFlag = true;
		roleId = Integer.parseInt(request.getParameter("role"));
		roleEditBean.setRoleId(roleId);
		roleEditBean.roleQuery();
	}

	if (request.getParameter("okBtn") != null) {
		roleEditBean.setRoleName("");
		roleEditBean.setAuth_authority(0);
		roleEditBean.setAuth_info(0);
		roleEditBean.setAuth_job(0);
		roleEditBean.setAuth_attendance(0);
		roleEditBean.setAuth_training(0);
		roleEditBean.setAuth_evaluation(0);
		roleEditBean.setAuth_rp(0);
		roleEditBean.setAuth_role(0);
		roleEditBean.setAuth_encrypt(0);
		roleEditBean.setRoleId(roleId);
		String roleName = new String(request.getParameter("role_name")
				.getBytes("ISO-8859-1"), "utf-8");
		if (roleName != "") {
			roleEditBean.setRoleName(roleName);
		}
		if (request.getParameter("Auth_Authority") != null) {
			roleEditBean.setAuth_authority(1);
		}
		if (request.getParameter("Auth_Info") != null) {
			roleEditBean.setAuth_info(1);
		}
		if (request.getParameter("Auth_Job") != null) {
			roleEditBean.setAuth_job(1);
		}
		if (request.getParameter("Auth_Attendance") != null) {
			roleEditBean.setAuth_attendance(1);
		}
		if (request.getParameter("Auth_Training") != null) {
			roleEditBean.setAuth_training(1);
		}
		if (request.getParameter("Auth_Evaluation") != null) {
			roleEditBean.setAuth_evaluation(1);
		}
		if (request.getParameter("Auth_RP") != null) {
			roleEditBean.setAuth_rp(1);
		}
		if (request.getParameter("Auth_Role") != null) {
			roleEditBean.setAuth_role(1);
		}
		if (request.getParameter("Auth_Encrypt") != null) {
			roleEditBean.setAuth_encrypt(1);
		}

		isOk = roleEditBean.roleEdit();
		if (isOk) {
			out.println("<script>alert('恭喜您编辑成功!');</script>");
		} else {
			out.println("<script>alert('编辑失败!');</script>");
		}
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<base href="<%=basePath%>">

<title>My JSP 'role_edit.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
body {
	background: url(images/main_content.jpg);
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: Helvetica;
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
	width: auto;
	height: 60px;
	border: none;
}

hr {
	width: auto;
	height: 5px;
	background: black;
}

table {
	text-align: center;
	border: double;
	border-color: black;
	width: 1000px;
}
</style>
</head>

<body>
	<a href="main_user.jsp">返回首页</a>
	<hr />
	<form name="form" method="post" action="role_edit.jsp">
		<ul type="square">
			<!-- select角色内容来自数据库，修改过后还要上传到数据库 -->
			<h3>
				要编辑的角色： <select name="role" height="50" width="160">
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
		<h3>编辑角色</h3>

		<form name="form1" action="role_edit.jsp" method="post">
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
				<tr>
					<th><input name="role_name" type="text"
						<%if (roleEditBean.getRoleName() != "") {
				out.print("value=" + roleEditBean.getRoleName());
			}%> /></th>
					<th><input name="Auth_Authority" type="checkbox"
						<%if (roleEditBean.getAuth_authority() != 0) {
				out.print("checked='checked'");
			}%> /></th>
					<th><input name="Auth_Info" type="checkbox"
						<%if (roleEditBean.getAuth_info() != 0) {
				out.print("checked='checked'");
			}%> /></th>
					<th><input name="Auth_Job" type="checkbox"
						<%if (roleEditBean.getAuth_job() != 0) {
				out.print("checked='checked'");
			}%> /></th>
					<th><input name="Auth_Attendance" type="checkbox"
						<%if (roleEditBean.getAuth_attendance() != 0) {
				out.print("checked='checked'");
			}%> /></th>
					<th><input name="Auth_Training" type="checkbox"
						<%if (roleEditBean.getAuth_training() != 0) {
				out.print("checked='checked'");
			}%> /></th>
					<th><input name="Auth_Evaluation" type="checkbox"
						<%if (roleEditBean.getAuth_evaluation() != 0) {
				out.print("checked='checked'");
			}%> /></th>
					<th><input name="Auth_RP" type="checkbox"
						<%if (roleEditBean.getAuth_rp() != 0) {
				out.print("checked='checked'");
			}%> /></th>
					<th><input name="Auth_Role" type="checkbox"
						<%if (roleEditBean.getAuth_role() != 0) {
				out.print("checked='checked'");
			}%> /></th>
					<th><input name="Auth_Encrypt" type="checkbox"
						<%if (roleEditBean.getAuth_encrypt() != 0) {
				out.print("checked='checked'");
			}%> /></th>
				</tr>
			</table>
			<br /> <br /> <input name="okBtn" type="submit" value="确定"></input>
			<input name="cancelBtn" type="submit" value="取消"></input>
		</form>
	</ul>
</body>
</html>
