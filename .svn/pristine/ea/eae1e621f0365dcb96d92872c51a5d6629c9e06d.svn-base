package employee.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.db.beans.Employee;
import employee.db.beans.EmployeeBean;

public class SelectEmployeeServlet extends HttpServlet {

	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String EmployeeName = request.getParameter("EmployeeName");
		String Sex = request.getParameter("Sex");
		String EmployeeTypeID = request.getParameter("EmployeeTypeID");
		String DepartmentID = request.getParameter("DepartmentID");
		
		Employee em = new Employee();
		em.setEmployeeName(EmployeeName);
		em.setSex(Sex);
		em.setEmployeeTypeID(Integer.valueOf(EmployeeTypeID));
		em.setDepartmentID(Integer.valueOf(DepartmentID));
		
		
		/*System.out.println(EmployeeName);
		System.out.println(Sex);
		System.out.println(EmployeeTypeID);
		System.out.println(DepartmentID);*/
		
		
		EmployeeBean b = new EmployeeBean();
		List<Map<String,Object>> list = b.queryIf(em);
		//System.out.println(list.size());
		//System.out.println(list);
		
		request.setAttribute("list",list);
		request.getRequestDispatcher("employee_query.jsp").forward(request, response);
		
		out.flush();
		out.close();
	}

}
