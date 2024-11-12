package com.example.sakila.vo;

import lombok.Data;

@Data
public class ActorFile {
	private Integer actorFileId; // PK
	private Integer actorId; // FK 
	private String originname;
	private String filename;
	private String ext;
	private String type;
	private Long size;
	private String createDate;
}
