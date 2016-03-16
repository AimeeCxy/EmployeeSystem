package employee.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.db.beans.Employee;
import employee.db.beans.EmployeeBean;

public class UpdateEmployeeServlet extends HttpServlet {

	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String EmployeeID = request.getParameter("EmployeeID");
		String EmployeeName = request.getParameter("EmployeeName");
		String Sex = request.getParameter("Sex");
		String BirthDay = request.getParameter("BirthDay");
		String Phone = request.getParameter("Phone");
		String DegreeID = request.getParameter("DegreeID");
		String HireDate = request.getParameter("HireDate");
		String EmployeeTypeID = request.getParameter("EmployeeTypeID");
		String DepartmentID = request.getParameter("DepartmentID");
		String Title = request.getParameter("Title");
		String Salary = request.getParameter("Salary");
		
		Employee em = new Employee();
		
		em.setEmployeeID(Integer.valueOf(EmployeeID));
		em.setEmployeeName(EmployeeName);
		em.setSex(Sex);
		em.setBirthDay(BirthDay);
		em.setPhone(Phone);
		em.setDegreeID(Integer.valueOf(DegreeID));
		em.setHireDate(HireDate);
		em.setEmployeeTypeID(Integer.valueOf(EmployeeTypeID));
		em.setDepartmentID(Integer.valueOf(DepartmentID));
		em.setTitle(Title);
		em.setSalary(Salary);
		
		EmployeeBean b = new EmployeeBean();
		int result = b.update(em);
		System.out.println(result);
		if(result>0){
			request.setAttribute("message", "员工信息修改成功！");
			request.setAttribute("url", "employee_query.jsp");
		}else{
			request.setAttribute("message", "员工信息修改失败！");
			request.setAttribute("url", "employee_edit.jsp?id="+EmployeeID);
			
		}
		request.getRequestDispatcher("/message.jsp").forward(request, response);
		out.flush();
		out.close();
	}

}
