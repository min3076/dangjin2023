<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.but {
	text-align: center;
	margin: 0 auto;
}
</style>

<h2>타 지역 중․고등학교 신입생 교복지원 신청</h2>


<h3>지원대상</h3>
<ul class="list_1st">
	<li>2023년 입학일 기준 당진시에 주민등록을 두고, 교복을 입는 학교에 입학하는 학생
		<ul class="list_2st">
			<li>당진시 이외 지역에 소재한 고등학교에 입학하는 학생</li>
			<li>충청남도 이외 지역에 소재한 중학교에 입학하는 학생</li>
			<li>당진시 이외 지역에 소재한 중․고등학교 1학년에 준하는 교육과정을 운영하는 대안교육기관에 입학하는 학생</li>
		</ul>
	</li>
</ul>

<h3>지원제외</h3>
<ul class="list_1st">
	<li>중복지원 불가(학업기간 1회 지원)</li>
	<li>당진시, 타 지자체 및 공공기관, 보호자의 회사, 학교 등에서 별도의 교복지원을 받은 경우
		<p class="txt-tip txt-small"><i class="fa fa-fw fa-exclamation-circle"></i>당진시 소재 학교 입학생 및 전학생은 학교로 지원되니, 별도 신청이 필요 없습니다.</p>
	</li>
</ul>

<h3>신청방법</h3>
<ul class="list_1st">
	<li>홈페이지 신청 및 평생학습과 방문신청, 우편신청
		<p class="txt-tip txt-small"><i class="fa fa-fw fa-exclamation-circle"></i>방문신청: 평일 근무시간(09:00~18:00)내에 신청, 중식시간(12:00~13:00) 및 공휴일 신청 불가</p>
	</li>
</ul>

<h3>신청기간</h3>
<ul class="list_1st">
	<li>1차 : 2023. 3. 6.(월) ~ 3. 31.(금)</li>
	<li>2차 : 2023. 9. 1.(금) ~ 9. 27.(수)
		<p class="txt-tip txt-small"><i class="fa fa-fw fa-exclamation-circle"></i>기간 외 신청불가</p>
	</li>
</ul>

<h3>지원금액</h3>
<ul class="list_1st">
	<li>314,000원 이내(품목별 1벌씩, 지원금액 범위 내 실제 구입비 지원)</li>
</ul>

<h3>구비서류</h3>
<ul class="list_1st">
	<li>① 교복구입비 지원 신청서</li>
	<li>② 교복구입영수증(간이영수증 불가)</li>
	<li>③ 구입내역서(품목별 단가, 수량, 금액 포함) - 교복판매업체 발행</li>
	<li>④ 학교규정(교복관련 내용으로서 교복디자인, 착용 시기 등 명시)</li>
	<li>⑤ 재학증명서(1개월 이내)</li>
	<li>⑥ 신청자 통장사본</li>
</ul>


<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear">
	<fmt:formatDate value="${now}" pattern="yyyyMMdd" />
</c:set>

<a class="btn btn-ani btn-file mt_20"
	href="/gonet/FileDownload.do?fileName=sub05_11_09_A.hwp&amp;code=download/kor/sub05/"><span
	class="bico bticon left hwp">hwp 파일</span> 교복구입비 지원 신청서 다운로드</a>


<div class="mt_20 but">
	 <c:choose>
		<c:when test="${sysYear >= 20230306 and (sysYear <= 20230331)}">
			<c:choose>
				<c:when test="${not empty loginVO}">		
					<a class="btn btn-ani btn-default"
						href="/cop/bbs/BBSMSTR_000000000640/selectBoardList.do">1차 무상교복 지원 신청</a>
				</c:when>
				<c:otherwise>
					<a class="btn btn-ani btn-default"
					href="/kor/sitemap_12.do?bbsId=BBSMSTR_000000000640&returnUrl=/cop/bbs/BBSMSTR_000000000640/selectBoardList.do">1차 무상교복 지원 신청</a>
				</c:otherwise>
				</c:choose>
		</c:when>
		<c:otherwise>
			<!-- <a class="btn btn-ani btn-default" href="#"
				onclick="alert('1차 무상교복 신청기간은 2023. 3. 6.(월) ~ 2023. 3. 31.(금)입니다.')">
				1차 무상교복 지원 신청</a> -->
				<a class="btn btn-ani btn-default" href="/cop/bbs/BBSMSTR_000000000640/selectBoardList.do">1차 무상교복 지원 신청 확인</a><!--신청기간 이후 활성-->
		</c:otherwise>
	</c:choose> 
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${sysYear >= 20200901 and (sysYear <= 20200929)}"> --%>
<!-- 			<a class="btn btn-ani btn-default" -->
<!-- 				href="/cop/bbs/BBSMSTR_000000000640/selectBoardList.do">2차 무상교복 -->
<!-- 				지원 신청</a> -->
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<a class="btn btn-ani btn-default" href="#" -->
<!-- 				onclick="alert('2차 무상교복 신청기간은 2020. 9. 1.(화) ~ 2020. 9. 29.(화)입니다.')">2차 -->
<!-- 				무상교복 지원 신청</a> -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
</div>








