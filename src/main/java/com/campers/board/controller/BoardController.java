package com.campers.board.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.campers.board.model.service.BoardService;
import com.campers.board.model.vo.FreeBoard;
import com.campers.board.model.vo.Reply;
import com.campers.board.model.vo.ReviewBoard;
import com.campers.user.model.vo.User;
import com.kh.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/boards")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;

	@Autowired
	private ResourceLoader resourceLoader; // 파일 다운로드 기능시 활용하는 loader
	
	@GetMapping("/freeList")
	public ModelAndView freeList(ModelAndView model, @RequestParam Map<String, String> param) {
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		PageInfo pageInfo = new PageInfo(page, 10, service.getFreeBoardCount(param), 10);
		List<FreeBoard> freeList = service.getFreeBoardList(pageInfo, param);

		model.addObject("freeList", freeList);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/boards/freeList");
		
		return model;
	}
	
	@GetMapping("/freeView")
	public ModelAndView freeView(ModelAndView model, String no) {
		FreeBoard freeBoard = service.findByFreeNo(no);
		List<Reply> replyList = service.findReplyListByNo(no);
		
		System.out.println(freeBoard);
		for(int i = 0; i < replyList.size(); i++ ) {			
			System.out.println(replyList.get(i));
		}
		
		
		model.addObject("freeBoard", freeBoard);
		model.addObject("replyList", replyList);
		model.setViewName("/boards/freeView");

		return model;
	}
	
	
	@GetMapping("/freeWrite")
	public String freeWriteView() {
		log.info("게시글 작성 요청페이지");
		
		return "boards/freeWrite"; 
	}
	
	@PostMapping("/freeWrite")
	public ModelAndView freeWrite(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginUser", required = false) User loginUser, 
			@ModelAttribute FreeBoard freeBoard,
			@RequestParam("upfile") MultipartFile upfile
			) {
		log.info("게시글 작성 요청");

		if (loginUser.getUserId().equals(freeBoard.getWriterId()) == false) {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
			return model;
		}
		
		freeBoard.setWriterId(loginUser.getUserId());
		
		if(upfile != null && upfile.isEmpty() == false) {
			// 파일을 저장하는 로직
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/board";
			String renameFileName = service.saveFile(upfile, savePath); // 실제 파일 저장하는 코드

			System.out.println("savePath : " + savePath);
			
			if (renameFileName != null) {
				freeBoard.setOriginalFilename(upfile.getOriginalFilename());
				freeBoard.setRenameFilename(renameFileName);
			}
		}
		
		System.out.println(freeBoard);

		int result = service.saveFreeBoard(freeBoard);

		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/boards/freeList");
		} else {
			model.addObject("msg", "게시글이 등록을 실패하였습니다.");
			model.addObject("location", "/boards/freeList");
		}

		model.setViewName("/common/msg");
		
		return model;
	}
	
	@RequestMapping("/freeDelete")
	public ModelAndView deleteFreeBoard(ModelAndView model,
			@SessionAttribute(name = "loginUser", required = false) User loginUser, 
			@RequestParam("no") String boardNo) {
		log.info("글 삭제 요청");
		
		System.out.println("board no : " + boardNo);
		int result = service.deleteFreeBoard(boardNo);
		
		if (result > 0) {
			model.addObject("msg", "글이 삭제되었습니다.");
			model.addObject("location", "/boards/freeList");
		} else {
			model.addObject("msg", "글 삭제에 실패하였습니다.");
			model.addObject("location", "/boards/freeList");
		}
		model.setViewName("/common/msg");
		
		return model;
	}
	
	@GetMapping("/freeUpdate")
	public ModelAndView updateFreeView(ModelAndView model,
			@SessionAttribute(name = "loginUser", required = false) User loginUser,
			@RequestParam("no") String boardNo) {

		FreeBoard freeBoard = service.findByFreeNo(boardNo);

		if (loginUser.getUserId().equals(freeBoard.getWriterId()) == true) {
			model.addObject("freeBoard", freeBoard);
			model.setViewName("boards/freeUpdate");
		} else {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/boards/freeList");
			model.setViewName("/common/msg");
		}

		return model;
	}
	
	@PostMapping("/freeUpdate")
	public ModelAndView updateFree(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginUser", required = false) User loginUser, 
			@ModelAttribute FreeBoard freeBoard,
			@RequestParam("reloadFile") MultipartFile reloadFile) {

		log.info("게시글 업데이트 요청");

		if (loginUser.getUserId().equals(freeBoard.getWriterId()) == false) {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/boards/freeList");
			model.setViewName("/common/msg");
			return model;
		}

		if (reloadFile != null && reloadFile.isEmpty() == false) {
			// 파일 저장하는 로직 구성
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/board";
			
			if(freeBoard.getRenameFilename() != null) {
				service.deleteFile(savePath+"/"+freeBoard.getRenameFilename());
			}
			
			String renameFileName = service.saveFile(reloadFile, savePath); // 실제 파일 저장하는 코드

			if (renameFileName != null) {
				freeBoard.setOriginalFilename(reloadFile.getOriginalFilename());
				freeBoard.setRenameFilename(renameFileName);
			}
		}

		System.out.println(freeBoard);

		int result = service.updateFreeBoard(freeBoard);

		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
			model.addObject("location", "/boards/freeView?no=" + freeBoard.getNo());
		} else {
			model.addObject("msg", "게시글이 수정에 실패하였습니다.");
			model.addObject("location", "/boards/freeUpdate?no=" + freeBoard.getNo());
		}

		model.setViewName("/common/msg");

		return model;
	}
	
	@PostMapping("/freeReply")
	public ModelAndView writeFreeReply(ModelAndView model,
			@SessionAttribute(name = "loginUser", required = false) User loginUser, 
			@ModelAttribute Reply reply
			) {
		log.info("리플 작성 요청");
		
		reply.setWriterId(loginUser.getUserId());
		
		int result = service.saveReply(reply);
		
		if (result > 0) {
			FreeBoard freeBoard = service.findByFreeNo(reply.getBoardNo());
			List<Reply> replyList = service.findReplyListByNo(reply.getBoardNo());
			System.out.println(freeBoard);
			model.addObject("freeBoard", freeBoard);
			model.addObject("replyList", replyList);
			model.setViewName("boards/freeView");
		} else {
			model.addObject("msg", "댓글이 등록을 실패하였습니다.");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
		}
		
		return model;
	}
	
	@RequestMapping("/freeReplydel")
	public ModelAndView deleteFreeReply(ModelAndView model,
			@SessionAttribute(name = "loginUser", required = false) User loginUser, 
			@RequestParam("no") String replyNo) {
		log.info("리플 삭제 요청");
		
		int result = service.deleteReply(replyNo);
			
		if (result > 0) {
			model.addObject("msg", "댓글이 삭제되었습니다.");
			model.addObject("location", "/boards/freeList");
		} else {
			model.addObject("msg", "댓글이 등록을 실패하였습니다.");
			model.addObject("location", "/boards/freeList");
		}
		model.setViewName("/common/msg");
		
		return model;
	}
	
	
	
	
	
	@GetMapping("/reviewList")
	public ModelAndView reviewList(ModelAndView model, 
			@RequestParam Map<String, String> param) {
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		PageInfo pageInfo = new PageInfo(page, 12, service.getReviewBoardCount(param), 12);
		List<ReviewBoard> reviewList = service.getReviewBoardList(pageInfo, param);

		String savePath2 = "/upload/board";
		
		model.addObject("savePath2", savePath2);
		model.addObject("reviewList", reviewList);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/boards/reviewList");
		
		return model;
	}
	
	@GetMapping("/reviewView")
	public ModelAndView reviewView(ModelAndView model, String no) {
		ReviewBoard reviewBoard = service.findByReviewNo(no);
		List<Reply> replyList = service.findReplyListByNo(no);
		
		System.out.println(reviewBoard);
		for(int i = 0; i < replyList.size(); i++ ) {			
			System.out.println(replyList.get(i));
		}
		
		model.addObject("reviewBoard", reviewBoard);
		model.addObject("replyList", replyList);
		model.setViewName("/boards/reviewView");

		return model;
	}
	
	
	@GetMapping("/reviewWrite")
	public void writeView() {
		log.info("게시글 작성 요청페이지");
		// return "board/write"; 
	}
	
	@PostMapping("/reviewWrite")
	public ModelAndView write(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginUser", required = false) User loginUser, 
			@ModelAttribute ReviewBoard reviewBoard,
			@RequestParam("upfile") MultipartFile upfile,
			@RequestParam("image") MultipartFile image
			) {
		log.info("게시글 작성 요청");

		if (loginUser.getUserId().equals(reviewBoard.getWriterId()) == false) {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
			return model;
		}
		
		System.out.println("image : " + image);

		reviewBoard.setWriterId(loginUser.getUserId());
		
		if(upfile != null && upfile.isEmpty() == false) {
			// 파일을 저장하는 로직
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/board";
			String renameFilename = service.saveFile(upfile, savePath); // 실제 파일 저장하는 코드

			if (renameFilename != null) {
				reviewBoard.setOriginalFilename(upfile.getOriginalFilename());
				reviewBoard.setRenameFilename(renameFilename);
			}
		}
		
		if(image != null && image.isEmpty() == false) {
			// 파일을 저장하는 로직
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/board";
			String renameImage = service.saveFile(image, savePath); // 실제 파일 저장하는 코드

			if (renameImage != null) {
				reviewBoard.setMainImage(image.getOriginalFilename());
				reviewBoard.setRenameImage(renameImage);
			}
		}
		
		System.out.println(reviewBoard);

		int result = service.saveReviewBoard(reviewBoard);

		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/boards/reviewList");
		} else {
			model.addObject("msg", "게시글이 등록을 실패하였습니다.");
			model.addObject("location", "/boards/reviewList");
		}

		model.setViewName("/common/msg");
		
		return model;
	}
	
	@RequestMapping("/reviewDelete")
	public ModelAndView deleteReviewBoard(ModelAndView model,
			@SessionAttribute(name = "loginUser", required = false) User loginUser, 
			@RequestParam("no") String boardNo) {
		log.info("글 삭제 요청");
		
		int result = service.deleteReviewBoard(boardNo);
		
		if (result > 0) {
			model.addObject("msg", "글이 삭제되었습니다.");
			model.addObject("location", "/boards/reviewList");
		} else {
			model.addObject("msg", "글 삭제에 실패하였습니다.");
			model.addObject("location", "/boards/reviewList");
		}
		model.setViewName("/common/msg");
		
		return model;
	}
	
	@GetMapping("/reviewUpdate")
	public ModelAndView updateView(ModelAndView model,
			@SessionAttribute(name = "loginUser", required = false) User loginUser,
			@RequestParam("no") String boardNo) {

		ReviewBoard reviewBoard = service.findByReviewNo(boardNo);

		if (loginUser.getUserId().equals(reviewBoard.getWriterId()) == true) {
			model.addObject("reviewBoard", reviewBoard);
			model.setViewName("boards/reviewUpdate");
		} else {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/boards/reviewList");
			model.setViewName("/common/msg");
		}

		return model;
	}
	
	@PostMapping("/reviewUpdate")
	public ModelAndView update(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginUser", required = false) User loginUser, 
			@ModelAttribute ReviewBoard reviewBoard,
			@RequestParam("reloadFile") MultipartFile reloadFile,
			@RequestParam("reloadImage") MultipartFile reloadImage) {

		log.info("게시글 업데이트 요청");

		if (loginUser.getUserId().equals(reviewBoard.getWriterId()) == false) {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/boards/reviewList");
			model.setViewName("/common/msg");
			return model;
		}

		if (reloadFile != null && reloadFile.isEmpty() == false) {
			// 파일 저장하는 로직 구성
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/board";
			
			if(reviewBoard.getRenameFilename() != null) {
				service.deleteFile(savePath+"/"+reviewBoard.getRenameFilename());
			}
			
			String renameFileName = service.saveFile(reloadFile, savePath); // 실제 파일 저장하는 코드

			if (renameFileName != null) {
				reviewBoard.setOriginalFilename(reloadFile.getOriginalFilename());
				reviewBoard.setRenameFilename(renameFileName);
			}
		}
		
		if (reloadImage != null && reloadImage.isEmpty() == false) {
			// 파일 저장하는 로직 구성
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/board";
			
			if(reviewBoard.getRenameImage() != null) {
				service.deleteFile(savePath+"/"+reviewBoard.getRenameImage());
			}
			
			String renameImage = service.saveFile(reloadImage, savePath); // 실제 파일 저장하는 코드
			
			if (renameImage != null) {
				reviewBoard.setMainImage(reloadImage.getOriginalFilename());
				reviewBoard.setRenameImage(renameImage);
			}
		}

		System.out.println(reviewBoard);

		int result = service.updateReviewBoard(reviewBoard);

		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
			model.addObject("location", "/boards/reviewView?no=" + reviewBoard.getNo());
		} else {
			model.addObject("msg", "게시글이 수정에 실패하였습니다.");
			model.addObject("location", "/boards/reviewUpdate?no=" + reviewBoard.getNo());
		}

		model.setViewName("/common/msg");

		return model;
	}
	
	@PostMapping("/reviewReply")
	public ModelAndView writeReviewReply(ModelAndView model,
			@SessionAttribute(name = "loginUser", required = false) User loginUser, 
			@ModelAttribute Reply reply
			) {
		log.info("리플 작성 요청");
		
		reply.setWriterId(loginUser.getUserId());
		
		int result = service.saveReply(reply);
		
		System.out.println(reply);

		
		if (result > 0) {
			ReviewBoard reviewBoard = service.findByReviewNo(reply.getBoardNo());
			List<Reply> replyList = service.findReplyListByNo(reply.getBoardNo());
			System.out.println(reviewBoard);
			model.addObject("reviewBoard", reviewBoard);
			model.addObject("replyList", replyList);
			model.setViewName("boards/reviewView");
		} else {
			model.addObject("msg", "댓글이 등록을 실패하였습니다.");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
		}
		
		return model;
	}
	
	@RequestMapping("/reviewReplydel")
	public ModelAndView deleteReviewReply(ModelAndView model,
			@SessionAttribute(name = "loginUser", required = false) User loginUser, 
			@RequestParam("no") String replyNo) {
		log.info("리플 삭제 요청");
		
		int result = service.deleteReply(replyNo);
			
		if (result > 0) {
			model.addObject("msg", "댓글이 삭제되었습니다.");
			model.addObject("location", "/boards/reviewList");
		} else {
			model.addObject("msg", "댓글 삭제를 실패하였습니다.");
			model.addObject("location", "/boards/reviewList");
		}
		model.setViewName("/common/msg");
		
		return model;
	}
	
	
	
	
	@GetMapping("/fileDown")
	public ResponseEntity<Resource>	fileDown(
			@RequestParam("oriname") String oriname, 
			@RequestParam("rename") String rename,
			@RequestHeader(name = "user-agent")String header){
		
		try {
			Resource resource = resourceLoader.getResource("resources/upload/board/" + rename);
			String downName = null;
			
			// 인터넷 익스플로러 인 경우
			boolean isMSIE = header.indexOf("MSIE") != -1 || header.indexOf("Trident") != -1;

			if (isMSIE) { // 익스플로러 처리하는 방법
				downName = URLEncoder.encode(oriname, "UTF-8").replaceAll("\\+", "%20");
			} else {    		
				downName = new String(oriname.getBytes("UTF-8"), "ISO-8859-1"); // 크롬
			}
			
			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + downName + "\"")
					.header(HttpHeaders.CONTENT_LENGTH, String.valueOf(resource.contentLength()))
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString())
					.body(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 실패했을 경우!
	}

}
