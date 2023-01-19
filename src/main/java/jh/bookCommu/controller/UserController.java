package jh.bookCommu.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jh.bookCommu.Service.KaKaoService;
import jh.bookCommu.mapper.UserMapper;
import jh.bookCommu.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	UserMapper userMapper;
	
	
	@RequestMapping(value="/loginForm.do")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping(value="/userLogin.do")
	@ResponseBody
	public int userLogin(UserVO vo,HttpSession session) throws Exception {
		int result = userMapper.userLogin(vo);
		UserVO uvo = userMapper.user(vo);
		if (uvo!=null) {
			session.setAttribute("sessionUserID", vo.getUserid());
			session.setMaxInactiveInterval(1800);
		}
		return result;
	}
	
	@RequestMapping(value="/registerForm.do")
	public String registerForm() {
		return "registerForm";
	}
	
	@RequestMapping(value="registerCheck.do")
	@ResponseBody
	public String registerCheck(String userid,UserVO vo) throws Exception {
		String message = "";
		int result = userMapper.registerCheck(userid);
		if (result == 0 ) {
			message ="ok";
		}
		return message;
	}
	
	@RequestMapping(value="register.do")
	@ResponseBody
	public String register(UserVO vo) throws Exception {
		String message = "";
		int result = userMapper.register(vo);
		if (result == 1) {
			message ="ok";
		}
		return message;
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/kakaoLoginForm.do")
	public String kakaoLoginForm(Model model, HttpServletRequest request) {
		
		return "loginForm";
	}
	
	@RequestMapping(value="/kakaoLogin.do")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session
						,Model model,UserVO vo) throws Exception{
		KaKaoService kakao = new KaKaoService();
	    String access_Token = kakao.getAccessToken(code);
        
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("kakaoEmail", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }
       
        model.addAttribute("kakaoEmail",  userInfo.get("email"));
		
		vo.setUserid((String) userInfo.get("email"));
		UserVO uvo = userMapper.user(vo);
		if (uvo != null) {
			return "redirect:loginForm.do";
		}else {
			return "kakaoRegisterForm";
		}
	}
	
}
