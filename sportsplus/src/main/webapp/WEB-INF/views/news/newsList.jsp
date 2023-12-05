<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="content" class="container">
    <div class="row">
        <div class="col">
        
        	<div class="row mb-3">
        		
        		<div class="col">
        			<h2 class="fw-bold">${category} 기사</h2>
        		</div>
        		
        		<c:if test="${sessionScope.isLogin and sessionScope.member.id eq 'admin'}">
	        		<div class="col text-end">
						<input type="button" value="기사 작성" class="btn btn-dark" id="writeArticle" onclick="location.href='newsWrite?cat=${cat}'">
					</div>
				</c:if>
        		
        	</div>
        	
        	<div class="row">
        		<div class="col rounded bg-white shadow-sm p-5">
					<div class="row">
						
						<!-- 기사리스트가 없을때 시작 -->
						<c:if test="${empty newsList}">
							<div class="col fs-1 text-dark fw-bold d-flex justify-content-center align-items-center">
								죄송합니다<br>
								${category} 기사가 없습니다.
							</div>
						</c:if>
						<!-- 기사리스트가 없을때 끝 -->
					
						<!-- 기사리스트가 있을때 시작 -->
						<c:if test="${not empty newsList}">
		        		<div class="col" id="newsList">
		        			<div class="row">
		        				<div class='col me-5'>
		        					<div class="row">
		        						<div class="col">
			        						<a href="newsList?cat=${cat}&pageNum=${pageNum}&view=${view}&type=latest" 
			        						class="${type eq 'latest' ? 'btn btn-dark' : 'btn text-dark'}">최신순</a>
			        						<a href="newsList?cat=${cat}&pageNum=${pageNum}&view=${view}&type=popular" 
			        						class="${type eq 'popular' ? 'btn btn-dark' : 'btn text-dark'}">인기순</a>
		        						</div>
		        						<div class="col text-end">	        							
		        							<div onclick="location.href='newsList?cat=${cat}&pageNum=${pageNum}&view=list&type=${type}'" 
		        							style="cursor:pointer;" class="d-inline">
		        								<img src="${view eq 'list' ? 'resources/images/listSelect.png' : 'resources/images/list.png'}"
		        								width="40px" height="40px">
		        							</div>
		        							<div onclick="location.href='newsList?cat=${cat}&pageNum=${pageNum}&view=card&type=${type}'" 
		        							style="cursor:pointer;" class="d-inline">
		        								<img src="${view eq 'card' ? 'resources/images/cardSelect.png' : 'resources/images/card.png'}"
		        								width="40px" height="40px">
		        							</div>	
		        						</div>
		        					</div>
		        				</div>		        				
		        			</div>
		        			<div class="row">
		        				<div class='col me-5'>
		        				
		        					<!-- 리스트 방식 뷰 시작 -->
		        					<c:if test="${view eq 'list'}">
		        					<c:forEach var="n" items="${newsList}">
		        						<div class="row my-5 latestNews newsRow">
		        							<div class="col-3 bg-white rounded border border-secondary-subtle me-3 latestNewsThumbnail" 
		        							style="height : ${cat eq 'all' ? '25' : '15'}vh; 
		        							background-image : url('${not empty n.thumbnail ? n.thumbnail : 'resources/images/defaultThumbnail.jpg'}'); background-position: center; cursor:pointer;"
		        							onclick="location.href='newsDetail?no=${n.no}&cat=${n.category}&pageNum=${pageNum}'"></div>
		        							<div class="col" style="height : ${cat eq 'all' ? '25' : '15'}vh;">
		        								<div class="row">
		        									<div class="col article" style="height : ${cat eq 'all' ? '8' : '4'}vh; width:20vw; cursor:pointer;" onclick="location.href='newsDetail?no=${n.no}&cat=${n.category}&pageNum=${pageNum}'">
		        										<span class="${cat eq 'all' ? 'fs-2' : 'fs-4'} fw-bold">
		        											${n.title}
		        										</span>
		        									</div>
		        								</div>
		        								<div class="row">
		        									<div class="col articleContent" style="height : ${cat eq 'all' ? '12' : '8'}vh; width:20vw; cursor:pointer;" onclick="location.href='newsDetail?no=${n.no}&cat=${n.category}&pageNum=${pageNum}'">
		        										<span class="${cat eq 'all' ? 'fs-4' : 'fs-6'} text-dark">
		        											${n.description}
		        										</span>
		        									</div>
		        								</div>
		        								<div class="row">
		        									<div class="col"  style="height : ${cat eq 'all' ? '5' : '3'}vh; width:20vw; cursor:pointer;" onclick="location.href='newsDetail?no=${n.no}&cat=${n.category}&pageNum=${pageNum}'">
				        									<c:if test="${type eq 'latest'}">
				        										<span class="text-secondary" style="font-size: ${cat eq 'all' ? '20' : '14'}px;">
				        											등록일 : ${n.regDate}
				        										</span>
				        									</c:if>
				        									<c:if test="${type eq 'popular'}">
				        										<span class="text-secondary" style="font-size: ${cat eq 'all' ? '20' : '14'}px;">
				        											조회수 : ${n.readCount}
				        										</span>
				        									</c:if>
		        									</div>
		        									<c:if test="${sessionScope.isLogin and sessionScope.member.id eq 'admin'}">
													<div class="col-auto text-end">
				        								<input type="button" value="수정" class="btn btn-warning btn-sm fw-bold" id="newsUpdate"
				        								onclick="location.href='newsUpdate?no=${n.no}&cat=${n.category}'">
				        								<input type="button" value="삭제" class="btn btn-danger btn-sm fw-bold" id="newsDelete"
				        								onclick="location.href='newsDelete?no=${n.no}&cat=${n.category}'">
				        							</div>
		        									</c:if>
		        								</div>
		        							</div>
		        						</div>		        					
		        					</c:forEach>
		        					</c:if>
		        					<!-- 리스트 방식 뷰 끝 -->
		        					
		        					<!-- 썸네일 방식 뷰 시작 -->
		        					<c:if test="${view eq 'card'}">
			        					<div class="row my-5">
				        					<c:forEach var="n" items="${newsList}">
				        						<div class="col-4 pb-3 px-4 latestNews">
				        							
				        							<div class="row">
				        								<div class="col rounded border latestNewsThumbnail" style="height: ${cat eq 'all' ? '30' : '15'}vh; background-position: center; cursor:pointer;
				        								 background-image: url('${not empty n.thumbnail ? n.thumbnail : 'resources/images/defaultThumbnail.jpg'}');"
				        								 onclick="location.href='newsDetail?no=${n.no}&cat=${n.category}&pageNum=${pageNum}&view=${view}'"></div>
				        							</div>
				        							<div class="row">
				        								<div class="col p-0 pt-1" style="height : 4vh; overflow: hidden; text-overflow: ellipsis; cursor:pointer;"
				        								onclick="location.href='newsDetail?no=${n.no}&cat=${n.category}&pageNum=${pageNum}&view=${view}'">
				        									<p class="text-dark fw-bold lh-1 fs-6">${n.title}</p>
				        								</div>
				        							</div>
				        							<div class="row">
				        								<div class="col p-0" style="cursor:pointer;"
				        								onclick="location.href='newsDetail?no=${n.no}&cat=${n.category}&pageNum=${pageNum}&view=${view}'">
				        									<c:if test="${type eq 'latest'}">
				        										<span class="text-secondary" style="font-size: 14px;">
				        											등록일 : ${n.regDate}
				        										</span>
				        									</c:if>
				        									<c:if test="${type eq 'popular'}">
				        										<span class="text-secondary" style="font-size: 14px;">
				        											조회수 : ${n.readCount}
				        										</span>
				        									</c:if>
				        								</div>
				        							</div>
				        							
				        						</div>
				        					</c:forEach>
			        					</div>
		        					</c:if>
		        					<!-- 썸네일 방식 뷰 끝 -->
		        					
		        				</div>
		        			</div>
		        			<div class="row my-3">
		        				<div class='col text-center me-5'>
		        				
									<nav aria-label="Page navigation example">
									  <ul class="pagination justify-content-center">
									  	
									  	<c:if test="${startPage > pageGroup}">
									    	<li class="page-item"><a class="page-link" href="newsList?cat=${cat}&pageNum=${startPage - 1}&view=${view}">이전</a></li>
									    </c:if>
									    
									    <c:forEach var="i" begin="${startPage}" end="${endPage}">
										    <c:if test="${pageNum eq i}">
												<li class="page-item active" aria-current="page">
													<a class="page-link">${i}</a>
												</li>
										    </c:if>
										    
										    <c:if test="${pageNum ne i}">
										    	<li class="page-item"><a class="page-link" href="newsList?cat=${cat}&pageNum=${i}&view=${view}">${i}</a></li>									    
										    </c:if>
										</c:forEach>
									    
									    <c:if test="${endPage < pageCount}">
									    	<li class="page-item"><a class="page-link" href="newsList?cat=${cat}&pageNum=${startPage + pageGroup}&view=${view}">다음</a></li>
									    </c:if>
									    
									  </ul>
									</nav>
									
		        				</div>
		        			</div>
		        		</div>
		        		</c:if>
		        		<!-- 기사리스트가 있을떄 끝  -->
		        		
		        		<!-- 사이드바 시작, 전체기사일 경우에는 실행X  -->
		        		<c:if test="${cat ne 'all'}">
		        		<div class="col-4 border-start ps-5" id="sideList">

		        			<div class="row">
		        				<div class="col p-3 mb-3" style="border-bottom : 1px dotted #ddd;">
		        					
		        					<div class="row my-3">
		        						<div class="col">
		        							<span class="fw-bold fs-5">${category} 오픈톡</span>	
		        						</div>
		        					</div>
		        					
		        					<!-- 비로그인했을 때 채팅창 시작 -->
		        					<c:if test="${not sessionScope.isLogin}">
		        					<div class="row">
		        						<div class="col border p-3 rounded" style="background-color: #e5e5e5;">
		        						
		        								<div class="bg-white rounded d-flex flex-column justify-content-center align-items-center fw-bold" style="min-height : 40vh;">
		        									로그인이 필요한 컨텐츠입니다 <br>
		        									<a href="login" class="btn btn-dark my-3">로그인하러 가기</a>
		        								</div>
		        							
		        								<div class="mt-3 d-flex">
		        									<input type="text" class="form-control me-2 shadow-none border border-secondary-subtle" disabled>
		        									<input type="button" class="btn btn-dark" value="전송" disabled>
		        								</div>
		        							
		        						</div>
		        					</div>
		        					</c:if>
		        					<!-- 비로그인했을 때 채팅창 끝 -->
		        					
		        					<!-- 로그인했을 때 채팅창 시작 -->
		        					<c:if test="${sessionScope.isLogin}">
		        					<div class="row">
		        						<div class="col border p-3 rounded" style="background-color: #e5e5e5;">
		        								
		        								<div class="bg-white rounded" style="height : 40vh; overflow: auto;" id="${cat}Chat">
		        									<div class="text-dark p-3 text-center fw-bold">${category} 오픈톡에 참여하셨습니다</div>
		        								</div>
		        							
		        								<div class="mt-3 d-flex">
		        									<input type="text" class="form-control me-2 shadow-none border border-secondary-subtle" id="sendMessage">
		        									<input type="button" class="btn btn-dark" value="전송" id="sendBtn">
		        								</div>
		        							
		        						</div>
		        					</div>
		        					<script>
			
										let cat = '${cat}';
										let category = '${category}';
										let div = "#" + cat + "Chat";
										let loginId = '${sessionScope.member.id}';
		        						let url = "ws://192.168.35.92:8081/sportsplus/chat/" + cat;
		        						const chatConatiner = document.querySelector(div);
		        						
		        						const socket = new WebSocket(url);
		        						
		        						$(socket).on("open", function(event) {  
		        						});
		        						
		        						socket.addEventListener('message', function(event){
		        						    console.log('서버로부터 메시지 수신:', event.data); // 문자열로 출력
		        						    let chatMessage = $('<div>', {
		        						    	  'class': 'text-dark px-3 py-1'
		        						    }).append($('<span>', {'text': event.data}));
		        						    $(chatConatiner).append(chatMessage);
		        						    chatConatiner.scrollTo(0, chatConatiner.scrollHeight);
		        						    console.log("6");
		        						});
		        						
		        						$(socket).on('close', function(event) {
		        						    console.log('WebSocket 연결이 닫혔습니다.');
		        						});
		        						
		        						$(socket).on('error', function(event) {
		        						    console.error('WebSocket 오류:', event);
		        						});
		        						
		        						$("#sendMessage").on("keyup", function(event){
		        							
		        							if(event.key == 'Enter'){
			        							socket.send(loginId + ' : ' + $("#sendMessage").val());
			        							$("#sendMessage").val("");
			        							$("#sendMessage").focus();
		        							}
		        						});
		        						
		        						$("#sendBtn").on("click", function(){
		        							
		        							if($("#sendMessage").val().length == 0) {
		        								return;
		        							}
		        							
		        							socket.send(loginId + ' : ' + $("#sendMessage").val());
		        							$("#sendMessage").val("");
		        							$("#sendMessage").focus();
		        						});
		        						
		        					</script>
		        					</c:if>
		        					<!-- 로그인했을 때 채팅창 끝 -->
		        					
		        				</div>
		        			</div>
		        			
		        			<div class="row">
		        				<div class="col p-3" style="height : 25vh; border-bottom : 1px dotted #ddd;">
		        					<div class="row">
		        						<div class="col">
		        							<span class="fw-bold fs-5">스포츠 별 인기기사</span>
											<span class="align-top fs-5" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip" 
											data-bs-title="각 스포츠별로 최근 일주일동안의 기사들 중 가장 많이 조회된 기사들입니다">ⓘ</span>
		        						</div>
		        					</div>
		        					<div class="row">
		        						<div class="col my-3">
		        							<c:forEach var="m" items="${mainNews}">
		        									<div class="row newsRow" onclick="location.href='newsDetail?no=${m.no}&cat=${m.category}'" style="cursor:pointer;">
		        										<div class="col-2 text-end px-0 my-1" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; font-size:14px;">
					        								<a href="newsDetail?no=${m.no}&cat=${m.category}">
					        									<c:if test="${m.category eq 'baseball'}">
					        										<span class="text-secondary">국내야구</span>
					        									</c:if>
					        									<c:if test="${m.category eq 'worldBaseball'}">
					        										<span class="text-secondary">해외야구</span>
					        									</c:if>
					        									<c:if test="${m.category eq 'football'}">
					        										<span class="text-secondary">국내축구</span>
					        									</c:if>
					        									<c:if test="${m.category eq 'worldFootball'}">
					        										<span class="text-secondary">해외축구</span>
					        									</c:if>
					        									<c:if test="${m.category eq 'basketball'}">
					        										<span class="text-secondary">농구</span>
					        									</c:if>
					        								</a>
					        							</div>
		        										<div class="col my-1 fw-bold" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
					        								<a href="newsDetail?no=${m.no}&cat=${m.category}">
					        									<span class="text-dark">${m.title}</span>
					        								</a>
					        							</div>
					        							<div class="col-auto text-end px-0 my-1" style="font-size:12px;">
					        								<a href="newsDetail?no=${m.no}&cat=${m.category}">
					        									<span class="text-secondary">조회수(${m.readCount})</span>
					        								</a>
					        							</div>
		        									</div>
		        							</c:forEach>
		        						</div>
		        					</div>
		        				</div>
		        			</div>
		        			
		        		</div>
		        		</c:if>
		        		
		        	</div>
        		</div>
        	</div>
        	
        </div>
    </div>
</div>