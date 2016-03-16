package employee.db.beans;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Hashtable;

import employee.db.utils.DBUtils;

public class UserLoginBean {
	private DBUtils db = new DBUtils();
	private String userId="2" ;
	private String password = "";
	int userSearch;
	String pwdSearch;
	private int userFlag;
	//错误列表
	private Hashtable errors = new Hashtable();
	
	private Statement stmt = null;
	private ResultSet rs = null;
	private String sql;
	public boolean userTest() {
		sql = "select EmployeeID,password,flag from Users where EmployeeID="+userId;

		
		Connection cn = db.getConn();

		try {
			stmt = cn.createStatement();
			if(stmt!=null)
			rs = stmt.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(! rs.next() ){
				setErrorMsg("userError", "用户不存在！");
				return false;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
				 userSearch = rs.getInt("EmployeeID");
				 pwdSearch = rs.getString("password");
				userFlag = rs.getInt("flag");
				
				if(!(""+userSearch).trim().equals(userId)){
					setErrorMsg("userError", "用户不存在！");
					return false;
				}
				
				if(userFlag==0){
					setErrorMsg("userError", "用户不存在！");
					return false;
				}
				
				if(!(pwdSearch.trim().equals(password))){
					setErrorMsg("pwdError", "密码错误！");
					return false;
				}
				System.out.println(""+userSearch+" "+pwdSearch+" "+userFlag);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	public int getUserFlag() {
		return userFlag;
	}

	public void setUserFlag(int userFlag) {
		this.userFlag = userFlag;
	}

	public String getUserId() {
		return  userId;
	}

	public void setUserId(String userId) {
		this.userId =userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setErrorMsg(String err,String errMsg)
	{
		if((err != null) && (errMsg != null))
		{
			errors.put(err,errMsg);
		}
	}
	public String getErrorMsg(String err)
	{
		String err_msg = (String)errors.get(err);
		return (err_msg == null) ? "" : err_msg;
	}
}
