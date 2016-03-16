<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <jsp:useBean id="authorityBean" class="employee.db.beans.AuthorityBean" scope="page"/>
 <%!
	public static  boolean isSearcFlag=false; // 定义全局常量
%>
 
 <%

if(request.getParameter("search") != null)
{
isSearcFlag=true;
authorityBean.setAuthority(request.getParameter("authority"));
authorityBean.setOut(out);
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <base href="<%=basePath%>">
    
    <title>authority_query.jsp</title>
    
<style>
body{
background: url(images/main_content.jpg);
background-size: cover;
background-position: center center;
background-repeat: no-repeat;
background-attachment: fixed;
font-family: Helvetica;
overflow: scroll;

}

ul[type="square"]{
margin-top:50px;
text-align: center;
}
ul[type="square1"]{
margin-top:30px;
text-align: center;
}
select{
width: 150px;
height: 30px;
font-size: 20;
}

input[type="button"]{
width: 100px;
height: 30px;
font-size: 20;
}

hr{
width:auto;
height: 5px;
background: black;
}

table{
margin-left:16%;
border: double;
border-color: black;
width:800px;
}

th{
width: 120px;
border: none;
}

</style>
  </head>
  
  <body>
  <form name="form"  method="post" action="authority_query.jsp" >
  <ul type="square">
 <h2>
 	权限：
 	<select name="authority">
		<option value="Auth_Authority">Auth_Authority</option>
 		<option value="Auth_Info">Auth_Info</option>
 		<option value="Auth_Job">Auth_Job</option>
 		<option value="Auth_Attendance">Auth_Attendance</option>
 		<option value="Auth_Training">Auth_Training</option>
 		<option value="Auth_Evaluation">Auth_Evaluation</option>
 		<option value="Auth_RP">Auth_RP</option>
 		<option value="Auth_Role">Auth_Role</option>
 		<option value="Auth_Encrypt">Auth_Encrypt</option>
 	</select>
 	<input name="search" type="submit" value="查询"></input>
 </h2>
  </ul>
  </form>
  <hr/>
  <ul type="square1" >
  <h3>具有该权限的员工
			<table >
			<tr><th>员工ID</th><th>姓名</th><th>部门</th><th>职位</th><th>权限管理</th></tr>
			
			 <%
			if(isSearcFlag){
			authorityBean.employeesDisplay();
			}
			 %>
			</table>
		</h3>
  </ul>
  
 
  
   <hr/>
   
   <ul type="square1">
    <h3>具有该权限的角色</h3>
     <table>
  <tr><th>角色名称</th><th>操作</th></tr>
  <%
			if(isSearcFlag){
			authorityBean.rolesDisplay();
			}
 %>
  </table>
    </ul>
    
</body>
</html>
