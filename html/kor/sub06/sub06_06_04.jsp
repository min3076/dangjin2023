<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

												
														
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b476729042a77d97c951b8eb6afdac27" type="text/javascript"></script><script charset="UTF-8" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/3.5.11/1481522929979/open.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				var position = new daum.maps.LatLng( 36.8999321,126.5042331 );

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
					content: '대호지면'
				});
				infowindow.open(map, marker);
			}
		</script>


<div class="view_info sub06_topbx">
	<div class="l_img"><img src="/images/kor/sub06/sub06_img05.jpg" alt="대호지면 행정복지센터 전경 이미지"></div>
	<div class="rbgw">
		<div class="bbg">
			<span class="baricon"></span>
			<h2>대호지면 사무소</h2>
			<ul>
				<li><span>주소 :</span> [31798] 충청남도 당진시 대호지면 4.4만세로 55-1</li>
				<li><span>전화번호 :</span></li>
				<li><b>&middot;</b> 총무팀 041) 360-8251 / 산업팀 8280</li>
				<li><b>&middot;</b> 민원팀 041) 360-8270 / 맞춤형복지팀 8260</li>
			</ul>
		</div>
		<div class="gbg">
			<p><a href="http://map.daum.net/?urlX=389518&amp;urlY=945085&amp;q=%EC%B6%A9%EB%82%A8+%EB%8B%B9%EC%A7%84%EC%8B%9C+%EB%8C%80%ED%98%B8%EC%A7%80%EB%A9%B4+4.4%EB%A7%8C%EC%84%B8%EB%A1%9C+55-1" title="새창열림" target="_blank">다음길찾기</a></p>
		</div>
	</div>
</div>
	
<div id="map" class="map"></div>
<!--
<div class="box_local">
	<h2><span>대호지면</span></h2>
	<ul class="lst_local">
		<li><b>주소</b>[31798] 충청남도 당진시 대호지면 4.4만세로 55-1</li>
		<li><b>전화번호</b>041)360-8251~2</li>
		<li class="last">
		<a href="http://map.daum.net/?urlX=389518&urlY=945085&q=%EC%B6%A9%EB%82%A8+%EB%8B%B9%EC%A7%84%EC%8B%9C+%EB%8C%80%ED%98%B8%EC%A7%80%EB%A9%B4+4.4%EB%A7%8C%EC%84%B8%EB%A1%9C+55-1" target="_blank"><span class="ico_local ico3"></span>다음 길찾기</a></li>
	</ul>
</div>
-->
