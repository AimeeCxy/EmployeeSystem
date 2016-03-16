package employee.db.beans;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import employee.db.utils.DBUtils;

public class AuthorityBean {
	private DBUtils db = new DBUtils();

	private String sql_employees;// 具有该权限员工的查询
	private String sql_roles;// 具有该权限角色的查询
	private String sql_all_employee;
	private String sql_auth_employee;
	private String sql_add_to_roles;
	private String authority;
	private JspWriter out;
	private int employeeId;

	/**
	 * @return the employeeId
	 */
	public int getEmployeeId() {
		return employeeId;
	}

	/**
	 * @param employeeId
	 *            the employeeId to set
	 */
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
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

	public void employeesDisplay() {
		sql_employees = "SELECT Employees.* FROM UserRole JOIN Employees ON UserRole.`EmployeeID`=Employees.`EmployeeID` JOIN Roles ON Roles.`RoleID`=UserRole.`RoleID` WHERE "
				+ authority + "=1";
		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = null;
		cn = db.getConn();

		try {
			stmt = cn.createStatement();
			if (stmt != null)
				rs = stmt.executeQuery(sql_employees);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 将获取的结果一行一行显示：
		try {
			try {

				if (rs == null) {
					System.out.println("rs为null");
					return;

				}
				while (rs.next()) {
					int employeeId = rs.getInt("EmployeeID");
					String employeeName = rs.getString("EmployeeName");
					String title = rs.getString("Title");
					System.out.println(employeeId);
					out.println("<tr>");
					outInfo("" + employeeId);
					outInfo(employeeName);
					outInfo("" + rs.getInt("DepartmentID"));
					outInfo(title);
					outInfo("<a href=\"authority_manage.jsp?employeeId="
							+ employeeId + "&&employeeName=" + employeeName
							+ "&&title=" + title + "\">" + "[管理权限]</a>");
					out.println("</tr>");
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void rolesDisplay() {
		sql_roles = "SELECT Roles.* FROM Roles WHERE " + authority + "=1";
		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = db.getConn();

		try {
			stmt = cn.createStatement();
			if (stmt != null)
				rs = stmt.executeQuery(sql_roles);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (rs == null) {
				System.out.println("rs为null");
				return;
			}
			while (rs.next()) {
				try {
					int roleId = rs.getInt("RoleID");
					out.println("<tr>");
					String roleName=rs.getString("RoleName");
					outInfo("" + roleName);
					outInfo("<a href='role_query.jsp?roleId1=" + roleId
							+"&&roleName1="+roleName+ "'>" + "[角色信息]</a>");
					System.out.println("<a href='role_query.jsp?roleId1=" + roleId
							+"&&roleName1="+roleName+ "'>" + "[角色信息]</a>");
					out.println("</tr>");
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

	// <option value="Auth_Authority">Auth_Authority</option>
	// 查询数据库现有的权限
	public void employeeDisplay(int id) {
		sql_all_employee = "SELECT Employees.`EmployeeID`,Employees.`EmployeeName`,Employees.`Title` FROM Employees; ";

		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = db.getConn();

		try {
			stmt = cn.createStatement();
			if (stmt != null)
				rs = stmt.executeQuery(sql_all_employee);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (rs == null) {
				System.out.println("rs为null");
				return;
			}
			while (rs.next()) {
				String temp = rs.getInt("EmployeeID") + "-"
						+ rs.getString("EmployeeName") + "-"
						+ rs.getString("Title");
				try {
					if (id != rs.getInt("EmployeeID")) {
						out.print("<option value=\"" + rs.getInt("EmployeeID")
								+ "\">" + temp + "</option>");
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void getOptionId(int id) {
		String sql_one_employee = "SELECT Employees.`EmployeeID`,Employees.`EmployeeName`,Employees.`Title` FROM Employees WHERE Employees.`EmployeeID`="
				+ id;
		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = db.getConn();

		try {
			stmt = cn.createStatement();
			if (stmt != null)
				rs = stmt.executeQuery(sql_one_employee);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (rs == null) {
			System.out.println("rs为null");
			return;
		}
		try {
			while (rs.next()) {
				String temp = rs.getInt("EmployeeID") + "-"
						+ rs.getString("EmployeeName") + "-"
						+ rs.getString("Title");
				try {
						out.print("<option value=\"" + rs.getInt("EmployeeID")
								+ "\">" + temp + "</option>");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void authEmployeeDisplay(boolean flag) {
		sql_auth_employee = "SELECT Roles.* FROM UserRole JOIN Roles ON UserRole.`RoleID`=Roles.`RoleID` WHERE EmployeeID="
				+ employeeId;

		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = db.getConn();
		boolean[] isWrite = new boolean[9];
		for (int i = 0; i < 9; i++) {
			isWrite[i] = false;
		}
		try {
			stmt = cn.createStatement();
			if (stmt != null)
				rs = stmt.executeQuery(sql_auth_employee);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (rs == null) {
				System.out.println("rs为null");
				return;
			}
			while (rs.next()) {
				try {
					List<Integer> list = new ArrayList<Integer>();
					String roleName = rs.getString("RoleName");
					int roleId=rs.getInt("RoleID");
					list.add(rs.getInt("Auth_Authority"));
					list.add(rs.getInt("Auth_Info"));
					list.add(rs.getInt("Auth_Job"));
					list.add(rs.getInt("Auth_Attendance"));
					list.add(rs.getInt("Auth_Training"));
					list.add(rs.getInt("Auth_Evaluation"));
					list.add(rs.getInt("Auth_RP"));
					list.add(rs.getInt("Auth_Role"));
					list.add(rs.getInt("Auth_Encrypt"));
					if (flag) {
						out.print("<tr>");
						outInfo(roleName);
						for (int i = 0; i < list.size(); i++) {
							if (list.get(i) == 1) {
								outInfo("Y");
							} else {
								outInfo("N");
							}

						}
						outInfo("<a  href='javascript:void(0);'"+"onclick='deleteRole("+roleId+")'"+"\">移除该员工</a>");
						out.print("</tr>");
					} else // flag为false时,综合权限
					{

						for (int i = 0; i < 9; i++) {
							if (list.get(i) == 1) {
								isWrite[i] = true;
							}
						}
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (!flag) {
				try {
					out.print("<tr>");
					for (int i = 0; i < 9; i++) {
						if (isWrite[i]) {
							outInfo("Y");
						} else {
							outInfo("N");
						}
					}
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

	public void addToRoleDisplay() {
		sql_add_to_roles = "SELECT Roles.`RoleID`,Roles.`RoleName` FROM Roles";
		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = db.getConn();
		try {
			stmt = cn.createStatement();
			if (stmt != null)
				rs = stmt.executeQuery(sql_add_to_roles);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (rs == null) {
			System.out.println("rs为null");
			return;
		}
		try {
			while (rs.next()) {
				try {
					out.print("<option value=\"" + rs.getString("RoleID")
							+ "\">" + rs.getString("RoleName") + "</option>");
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

	/**
	 * @return the authority
	 */
	public String getAuthority() {
		return authority;
	}

	/**
	 * @param authority
	 *            the authority to set
	 */
	public void setAuthority(String authority) {

		this.authority = authority;
	}
}
