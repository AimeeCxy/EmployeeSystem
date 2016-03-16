package employee.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import employee.db.beans.Employee;
import employee.db.beans.EmployeeBean;



public class SelectOneEmployee extends HttpServlet {


	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String EmployeeID = request.getParameter("EmployeeID");  //根据EmployeeID查
		//System.out.println(EmployeeID);
		
		Employee em = new Employee();
		em.setEmployeeID(Integer.valueOf(EmployeeID));
		
		EmployeeBean b = new EmployeeBean();
		List<Map<String, Object>> list = b.selectOneEmployee(em);
		//System.out.println(list.get(0).get("EmployeeName")+"  "+list.get(0).get("DegreeID")+"  "+list.get(0).get("Salary")+"  "+list.get(0).get("BirthDay"));
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(list);
		//System.out.println(jsonString);
		out.print(jsonString.toString());
		
		out.flush();
		out.close();
	}

}
