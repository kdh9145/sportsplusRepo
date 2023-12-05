package com.sportsplus.app.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.sportsplus.app.domain.News;
import com.sportsplus.app.domain.Reply;

public interface NewsService {
	public abstract void writeArticle(News n);
	public abstract void updateArticle(News n);
	public abstract void deleteArticle(int no);
	public abstract Map<String, Object> getNewsList(String cat, int pageNum, String keyword, String view, String type);
	public abstract News getNews(int no);
	public abstract void incrementReadCount(int no);
	public abstract Map<String, Integer> increamentLikeHate(int no, String func);
	public abstract List<News> getMainNews();
	public abstract List<Reply> getReplyList(int no);
	public abstract void addReply(Reply r);
	public abstract void updateReply(Reply r);
	public abstract void deleteReply(Reply r);
	public void crawlingNews()throws IOException;
	public int getArticleCount(String cat);
}
