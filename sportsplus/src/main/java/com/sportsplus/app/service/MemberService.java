package com.sportsplus.app.service;

import com.sportsplus.app.domain.Member;

public interface MemberService {

	public abstract void addMember(Member m);
	
	public abstract int loginProcess(String id, String pass);
	
	public abstract Member getMember(String id);
	
	public abstract void updateMember(Member m, String newPass);
	
	public abstract boolean passCheck(Member m);
	
	public abstract Member idFind(Member m);
	
	public void sendFindPassEmail(Member m);
}
