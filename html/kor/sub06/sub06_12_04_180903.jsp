<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=b476729042a77d97c951b8eb6afdac27" type="text/javascript"></script><script charset="UTF-8" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/3.5.11/1481522929979/open.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				var position = new daum.maps.LatLng( 36.9325280, 126.6790200 );

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
					content: '송산면'
				});
				infowindow.open(map, marker);
			}
		</script>

<div class="view_info sub06_topbx">
	<div class="l_img"><img src="/images/kor/sub06/sub06_img11.jpg" alt="송산면 전경"></div>
	<div class="rbgw">
		<div class="bbg">
			<span class="baricon"></span>
			<h2>송산면 사무소</h2>
			<ul>
				<li><span>주소 :</span> [31714] 충청남도 당진시 송산면 상거중앙길 57</li>
				<li><span>전화번호 :</span> 041)360-8561~2</li>
			</ul>
		</div>
		<div class="gbg">
			<p><a href="http://map.daum.net/?urlX=428488&urlY=953926&q=%EC%B6%A9%EB%82%A8+%EB%8B%B9%EC%A7%84%EC%8B%9C+%EC%86%A1%EC%82%B0%EB%A9%B4+%EC%83%81%EA%B1%B0%EC%A4%91%EC%95%99%EA%B8%B8+57" target="_blank">다음길찾기</a></p>
		</div>
	</div>
</div>
	
<div id="map" class="map"></div>
<!--
<div class="box_local">
	<h2><span>송산면</span></h2>
	<ul class="lst_local">
		<li><b>주소</b>[31714] 충청남도 당진시 송산면 상거중앙길 57</li>
		<li><b>전화번호</b>041)360-8561~2</li>
		<li class="last">
		<a href="http://map.daum.net/?urlX=428488&urlY=953926&q=%EC%B6%A9%EB%82%A8+%EB%8B%B9%EC%A7%84%EC%8B%9C+%EC%86%A1%EC%82%B0%EB%A9%B4+%EC%83%81%EA%B1%B0%EC%A4%91%EC%95%99%EA%B8%B8+57" target="_blank"><span class="ico_local ico3"></span>다음 길찾기</a></li>
	</ul>
</div>
-->
