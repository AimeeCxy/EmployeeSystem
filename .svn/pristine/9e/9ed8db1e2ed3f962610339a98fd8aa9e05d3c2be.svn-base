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

public class SelectAllEmployees extends HttpServlet {

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		Employee e = new Employee();
		EmployeeBean b = new EmployeeBean();
		List<Map<String, Object>> list = b.query(e);
		
		request.setAttribute("isSubmit", "false");
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(list);
		//System.out.println(jsonString);
		out.print(jsonString);
		
		out.flush();
		out.close();
	}

}
