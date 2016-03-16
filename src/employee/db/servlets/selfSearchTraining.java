package employee.db.servlets;

import java.io.IOException;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.db.utils.DBUtils;

public class selfSearchTraining extends HttpServlet {

	private static final long serialVersionUID = 5419366114317960768L;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DBUtils db= new DBUtils();
	  	List<Map<String,Object>> li = db.queryList("select * from EmployeeTraining where EmployeeID=?", new Object[]{request.getSession().getAttribute("userId")});
	  	List<Map<String,Object>> list = db.queryList("select * from Training where TrainingID=?", new Object[]{li.get(0).get("TraingingID")});
	  	
	  	for(int i=1;i<li.size();i++){
	  		list.add(db.queryList("select * from Training where TrainingID=?", new Object[]{li.get(i).get("TraingingID")}).get(0));
	  	}
	  	
	  	request.setAttribute("list",list);
		request.getRequestDispatcher("self_search_training.jsp").forward(request, response);
	}
}
