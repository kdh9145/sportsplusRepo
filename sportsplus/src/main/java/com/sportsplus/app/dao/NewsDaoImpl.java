package com.sportsplus.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sportsplus.app.domain.News;
import com.sportsplus.app.domain.Reply;

@Repository
public class NewsDaoImpl implements NewsDao{

	private static final String NEWSMAPPER = "com.sportsplus.app.mapper.NewsMapper";
	private static final String REPLYMAPPER = "com.sportsplus.app.mapper.ReplyMapper";
	private SqlSessionTemplate sqlSession;
	@Autowired
	public NewsDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void writeArticle(News n) {
		sqlSession.insert(NEWSMAPPER + ".writeArticle", n);
	}

	@Override
	public List<News> getNewsList(String cat, int start, int end, String keyword, String type) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("cat", cat);
		paramMap.put("start", start);
		paramMap.put("end", end);
		paramMap.put("keyword", keyword);
		paramMap.put("type", type);
		return sqlSession.selectList(NEWSMAPPER + ".getNewsList", paramMap);
		
	}

	@Override
	public News getNews(int no) {
		return sqlSession.selectOne(NEWSMAPPER + ".getNews", no);
	}

	@Override
	public void updateArticle(News n) {
		sqlSession.update(NEWSMAPPER + ".updateArticle", n);
	}

	@Override
	public void deleteArticle(int no) {
		sqlSession.delete(NEWSMAPPER + ".deleteArticle", no);
	}

	@Override
	public int getNewsCount(String cat) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("cat", cat);
		return sqlSession.selectOne(NEWSMAPPER+".getNewsCount", paramMap);
	}

	@Override
	public void incrementReadCount(int no) {
		sqlSession.update(NEWSMAPPER + ".incrementReadCount", no);
	}

	@Override
	public void increamentLikeHate(int no, String func) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("no", no);
		paramMap.put("func", func);
		sqlSession.update(NEWSMAPPER + ".incrementLikeHate", paramMap);
	}

	@Override
	public News getLikeHateCount(int no) {
		return sqlSession.selectOne(NEWSMAPPER + ".getLikeHateCount", no);
	}

	@Override
	public List<News> getMainNews() {
		return sqlSession.selectList(NEWSMAPPER + ".getMainNews");
	}

	@Override
	public List<Reply> getReplyList(int no) {
		return sqlSession.selectList(REPLYMAPPER + ".getReplyList", no);
	}

	@Override
	public void addReply(Reply r) {
		sqlSession.insert(REPLYMAPPER + ".addReply", r);
	}

	@Override
	public void updateReply(Reply r) {
		sqlSession.update(REPLYMAPPER + ".updateReply", r);
	}

	@Override
	public void deleteReply(Reply r) {
		sqlSession.delete(REPLYMAPPER + ".deleteReply", r);
	}

}
