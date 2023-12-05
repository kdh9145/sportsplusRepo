package com.sportsplus.app.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sportsplus.app.domain.News;
import com.sportsplus.app.domain.Reply;
import com.sportsplus.app.service.NewsService;

@Controller
public class NewsController {
	
	private NewsService newsService;
	@Autowired
	public NewsController(NewsService newsService) {
		this.newsService = newsService;
	}
	
	@RequestMapping("/")
	public String newsInit(@RequestParam(value="cat", required=false, defaultValue="all") String cat) {
		
		int articleCount = newsService.getArticleCount(cat);
		
		if(articleCount == 0) return "forward:WEB-INF/views/news/newsInit.jsp";
		
		return "/news/newsMain";
	}
	
	@RequestMapping("/newsMain")
	public String newsMain(Model model,
			@RequestParam(value="cat", required=false, defaultValue="all") String cat,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum, 
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword, 
			@RequestParam(value="view", required=false, defaultValue="list") String view,
			@RequestParam(value="type", required=false, defaultValue="latest") String type) {
		
		
		model.addAttribute("mainNews", newsService.getMainNews());
		model.addAllAttributes(newsService.getNewsList(cat, pageNum, keyword, "card", type));
		
		return "/news/newsMain";
	}	

	@RequestMapping("newsList")
	public String newsList(Model model, 
			@RequestParam(value="cat", required=false, defaultValue="all") String cat,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum, 
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword, 
			@RequestParam(value="view", required=false, defaultValue="list") String view,
			@RequestParam(value="type", required=false, defaultValue="latest") String type) {

		String category = null;
		switch(cat) {
		case "all" : category = "전체기사";
		break;
		case "baseball" : category = "국내 야구";
			break;
		case "worldBaseball" : category = "해외 야구";
			break;
		case "football" : category = "국내 축구";
			break;
		case "worldFootball" : category = "해외 축구";
			break;
		case "basketball" : category = "농구";
			break;
		}
		
		List<News> mainNews = newsService.getMainNews();
		
		model.addAllAttributes(newsService.getNewsList(cat, pageNum, keyword, view, type));
		model.addAttribute("mainNews", mainNews);
		model.addAttribute("category", category);
		model.addAttribute("cat", cat);
		model.addAttribute("view", view);
		model.addAttribute("type", type);
		
		return "/news/newsList";
	}
	
	@RequestMapping("newsDetail")
	public String newsDetail(Model model, int no, String cat, @RequestParam(required=false, defaultValue="1") int pageNum) {
		
		//조회수를 1증가
		newsService.incrementReadCount(no);
		
		String category = null;
		switch(cat) {
		case "all" : category = "전체기사";
		break;
		case "baseball" : category = "국내 야구";
			break;
		case "worldBaseball" : category = "해외 야구";
			break;
		case "football" : category = "국내 축구";
			break;
		case "worldFootball" : category = "해외 축구";
			break;
		case "basketball" : category = "농구";
			break;
		}
		
		News news = newsService.getNews(no);
		List<Reply> replyList = newsService.getReplyList(no);
		
		model.addAllAttributes(newsService.getNewsList(news.getCategory(), 1, "null", "detail", "latest"));
		model.addAttribute("mainNews", newsService.getMainNews());
		model.addAttribute("news", news);
		model.addAttribute("replyList", replyList);
		model.addAttribute("cat", cat);
		model.addAttribute("category", category);
		model.addAttribute("pageNum", pageNum);
		
		return "/news/newsDetail";
	}
	
	@RequestMapping("newsWrite")
	public String newsWrite(Model model, String cat) {
		model.addAttribute("cat", cat);
		return "/news/newsWriteForm";
	}
	
	@RequestMapping("newsUpdate")
	public String newsUpdate(Model model, int no, String cat) {

		News news = newsService.getNews(no);
		model.addAttribute("news", news);
		model.addAttribute("cat", cat);
		
		return "/news/newsUpdateForm";
	}
	
	@RequestMapping("newsDelete")
	public String news(Model model, int no, String cat) {		
		newsService.deleteArticle(no);
		return "redirect:newsList";
	}
	
	@RequestMapping(value="newsWriteProcess", method=RequestMethod.POST)
	public String newsWriteProcess(Model model, News n) {
		newsService.writeArticle(n);
		return "redirect:newsList";
	}
	
	@RequestMapping(value="newsUpdateProcess", method=RequestMethod.POST)
	public String newsUpdateProcess(News n) {
		newsService.updateArticle(n);
		return "redirect:newsList";
	}
	
	
}
