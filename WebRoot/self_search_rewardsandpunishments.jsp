<%@ page language="java" import="java.util.*,employee.db.utils.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>员工查看个人奖惩信息</title>
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
    <a href="selfSearchRewardsAndPunishments">奖惩信息</a>
    </div><br/>
    
    <form action="<%=path %>/selfSearchRAPSecond" method ="post">
  	<table border="1" width="1000px" bordercolor="#C1FFC1" cellpadding="10px" cellspacing="0px">
  		<thead>
  		按日期：<select name="Year">
  					<option value="0">请选择</option>
    				<option value="2012">2012</option>
    				<option value="2013">2013</option>
    				<option value="2014">2014</option>
    				<option value="2015">2015</option>
                    </select>年
        &nbsp;
                    <select name="Month">
                    <option value="0">请选择</option>
    				<option value="01">1</option>
    				<option value="02">2</option>
    				<option value="03">3</option>
    				<option value="04">4</option>
    				<option value="05">5</option>
    				<option value="06">6</option>
    				<option value="07">7</option>
    				<option value="08">8</option>
    				<option value="09">9</option>
    				<option value="10">10</option>
    				<option value="11">11</option>
    				<option value="12">12</option>
                    </select>月
        &nbsp;&nbsp;&nbsp;
        	按类别：<select name="Type">
  					<option value="0">请选择</option>
    				<option value="1">奖励</option>
    				<option value="2">惩罚</option>
    				</select>
        &nbsp;&nbsp;&nbsp;
                   <input type="submit" value="查询">
  		</thead>
  		<tbody>
  			<tr>
  			<td>日期</td><td>类别</td><td>原因</td><td>备注</td>
  			</tr>
  			<tr>
  				<%
  				ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)request.getAttribute("list");
  				if(list.isEmpty())
	  				response.getWriter().write("<script>alert('无记录！请更改查询条件')</script>");
  				else{
  				for(int i=0;i<list.size();i++){
  					HashMap<String,Object> map = list.get(i);
  					out.print("</tr><tr>");
		  		%>
		  		<td><%=map.get("Date") %></td>
		  		<td><%=map.get("Type") %></td>
		  		<td><%=map.get("Reason") %></td>
		  		<td><%=map.get("Remark") %></td>
		  		<%}
		  		} %>
  		</tbody>
  	</table>
  	</form>
    
  </body>
</html>
