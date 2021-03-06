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

public class selfSearchAttendancesSecond extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Year;
		String Month;
		Year = request.getParameter("Year");
		Month = request.getParameter("Month");
		DBUtils db= new DBUtils();
	  	List<Map<String,Object>> list = db.queryList("select * from Attendances where EmployeeID=?", new Object[]{request.getSession().getAttribute("userId")});
		if(!Year.equals("0") && !Month.equals("0")){
			for(int i=0;i<list.size();i++){
		  		String date = list.get(i).get("Date").toString();
		  		String[] dates = date.split("-");
		  		if(!(dates[0].equals(Year)&&dates[1].equals(Month))){
		  			list.remove(i);
		  			i--;
		  		}
		  	}
		}
	  	request.setAttribute("list",list);
		request.getRequestDispatcher("self_search_attendances.jsp").forward(request, response);
	}

}
