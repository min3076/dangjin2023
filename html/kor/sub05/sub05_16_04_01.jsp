<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h2>연혁</h2>
<div class="history_box">
	<div class="history_bg">
		<p class="tit">HISTORY<span>Since 1997~</span></p>
	</div>
	<ul class="list_1st">
		<li>
			<span class="year">2011.12.26.</span>
			<span class="info">2단계 지붕형 매립시설(태양광 겸비) 준공</span>
		</li>
		
		<li>
			<span class="year">2010.12.02.</span>
			<span class="info">1단계 흙제방 증축공사 준공</span>
		</li>
		
		<li>
			<span class="year">2008.12.05.</span>
			<span class="info">위생매립장 2단계 착공</span>
		</li>
		
		<li>
			<span class="year">2000.08.31.</span>
			<span class="info">위생매립장 1단계 준공</span>
		</li>
		
		<li>
			<span class="year">1997.12.26.</span>
			<span class="info">위생매립장 조성공사 착공</span>
		</li>
		<li>
			<span class="year">1997.07.26.</span>
			<span class="info">폐기물처리시설 설치 승인</span>
		</li>
	</ul>
</div>

<h2>일반현황</h2>
	<ul class="list_1st">
		<li>위치 : 충남 당진시 송산면 석문방조제로 525</li>
		<li>사업면적 : 240,000㎡
			<ul class="list_2st">
				<li>1단계 매립용량 : 425,989㎥(흙제방 포함)</li>
				<li>2단계 매립용량 : 257,898㎥ </li>
			</ul>
		</li>
		<li>매립방법 : 준호기성 위생매립</li>
		<li>침출수처리 : 80톤/일</li>
	</ul>

<h2>주요시설</h2>
<p class="txtp">매립시설, 재활용선별센터, 대형폐기물 파쇄시설, 음식물류자원화시설, 가축분뇨지역단위 통합센터</p>


<h2>견학안내</h2>
<ul class="list_1st">
	<li>견학시간 : 월∼금(공휴일 제외)</li>
	<li>대 상 : 학교, 기관, 단체, 시민</li>
	<li>견학내용 : 쓰레기매립 및 재활용품 처리과정</li>
	<li>문 의 : 견학 희망시 공문 또는 사전연락〔☏ 350-4340~7, (FAX) 350-4349</li>
</ul>


<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b476729042a77d97c951b8eb6afdac27" type="text/javascript"></script>
<script type="text/javascript">
	window.onload = function() {
		var position = new daum.maps.LatLng( 36.9864160, 126.6840790 );

		var map = new daum.maps.Map(document.getElementById('map'), {
			center: position,
			level: 5,
			mapTypeId: daum.maps.MapTypeId.ROADMAP
		});

		var marker = new daum.maps.Marker({
			position: position
		});
		marker.setMap(map);

		var infowindow = new daum.maps.InfoWindow({
			content:'당진시자원순환센터'
		});
		infowindow.open(map, marker);
	}
</script>



<h2>찾아오시는길</h2>

<div id="map" class="map"></div>
<div class="box_local">
	<h2><span>당진시자원순환센터</span></h2>
	<ul class="lst_local">
		<li><b>주소</b>충청남도 당진시 송산면 가곡리 </li>
	</ul>
</div>

