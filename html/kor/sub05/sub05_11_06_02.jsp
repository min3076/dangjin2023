<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="ui uit type1 bgw mb_30">
    <div class="inner icowrap">
       <span class="tp_icon circle circle1">
            <span class="tp_icon icon icon1"></span>
        </span>
        <div class="txtwrap">
            <strong class="tit_inner">보육시설 찾기</strong>
            <p>사랑하는 아이를 기르는일 당진시에서 함께 하겠습니다.<br>아래는 당진시에서 제공하는 보육시설 목록입니다. 검색을 통해 찾고자 하는 보육시설을 찾으실 수 있습니다.</p>
        </div>            
    </div>    
</div>
        
<div class="select_search_box children">
	<form name="searchForm" method="post" action="/prog/nllp/kor/sub04_06/list.do">
		<input type="hidden" name="pageUnit" value="10">
		<input type="hidden" name="pageSize" value="10">
		<input type="hidden" name="mno" value="sub02_02_03">
		<input type="hidden" name="siteCode" value="edu">

		<div class="select_box">
			<ul>
				<li class="locate_block">
					<label for="searchKeyword">어린이집 유형</label>
					<div class="form_block">
						<select name="searchKeyword" id="searchKeyword" title="어린이집 유형">
							<option value="">전체</option>
							<option value="TK01">가정</option>
							<option value="TK02">국공립</option>
							<option value="TK03">국공립</option>
							<option value="TK04">민간</option>
							<option value="TK05">법인,단체등</option>
							<option value="TK06">사회복지법인</option>
							<option value="TK07">직장</option>
						</select>
					</div>
				</li>
				<li class="ordcd_block">
					<label for="searchKeyword2">통학차량운영</label>
					<div class="form_block">
						<select name="searchKeyword2" id="searchKeyword2" title="통학차량운영">
							<option value="">전체</option>
							<option value="TM01">운영(신고)</option>
							<option value="TM02">미운영</option>
						</select>
					</div>
				</li>
				<li class="realm_block">
					<label for="searchKeyword1">평가인증여부</label>
					<div class="form_block">
						<select name="searchKeyword1" id="searchKeyword1" title="평가인증여부">
							<option value="">전체</option>							
							<option value="LN01">예</option>						
							<option value="LN02">아니오</option>
						</select>
					</div>
				</li>
				<li class="target_block">
					<label for="searchKeyword3">행정동</label>
					<div class="form_block">
						<select name="searchKeyword3" id="searchKeyword3" title="행정동">
							<option value="">전체</option>
							<option value="고대면">고대면</option>
							<option value="당진1동">당진1동</option>
						</select>
					</div>
				</li>
				<li class="checked_block">					
					<label for="input_lecture">보육시설명을 입력하세요</label>
					<input type="text" id="input_lecture" name="searchCondition3" value="">
				</li>
			</ul>
		</div>

		<div class="search_box"><input type="submit" onclick="submitForm()" value="검색하기"></div>

	</form> 
</div>

<div class="basic_box no-border">
  <div class="inner">
    <form name="frm" action="#" method="post">
      <fieldset>
        <legend class="hide">게시물검색</legend>
        <p class="board_total">
          <span class="bold">총</span>
          <span class="bold red">00</span>
          <span class="bold">
            건이 검색되었습니다.
          </span>
        </p>        
      </fieldset>
    </form>
  </div>
</div>


<table class="tbl_basic center">
	<caption>
		<strong>보육시설 안내 표</strong>
		<details>
			<p>연번, 어린이집유형, 행정동, 어린이집 명, 소재지. 통학차량운영, 평가인증여부, 전화번호, 지도보기로 나누어 안내합니다.</p>
		</details>
	</caption>
	<colgroup>
		<col style="width:5%">
		<col style="width:8%">
		<col style="width:8%">
		<col style="width:12%">
		<col style="width:auto">
		<col style="width:8%">
		<col style="width:8%">
		<col style="width:12%">
		<col style="width:6%">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">연번</th>
			<th scope="col">어린이집 유형</th>
			<th scope="col">행정동</th>
			<th scope="col">어린이집 명</th>
			<th scope="col">소재지</th>
			<th scope="col">통학차량운영</th>
			<th scope="col">평가인증여부</th>
			<th scope="col">전화번호</th>
			<th scope="col">지도보기</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>46</td>
			<td>가정</td>
			<td>고대면</td>
			<td><a href="#">거산어린이집</a></td>
			<td class="left">충청남도 당진시 고대면 당진포리 1282-1075</td>
			<td>운영(신고)</td>
			<td>예</td>
			<td>041-356-8037</td>
			<td><a class="bico bticon home" href="#"></a></td>
		</tr>
	</tbody>
</table>




<h1 style="margin-top:50px;color:blue;font-size:30px;">여기서부터 보육시설 <em style="color:red;">상세</em> 화면입니다.</h1>



<table class="tbl_basic tbl_type1">
	<caption>
		<strong>보육시설 상세 표</strong>
		<details>
			<p>보육시설 유형, 보육시설 명, 통학차량 운영, 평가인증여부, 정원, 아동현원, 보육교직원현원, 원장, 행정동, 원장, 행정동, 전화번호, 소재지, 어린이집 특성으로 나누어 안내합니다.</p>
		</details>
	</caption>
	<colgroup>
		<col style="width:18%">
		<col style="width:32%">
		<col style="width:18%">
		<col style="width:32%">		
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">보육시설 유형</th>		
			<td>가정</td>
			<th scope="row">보육시설 명</th>
			<td>The 자라는 어린이집</td>
		</tr>
		<tr>
			<th scope="row">통학차량 운영</th>
			<td>미운영</td>	
			<th scope="row">평가인증여부</th>
			<td>예</td>
		</tr>
		<tr>
			<th scope="row">정원</th>
			<td>20</td>	
			<th scope="row">아동현원</th>
			<td>18</td>
		</tr>
		<tr>
			<th scope="row">보육교직원현원</th>
			<td>6</td>	
			<th scope="row">원장</th>
			<td>이용재</td>
		</tr>
		<tr>
			<th scope="row">행정동</th>
			<td>송악읍</td>	
			<th scope="row">전화번호</th>
			<td>041-000-0000</td>
		</tr>					
		<tr>
			<th scope="row">소재지</th>
			<td colspan="3">(343822) 충청남도 당진시 반촌로 108 롯데캐슬아파트109-102</td>
		</tr>	
		<tr>
			<th scope="row">어린이집 특성</th>
			<td colspan="3">장애아통합,시간연장형</td>
		</tr>
	</tbody>
</table>

<div class="btn_wrap right">
	<a class="btn btn-ani btn-default" href="#">목록</a>
</div>

