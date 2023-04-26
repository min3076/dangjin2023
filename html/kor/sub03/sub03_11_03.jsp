<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

.uibodo01 .thm_figure01{height: 215px;}
.uibodo01 .thm_figure01 img{padding-top:0;}

.diagram{}

.diagram.type1 .step_list{word-break: keep-all;}

.diagram.type1 .step_list li{position:relative;margin-top:30px;}

.diagram.type1 .step_list li:first-child{margin-top:0}

.diagram.type1 .step_list li:first-child:before{display:none}

.diagram.type1 .step_list li:before{display:block;position:absolute;top:-20px;left:50%;width:15px;height:9px;margin-left:-7px;background:url(/images/lab/sub03/arr_diagram_320.png) no-repeat;content:''}

.diagram.type1 .step_list li strong{display:block;margin-bottom:0;padding:15px;font-size:16px;color:#000}
.diagram.type1 .step_list li strong span{text-align:center;margin:0 auto;font-size: 20px;font-weight:600;margin-bottom:5px;}

.diagram.type1 .step_list li.step1 strong{border:1px solid #e54c37;background:#fff}

.diagram.type1 .step_list li.step2 strong{border:1px solid #dc2339;background:#fff}

.diagram.type1 .step_list li.step3 strong{border:1px solid #c2182d;background:#fff}

.diagram.type1 .step_list li.step4 strong{border:1px solid #982836;background:#fff}

.diagram.type1 .step_list li.step5 strong{border:1px solid #742630;background:#fff}

.diagram.type1 .step_list li.step6 strong{border:1px solid #351d20;background:#fff}

.diagram.type1 .step_list li div{padding:0 15px}

.diagram.type1 .step_list li div b{display:block;font-size:18px;font-weight:normal}

.diagram.type1 .step_list li.step1 b{color:#e54c37}

.diagram.type1 .step_list li.step2 b{color:#dc2339}

.diagram.type1 .step_list li.step3 b{color:#c2182d}

.diagram.type1 .step_list li.step4 b{color:#742630}

.diagram.type1 .step_list li.step5 b{color:#351d20}

.diagram.type1 .step_list li div ul{margin:0}

.diagram.type1 .step_list li div li{overflow:auto;margin-top:0}

@media all and (min-width: 768px){
.diagram.type1 .step_list li span{display:block}

.diagram.type1 .step_list li{overflow:hidden;margin-top:-24px;}

.diagram.type1 .step_list li:after{display:block;visibility:hidden;clear:both;content:''}

.diagram.type1 .step_list li:before{display:none}

.diagram.type1 .step_list li strong{float:left;position:relative;width:300px;height:auto;min-height:200px;margin-bottom:0;
									padding:35px 45px;line-height:22px;color:#fff;text-align:center;}

.diagram.type1 .step_list li strong:before{background:url(/images/common/content/arr_step_list.png) no-repeat}

.diagram.type1 .step_list li.step1 strong{background:#e54c37;opacity:0.9}

.diagram.type1 .step_list li.step2 strong{background:#dc2339;opacity:0.9}

.diagram.type1 .step_list li.step3 strong{background:#c2182d;opacity:0.9}

.diagram.type1 .step_list li.step4 strong{background:#982836;opacity:0.9}

.diagram.type1 .step_list li.step5 strong{background:#742630;opacity:0.9}

.diagram.type1 .step_list li.step6 strong{background:#351d20;opacity:0.9}

.diagram.type1 .step_list li div{height:128px;margin:0 0 0 300px;padding-top:20px;padding-left:34px;border-top:1px solid #e1e1e1}

.diagram.type1 .step_list li:first-child div{border:none}

.diagram.type1 .step_list li div:after{display:inline-block;vertical-align:middle;content:''}

.diagram.type1 .step_list li strong:after{display:block;position:absolute;top:10px;left:50%;z-index:10;width:13px;height:7px;margin-left:-7px;background:url(/images/common/content/arr_step_list.png) no-repeat;content:''}

.diagram.type1 .step_list li:first-child strong:after{display:none}

.diagram.type1 .step_list li div:after{display:inline-block;vertical-align:middle;content:''}

.diagram.type1 .step_list li div ul{display:inline-block;margin:0;vertical-align:middle}

.diagram.type1 .step_list li div li{overflow:auto;margin-top:0}
}


@media all and (max-width: 768px){
.diagram.type1 .step_list li strong span {text-align: left;display: block !important;}



}

.diagram{}
.diagram.type2 .title{width:100%;overflow:hidden;}
.diagram.type2 .title ul{display:block;overflow:hidden;padding:20px 0px;border-bottom:1px solid #333;}
.diagram.type2 .title ul li{float:left;text-align:center;font-size:20px;font-weight:600;color:#2364dc;}
.diagram.type2 .title ul li:first-child{width:30%;}
.diagram.type2 .title ul li:last-child{width:70%;}


.diagram.type2 .step_list{word-break: keep-all; margin-top: 11px;}

.diagram.type2 .step_list li{position:relative;margin-top:0px}

.diagram.type2 .step_list li:first-child{margin-top:0}

.diagram.type2 .step_list li:first-child:before{display:none}

.diagram.type2 .step_list li:before{display:block;position:absolute;top:-20px;left:50%;width:15px;height:9px;margin-left:-7px;background:url(/images/lab/sub03/arr_diagram_320.png) no-repeat;content:''}

.diagram.type2 .step_list li strong{display:block;margin-bottom:0;padding:15px;font-size:16px;color:#000}

.diagram.type2 .step_list li.step1 strong{border:2px solid #2364dc;background:#fff;font-weight:600;}

.diagram.type2 .step_list li.step2 strong{border:2px solid #2364dc;background:#fff;font-weight:600;}

.diagram.type2 .step_list li.step3 strong{border:2px solid #2364dc;background:#fff;font-weight:600;}

.diagram.type2 .step_list li.step4 strong{border:2px solid #2364dc;background:#fff;font-weight:600;}

.diagram.type2 .step_list li.step5 strong{border:2px solid #2364dc;background:#fff;font-weight:600;}

.diagram.type2 .step_list li.step6 strong{border:2px solid #2364dc;background:#fff;font-weight:600;}

.diagram.type2 .step_list li div{padding:15px}

.diagram.type2 .step_list li div b{display:block;font-size:18px;font-weight:normal}

.diagram.type2 .step_list li.step1 b{color:#e54c37}

.diagram.type2 .step_list li.step2 b{color:#dc2339}

.diagram.type2 .step_list li.step3 b{color:#c2182d}

.diagram.type2 .step_list li.step4 b{color:#742630}

.diagram.type2 .step_list li.step5 b{color:#351d20}

.diagram.type2 .step_list li div ul{margin:0}

.diagram.type2 .step_list li div li{overflow:auto;margin-top:0}

@media all and (min-width: 768px){
.diagram.type2 .step_list li span{display:block}

.diagram.type2 .step_list li{overflow:hidden;margin-top:0px;margin-bottom:5px;}

.diagram.type2 .step_list li:after{display:block;visibility:hidden;clear:both;content:''}

.diagram.type2 .step_list li:before{display:none;}

.diagram.type2 .step_list li strong{float:left;position:relative;width:317px;height:auto;min-height:150px;
									margin-bottom:0;padding:20px 50px;line-height:24px;color:#333;text-align:center}
.diagram.type2 .step_list li strong p{color:#333;font-size:14px;margin-top:20px;}

.diagram.type2 .step_list li strong:before{background:url(/images/common/content/arr_step_list.png) no-repeat}

.diagram.type2 .step_list li.step1 strong{border-radius:20px;/*background:#e54c37;*/opacity:0.9}

.diagram.type2 .step_list li.step2 strong{border-radius:20px;/*background:#dc2339;*/opacity:0.9}

.diagram.type2 .step_list li.step3 strong{border-radius:20px;/*background:#c2182d;*/opacity:0.9}

.diagram.type2 .step_list li.step4 strong{border-radius:20px;/*background:#982836;*/opacity:0.9}

.diagram.type2 .step_list li.step5 strong{border-radius:20px;/*background:#742630;*/opacity:0.9}

.diagram.type2 .step_list li.step6 strong{border-radius:20px;/*background:#351d20;*/opacity:0.9}

.diagram.type2 .step_list li div{height:128px;margin:0 0 0 317px;padding-left:34px;border-top:1px solid #e1e1e1}

.diagram.type2 .step_list li:first-child div{border:none}

.diagram.type2 .step_list li div:after{display:inline-block;height:100%;vertical-align:middle;content:''}



.diagram.type2 .step_list li:first-child strong:after{display:none}

.diagram.type2 .step_list li div:after{display:inline-block;height:100%;vertical-align:middle;content:''}

.diagram.type2 .step_list li div ul{display:inline-block;margin:0;vertical-align:middle}

.diagram.type2 .step_list li div li{overflow:auto;margin-top:0}
}


@media all and (max-width: 768px){
.diagram.type2 .title{display:none;}

}

</style>





<h2>당진시 지속가능발전 기본계획</h2>

<figure class="uibodo01 mt_10">
	<span class="thm_figure01"><img src="/images/kor/sub03/2035_img03.jpg" alt="당진시 지속가능발전 기본계획"></span>
	<figcaption class="thm_caption01">
		<!--<h3 class="tit_inner">주요정보</h3>-->
		<ul class="list_1st">
			<li><strong>기준년도 :</strong>2018년</li> 
			<li><strong>계획범위 :</strong>(시간적) 2018~2035, (공간적) 당진시 전역</li> 
			<li><strong>내   용 :</strong>지속가능발전 관련 인식 현황, 당진시 지속가능발전 비전, 목표 및 전략이행계획 수립원칙 및 작성 가이드라인지속가능발전 지표 및 추진체계</li> 
		</ul>
		<a class="btn btn-ani btn-file" href="/gonet/FileDownload.do?fileName=sub03_11_03_A.pdf&amp;code=download/kor/sub03/"><span class="bico bticon left acrobat">pdf 파일 다운로드</span>
		당진시 2035 지속가능발전 기본계획</a>
	</figcaption>
</figure>



<h2>당진시 지속가능발전목표와 전략</h2>
<table class="tbl_basic center">
	<caption>
		<strong>당진시 지속가능발전목표와 전략</strong>
		<p>당진시 지속가능발전목표와 전략을 안내하는 표입니다. UN SDGs, 당진시 SDGs, 당진시 전략으로 나뉘어 자료를 제공하고 있습니다.</p>
	</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:30%;">
		<col style="width:50%;">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">UN SDGs</th>
			<th scope="col">당진시 SDGs</th>
			<th scope="col">당진시 전략</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><img src="/images/kor/sub03/0311_01.jpg" alt="빈곤근절"><p class="mt_10">빈곤근절</p></td>
			<td>G1 절대빈곤층이 없는 당진</td>
			<td>
				<ul class="list_1st">
					<li>1.1 도시와 농촌의 소득격차 완화</li>
					<li>1.2 취약계층 경제적 자립기반 형성</li>
					<li>1.3 노인빈곤 해소(은퇴빈곤층 자립기반 구축)</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_02.jpg" alt="기아해결"><p class="mt_10">기아해결</p></td>
			<td>G2 전략산업으로서의 농업기반 강화</td>
			<td>
				<ul class="list_1st">
					<li>2.1 농업특화</li>
					<li>2.2 친환경 웰빙 농산물 생산기반 구축</li>
					<li>2.3 3농혁신</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_03.jpg" alt="보건웰빙"><p class="mt_10">보건웰빙</p></td>
			<td>G3 건강한 삶 보장</td>
			<td>
				<ul class="list_1st">
					<li>3.1 생활체육 여건 조성</li>
					<li>3.2 교통사고율 전국평균 이하로 줄이기</li>
					<li>3.3 호흡기질환(질병발생률) 절반으로 줄이기</li>
					<li>3.4 안전한 먹거리 보급</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_04.jpg" alt="교육"><p class="mt_10">교육</p></td>
			<td>G4 맞춤형 교육도시</td>
			<td>
				<ul class="list_1st">
					<li>4.1 생애주기별 맞춤형 교육프로그램 확충</li>
					<li>4.2 교육 만족도 10% 향상</li>
					<li>4.3 문화 불평등 완화</li>
					<li>4.4 참여형 문화공동체 구축</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_05.jpg" alt="성평등"><p class="mt_10">성평등</p></td>
			<td>G5 실질적인 성평등 달성</td>
			<td>
				<ul class="list_1st">
					<li>5.1 의사결정과정 여성참여 확대</li>
					<li>5.2 돌봄 및 보육의 평등과 지원체계 강화</li>
					<li>5.3 아동, 여성의 안전을 보장하는 사회기반 조성</li>					
				</ul>
			</td>

		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_06.jpg" alt="물과위생"><p class="mt_10">물과위생</p></td>
			<td>G6 물 걱정 없는 도시</td>
			<td>
				<ul class="list_1st">
					<li>6.1 물순환 개선</li>
					<li>6.2 상수도 관리체계 개선</li>
					<li> 6.3 수자원 보호</li>					
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_07.jpg" alt="에너지"><p class="mt_10">에너지</p></td>
			<td>G7 에너지 정의 실현</td>
			<td>
				<ul class="list_1st">
					<li>7.1 친환경 에너지 전환</li>
					<li>7.2 에너지 수요관리</li>
					<li>7.3 대안적 송전체계 마련</li>					
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_08.jpg" alt="일자리경제"><p class="mt_10">일자리경제</p></td>
			<td>G8 누구나 일할 수 있는 경제환경 조성</td>
			<td>
				<ul class="list_1st">
					<li>8.1 친환경산업 육성</li>
					<li>8.2 일자리 양극화 해소</li>
					<li>8.3 지역 내 순환경제 구축</li>					
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_09.jpg" alt="산업혁신"><p class="mt_10">산업혁신</p></td>
			<td>G9 미래 전략산업 육성을 위한 기반 구축</td>
			<td>
				<ul class="list_1st">
					<li>9.1 4차산업 기술 육성</li>
					<li>9.2 6차산업 활성화</li>
					<li>9.3 친환경산업 기반 구축</li>					
				</ul>
			</td>

		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_10.jpg" alt="불평등완화"><p class="mt_10">불평등완화</p></td>
			<td>G10 불평등 없는 지역공동체 구현</td>
			<td>
				<ul class="list_1st">
					<li>10.1 지역권역별 균형발전</li>
					<li>10.2 노동 불평등 완화</li>
					<li>10.3 사회적 약자를 위한 제도 강화</li>					
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_11.jpg" alt="도시공동체"><p class="mt_10">도시공동체</p></td>
			<td>G11 사람 중심의 도시공간 조성</td>
			<td>
				<ul class="list_1st">
					<li>11.1 도시공원 확대</li>
					<li>11.2 지역문화자원과 연계한 도시재생 활성화</li>
					<li>11.3 친환경 교통체계 구축</li>
					<li>11.4 주거복지 강화</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_12.jpg" alt="소비생산"><p class="mt_10">소비생산</p></td>
			<td>G12 지속가능한 지역 소비체계 구축</td>
			<td>
				<ul class="list_1st">
					<li>12.1 로컬푸드 유통체계 확립</li>
					<li>12.2 자원순환 활성화</li>
					<li>12.3 공유경제 확대</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_13.jpg" alt="기후행동"><p class="mt_10">기후행동</p></td>
			<td>G13 국가목표 수준 온실가스 감축</td>
			<td>
				<ul class="list_1st">
					<li>13.1 이산화탄소 배출 획기적 감축</li>
					<li>13.2 신재생에너지 확대</li>
					<li>13.3 기후재난 복원력 증대</li>
					<li>13.4 농어업 기후변화 적응대책</li>
				</ul>
			</td>

		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_14.jpg" alt="해양생태계"><p class="mt_10">해양생태계</p></td>
			<td>G14 해양생태계 건강성 유지</td>
			<td>
				<ul class="list_1st">
					<li>14.1 해양 생물자원 보호</li>
					<li>14.2 해양환경 개선</li>
					<li>14.3 해양 보전지역 확대</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_15.jpg" alt="육상생태계"><p class="mt_10">육상생태계</p></td>
			<td>G15 친환경도시를 위한 생물다양성 확보</td>
			<td>
				<ul class="list_1st">
					<li>15.1 도심지역 생태공간 확보</li>
					<li>15.2 수생태계 복원</li>
					<li>15.3 토양의 건강성 확보</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_16.jpg" alt="평화정의제도"><p class="mt_10">평화정의제도</p></td>
			<td>G16 시민 누구나 존중받는 도시</td>
			<td>
				<ul class="list_1st">
					<li>16.1 인권도시 만들기</li>
					<li>16.2 지역사회의 투명성 강화</li>
					<li>16.3 안전한 도시기반 구축</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td><img src="/images/kor/sub03/0311_17.jpg" alt="파트너십"><p class="mt_10">파트너십</p></td>
			<td>G17 지속가능발전을 위한 네트워크 구축</td>
			<td>
				<ul class="list_1st">
					<li>17.1 지역산업과 동반성장을 위한 상생협력체계 구축</li>
					<li>17.2 참여적 의사결정 확대</li>
					<li>17.3 갈등관리</li>
					<li>17.4 글로벌 네트워크 참여</li>
					<li>17.5 지구의제 시민교육 확대</li>
				</ul>
			</td>
		</tr>
	</tbody>
</table>


<h2>당진시 지속가능발전 지표(대표지표)</h2>


<table class="tbl_basic center">
	<caption>
		<strong>당진시 지속가능발전 지표(대표지표)</strong>
		<p>당진시 지속가능발전 지표(대표지표)를 안내하는 표입니다.  목표, 대표지표, 관리부서로 나뉘어 자료를 제공하고 있습니다.</p>
	</caption>
	<colgroup>
		<col style="width:30%;">
		<col style="width:50%;">
		<col style="width:20%;">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">목표</th>
			<th scope="col">대표지표</th>
			<th scope="col">관리부서</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>G1 절대빈곤층이 없는 당진</td>
			<td>1.1. 사회복지비 비율</td>
			<td>사회복지과</td>
		</tr>
		<tr>
			<td>G2 전략산업으로서의 농업기반강화</td>
			<td>2.3. 농업인 월급제 약정 농가 수</td>
			<td>농업정책과</td>
		</tr>
		<tr>
			<td>G3 건강한 삶 보장</td>
			<td>3.4. 아동 환경성 질환 유병률</td>
			<td>건강증진과</td>
		</tr>
		<tr>
			<td>G4 맞춤형 교육도시</td>
			<td>4.3. 문화예술공연 및 전시개최 횟수와 관람자 수</td>
			<td>문화관광과</td>
		</tr>
		<tr>
			<td>G5 실질적인 성평등 달성</td>
			<td>5.2. 성별영향평가 수행정책 비율</td>
			<td>여성가족과</td>
		</tr>
		<tr>
			<td rowspan="2">G6 물걱정 없는 도시</td>
			<td>6.2. 빗물활용도</td>
			<td>수도과</td>
		</tr>
		<tr>
			<td>6.7. 하천오염도(BOD)</td>
			<td>환경정책과</td>
		</tr>
		<tr>
			<td>G7 에너지 정의 실현</td>
			<td>7.2. 신재생에너지 생산량</td>
			<td>경제에너지과</td>
		</tr>
		<tr>
			<td>G8 누구나 일할 수 있는 경제환경 조성</td>
			<td>8.4. 사회적경제 기업 수, 고용인원 수</td>
			<td>기업지원과, 사회복지과</td>
		</tr>
		<tr>
			<td>G9 미래 전략산업 육성을 위한 기반 구축</td>
			<td>9.4. 농촌체험프로그램 이용자수 </td>
			<td>지도개발과</td>
		</tr>
		<tr>
			<td>G10 불평등 없는 지역공동체 구현</td>
			<td>10.1. 장애인 고용률</td>
			<td>경로장애인과, 경제에너지과</td>
		</tr>
		<tr>
			<td>G11 사람 중심의 도시공간 조성</td>
			<td>11.3. 1인당 도시공원 면적</td>
			<td>산림녹지과</td>
		</tr>
		<tr>
			<td>G12 지속가능한 지역 소비체계 구축</td>
			<td>12.1. 지속가능한 공공물품 구매 비율</td>
			<td>기업지원과, 경로장애인과, 여성가족과</td>
		</tr>
		<tr>
			<td>G13 국가목표 수준 온실가스 감축</td>
			<td>13.2. 미세먼지(PM10) 기준 초과일수</td>
			<td>환경정책과</td>
		</tr>
		<tr>
			<td rowspan="2">G14 해양생태계 건강성 유지</td>
			<td>14.2. 연안 수질오염도 (COD)(미래지표)</td>
			<td>항만수산과</td>
		</tr>
		<tr>
			<td>14.4. 연안 어장 환경개선 면적 비율</td>
			<td>항만수산과</td>
		</tr>
		<tr>
			<td>G15 친환경도시를 위한 생물다양성 확보</td>
			<td>15.2. 하천생태계 건강성(미래지표)</td>
			<td>환경정책과</td>
		</tr>
		<tr>
			<td>G16 시민 누구나 존중받는 도시</td>
			<td>16.2. 공공기관청렴도</td>
			<td>감사법무담당관</td>
		</tr>
		<tr>
			<td>G17 지속가능발전을 위한 네트워크 구축</td>
			<td>17.1. 민원만족도</td>
			<td>민원정보과</td>
		</tr>
		<tr>
			<td>17.5. 참여예산 비율</td>
			<td>기획예산담당관</td>
		</tr>
	</tbody>
</table>




<h2>당진시 지속가능발전 정책 추진 과정</h2>

<div class="diagram type1 mt_30">
  <ul class="step_list">
    <li class="step1"> <strong><span>2015</span>지속가능발전 거버넌스 발족/지원의제21 &rarr; 당진시지속가능발전협의회</strong>
      <div>
		<ul class="list_1st">
			<li>당진시 지속가능발전협의회 설치 운영조례 제정</li>
			<li>당진시 지속가능발전협의회 발족 및 1기 위원구성 (5개분과 | 110명)</li>
			<li>분과별 지속가능발전 의제 발굴 등 운영 활성화</li>
		</ul>
	  </div>
    </li>
	<li class="step2"> <strong><span>2016</span>지속가능발전 지역 여건 분석 with 전국지속가능발전협의회</strong>
      <div>
		<ul class="list_1st">
			<li>지속가능발전 로드맵 | 추진기반 및 체계 마련, 추진체계 운영</li>
			<li>지속가능발전 제도 구축 | 전담조직 구성, 거버넌스 활성화 방안, 기본조례 제정 등</li>
			<li>당진시 지속가능발전협의회 역할 및 전망<br>
				<ul class="list_2st">
					<li>주민자치위와 연계노력, 시의회 공조 유지 등</li>
				</ul>
			</li>
			<li>지속가능발전 추진역량 강화 교육 (공무원, 시민, 기업체 대상)</li>
		</ul>
	  </div>
    </li>
	<li class="step3"> <strong><span>2017</span>당진시 지속가능발전 기본계획 수립 17개 목표, 57개 전략 | 88개 지표</strong>
      <div>
		<ul class="list_1st">
			<li>UN지속가능발전목표와 직접 연계한 17개 지속가능발전목표 수립</li>
			<li>당진시 지속가능발전 비전 선포식(당진시, 시의회, 지속협)</li>
			<li>지속가능발전 이행계획 수립</li>
		</ul>
	  </div>
    </li>
	<li class="step4"> <strong><span>2018</span>지속가능발전 이행체계 본격 가동 전담조직 구성 | 협력사업 추진</strong>
      <div>
		<ul class="list_1st">
			<li>지속가능발전지표 중장기 목표 설정(부서 및 거버넌스 목표, 지표현황 조사)</li>
			<li>지속가능발전 역량강화 교육 (지역전문가 양성 및 공무원 교육)</li>
			<li>시정 업무계획과 연계(`19년도 시책구상 및 주요업무계획 대상)</li>
			<li>지속가능발전 이행 전담조직 구성</li>
			<li>이행계획 추진상황 모니터링 (추진상황 및 성과지표 현황)</li>
		</ul>
	  </div>
    </li>
	<li class="step5"> <strong><span>2019</span>지속가능발전 이행체계 고도화 추진 지속가능성제고 중점과제와 성과지표 중심 이행체계 개편 종합성과평가시스템 반영</strong>
      <div>
		<ul class="list_1st">
			<li>지속가능발전 간부공무원 평가시행</li>
			<li>지속가능발전 이행계획 고도화 추진<br>
				<ul class="list_2st">
					<li>54개 부서, 108개 중점과제</li>
					<li>112개 단위사업, 124개 성과지표 작성</li>
				</ul>
			</li>
		</ul>
	  </div>
    </li>
  </ul>
</div>




<h2>당진시 지속가능발전 이행계획 수립 과정</h2>


<div class="diagram type2">
	<div class="title">
		<ul>
			<li>수립절차</li>
			<li>추진내용</li>
		</ul>
	</div>

  <ul class="step_list">
    <li class="step1"> <strong>비전 및 전략과 연계 기존사업사전검토 / 이행계획 구성 체계 확정<p>2017.7~8</p></strong>
      <div>
		<ul class="list_1st">
			<li>당진 지속가능발전 비전, 목표와 부합되는 핵심사업, 중점관리사업 등 검토</li>
			<li>이행계획 구성, 체계 개발 및 확정 / 작성 가이드라인 도출<br>
				(연구진, 기획예산담당관 업무협의)</li>
		</ul>
	  </div>
    </li>
	<li class="step2"> <strong>부서 공무원대상 설명회<p>2017.9.14</p></strong>
      <div>
		<ul class="list_1st">
			<li>이행계획 작성 부서 담당자 관련 교육 실시</li>
		</ul>
	  </div>
    </li>
	<li class="step3"> <strong>이행계획(안) 작성<p>2017.10.11</p></strong>
      <div>
		<ul class="list_1st">
			<li>세부사업, 성과지표, 추진계획 등 작성(소관 국과)</li>
		</ul>
	  </div>
    </li>
	<li class="step4"> <strong>검토 의견작성<p>2017.10.18</p></strong>
      <div>
		<ul class="list_1st">
			<li>거버넌스를 통한 공유 및 보완사항 도출<br>
			(지속가능발전협의회 의견수렴)</li>
		</ul>
	  </div>
    </li>
	<li class="step3"> <strong>이행계획(안) 검토<p>(2017.11) </p></strong>
      <div>
		<ul class="list_1st">
			<li>지속가능발전협의회(정책위) 의견수렴 연석회의</li>
			<li>민관합동 워크숍 (11.13)</li>
		</ul>
	  </div>
    </li>
	<li class="step4"> <strong>이행계획(안) 마련<p>(2017.11)</p></strong>
      <div>
		<ul class="list_1st">
			<li>지속가능발전협의회 및 시장 보고</li>
		</ul>
	  </div>
    </li>
  </ul>
</div>



<h2>당진시 지속가능발전 추진체계 운영 매뉴얼</h2>

<div class="imgbox mt_20"><img src="/images/kor/sub03/2035_img04.jpg" alt="지속가능발전위원회, 지속가능발전가치, 지속가능발전 가치 확산, 외부시민사회, 요구수렴, 결과소통, 지속가능발전 지표 진단, 진단결과, 지속가능 발전 이행계획 수정보완, 참여유도, 요구수렴, 부서의 정책 집행"></div>

