package employee.db.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.db.utils.DBUtils;

public class selfModifyEmployees extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		DBUtils db = new DBUtils();
		String tel = request.getParameter("tel").toString();
	    String passwd = request.getParameter("passwd").toString();
	    int i = db.update("update Employees set Phone=? where EmployeeID=?",new Object[]{tel,request.getSession().getAttribute("userId")});
	    int j = db.update("update Users set Password=? where EmployeeID=?",new Object[]{passwd,request.getSession().getAttribute("userId")});
	    if(i!=0){
	    	response.getWriter().write("<script>alert('联系电话修改成功！')</script>");
	    }
	    if(j!=0){
	    	response.getWriter().write("<script>alert('登录密码修改成功！')</script>");
	    }
	    request.getRequestDispatcher("main_user.jsp").forward(request, response);
	}

}
