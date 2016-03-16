package employee.db.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.jsp.JspWriter;

import employee.db.utils.DBUtils;

public class RoleDeleteBean {
	private DBUtils db = new DBUtils();
	private JspWriter out;
	/**
	 * @return the out
	 */
	public JspWriter getOut() {
		return out;
	}
	/**
	 * @param out the out to set
	 */
	public void setOut(JspWriter out) {
		this.out = out;
	}
	public void outInfo(String s) {
		try {

			out.println("<th>");
			out.println(s);
			out.println("</th>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public boolean deleteRole(int id){
		String sql_delete_role="DELETE FROM roles WHERE roles.`RoleID`="+id;
		
		Statement stmt = null;
		Connection cn = null;
		cn = db.getConn();
		try {
			stmt = cn.createStatement();
			if (stmt != null){
			stmt.execute(sql_delete_role);
			}
			else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
		
		
	}
	
	
	
	
	public void authorityDisplay(int roleId) {
		String sql_role_auth = "SELECT Roles.* FROM Roles WHERE Roles.`RoleID`="
				+ roleId;
		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = null;
		cn = db.getConn();
		try {
			stmt = cn.createStatement();
			if (stmt != null)
				rs = stmt.executeQuery(sql_role_auth);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 将获取的结果一行一行显示：

		if (rs == null) {
			System.out.println("rs为null");
			return;
		}

		try {
			while (rs.next()) {
				try {
					out.print("<tr>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				outInfo(rs.getString("RoleName"));
				if ((rs.getInt("Auth_Authority") == 1)) {
					outInfo("Y");
				} else {
					outInfo("N");
				}
				if (rs.getInt("Auth_Info") == 1) {
					outInfo("Y");
				} else {
					outInfo("N");
				}
				if (rs.getInt("Auth_Job") == 1) {
					outInfo("Y");
				} else {
					outInfo("N");
				}
				if (rs.getInt("Auth_Attendance") == 1) {
					outInfo("Y");
				} else {
					outInfo("N");
				}
				if (rs.getInt("Auth_Training") == 1) {
					outInfo("Y");
				} else {
					outInfo("N");
				}
				if (rs.getInt("Auth_Evaluation") == 1) {
					outInfo("Y");
				} else {
					outInfo("N");
				}
				if (rs.getInt("Auth_RP") == 1) {
					outInfo("Y");
				} else {
					outInfo("N");
				}
				if (rs.getInt("Auth_Role") == 1) {
					outInfo("Y");
				} else {
					outInfo("N");
				}
				if (rs.getInt("Auth_Encrypt") == 1) {
					outInfo("Y");
				} else {
					outInfo("N");
				}

				try {
					out.print("</tr>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
