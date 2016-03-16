<%@ page language="java" import="java.util.*,java.text.*,employee.db.others.Options" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加员工</title>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
		
<base href="<%=basePath%>"/>

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
<script type="text/javascript">
	
	function check(){
        if(form.EmployeeName.value==""){
        	document.getElementById("EmployeeName").innerHTML = "<font color='red' size='4' face='微软雅黑'>该项不能为空</font>";
        	return false;
        }else if(form.BirthDay.value==""){
        	document.getElementById("BirthDay").innerHTML = "<font color='red' size='4' face='微软雅黑'>该项不能为空</font>";
        	return false;
        }else if(form.Phone.value==""){
        	document.getElementById("Phone").innerHTML = "<font color='red' size='4' face='微软雅黑'>该项不能为空</font>";
        	return false;
        }else if(form.HireDate.value==""){
        	document.getElementById("HireDate").innerHTML = "<font color='red' size='4' face='微软雅黑'>该项不能为空</font>";
        	return false;
        }else if(form.Title.value==""){
        	document.getElementById("Title").innerHTML = "<font color='red' size='4' face='微软雅黑'>该项不能为空</font>";
        	return false;
        }else if(form.Salary.value==""){
        	document.getElementById("Salary").innerHTML = "<font color='red' size='4' face='微软雅黑'>该项不能为空</font>";
        	return false;
        }
    	return true;
    }
    
 
</script>
</head>

<body>
	<%
		Options op = new Options();
		List<Map<String, Object>> list1 = op.degrees();
		List<Map<String, Object>> list2 = op.departments();
		List<Map<String, Object>> list3 = op.employeeType(); 
	 %>

	<div class="place"> 
    <font color='red' size='4' face='微软雅黑'>位置：</font>
    <a href="main_user.jsp">首页</a>>
  	<a href="employee_query.jsp">员工表</a>>
    <a href="employee_add.jsp">添加员工</a>
    
    </div><br/>
     <center>
    <div>
    <form action="AddEmployeeServlet"  method ="post" name="form" onsubmit="return check()">
     <table border="1" width="1000px" bordercolor="#C1FFC1" cellpadding="10px" cellspacing="0px" >
     	<tr><input type="button" style="width:1000px;height:45px;" value="请添加员工信息" disabled="disabled"></tr>
   	   	<tr>
           <td><label>姓名</label></td><td><input name="EmployeeName" type="text" class="dfinput" /><i id="EmployeeName"></i></td><td><label>姓别</label></td>
           <td><select name="Sex">
    				<option value="男">男</option>
    				<option value="女">女</option>
                    </select><i>请选择</i></td>
        </tr>
    	<tr>
           <td><label>生日</label></td><td><input  name="BirthDay" class="Wdate" type="text" onclick="WdatePicker()"/><i id="BirthDay"></i></td><td><label>电话</label></td><td><input  name="Phone" type="text" class="dfinput" /><i id="Phone"></i></td>
        </tr>
 		
   		<tr>
   			<td><label>学历</label></td><td><select name="DegreeID" id="op1">
							  	<%
							  		if(list1!=null&&list1.size()!=0){
							  			for(int i=0;i<list1.size();i++){
							  	 %>
							  	 <option value="<%= list1.get(i).get("DegreeID")%>"><%= list1.get(i).get("DegreeName")%></option>
							  	 <%		
							  	 		}
							  	 	}
							  	  %>  
  							</select> <i>请选择</i></td>
  							
  			<%
  					java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat(
					"yyyy-MM-dd");
					String CurrentDate = formater.format(new java.util.Date());
  							
  							
  			 %>
    		<td><label>入职日期</label></td><td><input value="<%=CurrentDate %>" name="HireDate" class="Wdate" type="text" onclick="WdatePicker()"/><i id="HireDate"></i></td>
    	</tr>
    	<tr>
    		<td><label>部门</label></td><td><select name="DepartmentID" id="op2">
							  	<%
							  		if(list2!=null&&list2.size()!=0){
							  			for(int i=0;i<list2.size();i++){
							  	 %>
							  	 <option value="<%= list2.get(i).get("DepartmentID")%>"><%= list2.get(i).get("DepartmentName")%></option>
							  	 <%		
							  	 		}
							  	 	}
							  	  %>	 
  							</select><i>请选择</i></td><td><label>职位</label></td><td><input name="Title" type="text" class="dfinput" /><i id="Title"></i></td>
 		</tr>
 		<tr>
  			<td><label>员工类型</label></td><td><select name="EmployeeTypeID" id="op2">
							  	<%
							  		if(list3!=null&&list3.size()!=0){
							  			for(int i=0;i<list3.size();i++){
							  	 %>
							  	 <option value="<%= list3.get(i).get("EmployeeTypeID")%>"><%= list3.get(i).get("EmployeeTypeName")%></option>
							  	 <%		
							  	 		}
							  	 	}
							  	  %>	 
  							</select><i>请选择</i></td><td><label>薪水</label></td><td><input name="Salary" type="text" class="dfinput" /><i id="Salary"></i></td>
		</tr>
  		
  			
   		
   		<tr>
   			<td colspan="2"><input type="submit" class="btn" value="提交"/></td>     <td colspan="2"><input type="reset" class="btn" value="重置"/></td>
    	</tr>
    </table>
    </form>
   </div>
 </center>
</body>

</html>
