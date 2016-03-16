<%@ page language="java" import="java.util.*,employee.db.utils.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <base href="<%=basePath%>">
    
    <title>员工查看个人基本信息</title>
    
<style>
body {
	background: url(images/main_content.jpg);
	background-size: cover;
background-position: center center;
background-repeat: no-repeat;
background-attachment: fixed;
font-family: Helvetica;
}
</style>

  </head>
  
  <body>
    <div class="place"> 
    <font color='red' size='4' face='微软雅黑'>位置：</font>
    <a href="#">首页></a>
  	<a href="main_user.jsp">个人信息管理></a>
    <a href="selfSearchEmployees">基本信息</a>
    
    </div><br/>
    <%
  	List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("list");
  	Map<String,Object> map = list.get(0);
  	%>
    <div>
  
    <form action="<%=path %>/selfSearchEmployees" method ="post" name="form" onsubmit="return check()">
     <table border="1" width="1000px" bordercolor="#C1FFC1" cellpadding="10px" cellspacing="0px" >
     	<tr><td colspan="4" valign="middle" align="center">员工基本信息</td></tr>
   	   	<tr>
           <td><label>ID</label></td><td><%=map.get("EmployeeID") %></td>
        </tr>
   	   	<tr>
           <td><label>姓名</label></td><td><%=map.get("EmployeeName") %></td>
        </tr>
        <tr>
           <td><label>性别</label></td><td><%=map.get("Sex") %></td>
        </tr>
    	<tr>
           <td><label>生日</label></td><td><%=map.get("BirthDay") %></td>
        </tr>
 		<tr>
           <td><label>电话</label></td><td><%=map.get("Phone") %></td>
        </tr>
        <%
        	DBUtils db = new DBUtils();
	  		List<Map<String,Object>> Degreelist = db.queryList("select * from Degrees where DegreeID=?", new Object[]{map.get("DegreeID")});
         %>
   		<tr>
   			<td><label>学历</label>
   			</td>
   			<td><%=Degreelist.get(0).get("DegreeName") %>
   			</td>
		</tr>
		<tr>					  	
    		<td><label>入职日期</label></td><td><%=map.get("HireDate") %></td>
    	</tr>
    	<%
	  		List<Map<String,Object>> eTypelist = db.queryList("select * from EmployeeType where EmployeeTypeID=?", new Object[]{map.get("EmployeeTypeID")});
         %>
    	<tr>
    		<td><label>员工类型</label></td><td><%=eTypelist.get(0).get("EmployeeTypeName") %></td>
		</tr>
		<%
	  		List<Map<String,Object>> Departmentlist = db.queryList("select * from Departments where DepartmentID=?", new Object[]{map.get("DepartmentID")});
         %>
    	<tr>
    		<td><label>部门</label></td><td><%=Departmentlist.get(0).get("DepartmentName") %></td>
		</tr>
 		<tr>
  			<td><label>职务</label></td><td><%=map.get("Title") %></td>
		</tr>
		<tr>
  			<td><label>薪资</label></td><td><%=map.get("Salary") %></td>
		</tr>
		<%
	  		List<Map<String,Object>> Managerlist = db.queryList("select EmployeeName from Employees where ManagerID=?", new Object[]{map.get("ManagerID")});
         %>
		<tr>
  			<td><label>领导</label></td><td><%=Managerlist.get(0).get("EmployeeName") %></td>
		</tr>
   		<tr>
   			<td colspan="2" valign="middle" align="center"><input type="button" value="确定" onclick="window.location.href='main_user.jsp'"/></td>
    	</tr>
    </table>
    </form>
   </div>
  </body>
</html>
