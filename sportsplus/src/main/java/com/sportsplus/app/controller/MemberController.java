package com.sportsplus.app.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sportsplus.app.domain.Member;
import com.sportsplus.app.service.MemberService;

@Controller
public class MemberController {
	
	private MemberService memberService;
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping("login")
	public String login() {
		
		return "/member/loginForm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:newsMain";
	}
	
	@RequestMapping("join")
	public String join() {
		return "/member/joinForm";
	}
	
	
	@RequestMapping("idFind")
	public String idFind() {
		return "/member/idFindForm";
	}
	
	@RequestMapping("memberUpdate")
	public String memberUpdate() {
		return "/member/memberUpdateForm";
	}
	
	@RequestMapping("joinProcess")
	public String joinProcess(Member m) {
		memberService.addMember(m);
		return "redirect:login";
	}
	
	@RequestMapping("loginProcess")
	public String loginProcess(String id, String pass, Model model, HttpServletResponse response, PrintWriter out, HttpSession session) {
		int result = memberService.loginProcess(id, pass);
		
		if(result == -1) {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		else if(result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}		
		session.setAttribute("member", memberService.getMember(id));
		session.setAttribute("isLogin", true);
		return "redirect:newsMain";
	}
	
	@RequestMapping("memberUpdateProcess")
	public String memberUpdateProcess(Member m, @RequestParam(required=false) String newPass, HttpServletResponse response, PrintWriter out) {
		
		boolean result = memberService.passCheck(m);
		
		if(!result) {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>");
			out.println("alert('기존 비밀번호가 일치하지 않습니다');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		
		if(newPass.length() == 0) memberService.updateMember(m, m.getPass());
		else memberService.updateMember(m, newPass);
		
		return "redirect:newsMain";
	}
	
	
	
}
