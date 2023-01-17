package jh.bookCommu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jh.bookCommu.mapper.BoardMapper;
import jh.bookCommu.vo.BoardVO;


@Controller
public class BoardController {

	@Autowired
	BoardMapper boardMapper;
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		List<BoardVO> list=boardMapper.getLists();
		model.addAttribute("list", list);
		return "boardList"; // /WEB-INF/views/boardList.jsp -> forward
	}	
	
}
