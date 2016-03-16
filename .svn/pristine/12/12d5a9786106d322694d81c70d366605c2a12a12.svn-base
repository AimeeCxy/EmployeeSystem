package employee.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import employee.db.beans.AttendanceBean;

public class FindAttendanceServlet extends HttpServlet {

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String EmployeeID = request.getParameter("EmployeeID");
		String year = request.getParameter("Year");
		String month = request.getParameter("Month");
		if(Integer.valueOf(month)<10){
			month = "0" + month;
		}
		
		String date = year+"-"+month+"%";  //yyyy-MM
		/*System.out.println(EmployeeID);
		System.out.println(date);*/
	
		AttendanceBean b = new AttendanceBean();
		List<Map<String,Object>> list = null;
		if(EmployeeID.equals("0")){
			list = b.queryAttend(date);
		}else{
			list = b.queryAttendByID(EmployeeID,date);
		}
//		System.out.println("--------------*****************************---------------");
//		System.out.println(list);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("attendance_query.jsp").forward(request, response);
		
		
		out.flush();
		out.close();
	}

}
