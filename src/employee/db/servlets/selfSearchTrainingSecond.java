package employee.db.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.db.utils.DBUtils;

public class selfSearchTrainingSecond extends HttpServlet {

	private static final long serialVersionUID = -4339845795767260959L;

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Year;
		String Month;
		String Year2;
		String Month2;
		Year = request.getParameter("Year");
		Month = request.getParameter("Month");
		Year2 = request.getParameter("Year2");
		Month2 = request.getParameter("Month2");
		DBUtils db= new DBUtils();
		List<Map<String,Object>> li = db.queryList("select * from EmployeeTraining where EmployeeID=?", new Object[]{request.getSession().getAttribute("userId")});
	  	System.out.println("li的size是："+li.size());
	  	System.out.println("li.get(0):"+li.get(0).toString());
		List<Map<String,Object>> list = db.queryList("select * from Training where TrainingID=?", new Object[]{li.get(0).get("TraingingID")});
		System.out.println("list的size是："+list.size());
	  	
		for(int i=1;i<li.size();i++){
	  		list.add(db.queryList("select * from Training where TrainingID=?", new Object[]{li.get(i).get("TraingingID")}).get(0));
		}
		System.out.println("现在list的size是："+list.size());
	  	
	  	if(!Year.equals("0") && !Month.equals("0")){
			for(int i=0;i<list.size();i++){
		  		String date = list.get(i).get("BeginDate").toString();
		  		String[] dates = date.split("-");
		  		if(!(dates[0].equals(Year)&&dates[1].equals(Month))){
		  			list.remove(i);
		  			i--;
		  		}
		  	}
		}
	  	if(!Year2.equals("0") && !Month2.equals("0")){
			for(int i=0;i<list.size();i++){
		  		String date = list.get(i).get("EndDate").toString();
		  		String[] dates = date.split("-");
		  		if(!(dates[0].equals(Year2)&&dates[1].equals(Month2))){
		  			list.remove(i);
		  			i--;
		  		}
		  	}
		}
	  	request.setAttribute("list",list);
		request.getRequestDispatcher("self_search_training.jsp").forward(request, response);
	
	}

}
