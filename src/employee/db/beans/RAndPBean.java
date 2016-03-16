package employee.db.beans;

import java.util.List;
import java.util.Map;

import employee.db.utils.DBUtils;

public class RAndPBean {
	
	private DBUtils db = new DBUtils();
	
	public int addRewardsOrPunishments(RewardsAndPunishments rap){        //添加奖惩
		
		String sql ="";
		int k = db.update(sql, new Object[]{});
		
		return k;
	}
	
	
	public List<Map<String,Object>> findRewardsAndPunishments(){            //查询奖惩
		
		String sql ="";
		List<Map<String,Object>> list = db.queryList(sql, new Object[]{});
		return list;
	}
	
	
	public int deleteRewardsOrPunishments(){               //删除一条记录
		
		String sql ="";
		int k = db.update(sql, new Object[]{});
		return 0;
		
	}

}
