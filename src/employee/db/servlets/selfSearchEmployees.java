package employee.db.servlets;

import java.io.IOException;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.db.utils.DBUtils;

public class selfSearchEmployees extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DBUtils db= new DBUtils();
	  	List<Map<String,Object>> list = db.queryList("select * from Employees where EmployeeID=?", new Object[]{request.getSession().getAttribute("userId")});
	  	request.setAttribute("list",list);
		request.getRequestDispatcher("self_search_employees.jsp").forward(request, response);
	}
}
