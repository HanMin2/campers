package com.campers.board.model.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.campers.board.model.mapper.BoardMapper;
import com.campers.board.model.vo.FreeBoard;
import com.campers.board.model.vo.Reply;
import com.campers.board.model.vo.ReviewBoard;
import com.kh.mvc.common.util.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	// 자유게시판 리스트 출력(검색 가능)
	@Override
	public List<FreeBoard> getFreeBoardList(PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		Map<String, String> searchMap = new HashMap<String, String>();
		String searchValue = param.get("searchValue");
		if (searchValue != null && searchValue.length() > 0) {
			String type = param.get("searchType");
			if (type.equals("title")) {
				searchMap.put("titleKeyword", searchValue);
			}
			else if (type.equals("content")) {
				searchMap.put("contentKeyword", searchValue);
			}
			else if(type.equals("writer")) {
				searchMap.put("writerKeyword", searchValue);
			}
		}

		return mapper.selectFreeBoardList(rowBounds, searchMap);
	}

	@Override
	public int getFreeBoardCount(Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		String searchValue = param.get("searchValue");
		System.out.println("searchValue : " + searchValue);
		if (searchValue != null && searchValue.length() > 0) {
			String type = param.get("searchType");
			if (type.equals("title")) {
				searchMap.put("titleKeyword", searchValue);
			}
			else if (type.equals("content")) {
				searchMap.put("contentKeyword", searchValue);
			}
			else if(type.equals("writer")) {
				searchMap.put("writerKeyword", searchValue);
			}
		}
		System.out.println(searchMap);
		return mapper.selectFreeBoardCount(searchMap);
	}


	@Override
	@Transactional(rollbackFor = Exception.class)
	public FreeBoard findByFreeNo(String boardNo) {
		FreeBoard freeBoard = mapper.selectFreeBoardByNo(boardNo);
		freeBoard.setReadCount(freeBoard.getReadCount() + 1);
		mapper.updateReadCountFreeBoard(freeBoard);
		return freeBoard;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int saveFreeBoard(FreeBoard freeBoard) {
		int result = 0;

		result = mapper.insertFreeBoard(freeBoard);

		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateFreeBoard(FreeBoard freeBoard) {
		int result = 0;

		result = mapper.updateFreeBoard(freeBoard);
		
		return result;
	}


	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteFreeBoard(String no) {
		FreeBoard freeBoard = mapper.selectFreeBoardByNo(no);
		
		System.out.println(freeBoard.toString());
		
		try {
			File file = new File(freeBoard.getRenameFilename());
			if (file.exists()) {
				file.delete();
			}
		} catch (Exception e) {}
		return mapper.deleteFreeBoard(no);
	}

	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int countFreebyId(String writerId) {
		return mapper.selectFreeCountById(writerId);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<FreeBoard> getFreeById(String writerId) {
		
		return mapper.selectFreeById(writerId);
	}


	// 후기게시판 리스트 출력(검색 가능)
	@Override
	public List<ReviewBoard> getReviewBoardList(PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		Map<String, String> searchMap = new HashMap<String, String>();
		String searchValue = param.get("searchValue");
		if (searchValue != null && searchValue.length() > 0) {
			String type = param.get("searchType");
			if (type.equals("title")) {
				searchMap.put("titleKeyword", searchValue);
			}
			else if (type.equals("content")) {
				searchMap.put("contentKeyword", searchValue);
			}
			else if(type.equals("writer")) {
				searchMap.put("writerKeyword", searchValue);
			}
		}

		return mapper.selectReviewBoardList(rowBounds, searchMap);
	}

	@Override
	public int getReviewBoardCount(Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		
		String searchValue = param.get("searchValue");
		System.out.println("searchValue : " + searchValue);
		
		if (searchValue != null && searchValue.length() > 0) {
			String type = param.get("searchType");
			if (type.equals("title")) {
				searchMap.put("titleKeyword", searchValue);
			}
			else if (type.equals("content")) {
				searchMap.put("contentKeyword", searchValue);
			}
			else if(type.equals("writer")) {
				searchMap.put("writerKeyword", searchValue);
			}
		}
		
		System.out.println(searchMap);
		
		return mapper.selectReviewBoardCount(searchMap);
	}


	@Override
	@Transactional(rollbackFor = Exception.class)
	public ReviewBoard findByReviewNo(String boardNo) {
		ReviewBoard reviewBoard = mapper.selectReviewBoardByNo(boardNo);
		reviewBoard.setReadCount(reviewBoard.getReadCount() + 1);
		mapper.updateReadCountReviewBoard(reviewBoard);
		return reviewBoard;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int saveReviewBoard(ReviewBoard reviewBoard) {
		int result = 0;

		result = mapper.insertReviewBoard(reviewBoard);

		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateReviewBoard(ReviewBoard reviewBoard) {
		int result = 0;

		result = mapper.updateReviewBoard(reviewBoard);
		
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteReviewBoard(String no) {
		ReviewBoard reviewBoard = mapper.selectReviewBoardByNo(no);
		try {
			File file = new File(reviewBoard.getRenameFilename());
			if (file.exists()) {
				file.delete();
			}
		} catch (Exception e) {}
		return mapper.deleteReviewBoard(no);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int countReviewbyId(String writerId) {
		return mapper.selectReviewCountById(writerId);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<ReviewBoard> getReviewById(String writerId) {
		
		return mapper.selectReviewById(writerId);
	}


	// File

	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		// 저장 경로의 폴더 생성부
		File folder = new File(savePath);

		if (folder.exists() == false) {
			folder.mkdirs();
		}

		System.out.println("savePath : " + savePath);

		String originalFileName = upfile.getOriginalFilename();
		String reNameFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"))
				+ originalFileName.substring(originalFileName.lastIndexOf("."));
		String reNamePath = savePath + "/" + reNameFileName;

		// 업로드 된 파일 이름을 바꾸고, 실제 디스크에 저장하는 코드부
		try {
			upfile.transferTo(new File(reNamePath));
		} catch (Exception e) {
			return null;
		}

		return reNameFileName;
	}

	public void deleteFile(String filePath) {
		File file = new File(filePath);
		if (file.exists()) {
			file.delete();
		}
	}


	// Reply

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Reply> findReplyListByNo(String boardNo) {
		List<Reply> list = mapper.selectReplyListByNo(boardNo);
		return list;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int saveReply(Reply reply) {
		return mapper.insertReply(reply);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteReply(String no) {
		return mapper.deleteReply(no);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int countReplybyId(String writerId) {
		return mapper.selectReplyCountById(writerId);
	}


}
