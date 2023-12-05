<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="footer" class="justify-content-center container bg-white rounded shadow-sm mt-5">
    <div id="footerMenu" class="row d-flex justify-content-center align-items-middle py-5">
		<div class="col text-center">
			<a href="newsMain" class="mx-3 text-dark">처음화면</a>
			<a href="newsList?cat=all" class="mx-3 text-dark">전체기사</a>
			<a href="newsList?cat=baseball" class="mx-3 text-dark">국내야구</a>
			<a href="newsList?cat=worldBaseball" class="mx-3 text-dark">해외야구</a>
			<a href="newsList?cat=football" class="mx-3 text-dark">국내축구</a>
			<a href="newsList?cat=worldFootball" class="mx-3 text-dark">해외축구</a>
			<a href="newsList?cat=basketball" class="mx-3 text-dark">농구</a>
		</div>
    </div>
    <div class="row">
        <div class="col">
            <div class="row">
                <div class="col-4 d-flex justify-content-end align-items-center ms-3 py-2 border-top border-2" style="height : 100px;">
                    <span class="fw-bold fs-1 text-dark" style="line-height: 100px;">
                        &nbsp;SportsPlus&nbsp;
                    </span>
                </div>
                <div class="col text-dark d-flex justify-content-start align-items-center me-3 py-2 border-top border-2">
                    <span class="fs-5">
                        본 콘텐츠의 저작권은 제공처 또는 스포츠플러스에 있으며,<br>
                        이를 무단 이용하는 경우 저작권법 등에 따라 법적 책임을 질 수 있습니다.
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>