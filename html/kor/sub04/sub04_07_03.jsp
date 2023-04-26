<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="select_search_box category button">
	<form name="searchForm" method="post" action="/prog/nllp/kor/sub04_06/list.do">
		<input type="hidden" name="pageUnit" value="10">
		<input type="hidden" name="pageSize" value="10">
		<input type="hidden" name="mno" value="sub02_02_03">
		<input type="hidden" name="siteCode" value="edu">

		<div class="select_box">
			<ul>
				<li class="realm_block cat">
					<label for="searchKeyword1">대분류</label>
					<div class="form_block">
						<ul>
							<li class="on">
								<a href="#">
									<span class="ico ico1"></span>							
									<em>행정/유관기관</em>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="ico ico2"></span>								
									<em>의료</em>
								</a>
							</li>				
							<li>
								<a href="#">
									<span class="ico ico3"></span>								
									<em>복지시설</em>
								</a>
							</li>		
							<li>
								<a href="#">
									<span class="ico ico4"></span>								
									<em>기업지원</em>
								</a>
							</li>		
							<li>
								<a href="#">
									<span class="ico ico5"></span>								
									<em>농/수/축산</em>
								</a>
							</li>		
							<li>
								<a href="#">
									<span class="ico ico6"></span>								
									<em>문화체육청소년</em>
								</a>
							</li>		
							<li>
								<a href="#">
									<span class="ico ico7"></span>								
									<em>생활/교통/치안</em>
								</a>
							</li>		
							<li>
								<a href="#">
									<span class="ico ico8"></span>								
									<em>관광</em>
								</a>
							</li>		
							<li>
								<a href="#">
									<span class="ico ico9"></span>								
									<em>근로자/일자리</em>
								</a>
							</li>								
							<li>
								<a href="#">
									<span class="ico ico10"></span>								
									<em>기타기관</em>
								</a>
							</li>															
						</ul>
					</div>
				</li>

				<li class="locate_block btn-set">
					<label for="searchKeyword">중분류</label>
					<div class="form_block">
						<a class="btn btn-ani btn-default on" href="#">전체보기</a>
						<a class="btn btn-ani btn-default" href="#">관공서</a>
						<a class="btn btn-ani btn-default" href="#">교육문화체육청소년</a>
					</div>
				</li>				

				<li class="checked_block">					
					<label for="input_lecture">검색</label>
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
		<strong>생활시설안내 리스트 표</strong>
		<p>기관명, 주소, 전화번호, 홈페이지로 구분하여 안내합니다.</p>
	</caption>
	<colgroup>
		<col style="width:20%">
		<col style="width:auto">
		<col style="width:15%">
		<col style="width:10%">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">기관명</th>
			<th scope="col">주소</th>
			<th scope="col">전화번호</th>
			<th scope="col">홈페이지</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>당진시청</td>			
			<td class="left">충청남도 당진시 시청1로 1</td>
			<td>041-350-3114</td>
			<td>
				<a class="bico bticon left home" href="#" target="_blank" title="홈페이지 새창열림"></a>
			</td>
		</tr>
	</tbody>
	
</table>