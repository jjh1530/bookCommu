package jh.bookCommu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookController {

	@RequestMapping("/")
	public String main() {
		
		return "main";
	}
	
	@RequestMapping(value="bookDetail.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String bookDetail(String title,String contents) throws Exception {
		title = title.substring(1,title.length()-1);
		contents = contents.substring(1, contents.length()-1);
		String data = title +"btf" +contents;
		return data;
	}
	
	@RequestMapping(value="detail.do")
	public String detail(HttpServletRequest request ,Model model) {
		String data = request.getParameter("title");
		String[] arr = data.split("btf");
		String title = arr[0];
		String contents = arr[1];
		model.addAttribute("title", title);
		model.addAttribute("contents", contents);
		return "detail";
	}
}
