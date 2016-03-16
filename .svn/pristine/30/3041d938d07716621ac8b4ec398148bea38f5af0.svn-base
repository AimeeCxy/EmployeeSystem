<<<<<<< .mine
<!--  %@page import="javafx.scene.control.Alert"%-->
=======
>>>>>>> .r57
<%@ page language="java" import="java.util.* " pageEncoding="UTF-8"%>
<%

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<jsp:useBean id="roleAddBean" class="employee.db.beans.RoleAddBean" scope="page"></jsp:useBean>>
<%! 
boolean isOk=false;

%>
<% 
if(request.getParameter("okBtn")!=null){
String roleName = new String(request.getParameter("role_name").getBytes("ISO-8859-1"),"utf-8");
if(roleName!=""){
roleAddBean.setRoleName(roleName);
}
if(request.getParameter("Auth_Authority")!=null){
roleAddBean.setAuth_authority(1);
}
if(request.getParameter("Auth_Info")!=null){
roleAddBean.setAuth_info(1);
}
if(request.getParameter("Auth_Job")!=null){
roleAddBean.setAuth_job(1);
}
if(request.getParameter("Auth_Attendance")!=null){
roleAddBean.setAuth_attendance(1);
}
if(request.getParameter("Auth_Training")!=null){
roleAddBean.setAuth_training(1);
}
if(request.getParameter("Auth_Evaluation")!=null){
roleAddBean.setAuth_evaluation(1);
}
if(request.getParameter("Auth_RP")!=null){
roleAddBean.setAuth_rp(1);
}
if(request.getParameter("Auth_Role")!=null){
roleAddBean.setAuth_role(1);
}
if(request.getParameter("Auth_Encrypt")!=null){
roleAddBean.setAuth_encrypt(1);
}

isOk=roleAddBean.addRole();
if(isOk){
 out.println("<script>alert('恭喜您添加成功!');</script>");
 }else{
 out.println("<script>alert('添加失败!');</script>");
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
	<ul type="square1">
		<h3>添加角色</h3>
		<form name="form_role_add" method="post" action="role_add.jsp">
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
				</tr>
				<tr>
					<th><input name="role_name" type="text" /></th>
					<th><input name="Auth_Authority" type="checkbox" /></th>
					<th><input name="Auth_Info" type="checkbox" /></th>
					<th><input name="Auth_Job" type="checkbox" /></th>
					<th><input name="Auth_Attendance" type="checkbox" /></th>
					<th><input name="Auth_Training" type="checkbox" /></th>
					<th><input name="Auth_Evaluation" type="checkbox" /></th>
					<th><input name="Auth_RP" type="checkbox" /></th>
					<th><input name="Auth_Role" type="checkbox" /></th>
					<th><input name="Auth_Encrypt" type="checkbox" /></th>
				</tr>
			</table>
			<br /> <br /> 
			<input name="okBtn" type="submit" value="确定" onclick="prom()" ></input>
			<input name="cancelBtn" type="submit" value="取消"></input>
		</form>
	</ul>
	<hr>

</body>
</html>
