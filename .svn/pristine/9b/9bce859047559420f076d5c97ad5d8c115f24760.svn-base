<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


 <jsp:useBean id="userLogBean" class="employee.db.beans.UserLoginBean" scope="page"/>
<%
	userLogBean.setUserId(request.getParameter("userId"));
	userLogBean.setPassword(request.getParameter("pwd")) ;
 %>

<%

if(request.getParameter("login") != null)
{
if(userLogBean.userTest()){
session.setAttribute("userId", request.getParameter("userId"));
%>
<jsp:forward page="main.jsp" />
<%
}
}
%>

<!DOCTYPE html>

<head>
<title>welcome to employee system!</title>
<base href="<%=basePath%>"/>
<style>

body{
text-align:center;
background: url(images/login.jpg);
background-size: cover;
background-position: center center;
background-repeat: no-repeat;
background-attachment: fixed;
font-family: Helvetica;
}
ul{
margin-top:100px;
margin-left:450px;
background:url(images/log_frame.jpg);
background-size: cover;
height:250px;
width:260px;
text-align:center;
}


    p{
    margin-left:800px;
      font-size: 24px;
      color:white;
    }
   
     input[type="password"]{
		margin-top:5px;
        font-size: 20px;
    }
    input[type="text"]{
		margin-top:35px;
        font-size: 20px;
    }
    input[type="submit"] {
    color: black;
    background:#2f7132;
    font-size: 25px;
     width: 90px;
    }
</style>

<script type="text/javascript">
	function checkNull(){
	/*  */
        if(form_login.userId.value==""){
        	document.getElementById("userId").innerHTML = "<font color='red' size='4' face='微软雅黑'>该项不能为空</font>";
        	if(form_login.pwd.value!=""){
        	document.getElementById("pwd").innerHTML = "<font color='red' size='4' face='微软雅黑'></font>";
        	}
        	return false;
        }
         if(form_login.pwd.value==""){
        	document.getElementById("pwd").innerHTML = "<font color='red' size='4' face='微软雅黑'>不能为空</font>";
        	if(form_login.userId.value!=""){
        	document.getElementById("userId").innerHTML = "<font color='red' size='4' face='微软雅黑'></font>";
        	}
        	return false;
        }
        
        if(!(form_login.userId.value).match("^[0-9]*$")){
        document.getElementById("userId").innerHTML = "<font color='red' size='4' face='微软雅黑'>0-9的數字</font>";
         if(form_login.userId.value!=""){
        	document.getElementById("pwd").innerHTML = "<font color='red' size='4' face='微软雅黑'></font>";
        	}
        	return false;
        }
         if(!(form_login.pwd.value).match("^[0-9]*$")){
        document.getElementById("pwd").innerHTML = "<font color='red' size='4' face='微软雅黑'>0-9的數字</font>";
         if(form_login.userId.value!=""){
        	document.getElementById("userId").innerHTML = "<font color='red' size='4' face='微软雅黑'></font>";
        	}
           return false;
        }
        if(!(form_login.pwd.value).match("^.{6}$")){
        document.getElementById("pwd").innerHTML = "<font color='red' size='4' face='微软雅黑'>密碼是6位</font>";
        if(form_login.userId.value!=""){
        	document.getElementById("userId").innerHTML = "<font color='red' size='4' face='微软雅黑'></font>";
        	}
        	return false;
        }  
        document.getElementById("userId").innerHTML = "<font color='red' size='4' face='微软雅黑'></font>";
        document.getElementById("pwd").innerHTML = "<font color='red' size='4' face='微软雅黑'></font>";
    	
    	return true;
    }
    
</script>
</head>



<body>
<p>
您好， 今天是
<%
java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat(
"yyyy年MM月dd日");
String strCurrentTime = formater.format(new java.util.Date());
%>
<%=strCurrentTime %>
</p>
<form name="form_login"  method="post" action="login.jsp" onsubmit="return checkNull()">
<ul style="width: 399px; ">
<div>
    <h4>Account:
    <input name="userId"  type="text" placeholder="用戶名"  value="" style="width: 180px; height: 25px" /><font id="userId" color="red"><%=userLogBean.getErrorMsg("userError")%></font><br>
   </h4>
   </div>
	 <div>
	 <h4>Passward:
	 <input name="pwd" type="password" placeholder="密碼" value="" " style="width: 180px; height: 25px"/><font id="pwd" color="red"><%=userLogBean.getErrorMsg("pwdError")%></font><br>
	 </h4>
	 </div>
    <input name="login"  type="submit" value="LogIn" style="height: 60px; ">
    <div>
    <label>
    <input name="pwd_cb" type="checkbox" value="" checked="checked" />remember?   
    </label>
    <label>
    <a href="#">forget passward?</a>
    </label>
    </div>
</ul>
</form>
</body>