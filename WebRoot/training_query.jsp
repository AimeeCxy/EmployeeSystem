<%@ page language="java" import="java.util.*,employee.db.utils.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询培训</title>
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
		<font color='red' size='4' face='微软雅黑'>位置：</font> <a href="#">首页></a>
		<a href="main_user.jsp">培训管理></a> <a href="FindTraining">查询培训</a>
	</div>
	<form action="<%=path%>/FindTrainingSecond" method="post">
		<table border="1" width="1000px" bordercolor="#C1FFC1"
			cellpadding="10px" cellspacing="0px">
			<thead>
				按开始日期：
				<select name="Year">
					<option value="0">请选择</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
				</select>年 &nbsp;
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
				</select>月 &nbsp;&nbsp;&nbsp; 按结束日期：
				<select name="Year2">
					<option value="0">请选择</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
				</select>年 &nbsp;
				<select name="Month2">
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
				</select>月 &nbsp;&nbsp;&nbsp;
				按培训类型：
				<select name="TrainingT">
					<option value="0">请选择</option>
					<option value="1">入职培训</option>
					<option value="2">业务培训</option>
					<option value="3">思想培训</option>
					<option value="4">管理培训</option>
				</select>&nbsp;&nbsp;&nbsp;
				<input type="submit" value="查询">
			</thead>
			<tbody>
				<tr>
					<td>开始日期</td>
					<td>结束日期</td>
					<td>培训类型</td>
					<td>详细情况</td>
					<td>参加人数</td>
					<td>操作</td>
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
					<td><%=map.get("BeginDate")%></td>
					<td><%=map.get("EndDate")%></td>
					<td><%=map.get("TrainingType")%></td>
					<script type="text/javascript">
					function more(){
						alert("<%=map.get("Description").toString()%>");
					}
				</script>
					<td><button onclick="more()">查看</button></td>
					<%
						DBUtils dbu = new DBUtils();
								List<Map<String, Object>> EmployeeList = dbu.queryList("select EmployeeID from EmployeeTraining where TraingingID=?",new Object[] { map.get("TrainingID") });
								int many = EmployeeList.size();
								/*for (int j = 0; j < EmployeeList.size(); j++) {
									String he = EmployeeList.get(j).get("EmployeeID").toString();
									String me = request.getSession().getAttribute("userId").toString();
									if (!(he.equals(me))) {
										Map<String, Object> NameMap = dbu.queryList("select EmployeeName from Employees where EmployeeID=?",new Object[]{EmployeeList.get(j).get("EmployeeID") }).get(0);
										if (!NameMap.isEmpty())
											Names = Names+NameMap.get("EmployeeName").toString() + ";";
									}
								}*/
					%>
					<td><%=many%></td>
					<td><a href="training_edit.jsp?id=<%=map.get("TrainingID")%>">编辑</a>&nbsp;<a href="training_delete.jsp?id=<%=map.get("TrainingID")%>">删除</a></td>
					<%
						}
						}
					%>
				
			</tbody>
		</table>
	</form>
	
  </body>
</html>
