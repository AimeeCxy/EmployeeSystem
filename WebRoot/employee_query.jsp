<%@ page language="java" import="java.util.*,employee.db.others.Options" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("list");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if(<%=list==null%>){
				showAll();
		}
	});
	function showAll(){
    	$.post("SelectAllEmployees",{},function(data){
    		for(var i=0;i<data.length;i++){
    			newTR(data[i].EmployeeID,data[i].EmployeeName,data[i].Sex,transDate(data[i].BirthDay),data[i].Phone,data[i].DegreeName,transDate(data[i].HireDate),data[i].EmployeeTypeName,data[i].DepartmentName,data[i].Title,data[i].Salary);
    		
    		}
    	},"json");
    	
    }
    
    function newTR(EmployeeID,EmployeeName,Sex,BirthDay,Phone,DegreeName,HireDate,EmployeeTypeName,DepartmentName,Title,Salary){
    	    var tb = document.getElementById("tb");
    		var tr = document.createElement("tr");
    		var td0 = document.createElement("td");
		   	var td1 = document.createElement("td");
		    var td2 = document.createElement("td");
		    var td3 = document.createElement("td");
		    var td4 = document.createElement("td");
		    var td5 = document.createElement("td");
		    var td6 = document.createElement("td");
		    var td7 = document.createElement("td");
		    var td8 = document.createElement("td");
		    var td9 = document.createElement("td");
		    var td10 = document.createElement("td");
		    var td11 = document.createElement("td");

		    tb.appendChild(tr);
		    tr.appendChild(td0);
		    tr.appendChild(td1);
		    tr.appendChild(td2);
		    tr.appendChild(td3);
		    tr.appendChild(td4);
		    tr.appendChild(td5);
		    tr.appendChild(td6);
		    tr.appendChild(td7);
		    tr.appendChild(td8);
		    tr.appendChild(td9);
		    tr.appendChild(td10);
		    tr.appendChild(td11);
		    td0.innerHTML = EmployeeID;
		    td1.innerHTML = EmployeeName;
		    td2.innerHTML = Sex;
		    td3.innerHTML = BirthDay;
			td4.innerHTML = Phone;
			td5.innerHTML = DegreeName;
			td6.innerHTML = HireDate;
			td7.innerHTML = EmployeeTypeName;
			td8.innerHTML = DepartmentName;
			td9.innerHTML = Title;
			td10.innerHTML = Salary;
			td11.innerHTML = "<a href='employee_edit.jsp?EmployeeID="+EmployeeID+"' class='tablelink'>修改</a>&nbsp;&nbsp;&nbsp;<input type='button' value='删除' onclick='deleteEmployee("+EmployeeID+")'>";
    	
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
   
   function deleteEmployee(id){
	
	   	if(confirm("您确认要删除该员工吗？")){
		  	$.post("DeleteEmployeeServlet",{EmployeeID:id},function(data){
		    		
		    		if(data>0){
						alert("删除成功！");
						clearList();
					}else{
						alert("删除失败！");
					}
		    		
		    }); 
	    }
   
   }
   
   
   function clearList(){
   		 var tb = document.getElementById("tb"); //清空
		 var arr = tb.childNodes;
		 for(var i=arr.length-1;i>=0;i--){
		    tb.removeChild(arr[i]);
		 } 
   }
   
   function fresh(){
   		clearList();
   		showAll();
   }
   

</script>

<style>
body {
text-align:center;
	background: url(images/main_content.jpg);
	background-size: cover;
background-position: center center;
background-repeat: no-repeat;
background-attachment: fixed;
font-family: Helvetica;
}
</style>
 <title>员工查询</title>
 </head>
  
  <body>
  <%
		Options op = new Options();
		List<Map<String, Object>> list2 = op.departments();
		List<Map<String, Object>> list3 = op.employeeType(); 
	 %>
	 <input type="button" style="width:1050px;height:35px;" value="员工信息查询" disabled="disabled">
  	<form action="SelectEmployeeServlet" method="post">
  		<center><table>
  			<tr>
  				<td>姓名</td><td><input type="text" name="EmployeeName" style="width:100px;" /></td>
  				<td>性别</td><td><select name="Sex">
  					<option value="不限">不限</option>
  				    <option value="男">男</option>
    				<option value="女">女</option>
                    </select></td>
  			
  				<td>部门</td><td><select name="DepartmentID" id="op2">
  								<option value="0">不限</option>
							  	<%
							  		if(list2!=null&&list2.size()!=0){
							  			for(int i=0;i<list2.size();i++){
							  	 %>
							  	 <option value="<%= list2.get(i).get("DepartmentID")%>"><%= list2.get(i).get("DepartmentName")%></option>
							  	 <%		
							  	 		}
							  	 	}
							  	  %>	 
  							</select></td>
  				<td>员工类型</td><td><select name="EmployeeTypeID" id="op2">
  								<option value="0">不限</option>
							  	<%
							  		if(list3!=null&&list3.size()!=0){
							  			for(int i=0;i<list3.size();i++){
							  	 %>
							  	 <option value="<%= list3.get(i).get("EmployeeTypeID")%>"><%= list3.get(i).get("EmployeeTypeName")%></option>
							  	 <%		
							  	 		}
							  	 	}
							  	  %>	 
  							</select></td>		
  				<td colspan="4">
  				<input type="submit" value="查询"/>&nbsp;&nbsp;<input type="reset" value="重置"/>
  				</td>
  			</tr>
  		</table></center>
  	</form>
  	<input type="button" value="员工列表刷新" onclick="fresh()">
  	<div>
  	<center><table border="1" width="1050px" bordercolor="#C1FFC1" cellpadding="10px" cellspacing="0px">
    	<thead>
    	<tr  style="background:#EDEDED">
    	<th width="6%">员工ID</th>
        <th width="6%">姓名</th>
        <th width="6%">性别</th>
        <th width="11%">生日</th>
        <th width="12%">联系电话</th>
        <th width="7%">学历</th>
        <th width="12%">入职日期</th>
        <th width="9%">员工类型</th>
        <th width="7%">部门</th>
        <th width="7%">职位</th>
        <th width="5%">薪水</th> 
        <th width="12%">操作</th>
        </tr>
        </thead>
        <tbody id="tb">
        
         <%	if(list!=null){
         		if(list.size()>0){
         			//List<Map<String,Object>>  list = (List<Map<String,Object>>)request.getAttribute("list");
	        		for(int i=0;i<list.size();i++){
	        			Map<String,Object> map = list.get(i);
	        			out.print("<tr>");
	        			out.print("<td>"+map.get("EmployeeID")+"</td>");
		  				out.print("<td>"+map.get("EmployeeName")+"</td>");
		  				out.print("<td>"+map.get("Sex")+"</td>");
		  				out.print("<td>"+map.get("BirthDay")+"</td>");
		  				out.print("<td>"+map.get("Phone")+"</td>");
		  				out.print("<td>"+map.get("DegreeName")+"</td>");
		  				out.print("<td>"+map.get("HireDate")+"</td>");
		  				out.print("<td>"+map.get("EmployeeTypeName")+"</td>");
		  				out.print("<td>"+map.get("DepartmentName")+"</td>");
		  				out.print("<td>"+map.get("Title")+"</td>");
		  				out.print("<td>"+map.get("Salary")+"</td>");
		  				out.print("<td><a href=\"employee_edit.jsp?EmployeeID="+map.get("EmployeeID")+"\">修改</a>&nbsp;&nbsp;<input type='button' value='删除' onclick='deleteEmployee("+map.get("EmployeeID")+")'></td>");
		  				out.print("</tr>");
	  				} 
	  			} else if(list.size()==0){
	  					out.print("<tr>");
	  					out.print("<td colspan='11'>"+"<font color='red' size='4'>没有符合上述条件的员工</font>"+"</td>");
	  					out.print("</tr>");
	  			}
	  		
         		%>
    	</tbody>
    </table></center>
    	结果总数：<%=list.size() %>人
    	<%} %>
    </div>
  
  </body>
</html>
