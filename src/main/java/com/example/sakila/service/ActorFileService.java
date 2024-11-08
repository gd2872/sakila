package com.example.sakila.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;
import com.example.sakila.vo.Film;
@Service
@Transactional
public class ActorFileService {
	@Autowired ActorFileMapper actorFileMapper;
	
	// 배우 상세 -> 이미지파일 삭제 /on/removeActorFile
	// 1) actor_file 삭제 2) 물리 파일 삭제(이름 필요, 경로 PATH 필요)
	public void removeActorFile(int actorFileId, String path) {
		// 1) 파일이름 select
		ActorFile actorFile = actorFileMapper.selectActorFileOne(actorFileId);
		int row = actorFileMapper.deleteActorFile(actorFileId); // 삭제할 파일 
		if(row == 1) { // actor_file 정보가 삭제 되었다면 물리적 파일도 삭제
			// 파일 이름
			String fullname = path + actorFile.getFilename() + "." + actorFile.getExt(); 
			File f = new File(fullname); // 없으면 새로 만들고 있으면 그 파일 연결
			f.delete();
		}
	}
	
	// 배우상세 : 파일 추가 입력 /on/addActorFile
	public void addActorFile(ActorForm actorForm, String path) {
		// actorId = 0
		if(actorForm.getActorFile() != null) {
			// 파일 입력, ActorFile 입력
			List<MultipartFile> list = actorForm.getActorFile();
			for(MultipartFile mf : list) {
				ActorFile actorFile = new ActorFile();
				
				actorFile.setActorId(actorForm.getActorId());
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
	
	// 출연작품 리스트 /on/actorOne
	public List<ActorFile> getFilmTitleListByActor(int ActorId) {
		return actorFileMapper.selectActorFileListByActor(ActorId);
	}
}
