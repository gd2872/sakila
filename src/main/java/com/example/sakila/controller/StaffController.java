package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.AddressMapper;
import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Staff;
import com.example.sakila.vo.Store;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StaffController {
	@Autowired StaffMapper staffMapper;
	@Autowired StoreMapper storeMapper;
	@Autowired AddressMapper addressMapper;
	
	
	// active 수정
	@GetMapping("/on/modifyStaffActive")
	public String modifyStaffActive(Staff staff) {
		if(staff.getActive() == 1) { // 1은 활성화 -> 비활성화 버튼 누르면 2 비활성화 됨
			staff.setActive(2);
		} else {
			staff.setActive(1);
		}
		int row = staffMapper.updateStaff(staff); // 어떤 컬럼값을 수정하던 mapper 메소드는 하나
		return "redirect:/on/staffList";
	}
	
	// leftMenu.a href 태그 통해서, addStaff.주소검색 (a = 넘어오는 값 없음, 주소검색 = 주소값 넘김 가능)
	@GetMapping("/on/addStaff")
	public String addStaff(Model model
							, @RequestParam(defaultValue = "") String searchAddress) {
		// model(storeList)
		log.debug("searchAddress: " + searchAddress);

		List<Store> storeList = storeMapper.selectStoreList();
		model.addAttribute("storeList", storeList);
		
		// model(addressList) <- searchAddress가 공백이 아니면 검색 후 재호출
		if(searchAddress.equals("") == false) { // ! 공백이 아니면
			List<Address> addressList = addressMapper.selectAddressListByWord(searchAddress);
			log.debug(addressList.toString());
			model.addAttribute("addressList", addressList);
		}
		return "on/addStaff";
	}
	
	@PostMapping("/on/addStaff")
	public String addStaff(Staff staff) { // 커맨드 객체 생성 -> 커맨드객체.set(request.getParameter())
		// insert 호출
		log.debug(staff.toString());
		int row = staffMapper.insertStaff(staff);
		log.debug("row : " + row);
		if(row == 0) { // 입력 실패 시 입력페이지로 포워딩
			return "on/addStaff";
		}
		return "redirect:/on/staffList";
	}
	
	@GetMapping("/on/staffList")
	public String staffList(@RequestParam(defaultValue = "1") int currentPage
							, @RequestParam(defaultValue = "10") int rowPerPage
							, Model model) { 
		// currentPage가 넘어오지 않으면 1
		// moderl(staffList)
		Map<String, Object> map = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		log.debug(map.toString());
				
		List<Staff> staffList = staffMapper.selectStaffList(map);
		log.debug(staffList.toString());
		// @RequestParam(name = "currentPage") int currentPage
		// request.getParameter("currentPage")를 받아와서 int 타입 currentPage로 형변환
		
		int count = staffMapper.selectStaffCount(); // 토탈 Row
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage++;
		}
		
		model.addAttribute("staffList", staffList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		return "on/staffList";
	}
	
	@GetMapping("/on/staffOne")
	public String staffOne(HttpSession session, Model model) {
		int staffId = ((Staff)(session.getAttribute("loginStaff"))).getStaffId();
		Map<String, Object> staff = staffMapper.selectStaffOne(staffId);
		model.addAttribute("staff", staff);
		log.debug(staff.toString());
		return "on/staffOne";
	}

	@GetMapping("/on/storeOne")
	public String storeOne(HttpSession session, Model model) {
		int staffId = ((Staff)(session.getAttribute("loginStaff"))).getStaffId();
		Map<String, Object> staff = staffMapper.selectStoreOne(staffId);
		model.addAttribute("staff", staff);
		log.debug(staff.toString());
		return "on/storeOne";
	}
	

}
