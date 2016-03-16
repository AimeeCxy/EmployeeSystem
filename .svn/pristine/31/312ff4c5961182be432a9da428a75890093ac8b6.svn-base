package employee.db.beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import employee.db.utils.DBUtils;

public class AttendanceBean {
	
	private DBUtils db = new DBUtils();
	
	public List<Map<String,Object>> queryAttend(String date){    //只查日期，员工id不限
		
		String sql = "SELECT a.EmployeeID,e.EmployeeName,a.StatusID,COUNT(a.StatusID)AS num  FROM attendances a,employees e WHERE DATE LIKE ? AND a.EmployeeID=e.EmployeeID GROUP BY a.EmployeeID,a.StatusID";
		List<Map<String,Object>> list = db.queryList(sql,new Object[]{date});
		System.out.println(list);
		//Map<String,Object> map = null;
		List<Map<String,Object>> dlist =null;
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
		if(list.size()>0){
			for(int i=0;i<list.size();i++){
				if(i==0){
					dlist = new ArrayList<Map<String,Object>>();
				}
				if(i<list.size()-1){
					if(list.get(i+1).get("EmployeeID")!=list.get(i).get("EmployeeID")){
						dlist.add(list.get(i));
						Map<String,Object> map = getMap(dlist,date,0);
						System.out.println(map);
						resultList.add(map);
						
						dlist = new ArrayList<Map<String,Object>>();
						
					}else{
						dlist.add(list.get(i));
					}
				}else if(i==list.size()-1&&i>1){
					if(list.get(i).get("EmployeeID")!=list.get(i-1).get("EmployeeID")){
						dlist.add(list.get(i));
						Map<String,Object> map = getMap(dlist,date,0);
						System.out.println(map);
						resultList.add(map);
					}else{
						dlist.add(list.get(i));
						Map<String,Object> map = getMap(dlist,date,0);
						System.out.println(map);
						resultList.add(map);
					}
				}
			}
		}
		return resultList;
	}
	
	
	
	
	@SuppressWarnings("null")
	public List<Map<String,Object>> queryAttendByID(String id,String date){ // 查日期，员工id指定
		//System.out.println(date+"   "+id);
		String sql = "SELECT a.EmployeeID,e.EmployeeName,a.StatusID,COUNT(a.StatusID) AS num FROM attendances a,employees e WHERE DATE LIKE ? AND  a.EmployeeID=? AND a.EmployeeID=e.EmployeeID  GROUP BY a.StatusID ";
		List<Map<String,Object>> list = db.queryList(sql,new Object[]{date,id});
		List<Map<String,Object>> list1 = new ArrayList<Map<String,Object>>();
		if(list.size()>0){
			Map<String,Object> map = getMap(list,date,0);
			list1.add(map);
		}
		
		return list1;

	}
	
	private static Map<String,Object> getMap(List<Map<String,Object>> list,String date,int j){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("EmployeeID", list.get(j).get("EmployeeID"));
		map.put("EmployeeName", list.get(j).get("EmployeeName"));
		map.put("Date",date.substring(0, 7));
		map.put("s1", 0);
		map.put("s2", 0);
		map.put("s3", 0);
		map.put("s4", 0);
		map.put("s5", 0);
		
		for(int i=0;i<list.size();i++){ 
			int statusID =  (Integer) list.get(i).get("StatusID");
			if(statusID==1){
				map.put("s1", list.get(i).get("num"));
			}
			if(statusID==2){
				map.put("s2",list.get(i).get("num"));
			}
			if(statusID==3){
				map.put("s3",list.get(i).get("num"));
			}
			if(statusID==4){
				map.put("s4",list.get(i).get("num"));
			}
			if(statusID==5){
				map.put("s5",list.get(i).get("num"));
			}
			
		}
		return map;
	}

}
