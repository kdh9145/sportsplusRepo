package com.sportsplus.app.dao;

import java.util.List;
import java.util.Map;

import com.sportsplus.app.domain.News;
import com.sportsplus.app.domain.Reply;

public interface NewsDao {
	public abstract void writeArticle(News n);
	public abstract void updateArticle(News n);
	public abstract void deleteArticle(int no);
	public abstract List<News> getNewsList(String cat, int start, int end, String keyword, String type);
	public abstract News getNews(int no);
	public abstract int getNewsCount(String cat);
	public abstract void incrementReadCount(int no);
	public abstract void increamentLikeHate(int no, String func);
	public abstract News getLikeHateCount(int no);
	public abstract List<News> getMainNews();
	public abstract List<Reply> getReplyList(int no);
	public abstract void addReply(Reply r);
	public abstract void updateReply(Reply r);
	public abstract void deleteReply(Reply r);
}
