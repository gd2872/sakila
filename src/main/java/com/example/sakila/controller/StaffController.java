package com.example.sakila.controller;

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
		return "redirect:/on/staffList";
	}
	
	@GetMapping("/on/staffList")
	public String staffList(@RequestParam(defaultValue = "1") int currentPage) { 
		// currentPage가 넘어오지 않으면 1
		// moderl(staffList)
		// @RequestParam(name = "currentPage") int currentPage
		// request.getParameter("currentPage")를 받아와서 int 타입 currentPage로 형변환
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
