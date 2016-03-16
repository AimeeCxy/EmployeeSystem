package employee.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.db.utils.DBUtils;

public class AuthorityServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sql_add_to_role="INSERT INTO UserRole(EmployeeID,RoleID) VALUES(?,?)";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		String optionId=request.getParameter("optionID");
		String employeeId=request.getParameter("employeeID");
		DBUtils db = new DBUtils();
		int k = db.update(sql_add_to_role, new Object[]{employeeId,optionId});
		out.print(k);
		
		
		out.flush();
		out.close();
	}

}
