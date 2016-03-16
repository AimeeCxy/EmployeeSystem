package employee.db.beans;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import employee.db.utils.DBUtils;

public class EmployeeBean {
	
	private DBUtils db = new DBUtils();
	
	public int addEmployee(Employee e){       //添加员工，Employees和Users两个表操作
		
		String sql ="INSERT INTO Employees (EmployeeName,Sex,Birthday,Phone,DegreeID,HireDate,EmployeeTypeID,DepartmentID,Title,Salary) VALUES (?,?,?,?,?,?,?,?,?,?)";
		
		int k = db.updateReturnId(sql, new Object[]{e.getEmployeeName(),e.getSex(),e.getBirthDay(),e.getPhone(),e.getDegreeID(),e.getHireDate(),e.getEmployeeTypeID(),e.getDepartmentID(),e.getTitle(),e.getSalary()});
		int r = db.update("INSERT INTO Users (EmployeeID) VALUES(?)", new Object[]{k});
		return r;
	
		
		
	}
	
	public List<Map<String, Object>> selectOneEmployee(Employee e){         //找到一个员工
		
		String sql = "SELECT * FROM Employees WHERE EmployeeID=?";
		List<Map<String, Object>> list = db.queryList(sql,new Object[]{e.getEmployeeID()});
			
		return list;
	
	}
	
	public int update(Employee e){    //已知员工ID修改员工信息
		
		String sql = "UPDATE Employees SET EmployeeName=?,Sex=?,BirthDay=?,Phone=?,DegreeID=?,HireDate=?,EmployeeTypeID=?,DepartmentID=?,Title=?,Salary=? WHERE EmployeeID=?";
		int k = db.update(sql, new Object[]{e.getEmployeeName(),e.getSex(),e.getBirthDay(),e.getPhone(),e.getDegreeID(),e.getHireDate(),e.getEmployeeTypeID(),e.getDepartmentID(),e.getTitle(),e.getSalary(),e.getEmployeeID()});
		
		return k;
	}
	
	public List<Map<String,Object>> query(Employee e){      //查询所有员工
		//本地数据库
		String sql="SELECT em.EmployeeID,em.EmployeeName,em.Sex,em.Birthday,em.Phone,d.DegreeName,em.HireDate,et.EmployeeTypeName,dp.DepartmentName,em.Title,em.Salary FROM employees em INNER JOIN DEGREES d ON em.DegreeID=d.DegreeID INNER JOIN departments dp ON em.DepartmentID=dp.DepartmentID INNER JOIN employeetype et ON em.EmployeeTypeID=et.EmployeeTypeID INNER JOIN users u ON em.EmployeeID=u.EmployeeID WHERE u.flag='1'";
		//联网
		//String sql="SELECT em.EmployeeID,em.EmployeeName,em.Sex,em.Birthday,em.Phone,d.DegreeName,em.HireDate,et.EmployeeTypeName,dp.DepartmentName,em.Title,em.Salary FROM Employees em INNER JOIN Degrees d ON em.DegreeID=d.DegreeID INNER JOIN Departments dp ON em.DepartmentID=dp.DepartmentID INNER JOIN EmployeeType et ON em.EmployeeTypeID=et.EmployeeTypeID INNER JOIN Users u ON em.EmployeeID=u.EmployeeID WHERE u.flag='1'";
		sql = sql + " ORDER BY em.EmployeeID";
		List<Map<String,Object>> list = db.queryList(sql, new Object[]{});
		return list;
	}
	
	
	public int delete(Employee e){    //把users表flag置0，再查询时就查不到了
		String sql ="UPDATE users SET flag='0' WHERE EmployeeID=?";
		int k = db.update(sql,new Object[]{e.getEmployeeID()});
		return k;
	}
	
	public List<Map<String,Object>> queryIf(Employee e){      //多条件组合查询员工
		//本地数据库
		String sql="SELECT em.EmployeeID,em.EmployeeName,em.Sex,em.Birthday,em.Phone,d.DegreeName,em.HireDate,et.EmployeeTypeName,dp.DepartmentName,em.Title,em.Salary FROM employees em INNER JOIN DEGREES d ON em.DegreeID=d.DegreeID INNER JOIN departments dp ON em.DepartmentID=dp.DepartmentID INNER JOIN employeetype et ON em.EmployeeTypeID=et.EmployeeTypeID INNER JOIN users u ON em.EmployeeID=u.EmployeeID WHERE u.flag='1'";
		//联网
		//String sql="SELECT em.EmployeeID,em.EmployeeName,em.Sex,em.Birthday,em.Phone,d.DegreeName,em.HireDate,et.EmployeeTypeName,dp.DepartmentName,em.Title,em.Salary FROM Employees em INNER JOIN Degrees d ON em.DegreeID=d.DegreeID INNER JOIN Departments dp ON em.DepartmentID=dp.DepartmentID INNER JOIN EmployeeType et ON em.EmployeeTypeID=et.EmployeeTypeID INNER JOIN Users u ON em.EmployeeID=u.EmployeeID WHERE u.flag='1'";
		//System.out.println("姓名："+e.getEmployeeName()+" 性别："+e.getSex()+" 部门id："+e.getDepartmentID()+" 员工类型id："+e.getEmployeeTypeID());
		
		if((!e.getEmployeeName().equals(""))&&e.getEmployeeName()!=null){
			sql = sql + " AND em.EmployeeName='" + e.getEmployeeName() + "'";
		}
		
		if(!e.getSex().equals("不限")){
			sql = sql + " AND em.Sex='" + e.getSex() + "'";
		}
		if(e.getDepartmentID()!=0){
			sql = sql + "AND em.DepartmentID='" + e.getDepartmentID() + "'";
		}
		if(e.getEmployeeTypeID()!=0){
			sql = sql + "AND em.EmployeeTypeID='" + e.getEmployeeTypeID() + "'";
		}
		sql = sql + " ORDER BY em.EmployeeID";
		List<Map<String,Object>> list = db.queryList(sql, new Object[]{});
		return list;
	}

}
