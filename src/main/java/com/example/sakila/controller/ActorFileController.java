package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorFileService;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorFileController {
	@Autowired ActorFileService actorFileService;
	
	// 배우상세 : 이미지파일 추가 
	@GetMapping("/on/addActorFile")
	public String addActorFile(Model model, @RequestParam int actorId) {
		model.addAttribute("actorId", actorId);
		return "on/addActorFile"; // jsp로 이동
	}
	
	// 배우상세 : 이미지 추가 -> 배우상세로 돌아감
	@PostMapping("/on/addActorFile")
	public String addActorFile(HttpSession session, Model model, ActorForm actorForm) {
		List<MultipartFile> list = actorForm.getActorFile();
		for(MultipartFile f : list) { // 이미지파일은 *.jpg or *.png 가능
			if(f.getContentType().equals("image/jpeg") == false 
					&& f.getContentType().equals("image/png") == false) {
				model.addAttribute("msg", "이미지 파일만 입력이 가능합니다");
				return "on/addActorFile"; // 폼으로 가면서 
			}
		}
		
		String path = session.getServletContext().getRealPath("/upload/");
		actorFileService.addActorFile(actorForm, path);
		return "redirect:/on/actorOne?actorId=" + actorForm.getActorId();
	}
}
