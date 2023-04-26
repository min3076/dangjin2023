<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>

/* sub05_08_01 일자리센터 센터안내 */

.job_cont{}
.job_cont .txtp{font-size:17px;margin:30px;}
.job_cont .ui.uip.type2 li{margin-bottom:40px;width:24.2%;margin-right:1%;}
.job_cont .ui.uip.type2 li:last-child{margin-right:0;}
.job_cont .ui.uip.type2 span{display: table;width:100%;min-height:135px;border: 1px solid #165ea6;border-radius: 11px;}
.job_cont .ui.uip.type2 span strong{display:table-cell;color:#000;font-size:15px;text-align:center;vertical-align: middle;}
.job_cont .ui.uip.type2 p{color:#165ea6;margin:20px 0;font-size:17px;font-weight:600;}
.job_cont .ui.uip.type2 li:after{display:none;}

.job_cont .con{display: block;overflow: hidden;width:100%;clear:both;}
.job_cont .con_left {display:inline-block;width:47%; float:left;}
.job_cont .con_left .list_1st{border-right: 1px solid #d9d9d9;}
.job_cont .con_right {display:inline-block;width:47%; float:right;}
.job_cont .con span{color:#3c90e2; font-weight:400; margin-right:20px;}
.job_cont .con p{width:86%; float:right; }
.job_cont .con li {width:98%;}
.job_cont .con h3{width:100%;margin:20px 0;}

.info .group{overflow:hidden;margin:0 -1%}
.info .group > li{float:left;width:23%;margin:0 1%;}
.info .group > li p{display: block;position: relative;height: 40px;margin: 30px 0 0; padding: 0 10px;background: #555B69; line-height: 40px; color: #fff;text-align: center;}
.info .group > li .list_1st {padding:10px;background: #f9f9f9;height:131px;}


@media only screen and (max-width:1040px){
.job_cont .ui.uip.type2 li{width:24%;margin-right:1%;}
.job_cont .ui.uip.type2 li:last-child{margin-right:0;}
.job_cont .ui.uip.type2 span {width:100%;height:163px;border-radius:4%;}

}

@media only screen and (max-width: 768px){
.job_cont .ui.uip.type2 li {width:49%;margin: 0 1% 40px 0;padding:0;display: inline-block;}
.job_cont .ui.uip.type2 li:nth-child(2){margin-right:0;}
.job_cont .ui.uip.type2 p {text-align:center; font-size: 15px;}
.job_cont .ui.uip.type2 span strong {font-size: 14px;}
.job_cont .con_left {width:100%;}
.job_cont .con_right {width:100%;}

.info .group > li {width:49%;margin: 0px 1% 0px 0px;}
.info .group > li:nth-child(2){margin-right:0;}
.info .group > li:last-child{margin-right:0;}


@media only screen and (max-width: 500px){
.job_cont .ui.uip.type2 li {width:100%;}
.job_cont .ui.uip.type2 span {border-radius:0;}
.job_cont .s0203 div .icon{display:none;}
.job_cont .s0203 div{padding-left:10px;}
}

</style>


<h2>일자리센터</h2>
<div class="ui uit type1 mb_30">
    <div class="inner">
        <span class="tp_icon circle circle1">
            <span class="tp_icon icon icon26"></span>
        </span>
        <div class="txtwrap">
            <strong class="tit_inner">일자리센터</strong>
            <p class="txtp">당진시에서는 시 직영으로 일자리센터를 운영하여 구인구직 정보제공, 취업상담, 구인구직매칭 등 취업지원서비스를 제공해 기업체의 구인난을 해소하고
				구직자에게는 좋은 일자리를 찾아드리고 있습니다.</p>
			<a class="btn btn-ani btn-default mt_20" href="https://www.dangjin.go.kr/job.do" target="_blank" title="당진시일자리종합지원센터 새창열림">당진시일자리종합지원센터 바로가기</a>
        </div>            
    </div>    
</div>

<div class="job_cont">
	<div class="con">
		<div class="con_left">
		<h3>구직자를 위한 딱 맞는 일자리 찾기</h3>
			<ul class="list_1st">
				<li>일자리센터 방문</li>
				<li>구직신청서 작성 및 등록(온라인 등록 가능)</li>
				<li>개별상담</li>
				<li>일자리 알선
					<ul class="list_2st">
						<li>적성에 맞는 기업 알선</li>
						<li>구인구직매칭데이</li>
						<li>일자리 박람회 개최</li>
					</ul>	
				</li>
				<li>취업</li>
			</ul>
		</div>


		<div class="con_right">
		<h3>구인업체를 위한 꼭 맞는 인재 찾기</h3>
			<ul class="list_1st">
				<li>일자리센터 구인기업 등록
					<ul class="list_2st">
						<li>방문, 팩스, 인터넷홈페이지, 이메일 접수 가능 </li>
					</ul>	
				</li>
				<li>무료구인공고 게시</li>
				<li>직종별, 연령별 맞춤 인재 추천</li>
				<li>채용대행 서비스
					<ul class="list_2st">
						<li>구인구직매칭데이</li>
						<li>구인기업 맞춤형 동행면접</li>
						<li>일자리 박람회 개최</li>
					</ul>	
				</li>
				<li>채용</li>
			</ul>
		</div>
	</div>

</div> <!-- job_cont  -->


<h2>여성새로일하기센터</h2>
<div class="ui uit type1 bgw mb_30">
	<div class="inner icowrap">
	   <span class="tp_icon circle circle1">
			<span class="tp_icon icon icon1"></span>
		</span>
		<div class="txtwrap">
			<strong class="tit_inner">여성새로일하기센터</strong>
			<p>취업을 희망하는 모든 여성들의 취업을 지원하는 종합취업지원기관입니다. 임신·출산·육아 등으로 경력이 단절된 여성에게 취업상담, 인턴십, 직업교육훈련 및 취업 후 사후관리 등 종합적인 취업지원 서비스를 제공합니다. </p>
			<a class="btn btn-ani btn-default mt_20" href="https://www.dangjin.go.kr/job.do" target="_blank" title="당진시일자리종합지원센터 새창열림">당진시일자리종합지원센터 바로가기</a>
		</div>            
	</div>    
</div>
			
<div class="job_cont">
	<div class="info">
		<ul class="group">
			<li><p>직업상담</p>
				<ul class="list_1st lv1">
					<li>구직상담</li>
					<li>구인상담</li>
					<li>집단상담</li>
					<li>찾아가는 새일센터</li>
				</ul>
			</li>
			<li><p>직업교육훈련</p>
				<ul class="list_1st lv1">
					<li>새일역량교육</li>
					<li>직업능력개발교육</li>
					<li>취업준비 교육</li>
				</ul>
			</li>
			<li><p>사후관리</p>
				<ul class="list_1st lv1">
					<li>동행면접</li>
					<li>새일여성인턴</li>
					<li>결혼이민여성인턴</li>
				</ul>
			</li>
			<li><p>취업알선</p>
				<ul class="list_1st lv1">
					<li>여성친화기업지원</li>
					<li>취업자·구직자·구인처사후관리</li>
					<li>기업환경개선</li>
				</ul>
			</li>
		</ul>

	</div>


	<ol class="ui uip type2 mt_20">
		<li>
			<p>기간</p>
			<span class=""><strong>연중(월~금)<br>09:00~18:00</strong></span>
		</li>
		<li>
			<p>장소</p>
			<span class=""><strong>당진중앙1로 59<br>당진시일자리종합지원센터 1층</strong></span>       
		</li>
		<li>
			<p>전화번호</p>
			<span class=""><strong>041.354.1919</strong></span>			
		</li>
		<li>
			<p>팩스</p>
			<span><strong>041.354.1918</strong></span>
		</li>
	</ol>
</div>



