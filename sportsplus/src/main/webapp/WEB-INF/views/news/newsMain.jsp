<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="content" class="container" style="min-height: 100vh;">
        <div class="row">
            <div class="col">
                <div class="row" id="newsMainPopular">
                    <div class="col">
                    
                        <div class="row">
                            <div class="col">
                                <span class="fs-5 align-middle">
                                    	스포츠별 인기 기사
                                </span>
                                <span class="align-top fs-5" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip" 
                                data-bs-title="각 스포츠별로 최근 일주일동안의 기사들 중 가장 많이 조회된 기사들입니다">ⓘ</span>
                            </div>
                        </div>
                        
                        <!-- 스포츠별 인기기사 리스트가 없을 때 시작 -->
                        <c:if test="${empty mainNews or mainNews.size() < 5}">
                        	<div class="row">
                        		<div class="col text-center py-5 border bg-white rounded">
                        			<h1>죄송합니다</h1>
                        			<h1>스포츠별 인기기사가 준비되지 않았습니다.</h1>
                        		</div>
                        	</div>
                        </c:if>
                        <!-- 스포츠별 인기기사 리스트가 없을 때 끝 -->
                        
                        <!-- 스포츠별 인기기사 리스트가 있을 때 시작 -->
                        <c:if test="${not empty mainNews and mainNews.size() >= 5}">
                        <div class="row">
                        	<div class="col">
                        	
                        		<div class="row">
                        		
                        			<!-- 메인 -->
                        			<c:if test="${not empty mainNews}">
                        			<div class="col p-0" style="height: 50vh;">
                        				<div class="mainThumbnail border" 
                        				style="background-image : url('${empty mainNews.get(0).thumbnail ? 'resources/images/defaultThumbnail.jpg' : mainNews.get(0).thumbnail}');"
                        				onclick="location.href='newsDetail?no=${mainNews.get(0).no}&cat=${mainNews.get(0).category}'">
                        					<div class="mainTitle" style="height : 50vh;">
                        						<div style="height:50vh;" class="d-flex flex-column align-items-start justify-content-end p-5">		        									
		        									<div style="overflow: hidden; text-overflow: ellipsis; height:4vh;">
	                        							<c:if test="${mainNews.get(0).category eq 'baseball'}">
			        										<span class="text-white fs-5">국내야구</span>
			        									</c:if>
			        									<c:if test="${mainNews.get(0).category eq 'worldBaseball'}">
			        										<span class="text-white fs-5">해외야구</span>
			        									</c:if>
			        									<c:if test="${mainNews.get(0).category eq 'football'}">
			        										<span class="text-white fs-5">국내축구</span>
			        									</c:if>
			        									<c:if test="${mainNews.get(0).category eq 'worldFootball'}">
			        										<span class="text-white fs-5">해외축구</span>
			        									</c:if>
			        									<c:if test="${mainNews.get(0).category eq 'basketball'}">
			        										<span class="text-white fs-5">농구</span>
			        									</c:if>       									
		        									</div>
		        									<div style="overflow: hidden; text-overflow: ellipsis; height:5vh;">
                        								<span class="fs-2 fw-bold text-white">${mainNews.get(0).title}</span>		        									
		        									</div>
		        									<div style="overflow: hidden; text-overflow: ellipsis; height:9vh;">
	                        							<span class="fs-3 text-white">${mainNews.get(0).description}</span>		        									
		        									</div>
		        									<div style="overflow: hidden; text-overflow: ellipsis; height:4vh;">
	                        							<span class="fs-5 text-white">기사등록일 : ${mainNews.get(0).regDate} 조회수 : ${mainNews.get(0).readCount}</span>
		        									</div>
                        						</div>
                        					</div>
                        				</div>
                        			</div>
                        			
                        			<div class="col">
                        				<div class="row">
                        					<div class="col-6 p-0" style="height: 25vh;">
                       							<div class="mainThumbnail border"
                       							style="background-image : url('${empty mainNews.get(1).thumbnail ? 'resources/images/defaultThumbnail.jpg' : mainNews.get(1).thumbnail}');"
			                        				onclick="location.href='newsDetail?no=${mainNews.get(1).no}&cat=${mainNews.get(1).category}'">
		                        					<div class="mainTitle" style="height : 25vh;">
		                        					
		                        						<div style="height:25vh;" class="d-flex flex-column align-items-start justify-content-end p-3">		        									
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2vh;">
			                        							<c:if test="${mainNews.get(1).category eq 'baseball'}">
					        										<span class="text-white">국내야구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(1).category eq 'worldBaseball'}">
					        										<span class="text-white">해외야구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(1).category eq 'football'}">
					        										<span class="text-white">국내축구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(1).category eq 'worldFootball'}">
					        										<span class="text-white">해외축구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(1).category eq 'basketball'}">
					        										<span class="text-white">농구</span>
					        									</c:if>       									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2.5vh;">
		                        								<span class="fs-5 fw-bold text-white">${mainNews.get(1).title}</span>		        									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:4.5vh;">
			                        							<span class="text-white">${mainNews.get(1).description}</span>		        									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2vh;">
			                        							<span class="text-white" style="font-size: 12px;">기사등록일 : ${mainNews.get(1).regDate} 조회수 : ${mainNews.get(1).readCount}</span>
				        									</div>
		                        						</div>
		                        						
		                        					</div>
			                        			</div>
                        					</div>
                        					<div class="col-6 p-0" style="height: 25vh;">
                       							<div class="mainThumbnail border" 
                       							style="background-image : url('${empty mainNews.get(2).thumbnail ? 'resources/images/defaultThumbnail.jpg' : mainNews.get(2).thumbnail}');"
			                        				onclick="location.href='newsDetail?no=${mainNews.get(2).no}&cat=${mainNews.get(2).category}'">
			                        				<div class="mainTitle" style="height : 25vh;">
			                        				
		                        						<div style="height:25vh;" class="d-flex flex-column align-items-start justify-content-end p-3">		        									
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2vh;">
			                        							<c:if test="${mainNews.get(2).category eq 'baseball'}">
					        										<span class="text-white">국내야구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(2).category eq 'worldBaseball'}">
					        										<span class="text-white">해외야구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(2).category eq 'football'}">
					        										<span class="text-white">국내축구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(2).category eq 'worldFootball'}">
					        										<span class="text-white">해외축구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(2).category eq 'basketball'}">
					        										<span class="text-white">농구</span>
					        									</c:if>       									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2.5vh;">
		                        								<span class="fs-5 fw-bold text-white">${mainNews.get(2).title}</span>		        									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:4.5vh;">
			                        							<span class="text-white">${mainNews.get(2).description}</span>		        									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2vh;">
			                        							<span class="text-white" style="font-size: 12px;">기사등록일 : ${mainNews.get(2).regDate} 조회수 : ${mainNews.get(2).readCount}</span>
				        									</div>
		                        						</div>
		                        						
		                        					</div>
			                        			</div>
                        					</div>
                        				</div>
                        				<div class="row">
                        					<div class="col-6 p-0" style="height: 25vh;">
		                     					<div class="mainThumbnail border" 
		                     						style="background-image : url('${empty mainNews.get(3).thumbnail ? 'resources/images/defaultThumbnail.jpg' : mainNews.get(3).thumbnail}');"
			                        				onclick="location.href='newsDetail?no=${mainNews.get(3).no}&cat=${mainNews.get(3).category}'">
		                        					<div class="mainTitle" style="height : 25vh;">
		                        					
		                        						<div style="height:25vh;" class="d-flex flex-column align-items-start justify-content-end p-3">		        									
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2vh;">
			                        							<c:if test="${mainNews.get(3).category eq 'baseball'}">
					        										<span class="text-white">국내야구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(3).category eq 'worldBaseball'}">
					        										<span class="text-white">해외야구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(3).category eq 'football'}">
					        										<span class="text-white">국내축구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(3).category eq 'worldFootball'}">
					        										<span class="text-white">해외축구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(3).category eq 'basketball'}">
					        										<span class="text-white">농구</span>
					        									</c:if>       									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2.5vh;">
		                        								<span class="fs-5 fw-bold text-white">${mainNews.get(3).title}</span>		        									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:4.5vh;">
			                        							<span class="text-white">${mainNews.get(3).description}</span>		        									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2vh;">
			                        							<span class="text-white" style="font-size: 12px;">기사등록일 : ${mainNews.get(3).regDate} 조회수 : ${mainNews.get(3).readCount}</span>
				        									</div>
		                        						</div>
		                        						
		                        					</div>
			                        			</div>
                        					</div>
                        					<div class="col-6 p-0" style="height: 25vh;">
                       							<div class="mainThumbnail border" 
                       							style="background-image : url('${empty mainNews.get(4).thumbnail ? 'resources/images/defaultThumbnail.jpg' : mainNews.get(4).thumbnail}');"
			                        				onclick="location.href='newsDetail?no=${mainNews.get(4).no}&cat=${mainNews.get(4).category}'">
		                        					<div class="mainTitle" style="height : 25vh;">
		                        					
		                        						<div style="height:25vh;" class="d-flex flex-column align-items-start justify-content-end p-3">		        									
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2vh;">
			                        							<c:if test="${mainNews.get(4).category eq 'baseball'}">
					        										<span class="text-white">국내야구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(4).category eq 'worldBaseball'}">
					        										<span class="text-white">해외야구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(4).category eq 'football'}">
					        										<span class="text-white">국내축구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(4).category eq 'worldFootball'}">
					        										<span class="text-white">해외축구</span>
					        									</c:if>
					        									<c:if test="${mainNews.get(4).category eq 'basketball'}">
					        										<span class="text-white">농구</span>
					        									</c:if>       									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2.5vh;">
		                        								<span class="fs-5 fw-bold text-white">${mainNews.get(4).title}</span>		        									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:4.5vh;">
			                        							<span class="text-white">${mainNews.get(4).description}</span>		        									
				        									</div>
				        									<div style="overflow: hidden; text-overflow: ellipsis; height:2vh;">
			                        							<span class="text-white" style="font-size: 12px;">기사등록일 : ${mainNews.get(4).regDate} 조회수 : ${mainNews.get(4).readCount}</span>
				        									</div>
		                        						</div>
		                        						
		                        					</div>
			                        			</div>
                        					</div>
                        				</div>
                        			</div>
                        			</c:if>
                        			
                        		</div>
                        		
                        	</div>
                        
                        </div>
                        </c:if>
                        <!-- 스포츠별 인기기사 리스트가 있을 때 끝 -->
                        
                    </div>
                </div>
                
                <!-- 중앙 캐러셀 시작 -->
				<div id="carouselExampleInterval" class="carousel slide p-5 rounded w-100 my-5" data-bs-ride="carousel"
				style="background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 1));">
					<div class="carousel-inner text-white text-center">
						<div class="carousel-item active" data-bs-interval="2500">
							<span class="fw-bold" style="font-size:4rem;">손흥민, 김하성의 소식이 궁금해?</span>
						</div>
						<div class="carousel-item" data-bs-interval="2500">
							<span class="fw-bold" style="font-size:4rem;">최신 스포츠 기사를 한번에!</span>
						</div>
						<div class="carousel-item" data-bs-interval="2500">
							<span class="fw-bold" style="font-size:4rem;">SportsPlus</span>
						</div>
					</div>
				</div>
                <!-- 중앙 캐러셀 끝 -->
                
                

                <div class="row" id="newsMainRecent">
                    <div class="col">
                        
                        <div class="row">
                            <div class="col">
                                <span class="fs-5">
                                    최신 기사
                                </span>
                            </div>
                            <div class="col text-end">
                                <a href="newsList?cat=all" class="btn btn-dark btn-sm">
                                    	전체 기사 보기
                                </a>
                            </div>
                        </div>

                        <div class="row my-2">
                        	<c:forEach var="n" items="${newsList}">
                        		<div class="col-4 p-3">
                        			<div class="bg-white d-flex rounded shadow-sm latestNews" style="height : 10vh; cursor:pointer;" onclick="location.href='newsDetail?no=${n.no}&cat=${n.category}'">
                        					<div style="background-image: url('${empty n.thumbnail ? 'resources/images/defaultThumbnail.jpg' : n.thumbnail}');
                        					background-position:center; width: 30%; height : 10vh;" class="latestNewsThumbnail rounded-start">
                        					</div>
                        					<div style="width:70%; height:100%; overflow:hidden; text-overflow: ellipsis; white-space: nowrap;" class="px-3 border-start">
                        						<div style="width:100%; height : 4vh; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" 
                        						class="fw-bold d-flex align-items-center">
                        							${n.title}
                        						</div>
                        						<div style="width:100%; height : 3vh; overflow:hidden; text-overflow: ellipsis; word-wrap: break-word; font-size:14px;">
                        							${n.description}
                        						</div>
                        						<div style="height : 3vh; font-size:12px;" class="text-secondary">
                        							${n.regDate}
                        						</div>
                        					</div>
                        				
                        			</div>
                        		</div>
                        	</c:forEach>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>