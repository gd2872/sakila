package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.service.StaffService;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j // 이 클래스에서 log라는 변수를 사용 가능 (객체 자동 주입)
@Controller
public class LoginController {
	// @Autowired StaffMapper staffMapper;
	@Autowired StaffService staffService;
	
	// 로그아웃
	@GetMapping("/on/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		log.debug("로그아웃 성공"); 
		return "redirect:/off/login"; // 자동으로 : 뒤에 request.contextPath 주입
	}
	
	
	// 로그인 폼
	@GetMapping("/off/login")	
	public String login() {
		
		log.debug("/off/login 실행됨");
		
		return "off/login"; // "" 포워딩 
	}

	// 로그인 액션
	@PostMapping("/off/login")
	public String login(Model model, HttpSession session, 
			@RequestParam(name = "staffId") int staffId 
			, @RequestParam(name = "password") String password) {
			// post로 요청이 들어오면
			// int staffId = Integer.parseInt(request.getParameter("staffId")) => 자동형변환까지 가능
			// String password = reqeust.getParameter("password") 
		
			Staff paramStaff = new Staff(); // 지역변수
			paramStaff.setStaffId(staffId);
			paramStaff.setPassword(password);
			
			Staff loginStaff = staffService.login(paramStaff);
			if(loginStaff == null) {
				log.debug("로그인 실패");
				model.addAttribute("msg", "로그인 실패");
				return "/off/login";
			}
			session.setAttribute("loginStaff", loginStaff);
			log.debug("로그인 성공, 세션 loginStaff 속성 추가");
			
		return "redirect:/on/main"; // "redirect:/" -> 포워딩 X, 자동으로 request.contextPath 사용 
	}
}
