package employee.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.db.beans.Employee;
import employee.db.beans.EmployeeBean;

public class AddEmployeeServlet extends HttpServlet {

	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
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
		int result = b.addEmployee(em);
		if(result>0){
			request.setAttribute("message", "新员工添加成功！系统为您设置默认登录密码为123123\n" +
					"修改密码到:账户设置");
			request.setAttribute("url", "employee_add.jsp");
		}else{
			request.setAttribute("message", "新员工添加失败！");
			request.setAttribute("url", "employee_add.jsp");
			
		}
		request.getRequestDispatcher("/message.jsp").forward(request, response);
		out.flush();
		out.close();
	}

}
