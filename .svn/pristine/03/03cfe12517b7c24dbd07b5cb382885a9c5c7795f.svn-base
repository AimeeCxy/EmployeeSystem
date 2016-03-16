package employee.db.others;

import java.util.List;
import java.util.Map;

import employee.db.utils.DBUtils;

public class Options {
	
	private DBUtils db = new DBUtils();
	
	public List<Map<String,Object>> employee(){
		
		String sql = "SELECT u.EmployeeID,e.EmployeeName FROM Employees e,Users u WHERE e.EmployeeID=u.EmployeeID AND u.flag='1'"; 
		List<Map<String,Object>> list = db.queryList(sql, new Object[]{});
		return list;
	}
	
	public List<Map<String,Object>> degrees(){
		
		String sql = "SELECT * FROM Degrees";
		List<Map<String,Object>> list = db.queryList(sql, new Object[]{});
		return list;
	}
	
	public List<Map<String,Object>> departments(){
		
		String sql = "SELECT * FROM Departments";
		List<Map<String,Object>> list = db.queryList(sql, new Object[]{});
		return list;
	}
	
	public List<Map<String,Object>> employeeType(){
		
		String sql = "SELECT * FROM EmployeeType";
		List<Map<String,Object>> list = db.queryList(sql, new Object[]{});
		return list;
	}

}
