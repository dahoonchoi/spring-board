package com.springbook.view.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.h2.engine.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("TITLE", "TITLE");
		conditionMap.put("CONTENT", "CONTENT");
		return conditionMap;
	}

	@RequestMapping(value = "/insertBoard.do")
	public String insertBoard(BoardVO vo) throws IOException {
		System.out.println("글 등록 처리");
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("D:/" + fileName));
		}
		boardService.insertBoard(vo);
		return "getBoardList.do";
	}

	@RequestMapping("/dataTransform.do")
	@ResponseBody
	public List<BoardVO> dataTransform(BoardVO vo) {
		vo.setSearchCondition("TITLE");
		vo.setSearchKeyword("");
		List<BoardVO> boardList = boardService.getBoardList(vo);
		return boardList;
	}

	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		System.out.println("번호: " + vo.getSeq());
		System.out.println("제목: " + vo.getTitle());
		System.out.println("작성자: " + vo.getWriter());
		System.out.println("내용: " + vo.getContent());
		System.out.println("등록: " + vo.getRegDate());
		System.out.println("조회수: " + vo.getCnt());
		boardService.updateBoard(vo);
		return "getBoardList.do";
	}

	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		System.out.println("글 삭제 처리");

		boardService.deleteBoard(vo);
		return "getBoardList.do";

	}

	@RequestMapping("/changeBoard.do")
	public String changeBoard(BoardVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("userName");
		BoardVO boardvo = boardService.getBoard(vo);

		if (username.equals(boardvo.getWriter())) {
			model.addAttribute("board", boardService.getBoard(vo));
			return "updateBoard.jsp";
		} else {
			return "getBoard.jsp";
		}

	}

	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {

		model.addAttribute("board", boardService.getBoard(vo));
		return "getBoard.jsp";
	}

	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {

		System.out.println("글 목록 검색 처리");
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("TITLE");
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		model.addAttribute("boardList", boardService.getBoardList(vo));
		return "getBoardList.jsp";
	}
}
