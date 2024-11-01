package com.example.sakila.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	
	// /on/storeOne.jsp
	Map<String, Object> selectStoreOne(int staffId); // FM : Integer

	// /on/staffOne.jsp
	Map<String, Object> selectStaffOne(int staffId); // FM : Integer
	
	// /off/login.jsp
	Staff login(Staff staff);
}