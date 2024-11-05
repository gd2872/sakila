package com.example.sakila.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.vo.ActorForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorController {
	
	// 배우 추가 폼
	@GetMapping("/on/addActor")
	public String addActor() {
		return "on/addActor";
	}
	
	// 배우 추가 액션
	@PostMapping("/on/addActor")
	public String addActor(ActorForm actorForm) { // input type="file" 파일이 여러개니 배열 or List로 받음
		// (Actor actor, List<MultipartFile> actorFile) 이렇게 받을 수 있지만 vo 만들어서 할 수 있음 
		log.debug(actorForm.getFirstName());
		log.debug(actorForm.getLastName());
		log.debug("actorFile : " + actorForm.getActorFile());
		if(actorForm.getActorFile() != null) {
			log.debug("actorFile size : " + actorForm.getActorFile().size()); // 디버깅
		}
		return "";
		//return "redirect:/on/actorList";
	}
	

}
