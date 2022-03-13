package com.campers.board.model.vo;

import java.sql.Date;
import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ReviewBoard {
	String no;
	String writerId;
	String title;
	String content;
	String originalFilename;
	String renameFilename;
	Date registDate;
	Date modifyDate;
	int readCount;
	String status;	
	String mainImage;
	String renameImage;
}
