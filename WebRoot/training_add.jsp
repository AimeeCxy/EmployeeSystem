<%@ page language="java" import="java.util.*,employee.db.beans.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加培训项目</title>
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
		<a href="main_user.jsp">培训管理></a> <a href="training_add.jsp">添加培训</a>
	</div>
	<br/>
	<script type="text/javascript">
	function f(){
		System.out.println("sssssssssssssssssssss");
		var begin = document.getElementById("bd").value;
		var end = document.getElementById("ed").value;
		var type = document.getElementById("t").value;
		if(begin==""||end==""||t=="0"){
			alert("请将项目信息填写完整");
			return false;
		}else{
			return true;
		}
	}
		//return true;
		/*var begins = begin.split("-");
		var beginss=null;
		for(var i=0;i<begins.length;i++){
			beginss[i] = Integer.parseInt(begins[i]); 
		}
		var ends = end.split("-");
		var endss=null;
		for(var i=0;i<begins.length;i++){
			endss[i] = Integer.parseInt(ends[i]); 
		}
		if(begin=null){
			alert("开始时间不能为空");
			return false;
		}else if(beginss[0]>2015||beginss[0]<2012||(beginss[1]<1)||beginss[1]>12||(beginss[2]<0)||(beginss[2]>31)){
			alert("请规范填写开始时间");
			return false;
		}
		if(end=null){
			alert("结束时间不能为空");
			return false;
		}else if(endss[0]>2015||endss[0]<2012||(endss[1]<1)||endss[1]>12||(endss[2]<0)||(endss[2]>31)){
			alert("请规范填写结束时间");
			return false;
		}
		if(type.equals("0")){
			alert("请选择培训类型");
			return false;
		}
		alert("培训项目添加成功！");
		return true;
		*/
		
		//}
	</script>
	<form action="<%=path%>/AddTraining" method="post" onsubmit="return f();">
		<table border="1" width="1000px" bordercolor="#C1FFC1" cellpadding="10px" cellspacing="0px">
			<thead><tr><td colspan="2" valign="middle" align="center">请填写新建培训项目内容</td></tr></thead>
			<tbody>
				<tr>
					<td>开始日期:</td><td><input type="text" id="bd" name="BeginDate">(日期格式：YYYY-MM-DD)</td>
				</tr><tr>
					<td>结束日期:</td><td><input type="text" id="ed" name="EndDate">(日期格式：YYYY-MM-DD)</td>
				</tr><tr>
					<td>培训类型:</td><td><select id="t" name="Type">
  					<option value="0">请选择</option>
    				<option value="入职培训">入职培训</option>
    				<option value="业务培训">业务培训</option>
    				<option value="管理培训">管理培训</option>
                    </select></td>
				</tr><tr>
					<td>详细描述:(选填)</td>
					<td><input id="m" high="300px" wideth="800px" type="text" name="More"></td>
				</tr>
				
			</tbody>
   		</table>
   		&nbsp;&nbsp;&nbsp;
   		<input type="submit" value="添加"></td>
    	&nbsp;&nbsp;
    	<input type="reset" value="重置"></td>
	</form>
  </body>
</html>
