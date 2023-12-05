package com.sportsplus.app.ajax;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sportsplus.app.domain.Reply;
import com.sportsplus.app.service.NewsService;

@Controller
public class NewsAjaxController {

	private NewsService newsService;
	@Autowired
	public NewsAjaxController(NewsService newsService) {
		this.newsService = newsService;
	}
	
	@RequestMapping("newsInit.ajax")
	@ResponseBody
	public Map<String, Boolean> newsInit(@RequestParam(value="cat", required=false, defaultValue="all") String cat, HttpServletResponse response) throws IOException {
		Map<String, Boolean> result = new HashMap<>();
		int articleCount = newsService.getArticleCount(cat);
		if(articleCount == 0) newsService.crawlingNews();
		result.put("result", true);
		return result;
	}	
	
	@RequestMapping("search.ajax")
	@ResponseBody
	public Map<String, Object> searchList(@RequestParam(value="cat", required=false, defaultValue="all") String cat, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum, 
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword,
			@RequestParam(value="view", required=false, defaultValue="list") String view,
			@RequestParam(value="type", required=false, defaultValue="latest") String type){
		
		return newsService.getNewsList(cat, pageNum, keyword, view, type);
	}
	
	@RequestMapping("likeHate.ajax")
	@ResponseBody
	public Map<String, Integer>addLike(int no, String func) {
		return newsService.increamentLikeHate(no, func);
	}
	
	@RequestMapping("replyWrite.ajax")
	@ResponseBody
	public List<Reply> replyWrite(Reply r){
		newsService.addReply(r);
		return newsService.getReplyList(r.getBbsNo());
	}
	
	
	@RequestMapping("replyUpdate.ajax")
	@ResponseBody
	public List<Reply> replyUpdate(Reply r){
		newsService.updateReply(r);
		return newsService.getReplyList(r.getBbsNo());
	}
	
	@RequestMapping("replyDelete.ajax")
	@ResponseBody
	public List<Reply> replyDelete(Reply r){
		newsService.deleteReply(r);
		return newsService.getReplyList(r.getBbsNo());
	}
	
	@RequestMapping("/imageUpload.ajax")
	@ResponseBody
	public Map<String,String> imageUpload(@RequestParam(value="image") MultipartFile multipartFile, HttpServletRequest request) throws IOException {
		
		Map<String,String> result = new HashMap<>();
		
		if(!multipartFile.isEmpty()) {
			String filePath = request.getServletContext().getRealPath("/resources/upload/");
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			File file = new File(filePath, saveName);
			multipartFile.transferTo(file);
			result.put("fileName",saveName);
		}
		System.out.println("이미지 업로드 성공");
		return result;

	}
	
}
