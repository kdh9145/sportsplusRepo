package com.sportsplus.app.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sportsplus.app.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	private static final String NAME_SPACE = "com.sportsplus.app.mapper.MemberMapper";
	
	private SqlSessionTemplate sqlSession;
	@Autowired
	public MemberDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addMember(Member m) {
		sqlSession.insert(NAME_SPACE + ".addMember", m);
	}

	@Override
	public Member getMember(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getMember", id);
	}

	@Override
	public void updateMember(Member m) {
		sqlSession.update(NAME_SPACE + ".updateMember", m);
	}

	@Override
	public Member idFind(Member m) {
		return sqlSession.selectOne(NAME_SPACE + ".idFind", m);
	}

}
