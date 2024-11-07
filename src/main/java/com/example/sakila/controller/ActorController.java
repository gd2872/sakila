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
import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;
import com.example.sakila.vo.Film;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ActorController {
	@Autowired ActorService actorService;
	@Autowired ActorFileService actorFileService;
	@Autowired FilmService filmService;
	
	@GetMapping("/on/actorOne")
	public String actorOne(Model model
						   , @RequestParam int actorId) { 
		Actor actor = actorService.getActorOne(actorId);
		List<ActorFile> actorFileList = actorFileService.getFilmTitleListByActor(actorId);
		List<Film> filmList = filmService.getFilmTitleListByActor(actorId);
		// 디버깅
		log.debug(actor.toString());
		log.debug(actorFileList.toString());
		log.debug(filmList.toString());
		
		model.addAttribute("actor", actor);
		model.addAttribute("actorFileList", actorFileList);
		model.addAttribute("filmList", filmList);
		return "on/actorOne";
	}
	
	// 배우 리스트 (+페이징)
	@GetMapping("/on/actorList")
	public String actorList(Model model
							, @RequestParam(defaultValue = "1") int currentPage
							, @RequestParam(defaultValue = "10") int rowPerPage
							, @RequestParam(required = false) String searchWord) {
							// @RequestParam은 null값을 받아올 수 없음 -> required = false (공백도 가능) / true => null(공백 입력 안됨)
		log.debug("searchWord : " + searchWord);
		
		List<Actor> actorList = actorService.getActorList(currentPage, rowPerPage, searchWord);
		
		int lastPage = actorService.getTotalCount(rowPerPage, searchWord);

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("actorList", actorList);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("searchWord", searchWord);

		return "on/actorList";
	}
	
	// 배우 추가 액션
	@PostMapping("/on/addActor")
	public String addActor(HttpSession session, Model model, ActorForm actorForm) { // input type="file" 파일이 여러개니 배열 or List로 받음
		// (Actor actor, List<MultipartFile> actorFile) 이렇게 받을 수 있지만 vo 만들어서 할 수 있음 
		/* 디버깅
		log.debug(actorForm.getFirstName());
		log.debug(actorForm.getLastName());
		log.debug("actorFile : " + actorForm.getActorFile());
		if(actorForm.getActorFile() != null) {
			log.debug("actorFile size : " + actorForm.getActorFile().size());
		}
		*/
		List<MultipartFile> list = actorForm.getActorFile();
		if(list != null && list.size() !=0) { // 첨부된 파일이 있다면			
			for(MultipartFile f : list) { // 이미지파일은 *.jpg or *.png 가능
				if(f.getContentType().equals("image/jpeg") == false 
						&& f.getContentType().equals("image/png") == false) {
					model.addAttribute("msg", "이미지 파일만 입력이 가능합니다");
					return "on/addActor"; // 폼으로 가면서 
				}
			}
		}
		
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
