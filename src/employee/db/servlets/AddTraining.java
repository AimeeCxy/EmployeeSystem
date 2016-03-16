package employee.db.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import employee.db.utils.DBUtils;

public class AddTraining extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		JspWriter w = (JspWriter)request.getAttribute("out");
		
		String BeginDate = request.getParameter("BeginDate");
		String EndDate = request.getParameter("EndDate");
		String Type = request.getParameter("Type");
		String More = request.getParameter("More");
		DBUtils db = new DBUtils();
		db.update("INSERT INTO Training SET BeginDate=?,EndDate=?,TrainingType=?,Description=?",new Object[]{BeginDate,EndDate,Type,More});
		//if(res==1){
			//rdb.outAlert("<script>alert('培训项目添加成功！')</script>");
			//w.print("<script>alert('培训项目添加成功！')</script>");
		//}else{
		//	w.print("<script>alert('培训项目添加失败，请重试！')</script>");
		//}
			//request.setAttribute(String.valueOf(res), String.valueOf(res));
		request.getRequestDispatcher("training_add.jsp").forward(request, response);
	}
}
