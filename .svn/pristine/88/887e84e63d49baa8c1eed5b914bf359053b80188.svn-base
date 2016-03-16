package employee.db.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.jsp.JspWriter;

import employee.db.utils.DBUtils;

public class RoleQueryBean {
	private DBUtils db = new DBUtils();
	private String sql_role_query;
	private String sql_role_auth;
	private JspWriter out;

	/**
	 * @return the out
	 */
	public JspWriter getOut() {
		return out;
	}

	/**
	 * @param out
	 *            the out to set
	 */
	public void setOut(JspWriter out) {
		this.out = out;
	}

	public void roleQueryDisplay( int id) {
		sql_role_query = "SELECT Roles.* FROM Roles";
		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = null;
		cn = db.getConn();
		try {
			stmt = cn.createStatement();
			if (stmt != null)
				rs = stmt.executeQuery(sql_role_query);
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

				String roleName = rs.getString("RoleName");
				int roleId = rs.getInt("RoleID");
				try {
					if(id!=roleId){
					out.print("<option value=\"" + roleId + "\">" + roleName
							+ "</option>");
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void authorityDisplay(int roleId) {
		sql_role_auth = "SELECT Roles.* FROM Roles WHERE Roles.`RoleID`="
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

	public void getOptionId(int id) {
		String sql_option = "SELECT Roles.`RoleName` FROM Roles WHERE Roles.`RoleID`="
				+ id;
		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = null;
		cn = db.getConn();
		try {
			stmt = cn.createStatement();
			if (stmt != null)
				rs = stmt.executeQuery(sql_option);
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

				String roleName = rs.getString("RoleName");
				try {
					out.print("<option value=\"" + id + "\">" + roleName
							+ "</option>");
				} catch (IOException e) {
					e.printStackTrace();

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void employeesDisplay(int id) {
		String sql_role_employees = "SELECT Employees.* FROM UserRole JOIN Employees ON Employees.`EmployeeID`=UserRole.`EmployeeID` WHERE UserRole.`RoleID`="
				+ id;
		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = null;
		cn = db.getConn();
		try {
			stmt = cn.createStatement();
			if (stmt != null)
				rs = stmt.executeQuery(sql_role_employees);
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
					int employeeId = rs.getInt("EmployeeID");
					String employeeName = rs.getString("EmployeeName");
					String title = rs.getString("Title");
					System.out.println(employeeId);
					out.print("<tr>");
					outInfo("" + employeeId);
					outInfo(employeeName);
					outInfo("" + rs.getInt("DepartmentID"));
					outInfo(title);
					/*
					 * outInfo("<a href=\"authority_manage.jsp?employeeId=" +
					 * employeeId + "&&employeeName=" + employeeName +
					 * "&&title=" + title + "\">" + "[管理权限]</a>");
					 */
					out.println("</tr>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
}
