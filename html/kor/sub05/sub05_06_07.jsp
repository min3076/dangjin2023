<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="ui uit type1 bgw mb_30 list">
    <div class="inner icowrap">
       <span class="tp_icon circle circle1">
            <span class="tp_icon icon icon1"></span>
        </span>
        <div class="txtwrap">
            <strong class="tit_inner">착한가격업소란?</strong>
            <ul class="list_1st">
            	<li>착한가격, 청결한 가게 운영, 기분 좋은 서비스 제공으로 소비자에게 만족을 드리기 위해 정부에서 선정한 우수 업소가 바로 "착한가격업소" 입니다.</li>
            	<li>당진시에 있는 가격업소를 보시면 항상 안심하고 즐겁게 이용해주세요</li>
            </ul>
        </div>            
    </div>    
</div>

<div class="basic_box">
	<div class="inner">
		<form name="searchForm" method="post" action="#">
			
			<fieldset>
				<legend class="hide">게시물검색</legend>
				<p class="board_total">
					<span class="bold red">총게시물 :</span>
					12
				</p>
				<div class="basic_search">
					<div class="grap">
						<select name="searchCondition">
							<option value="name">업소명</option>
							<option value="addr">주소</option>
						</select>
					</div>
					<div class="searchinput">
						<label class="flow" for="searchKeyword" style="position: absolute;">검색어를 입력해주세요.</label>
						<input type="text" id="searchKeyword" name="searchKeyword" title="검색어입력" value="">
						<input type="submit" value="검색">
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>

<div class="btn_wrap right mb_10">
	<a class="btn btn-ani btn-file" href="#">
		<span class="bico bticon left excel"></span>
		엑셀 다운로드
	</a>
</div>

<table class="tbl_basic center">
	<caption>
		<strong>착한가격업소 표</strong>
		<details>
			<p>착한가격업소 목록 입니다.업소명, 대표품목, 가격(원), 연락처, 주소, 지도로 보기로 구분하여 안내합니다.</p>
		</details>
	</caption>
	<colgroup>
		<col style="width:15%;">
		<col style="width:18%;">
		<col style="width:15%;">
		<col style="width:15%;">
		<col style="width:27%;">
		<col style="width:10%;">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">업소명</th>
			<th scope="col">대표품목</th>
			<th scope="col">가격(원)</th>
			<th scope="col">연락처</th>
			<th scope="col">주소</th>
			<th scope="col">지도로 보기</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>서울미용실</td>
			<td class="left">파마</td>
			<td>15,000</td>
			<td>041-355-6378</td>
			<td class="left">송악읍 기지시2길 9-9</td>
			<td><a class="bico bticon home" href="http://map.daum.net/?urlX=431058&urlY=946238&q=%EC%B6%A9%EB%82%A8+%EB%8B%B9%EC%A7%84%EC%8B%9C+%EC%86%A1%EC%95%85%EC%9D%8D+%EA%B8%B0%EC%A7%80%EC%8B%9C2%EA%B8%B8+9-9" title="새창으로 이동합니다." target="_blank"></a></td>
		</tr>
		<tr>
			<td>다디미</td>
			<td class="left">두부,김치찌개</td>
			<td>5,000</td>
			<td>041-356-0513</td>
			<td class="left">서부로 85-17(채운동)</td>
			<td><a class="bico bticon home" href="http://map.daum.net/?urlX=416556&urlY=942377&q=%EC%B6%A9%EB%82%A8+%EB%8B%B9%EC%A7%84%EC%8B%9C+%EC%84%9C%EB%B6%80%EB%A1%9C+85-17" title="새창으로 이동합니다." target="_blank"></a></td>
		</tr>
		<tr>
			<td>가나안분식</td>
			<td class="left">칼국수</td>
			<td>4,000</td>
			<td>041-353-4141</td>
			<td class="left">당진시장길 27-30(읍내동)</td>
			<td><a class="bico bticon home" href="http://map.daum.net/?urlX=416552&urlY=942340&q=%EC%B6%A9%EB%82%A8+%EB%8B%B9%EC%A7%84%EC%8B%9C+%EB%8B%B9%EC%A7%84%EC%8B%9C%EC%9E%A5%EA%B8%B8+27-30" title="새창으로 이동합니다." target="_blank"></a></td>
		</tr>
		<tr>
			<td>행운식당</td>
			<td class="left">청국장, 순두부</td>
			<td>4,000</td>
			<td>041-354-1049</td>
			<td class="left">당진시장길 77(읍내동)</td>
			<td><a class="bico bticon home" href="http://map.daum.net/?urlX=417209&urlY=942183&q=%EC%B6%A9%EB%82%A8+%EB%8B%B9%EC%A7%84%EC%8B%9C+%EB%8B%B9%EC%A7%84%EC%8B%9C%EC%9E%A5%EA%B8%B8+77" title="새창으로 이동합니다." target="_blank"></a></td>
		</tr>
	</tbody>
</table>