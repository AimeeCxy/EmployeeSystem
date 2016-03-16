package employee.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.db.beans.Employee;
import employee.db.beans.EmployeeBean;

public class DeleteEmployeeServlet extends HttpServlet {

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String EmployeeID = request.getParameter("EmployeeID");
		
		Employee em = new Employee();
		em.setEmployeeID(Integer.valueOf(EmployeeID));
		EmployeeBean b = new EmployeeBean();
		int result= b.delete(em);
		out.print(result);
		
		
		out.flush();
		out.close();
	}

}
