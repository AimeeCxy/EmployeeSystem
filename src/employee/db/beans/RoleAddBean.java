package employee.db.beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import employee.db.utils.DBUtils;

public class RoleAddBean {
	private DBUtils db = new DBUtils();
	private String sql_add_role;
	private String roleName;
	private int auth_authority = 0;
	private int auth_info = 0;
	private int auth_job = 0;
	private int auth_attendance = 0;
	private int auth_training = 0;
	private int auth_evaluation = 0;
	private int auth_rp = 0;
	private int auth_role = 0;
	private int auth_encrypt = 0;

	public boolean addRole() {

		sql_add_role = "INSERT INTO Roles VALUES (NULL,'" + roleName + "',"
				+ auth_authority + "," + auth_info + ","

				+ auth_job + "," + auth_attendance + "," + auth_training + ","
				+ auth_evaluation + "," + auth_rp + "," + auth_role + ","
				+ auth_encrypt + ")";

		Statement stmt = null;
		ResultSet rs = null;
		Connection cn = null;
		cn = db.getConn();
		try {
			stmt = cn.createStatement();
			if (stmt != null)
				System.out.println(sql_add_role);
			stmt.execute(sql_add_role);

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;

	}

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
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
		System.out.println(roleName);

		this.roleName = roleName;
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
