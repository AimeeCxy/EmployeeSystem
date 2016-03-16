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

public class FindTrainingSecond extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Year;
		String Month;
		String Year2;
		String Month2;
		String Type;
		Year = request.getParameter("Year");
		Month = request.getParameter("Month");
		Year2 = request.getParameter("Year2");
		Month2 = request.getParameter("Month2");
		Type = request.getParameter("TrainingT");
		DBUtils db= new DBUtils();
		List<Map<String,Object>> list = db.queryList("select * from Training", new Object[]{});
	  	System.out.println("list的size是："+list.size());
	  	
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
	  /*	System.out.println("Type是："+Type);
	  	String tt=null;
	  	if(Type!=null){
	  		int a = Integer.parseInt(Type);
	  		switch(a){
		  	case 1:
		  		tt = "入职培训";
		  		break;
		  	case 2:
		  		tt = "业务培训";
		  		break;
		  	case 3:
		  		tt = "思想培训";
		  		break;
		  	case 4:
		  		tt = "管理培训";
		  		break;
		  	}
	  		for(int i=0;i<list.size();i++){
		  		String t = list.get(i).get("TrainingType").toString();
		  		System.out.println("数据库里是"+t);
		  		if(t.equals(tt)){
		  			list.remove(i);
		  			i--;
		  		}
	  		}
	  	}*/
	  	request.setAttribute("list",list);
		request.getRequestDispatcher("training_query.jsp").forward(request, response);
	}

}
