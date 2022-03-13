package com.campers.board.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.campers.board.model.vo.FreeBoard;
import com.campers.board.model.vo.ReviewBoard;
import com.campers.board.model.vo.Reply;


@Mapper
public interface BoardMapper {

	// free board
	// paging 처리를 위한 RowBounds 셋팅!
	
	
	List<FreeBoard> selectFreeBoardList(RowBounds rowBounds, Map<String, String> map);

	int selectFreeBoardCount(Map<String, String> map);

	FreeBoard selectFreeBoardByNo(String boardNo);
	
	int updateReadCountFreeBoard(FreeBoard freeBoard);

	int insertFreeBoard(FreeBoard freeBoard);
	
	int updateFreeBoard(FreeBoard freeBoard);
	
	int deleteFreeBoard(String boardNo);

	int selectFreeCountById(String writerId);
	
	List<FreeBoard> selectFreeById(String writerId);
	
	
	// review board
	// paging 처리를 위한 RowBounds 셋팅!
	
	
	List<ReviewBoard> selectReviewBoardList(RowBounds rowBounds, Map<String, String> map);
	
	int selectReviewBoardCount(Map<String, String> map);
	
	ReviewBoard selectReviewBoardByNo(String boardNo);
	
	int updateReadCountReviewBoard(ReviewBoard reviewBoard);
	
	int insertReviewBoard(ReviewBoard reviewBoard);
	
	int updateReviewBoard(ReviewBoard reviewBoard);
	
	int deleteReviewBoard(String boardNo);

	int selectReviewCountById(String writerId);
	
	List<ReviewBoard> selectReviewById(String writerId);
	
	// reply
	
	List<Reply> selectReplyListByNo(String boardNo);
	
	int insertReply(Reply reply);
	
	int deleteReply(String no);

	int selectReplyCountById(String writerId);

}
