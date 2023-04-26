<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b476729042a77d97c951b8eb6afdac27" type="text/javascript"></script><script charset="UTF-8" src="https://s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/3.5.11/1481522929979/open.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				var position = new daum.maps.LatLng( 36.904111, 126.699442 );

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
					content: '송악읍'
				});
				infowindow.open(map, marker);
			}
		</script>
<div class="view_info sub06_topbx">
	<div class="l_img"><img src="/images/kor/sub06/sub06_img02.jpg?ver=20221020" alt="송악읍 행정복지센터 이미지"></div>
	<div class="rbgw">
		<div class="bbg">
			<span class="baricon"></span>
			<h2>송악읍 사무소</h2>
			<ul>
				<li><span>주소 :</span> 충청남도 당진시 송악읍 반촌로 150, 3층</li>
				<li><span>전화번호 :</span> 041-360-8071</li>
			</ul>
		</div>
		<div class="gbg">
			<p><a href="http://kko.to/bByuzBWf1" target="_blank" title="새창">다음길찾기</a></p>
		</div>
	</div>
</div>	
<div id="map" class="map"></div>
<!--
<div class="box_local">
	<h2><span>송악읍</span></h2>
	<ul class="lst_local">
		<li><b>주소</b>[31733] 충청남도 당진시 송악읍 반촌로 59</li>
		<li><b>전화번호</b>041)360-8073~4</li>
		<li class="last">
		<a href="http://map.daum.net/?urlX=430981&urlY=945800&q=%EC%B6%A9%EB%82%A8+%EB%8B%B9%EC%A7%84%EC%8B%9C+%EC%86%A1%EC%95%85%EC%9D%8D+%EB%B0%98%EC%B4%8C%EB%A1%9C+59" target="_blank"><span class="ico_local ico3"></span>다음 길찾기</a></li>
	</ul>
</div>
-->
