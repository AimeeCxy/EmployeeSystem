<%@ page language="java" import="java.util.*,employee.db.others.Options" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改员工</title>
<base href="<%=basePath%>"/>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>		
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
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

	$(document).ready(function(){
		show(<%=request.getParameter("EmployeeID")%>);
		
	});
	
	function show(id){
		$.post("SelectOneEmployee",{EmployeeID:id},function(data){
			document.getElementById("op").value = id;
			document.getElementById("a0").value = data[0].EmployeeName;
    		document.getElementById("a1").value = data[0].Sex;
    		document.getElementById("a3").value = data[0].Phone;
    		document.getElementById("a4").value = data[0].DegreeID;
    		document.getElementById("a6").value = data[0].DepartmentID;
    		document.getElementById("a7").value = data[0].Title;
    		document.getElementById("a8").value = data[0].EmployeeTypeID;
    		document.getElementById("a9").value = data[0].Salary;
    		document.getElementById("a2").value = transDate(data[0].BirthDay);
    		document.getElementById("a5").value = transDate(data[0].HireDate);
    		
    	},"json");
    	
	}
	
	function transDate(date){
		
		var d = date.substring(date.lastIndexOf(" ")+1)+"-";
		var c = date.substring(date.indexOf(" ")+1, date.indexOf(","));
		if(date.length==10){
			d = d + f(date.substring(0,1)) +"-"+ f(c);
			
		}else if(date.length==11){
			if(date.charAt(2)=="月"){
				d = d + f(date.substring(0,2)) +"-"+ f(c);
				
			}else{
				d = d + f(date.substring(0,1)) +"-"+ f(c);
			}

		}else if(date.length==12){
			d = d + f(date.substring(0,2)) +"-"+ f(c);
		}
		return d;
	}
	
	function f(str){
		
		if(str=="一"||str=="1"){
			str = "01";
		}else if(str=="二"||str=="2"){
			str = "02";
		}else if(str=="三"||str=="3"){
			str = "03";
		}else if(str=="四"||str=="4"){
			str = "04";
		}else if(str=="五"||str=="5"){
			str = "05";
		}else if(str=="六"||str=="6"){
			str = "06";
		}else if(str=="七"||str=="7"){
			str = "07";
		}else if(str=="八"||str=="8"){
			str = "08";
		}else if(str=="九"||str=="9"){
			str = "09";
		}else if(str=="十"){
			str = "10";
		}else if(str=="十一"){
			str = "11";
		}else if(str=="十二"){
			str = "12";
		}
		return str;	
	} 
	
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
    
    function find(){
    	var id = document.getElementById("op").value;
    	show(id);
    }
   
	
	
</script>
</head>

<body>
	<%
		Options op = new Options();
		List<Map<String, Object>> list = op.employee();
		List<Map<String, Object>> list1 = op.degrees();
		List<Map<String, Object>> list2 = op.departments();
		List<Map<String, Object>> list3 = op.employeeType(); 
	 %>

	<div class="place"> 
    <font color='red' size='4' face='微软雅黑'>位置：</font>
    <a href="main_user.jsp">首页</a>>
    <a href="employee_query.jsp">员工表</a>>
    <a href="employee_edit.jsp">修改员工</a>
    
    </div><br/>
     <center>
    <div>
    <form action="UpdateEmployeeServlet"  method ="post" name="form" onsubmit="return check()">
          员工工号&nbsp;&nbsp;
      <select style="width:400p" name="EmployeeID" id="op">
			<%
				if(list!=null&&list.size()!=0){
					for(int i=0;i<list.size();i++){
			%>
			<option value="<%= list.get(i).get("EmployeeID")%>"><%= list.get(i).get("EmployeeID")+"--"+list.get(i).get("EmployeeName")%></option>
			<%		
					}
				}
			%>  
  	</select>&nbsp;&nbsp;
      <input type="button" value="显示信息" onclick="find()"/>    
     <table border="1" width="1000px" bordercolor="#C1FFC1" cellpadding="10px" cellspacing="0px" >
     	<tr><input type="button" style="width:1000px;height:45px;" value="编辑员工信息" disabled="disabled"></tr>
   	   	<tr>
           <td>姓名</td><td><input id="a0" name="EmployeeName" type="text"class="dfinput" /><i id="EmployeeName"></i></td>
           <td><label>姓别</label></td>
           <td><select id="a1" name="Sex">
           			<option value="男">男</option>
    				<option value="女">女</option>
                    </select></td>
        </tr>
    	<tr>
           <td>生日</td><td><input id="a2"  name="BirthDay" type="text" class="Wdate" onclick="WdatePicker()"/><i id="BirthDay"></i></td><td>电话</td><td><input id="a3"  name="Phone" type="text"  /><i id="Phone"></i></td>
        </tr>
   		<tr>
   			<td>学历</td><td><select id="a4" name="DegreeID" id="op1">
							  	<%
							  		if(list1!=null&&list1.size()!=0){
							  			for(int i=0;i<list1.size();i++){
							  	 %>
							  	 <option value="<%= list1.get(i).get("DegreeID")%>"><%= list1.get(i).get("DegreeName")%></option>
							  	 <%		
							  	 		}
							  	 	}
							  	  %>  
  							</select></td>
    		<td><label>入职日期</label></td><td><input id="a5" name="HireDate" class="Wdate" type="text" onclick="WdatePicker()"/><i id="HireDate"></i></td>
    	</tr>
    	<tr>
    		<td><label>部门</label></td><td><select id="a6" name="DepartmentID" id="op2">
							  	<%
							  		if(list2!=null&&list2.size()!=0){
							  			for(int i=0;i<list2.size();i++){
							  	 %>
							  	 <option value="<%= list2.get(i).get("DepartmentID")%>"><%= list2.get(i).get("DepartmentName")%></option>
							  	 <%		
							  	 		}
							  	 	}
							  	  %>	 
  							</select></td><td><label>职位</label></td><td><input id="a7" name="Title" type="text" class="dfinput" /><i id="Title"></i></td>
 		</tr>
 		<tr>
  			<td><label>员工类型</label></td><td><select id="a8" name="EmployeeTypeID" id="op2">
							  	<%
							  		if(list3!=null&&list3.size()!=0){
							  			for(int i=0;i<list3.size();i++){
							  	 %>
							  	 <option value="<%= list3.get(i).get("EmployeeTypeID")%>"><%= list3.get(i).get("EmployeeTypeName")%></option>
							  	 <%		
							  	 		}
							  	 	}
							  	  %>	 
  							</select></td><td><label>薪水</label></td><td><input id="a9" name="Salary" type="text" class="dfinput" /><i id="Salary"></i></td>
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

