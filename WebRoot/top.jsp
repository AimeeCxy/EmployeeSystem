<%@ page language="java" import="java.util.*,employee.db.utils.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
 <base href="<%=basePath%>"/>
<style type="text/css">    
 body{    
 text-align:center;
      background-image: url(images/menu.jpg);    
background-size: cover;
background-position: center center;
background-repeat: no-repeat;
background-attachment: fixed;
font-family: Helvetica;

 }    
 a{
 margin-left: 900px;
 }
 </style>    
<script type="text/javascript">

		function f(){
			if(confirm("您确认退出吗？")){
				document.getElementById("quit").href="login.jsp";
			}
		
		}
	
</script>


</head>

<body>
	<ul>
    <div >&nbsp; &nbsp; &nbsp; &nbsp; 
		<font color="black"  size="7" face='微软雅黑'>人事档案管理系统信息</font> 
		<div>
		<%
		DBUtils db= new DBUtils();
	  	List<Map<String,Object>> list = db.queryList("select EmployeeName from Employees where EmployeeID=?",new Object[]{request.getSession().getAttribute("userId")});
		String NowName = list.get(0).get("EmployeeName").toString();
		 %>
		 	<font  color="black" size="4"  >您好，<font color="white" size="4"><%=NowName %></font>  ，今天是<%
			java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat(
			"yyyy年MM月dd日");
			String strCurrentTime = formater.format(new java.util.Date());
			%>
			<%=strCurrentTime %></font>
		 </div>
   </div>

  	<div>
		&nbsp; &nbsp; &nbsp; &nbsp;<a id="quit" target="_parent" onclick="f()"><font color="white">安全退出</font></a>
 	 </div> 

    </ul>
   

</body>
</html>
 