package employee.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.db.utils.DBUtils;

public class selfSearchAttendances extends HttpServlet {

	private static final long serialVersionUID = 1840845872377545655L;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat("yyyy年MM月dd日");
		//String CurrentDate = formater.format(new java.util.Date());
		DBUtils db= new DBUtils();
	  	List<Map<String,Object>> list = db.queryList("select * from Attendances where EmployeeID=?", new Object[]{request.getSession().getAttribute("userId")});
	  	request.setAttribute("list",list);
		request.getRequestDispatcher("self_search_attendances.jsp").forward(request, response);
	}
}
