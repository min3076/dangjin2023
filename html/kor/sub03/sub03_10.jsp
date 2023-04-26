<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="ui uit type1 bgw mb_30 list">
    <div class="inner icowrap">
       <span class="tp_icon circle circle1">
            <span class="tp_icon icon icon1"></span>
        </span>
        <div class="txtwrap">
            <strong class="tit_inner">공유재산이란?</strong>
            <ul class="list_1st">
            	<li>지방자치단체의 부담, 기부채납이나 법령에 따라 지방자치단체의 소유로 된 재산을 말합니다.</li>
            	<li>아래 공유재산공개현황은 당진시 공유재산 중 대부 및 매매가 가능한 일반재산을 수요자에 대한 편의를 제공하기 위하여 참고자료로 제공하고 있으며, 공부 및 현황상 내용은 시간의 경과 등으로 변동될 수 있으니 자세한 사항은「041-350-3422」로 문의하시기 바랍니다.</li>
            </ul>
        </div>            
    </div>    
</div>
        
<div class="select_search_box">
	<form name="searchForm" method="post" action="/prog/nllp/kor/sub04_06/list.do">
		<input type="hidden" name="pageUnit" value="10">
		<input type="hidden" name="pageSize" value="10">
		<input type="hidden" name="mno" value="sub02_02_03">
		<input type="hidden" name="siteCode" value="edu">

		<div class="select_box">
			<ul>
				<li class="locate_block">
					<label for="searchKeyword">공부상 지목</label>
					<div class="form_block">
						<select name="searchKeyword" id="searchKeyword" title="공부상 지목">
							<option value="">전체</option>
							<option value="TK01">과수원</option>
							<option value="TK02">답</option>
						</select>
					</div>
				</li>
				<li class="ordcd_block">
					<label for="searchKeyword2">현황상 지목</label>
					<div class="form_block">
						<select name="searchKeyword2" id="searchKeyword2" title="현황상 지목">
							<option value="">전체</option>
							<option value="TM01">과수원</option>
							<option value="TM02">답</option>
						</select>
					</div>
				</li>
				<li class="realm_block">
					<label for="searchKeyword1">대부유무</label>
					<div class="form_block">
						<select name="searchKeyword1" id="searchKeyword1" title="대부유무">
							<option value="">전체</option>							
							<option value="LN01">대부중</option>						
							<option value="LN02">대부가능</option>
						</select>
					</div>
				</li>
				<li class="target_block">
					<label for="searchKeyword3">관리부서</label>
					<div class="form_block">
						<select name="searchKeyword3" id="searchKeyword3" title="관리부서">
							<option value="">전체</option>
							<option value="고대명">고대명</option>
							<option value="당진1동">당진1동</option>
						</select>
					</div>
				</li>
				<li class="checked_block lecture">					
					<label for="input_lecture">소재지를 입력하세요</label>
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
		<strong>공유재산안내 표</strong>
		<details>
			<p>연번, 구분, 관리부서, 소재지, 면적(㎡), 공부상 지목, 현황상 지목, 대부유무, 면적(㎡), 기간으로 나누어 안내합니다.</p>
		</details>
	</caption>
	<colgroup>
		<col style="width:5%">
		<col>
		<col>
		<col style="width:25%">
		<col>
		<col>
		<col>
		<col>
		<col>
		<col style="width:10%">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">연번</th>
			<th scope="col">구분</th>
			<th scope="col">관리부서</th>
			<th scope="col">소재지</th>
			<th scope="col">면적(㎡)</th>
			<th scope="col">공부상 지목</th>
			<th scope="col">현황상 지목</th>
			<th scope="col">대부유무</th>
			<th scope="col">면적(㎡)</th>
			<th scope="col">기간</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>46</td>
			<td>토지</td>
			<td>고대면</td>
			<td class="left">충청남도 당진시 고대면 당진포리 1282-1075</td>
			<td>652</td>
			<td>잡종지</td>
			<td>잡종지</td>
			<td>대부중</td>
			<td>1,703</td>
			<td>2016.1.1 ~ 2016.12.31</td>
		</tr>
		<tr>
			<td>45</td>
			<td>토지</td>
			<td>고대면</td>
			<td class="left">충청남도 당진시 고대면 당진포리 1282-1075</td>
			<td>652</td>
			<td>전</td>
			<td>잡종지</td>
			<td>대부가능</td>
			<td>1,703</td>
			<td>2016.1.1 ~ 2016.12.31</td>
		</tr>
		<tr>
			<td>44</td>
			<td>토지</td>
			<td>고대면</td>
			<td class="left">충청남도 당진시 고대면 당진포리 1282-1075</td>
			<td>652</td>
			<td>잡종지</td>
			<td>잡종지</td>
			<td>대부중</td>
			<td>1,703</td>
			<td>2016.1.1 ~ 2016.12.31</td>
		</tr>				
	</tbody>
</table>
