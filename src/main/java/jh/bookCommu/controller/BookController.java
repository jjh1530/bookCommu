package jh.bookCommu.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import jh.bookCommu.mapper.BookMapper;
import jh.bookCommu.vo.BookApiVO;
import jh.bookCommu.vo.BookReplyVO;

@Controller
public class BookController {

	@Autowired
	BookMapper bookMapper;
	
	@RequestMapping("/")
	public String main() {
		
		return "main";
	}
	
	@RequestMapping(value="bookDetail.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String bookDetail(BookApiVO vo,HttpServletRequest request, HttpServletResponse response) throws Exception {
		vo.setTitle(vo.getTitle().substring(1,vo.getTitle().length()-1));
		vo.setContents(vo.getContents().substring(1, vo.getContents().length()-1));
		vo.setIsbn(vo.getIsbn().substring(1,vo.getIsbn().length()-1));
		int result =bookMapper.isTitle(vo.getTitle());
		if (result ==0) {
			bookMapper.bookInsert(vo);
		}
		
		int idx = bookMapper.getIdx(vo.getTitle());
		
		return String.valueOf(idx);
	}
	
	@RequestMapping(value="bookInsert",  produces = "application/text; charset=utf8")
	public String bookInsert(BookApiVO vo,HttpServletRequest request,RedirectAttributes re,Model model) {
		String idx = request.getParameter("idx");
		re.addFlashAttribute("idx",idx);

		return "detail.do";
	}
	
	
	@RequestMapping(value="detail.do" )
	public String detail(BookApiVO vo,HttpServletRequest request,Model model,RedirectAttributes re) {
		String idx = request.getParameter("idx");
		List<BookApiVO> list =bookMapper.getBook(Integer.parseInt(idx));
		String title = bookMapper.getReplyTitle(Integer.parseInt(idx));
		List<BookApiVO> replyList =bookMapper.getReply(title);
		
		
		model.addAttribute("list",list);
		model.addAttribute("replyList",replyList);
		re.addAttribute("idx", idx);
		return "detail";
	}
	
	@RequestMapping(value="replyInsert.do")
	public String replyInsert(BookReplyVO vo, RedirectAttributes re) throws Exception {
		System.out.println(vo.getTitle()+"@@");
		System.out.println(vo.getIdx()+"@@");
		re.addAttribute("idx",vo.getIdx());
		bookMapper.replyInsert(vo);
		return "redirect:detail.do";
	}
}
