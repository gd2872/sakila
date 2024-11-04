package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper // MyBatis 사용됨 : .mxl -> SQL 쿼리 메소드 정의
public interface StaffMapper {
	
	// 스태프 활성/비활성 변경 : /on/staffList.jsp
	int updateStaff(Staff staff); // update 하나로 모든 컬럼이 개별 수정 가능
	
	// 스태프 총 리스트  Row : /on/staffList.jsp 
	int selectStaffCount();
	
	// /on/staffList.jsp
	List<Staff> selectStaffList(Map<String, Object> map);
	
	// /on/addStaff.jsp
	int insertStaff(Staff staff);
	
	// /on/storeOne.jsp
	Map<String, Object> selectStoreOne(int staffId); // FM : Integer

	// /on/staffOne.jsp
	Map<String, Object> selectStaffOne(int staffId); // FM : Integer
	
	// /off/login.jsp
	Staff login(Staff staff);
}