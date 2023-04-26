<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!--<div class="wrap_kordium">
	<div class="kordium_img"><img src="/images/kor/sub06/sub06_img01.jpg"></div>
		<div class="kordium_box">
			<div class="kordium_up">
				<p class="kordium_smalltit">
					<span>ㄴㄹㄴㄹ</span>
				</p>
				<span class="kordium_tit">ㄴㄹㄴㄹ</span>
			</div>
			<div class="kordium_down">
				<ul class="list_1st">
					<li>ㄴㄹㄴㄹ</li>
					<li>ㄴㄹㄴㄹ</li>
					
				</ul>
			</div>
		</div>
</div>-->


<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b476729042a77d97c951b8eb6afdac27" type="text/javascript"></script><script charset="UTF-8" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/3.5.11/1481522929979/open.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				var position = new daum.maps.LatLng( 36.9260090, 126.5967720 );

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
					content: '고대면'
				});
				infowindow.open(map, marker);
			}
		</script>

<div class="view_info sub06_topbx">
	<div class="l_img"><img src="/images/kor/sub06/sub06_img03.jpg" alt="고대면 행정복지센터 이미지"></div>
	<div class="rbgw">
		<div class="bbg">
			<span class="baricon"></span>
			<h2>고대면 사무소</h2>
			<ul>
				<li><span>주소 :</span> [31793] 충청남도 당진시 고대면 구장터길 9</li>
				<li><span>전화번호 :</span> 041)360-8151~2</li>
			</ul>
		</div>
		<div class="gbg">
			<p><a href="http://map.daum.net/?urlX=410165&urlY=952170&q=%EC%B6%A9%EB%82%A8+%EB%8B%B9%EC%A7%84%EC%8B%9C+%EA%B3%A0%EB%8C%80%EB%A9%B4+%EA%B5%AC%EC%9E%A5%ED%84%B0%EA%B8%B8+9" target="_blank" title="새창">다음길찾기</a></p>
		</div>
	</div>
</div>
	
<div id="map" class="map"></div>
<!--
<div class="box_local">
	<h2><span>고대면</span></h2>
	<ul class="lst_local">
		<li><b>주소</b>[31793] 충청남도 당진시 고대면 구장터길 9 </li>
		<li><b>전화번호</b>041)360-8151~2</li>
		<li class="last">
		<a href="http://map.daum.net/?urlX=410165&urlY=952170&q=%EC%B6%A9%EB%82%A8+%EB%8B%B9%EC%A7%84%EC%8B%9C+%EA%B3%A0%EB%8C%80%EB%A9%B4+%EA%B5%AC%EC%9E%A5%ED%84%B0%EA%B8%B8+9" target="_blank"><span class="ico_local ico3"></span>다음 길찾기</a></li>
	</ul>
</div>
-->
