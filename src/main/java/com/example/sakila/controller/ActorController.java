package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorController {
	@Autowired ActorService actorService;
	
	// 배우 리스트
	@GetMapping("/on/actorList")
	public String actorList(@RequestParam(defaultValue = "1") int currentPage
							, @RequestParam(defaultValue = "10") int rowPerPage) {
		
		return "on/actorList";
	}
	
	// 배우 추가 액션
	@PostMapping("/on/addActor")
	public String addActor(HttpSession session, ActorForm actorForm) { // input type="file" 파일이 여러개니 배열 or List로 받음
		// (Actor actor, List<MultipartFile> actorFile) 이렇게 받을 수 있지만 vo 만들어서 할 수 있음 
		/* 디버깅
		log.debug(actorForm.getFirstName());
		log.debug(actorForm.getLastName());
		log.debug("actorFile : " + actorForm.getActorFile());
		if(actorForm.getActorFile() != null) {
			log.debug("actorFile size : " + actorForm.getActorFile().size());
		}
		*/
		String path = session.getServletContext().getRealPath("/upload/"); // /슬래시 주의
		log.debug(path);
		
		actorService.addActor(actorForm, path);
		
		return "redirect:/on/actorList";
	}
	
	// 배우 추가 폼
	@GetMapping("/on/addActor")
	public String addActor() {
		return "on/addActor";
	}

}
