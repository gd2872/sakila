package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

@Service // 대표와 사원 그 사이 가공역할 팀장같은 역할
@Transactional // 클래스 안 메소드가 예외 발생하면 묶음 전부가 취소(메소드 롤백?)
public class StaffService { 
	@Autowired StaffMapper staffMapper;
	
	// 컨트롤러 이름 따라감
	
	
	public Map<String, Object> getStoreOne(int staffId) {
		return staffMapper.selectStaffOne(staffId);
	}
	
	public Map<String, Object> getStaffOne(int staffId) {
		return staffMapper.selectStaffOne(staffId);
	}
	
	public int getLastPage (int rowPerPage) {
		int count = staffMapper.selectStaffCount(); // 토탈 Row
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
	
	public List<Staff> getStaffList(Map paramMap) {
		return staffMapper.selectStaffList(paramMap);
	}
	
	public int addStaff(Staff paramStaff) {
		return staffMapper.insertStaff(paramStaff);
	}
	
	public int modifyStaff(Staff paramStaff) {
		return staffMapper.updateStaff(paramStaff);
	}
	
	public Staff login(Staff paramStaff) {
		return staffMapper.login(paramStaff);
	} 

	
}
