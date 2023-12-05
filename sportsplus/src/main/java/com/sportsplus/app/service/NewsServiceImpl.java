package com.sportsplus.app.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportsplus.app.dao.NewsDao;
import com.sportsplus.app.domain.News;
import com.sportsplus.app.domain.Reply;

@Service
public class NewsServiceImpl implements NewsService{
	
	private NewsDao newsDao;
	@Autowired
	public NewsServiceImpl(NewsDao newsDao) {
		this.newsDao = newsDao;
	}
	
	@Override
	public void writeArticle(News n) {
		newsDao.writeArticle(n);
	}
	
	@Override
	public void updateArticle(News n) {
		newsDao.updateArticle(n);
	}

	@Override
	public Map<String, Object> getNewsList(String cat, int pageNum, String keyword, String view, String type) {
			
		int pageSize = 5;
		if(view.equals("card")) pageSize = 9; 
		if(view.equals("detail")) pageSize = 3; 		
		int pageGroup = 10;
		
		int start = (pageNum - 1) * pageSize;
		int end = pageSize;
		
		int listCount = newsDao.getNewsCount(cat);
		int pageCount = listCount / pageSize + (listCount % pageSize == 0 ? 0 : 1);
		if(pageNum > pageCount) pageNum = pageCount;
		int startPage = (pageNum / pageGroup) * pageGroup + 1 - (pageNum % pageGroup == 0 ? pageGroup : 0);
		int endPage = startPage + pageGroup - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		List<News> newsList = newsDao.getNewsList(cat, start, end, keyword, type);
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("pageNum", pageNum);
		modelMap.put("listCount", listCount);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("pageGroup", pageGroup);
		modelMap.put("newsList", newsList);
		modelMap.put("keyword", keyword);
		
		return modelMap;
	}

	@Override
	public News getNews(int no) {
		return newsDao.getNews(no);
	}

	@Override
	public void deleteArticle(int no) {
		newsDao.deleteArticle(no);		
	}

	@Override
	public void incrementReadCount(int no) {
		newsDao.incrementReadCount(no);
	}

	@Override
	public Map<String, Integer> increamentLikeHate(int no, String func) {
		
		Map<String, Integer> map = new HashMap<>();
		
		newsDao.increamentLikeHate(no, func);
		News n = newsDao.getLikeHateCount(no);
		
		map.put("likeCount", n.getLikeCount());
		map.put("hateCount", n.getHateCount());		
		
		return map;
	}

	@Override
	public List<News> getMainNews() {
		return newsDao.getMainNews();
	}

	@Override
	public List<Reply> getReplyList(int no) {
		return newsDao.getReplyList(no);
	}

	@Override
	public void addReply(Reply r) {
		newsDao.addReply(r);
	}

	@Override
	public void updateReply(Reply r) {
		newsDao.updateReply(r);
	}

	@Override
	public void deleteReply(Reply r) {
		newsDao.deleteReply(r);
	}
	
	public void crawlingNews() throws IOException {
		
		List<News> nList = new ArrayList<>();
		
		for(int i=1; i<=5; i++) {
			
			Connection connection = Jsoup.connect("https://www.hankyung.com/sports/120"+i);
			connection.timeout(100000);
			Document doc = connection.get();
	        Elements newsList = doc.select(".news-list").select("li");
	        for(Element e : newsList) {
	        	News n = new News();
	        	String cat = "";
	        	if(i == 1) cat = "baseball";
	        	if(i == 2) cat = "worldBaseball";
	        	if(i == 3) cat = "football";
	        	if(i == 4) cat = "worldFootball";
	        	if(i == 5) cat = "basketball";
	        	
	        	n.setCategory(cat);
	        	n.setTitle(e.select(".news-tit a").text());
	        	n.setThumbnail(e.select(".thumb a img").attr("src"));
	        	n.setDescription(e.select(".lead").text());
	        	Connection con = Jsoup.connect(e.select(".news-tit a").attr("href"));
	        	con.timeout(100000);
	        	Document doc2 = con.get();
	        	n.setContent(doc2.select("#articletxt").html());

	        	nList.add(n);
	        }
		}
		
		for(News n : nList) {
			newsDao.writeArticle(n);			
		}
		
	}

	@Override
	public int getArticleCount(String cat) {
		return newsDao.getNewsCount(cat);
	}

}
