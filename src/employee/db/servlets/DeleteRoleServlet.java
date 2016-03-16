package employee.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.db.utils.DBUtils;

public class DeleteRoleServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String sql_delete_role = "DELETE FROM userrole WHERE EmployeeID=? AND RoleID=?";
		String roleId = request.getParameter("roleID");
		String employeeId = request.getParameter("employeeID");
		DBUtils db = new DBUtils();
		int k = db.update(sql_delete_role,
				new Object[] { employeeId, roleId });
		out.print(k);

		out.flush();
		out.close();
	}

}
