package employee.db.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import employee.db.utils.DBUtils;

public class RoleEditBean {
	private DBUtils db = new DBUtils();
	private String sql_role_query;
	private String sql_edit_role = "";
	private String roleName = "";
	private int roleId = 0;
	private int auth_authority = 0;
	private int auth_info = 0;
	private int auth_job = 0;
	private int auth_attendance = 0;
	private int auth_training = 0;
	private int auth_evaluation = 0;
	private int auth_rp = 0;
	private int auth_role = 0;
	private int auth_encrypt = 0;

	public boolean roleEdit() {
		sql_edit_role = "UPDATE Roles SET RoleName='" + roleName
				+ "',Auth_Authority=" + auth_authority + ",Auth_Info="
				+ auth_info +

				",Auth_Job=" + auth_job + ",Auth_Attendance="
				+ auth_attendance + ",Auth_Training=" + auth_training
				+ ",Auth_Evaluation=" + auth_evaluation + ",Auth_RP="
				+ auth_rp + ",Auth_Role=" + auth_role
				+ ",Auth_Encrypt=" + auth_encrypt + " WHERE RoleID="
				+ roleId;

		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = null;
		cn = db.getConn();
		try {
			stmt = cn.createStatement();
			if (stmt != null)
				System.out.println(sql_edit_role);
			stmt.execute(sql_edit_role);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public void roleQuery() {
		sql_role_query = "SELECT Roles.* FROM Roles WHERE RoleID=" + roleId;
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
				setRoleName(rs.getString("RoleName"));
				setRoleId(rs.getInt("RoleID"));
				setAuth_authority(rs.getInt("Auth_Authority"));
				setAuth_info(rs.getInt("Auth_Info"));
				setAuth_job(rs.getInt("Auth_Job"));
				setAuth_attendance(rs.getInt("Auth_Attendance"));
				setAuth_encrypt(rs.getInt("Auth_Encrypt"));
				setAuth_evaluation(rs.getInt("Auth_Evaluation"));
				setAuth_role(rs.getInt("Auth_Role"));
				setAuth_training(rs.getInt("Auth_Training"));
				setAuth_rp(rs.getInt("Auth_RP"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @return the roleId
	 */
	public int getRoleId() {
		return roleId;
	}

	/**
	 * @return the auth_authority
	 */
	public int getAuth_authority() {
		return auth_authority;
	}

	/**
	 * @return the auth_info
	 */
	public int getAuth_info() {
		return auth_info;
	}

	/**
	 * @return the auth_job
	 */
	public int getAuth_job() {
		return auth_job;
	}

	/**
	 * @return the auth_attendance
	 */
	public int getAuth_attendance() {
		return auth_attendance;
	}

	/**
	 * @return the auth_training
	 */
	public int getAuth_training() {
		return auth_training;
	}

	/**
	 * @return the auth_evaluation
	 */
	public int getAuth_evaluation() {
		return auth_evaluation;
	}

	/**
	 * @return the auth_rp
	 */
	public int getAuth_rp() {
		return auth_rp;
	}

	/**
	 * @return the auth_role
	 */
	public int getAuth_role() {
		return auth_role;
	}

	/**
	 * @return the auth_encrypt
	 */
	public int getAuth_encrypt() {
		return auth_encrypt;
	}

	/**
	 * @param roleName
	 *            the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/**
	 * @param roleId
	 *            the roleId to set
	 */
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	/**
	 * @param auth_authority
	 *            the auth_authority to set
	 */
	public void setAuth_authority(int auth_authority) {
		this.auth_authority = auth_authority;
	}

	/**
	 * @param auth_info
	 *            the auth_info to set
	 */
	public void setAuth_info(int auth_info) {
		this.auth_info = auth_info;
	}

	/**
	 * @param auth_job
	 *            the auth_job to set
	 */
	public void setAuth_job(int auth_job) {
		this.auth_job = auth_job;
	}

	/**
	 * @param auth_attendance
	 *            the auth_attendance to set
	 */
	public void setAuth_attendance(int auth_attendance) {
		this.auth_attendance = auth_attendance;
	}

	/**
	 * @param auth_training
	 *            the auth_training to set
	 */
	public void setAuth_training(int auth_training) {
		this.auth_training = auth_training;
	}

	/**
	 * @param auth_evaluation
	 *            the auth_evaluation to set
	 */
	public void setAuth_evaluation(int auth_evaluation) {
		this.auth_evaluation = auth_evaluation;
	}

	/**
	 * @param auth_rp
	 *            the auth_rp to set
	 */
	public void setAuth_rp(int auth_rp) {
		this.auth_rp = auth_rp;
	}

	/**
	 * @param auth_role
	 *            the auth_role to set
	 */
	public void setAuth_role(int auth_role) {
		this.auth_role = auth_role;
	}

	/**
	 * @param auth_encrypt
	 *            the auth_encrypt to set
	 */
	public void setAuth_encrypt(int auth_encrypt) {
		this.auth_encrypt = auth_encrypt;
	}
}
