<%@ page language="java" import="java.util.*,employee.db.others.Options" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Map<String,Object>> alist = (List<Map<String,Object>>)request.getAttribute("list");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询考勤</title>
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
  
  <%
		Options op = new Options();
		List<Map<String, Object>> list = op.employee();
	 %>
  <div class="place"> 
    <font color='red' size='4' face='微软雅黑'>位置：</font>
    <a href="main_user.jsp">首页</a>>
    <a href="attendance_query.jsp">查询考勤</a>
    </div>
    <input type="button" style="width:1050px;height:35px;" value="员工考勤信息" disabled="disabled">
    <form action="FindAttendanceServlet" method="post">
  		<center><table>
  			<tr>
  				<td>年份</td><td><select name="Year" style="width:80p">
  				<%	
  					for(int i=2004;i<2016;i++){
  				%>
  					<option value="<%= i%>"><%= i%></option>
  			    <%  
  				  }
    			%>
                    </select></td>
  				<td>月份</td><td><select name="Month" style="width:80p">
  			    <%	
  					for(int i=1;i<13;i++){
  				%>
  					<option value="<%= i%>"><%= i%></option>
  			    <%  
  				  }
    			%>
                    </select></td>
  			
  				<td>员工</td>
  				<td><select style="width:400p" name="EmployeeID" id="op">
  				<option value="0">不限</option>
			<%
				if(list!=null&&list.size()!=0){
					for(int i=0;i<list.size();i++){
			%>
			<option value="<%= list.get(i).get("EmployeeID")%>"><%= list.get(i).get("EmployeeID")+"--"+list.get(i).get("EmployeeName")%></option>
			<%		
					}
				}
			%>  
  			</select></td>
  				<td>
  				<input type="submit" value="查询"/>&nbsp;&nbsp;<input type="reset" value="重置"/>
  				</td>
  			</tr>
  		</table></center>
  	</form>
  	
  	<table border="1" width="1050px" bordercolor="#C1FFC1" cellpadding="10px" cellspacing="0px">
    	<thead>
    	<tr  style="background:#EDEDED">
    	<th width="12%">员工ID</th>
        <th width="13%">姓名</th>
        <th width="15%">月份</th>
        <th width="12%">出勤</th>
        <th width="12%">事假</th>
        <th width="12%">迟到或早退</th>
        <th width="12%">休假</th>
        <th width="12%">公差</th>
        </tr>
        </thead>
        <tbody>
        	<%
        	
        	if(alist!=null){
        		if(alist.size()>0){
        			for(int i=0;i<alist.size();i++){
        				Map<String,Object> map = alist.get(i);
        				out.print("<tr align='center'>");
	        			out.print("<td>"+map.get("EmployeeID")+"</td>");
		  				out.print("<td>"+map.get("EmployeeName")+"</td>");
		  				out.print("<td>"+map.get("Date")+"</td>");
		  				out.print("<td>"+map.get("s1")+"</td>");
		  				out.print("<td>"+map.get("s2")+"</td>");
		  				out.print("<td>"+map.get("s3")+"</td>");
		  				out.print("<td>"+map.get("s4")+"</td>");
		  				out.print("<td>"+map.get("s5")+"</td>");
		  				out.print("</tr>");		
        			}
       
        		}else if(alist.size()==0){
	  					out.print("<tr>");
	  					out.print("<td colspan='8'>"+"<font color='red' size='4'>没有符合上述条件的考勤信息</font>"+"</td>");
	  					out.print("</tr>");
	  			}
  	
        	}
        	
        	
        	 %>
        
        
        
        
        
        </tbody>
        
        
      </table>
    
  </body>
</html>
