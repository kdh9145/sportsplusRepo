package com.sportsplus.app.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sportsplus.app.domain.Member;
import com.sportsplus.app.domain.Reply;
import com.sportsplus.app.service.MemberService;

@Controller
public class MemberAjaxController {

	private MemberService memberService;
	@Autowired
	public MemberAjaxController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping("overlapId.ajax")
	@ResponseBody
	public boolean overlapId(String id) {
		boolean result = false;
		Member m = memberService.getMember(id);
		if(m != null) result = true;	
		return result;
	}
	
	@RequestMapping(value="idFind.ajax")
	@ResponseBody
	public Map<String, Object> idFind(Member m){
		
		Map<String, Object> resultMap = new HashMap<>();
		if(memberService.idFind(m) == null) {
			resultMap.put("result", false);
		} else {
			resultMap.put("result", true);
			resultMap.put("member", memberService.idFind(m));
		}
		
		return resultMap;
	}
	
	@RequestMapping("passFind.ajax")
	@ResponseBody
	public Map<String, Object> passFind(Member m) {
		Map<String, Object> resultMap = new HashMap<>();
		if(memberService.idFind(m) == null || !(memberService.idFind(m).getId().equals(m.getId()))) {
			resultMap.put("result", false);
		} else {
			resultMap.put("result", true);
			memberService.sendFindPassEmail(memberService.idFind(m));
		}
		return resultMap;
	}
	
}
