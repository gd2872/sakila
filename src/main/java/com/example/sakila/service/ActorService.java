package com.example.sakila.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.mapper.ActorMapper;
import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ActorService {
	@Autowired ActorMapper actorMapper;
	@Autowired ActorFileMapper actorFileMapper;
	@Autowired FilmActorMapper filmActorMapper;
	
	// 필름 상세 -> searchName 검색 결과 : /on/filmOne
	public List<Actor> getActorListByActor(String searchName){
		return actorMapper.selectActorListByActor(searchName);
	}
	
	// 배우상세 -> 삭제 /on/removeActor
	public void removeActor(int actorId, String path) {
	
		// 1) film_actor 삭제 (삭제할 내용이 없을 수 있음)
		filmActorMapper.deleteFileByActor(actorId); 
		// 2) actor_file 삭제
		List<ActorFile> list = actorFileMapper.selectActorFileListByActor(actorId);
		actorFileMapper.deleteActorFileByActor(actorId);
		// 3) actor 삭제
		int row = actorMapper.deleteActor(actorId);
		// 4) 물리적 파일 삭제
		if(row == 1 && list != null && list.size() > 0) { // actor 삭제했고 물리적 파일이 존재한다면
			for(ActorFile af : list) {
				String fullname = path + af.getFilename() + "." + af.getExt();
				File f = new File(fullname);
				f.delete();
			}
		}
	}
	
	// 배우상세 -> 이름 수정 /on/modifyActor
	public int modifyActor(Actor actor) {
		return actorMapper.updateActor(actor);
	}
	
	// on/filmOne
	public List<Actor> getActorListByFilm(int filmId) {
		return actorMapper.selectAcotrListByFilm(filmId);
	}
	
	// on/actorOne 
	public Actor getActorOne(int ActorId) {
		return actorMapper.selectActorOne(ActorId);
	}
	
	// 배우 리스트 페이징
	public int getTotalCount (int rowPerPage, String searchWord) {
		int count = actorMapper.selectActorCount(searchWord);
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage; 
	}
	
	// 배우 리스트
	public List<Actor> getActorList(int currentPage, int rowPerPage, String searchWord){
		Map<String, Object> paramMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord); // 검색어 없으면 null
		
		return actorMapper.selectActorList(paramMap);
	}
	
	// 배우 추가 
	public void addActor(ActorForm actorForm, String path) {
		Actor actor = new Actor();
		actor.setFirstName(actorForm.getFirstName());
		actor.setLastName(actorForm.getLastName());
		
		// actorId = 0
		int row1 = actorMapper.insertActor(actor);
		// mybatis selectKey의 값
		int actorId = actor.getActorId();
		
		if(row1 == 1 && actorForm.getActorFile() != null) {
			// 파일 입력, ActorFile 입력
			List<MultipartFile> list = actorForm.getActorFile();
			for(MultipartFile mf : list) {
				ActorFile actorFile = new ActorFile();
				
				actorFile.setActorId(actorId);
				actorFile.setType(mf.getContentType());
				actorFile.setSize(mf.getSize());
				String filename = UUID.randomUUID().toString().replace("-", "");
				actorFile.setFilename(filename);
				int dotIdx = mf.getOriginalFilename().lastIndexOf("."); // (해당하는 점을 찾아내서
				String originname = mf.getOriginalFilename().substring(0, dotIdx);
				String ext = mf.getOriginalFilename().substring(dotIdx + 1);
				actorFile.setOriginname(originname);
				actorFile.setExt(ext);
				
				int row2 = actorFileMapper.insertActorFile(actorFile);
				if(row2 == 1) {
					// 물리적 파일 저장
					try {
						mf.transferTo(new File(path + filename + "." + ext));
					} catch (Exception e) {
						e.printStackTrace();
						// 예외 발생하고 예외처리 하지 않아야지 @Transactional 작동한다
						// so... RuntimeException을 인위적으로 발생
						// -> try에서 작동하는 예외 말고 다른 예외를 인위적으로 발생시켜서 알림
						throw new RuntimeException(); 
					}
				}
			}
		}		
	}
}
