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

public class FindTraining extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DBUtils db= new DBUtils();
	  	List<Map<String,Object>> list = db.queryList("select * from Training", new Object[]{});
	  	
	  	request.setAttribute("list",list);
		request.getRequestDispatcher("training_query.jsp").forward(request, response);
	
	}

}
