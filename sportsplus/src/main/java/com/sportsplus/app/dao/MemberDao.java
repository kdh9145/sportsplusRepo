package com.sportsplus.app.dao;

import com.sportsplus.app.domain.Member;

public interface MemberDao {
	
	public abstract void addMember(Member m);
	
	public abstract Member getMember(String id);
	
	public abstract void updateMember(Member m);
	
	public abstract Member idFind(Member m);
}
