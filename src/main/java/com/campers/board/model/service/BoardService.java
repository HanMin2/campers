package com.campers.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.campers.board.model.vo.FreeBoard;
import com.campers.board.model.vo.Reply;
import com.campers.board.model.vo.ReviewBoard;
import com.kh.mvc.common.util.PageInfo;

public interface BoardService {
	
	// Free Board
	List<FreeBoard> getFreeBoardList(PageInfo pageInfo, Map<String, String> param);

	int getFreeBoardCount(Map<String, String> param);
	
	FreeBoard findByFreeNo(String boardNo);

	int saveFreeBoard(FreeBoard freeBoard);
	
	int updateFreeBoard(FreeBoard freeBoard);

	int deleteFreeBoard(String boardNo);

	int countFreebyId(String writerId);
	
	List<FreeBoard> getFreeById(String writerId);

	
	// Review Board
	
	List<ReviewBoard> getReviewBoardList(PageInfo pageInfo, Map<String, String> param);

	int getReviewBoardCount(Map<String, String> param);
	
	ReviewBoard findByReviewNo(String boardNo);

	int saveReviewBoard(ReviewBoard reviewBoard);
	
	int updateReviewBoard(ReviewBoard reviewBoard);
	
	int deleteReviewBoard(String boardNo);

	int countReviewbyId(String writerId);
	
	List<ReviewBoard> getReviewById(String writerId);
	
	// File
	
	String saveFile(MultipartFile upfile, String savePath);

	void deleteFile(String filePath);

	
	// Reply
	
	List<Reply> findReplyListByNo(String boardNo);
	
	int saveReply(Reply reply);

	int deleteReply(String no);

	int countReplybyId(String writerId);
}
