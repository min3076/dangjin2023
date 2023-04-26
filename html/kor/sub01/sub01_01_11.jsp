<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="warningbox">
	<span class="icon"></span>			
	<div class="inner">
		<p>검색 조건을 입력 또는 선택 후 검색버튼을 클릭하여 주세요</p>
	</div>
</div>



<div class="select_search_box category">
	<form name="searchForm" method="post" action="/prog/nllp/kor/sub04_06/list.do">
		<input type="hidden" name="pageUnit" value="10">
		<input type="hidden" name="pageSize" value="10">
		<input type="hidden" name="mno" value="sub02_02_03">
		<input type="hidden" name="siteCode" value="edu">

		<div class="select_box">
			<ul>
				<li class="locate_block">
					<label for="searchKeyword">구분</label>
					<div class="form_block">
						<select name="searchKeyword" id="searchKeyword" title="구분">
							<option value="">전체</option>
							<option value="TK01">담당관</option>
							<option value="TK02">자치행정국</option>
							<option value="TK03">경제행정</option>
							<option value="TK04">건설도시국</option>
							<option value="TK05">직속기관</option>
							<option value="TK06">사업소</option>
						</select>
					</div>
				</li>
				<li class="ordcd_block">
					<label for="searchKeyword2">부서</label>
					<div class="form_block">
						<select name="searchKeyword2" id="searchKeyword2" title="부서">
						 <option value="전체">전체</option>
				         <option value="건설과">건설과</option> 
				         <option value="도시재생과">도시재생과</option> 
				         <option value="도로과">도로과</option> 
				         <option value="건축과">건축과</option> 
				         <option value="허가과">허가과</option> 
				         <option value="산림녹지과">산림녹지과</option> 
				         <option value="교통과">교통과</option> 
				         <option value="토지관리과">토지관리과</option> 
				         <option value="수도과">수도과</option> 
						</select>
					</div>
				</li>
				<li class="realm_block cat">
					<label for="searchKeyword1">카테고리 검색</label>
					<div class="form_block">
						<p class="txt-tip txt-small"><i class="fa fa-fw fa-exclamation-circle"></i>다수의 카테고리 선택이 가능합니다.</p>					
						<ul>
							<li>
								<span class="ico ico1"></span>
								<input type="checkbox" id="ico1">
								<label for="ico1">전체</label>
							</li>
							<li>
								<span class="ico ico2"></span>
								<input type="checkbox" id="ico2">
								<label for="ico2">회계/서무</label>
							</li>				
							<li>
								<span class="ico ico3"></span>
								<input type="checkbox" id="ico3">
								<label for="ico3">건축/건설</label>
							</li>		
							<li>
								<span class="ico ico4"></span>
								<input type="checkbox" id="ico4">
								<label for="ico4">경제/기업</label>
							</li>		
							<li>
								<span class="ico ico5"></span>
								<input type="checkbox" id="ico5">
								<label for="ico5">사회/복지</label>
							</li>		
							<li>
								<span class="ico ico6"></span>
								<input type="checkbox" id="ico6">
								<label for="ico6">환경/위생</label>
							</li>		
							<li>
								<span class="ico ico7"></span>
								<input type="checkbox" id="ico7">
								<label for="ico7">문화/관광</label>
							</li>		
							<li>
								<span class="ico ico8"></span>
								<input type="checkbox" id="ico8">
								<label for="ico8">경제/도로</label>
							</li>		
							<li>
								<span class="ico ico9"></span>
								<input type="checkbox" id="ico9">
								<label for="ico9">농업/축산</label>
							</li>								
							<li>
								<span class="ico ico10"></span>
								<input type="checkbox" id="ico10">
								<label for="ico10">기타</label>
							</li>															
						</ul>
					</div>
				</li>
				<li class="checked_block">					
					<label for="input_lecture">키워드검색</label>
					<input type="text" id="input_lecture" name="searchCondition3" value="" placeholder="찾으시는 민원서식이 있을 경우 입력해 주세요.">
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
		<strong>민원서식자료실 리스트 표</strong>
		<details><p>번호, 민원 사무명, 담당부서, 등록일, 조회수로 구분하여 안내합니다.</p></details>
	</caption>
	<colgroup>
		<col style="width:10%">
		<col style="width:auto">
		<col style="width:15%">
		<col style="width:15%">
		<col style="width:10%">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">민원 사무명</th>
			<th scope="col">담당부서</th>
			<th scope="col">등록일</th>
			<th scope="col">조회수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1001</td>
			<td><a href="#">인감(변경)신고서(서면신고용)</a></td>
			<td>민원위생과</td>
			<td>2016-10-11</td>
			<td>261</td>
		</tr>
	</tbody>
	
</table>


<h1 style="margin-top:50px;color:blue;font-size:30px;">여기서부터 민원서식자료실 <em style="color:red;">상세</em> 화면입니다.</h1>


<table class="tbl_basic tbl_type1">
	<caption>
		<strong>민원서식자료실 상세 표</strong>
		<details>
			<p>민원사무명, 민원내용(민원사무안내), 접수부서, 처리부서(주관부서), 경유/협의부서, 제출처, 처리일수, 전화, 접수방법, 구비서류, 서식파일, 처리절차, 수수료, 면허세, 기타비용, 심사기준, 처리요령 및 유의사항, 관련법규, 기타로 구분하여 안내합니다.</p>
		</details>
		<colgroup>
			<col style="width:18%">
			<col style="width:72%">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">민원 사무명</th>
				<td>거주숙소제공확인서(외국인 체류지변경)</td>
			</tr>
			<tr>
				<th scope="row">민원내용<br>(민원사무안내)</th>
				<td>민원사무내용이 들어갑니다.민원사무내용이 들어갑니다.민원사무내용이 들어갑니다.민원사무내용이 들어갑니다.민원사무내용이 들어갑니다.민원사무내용이 들어갑니다.민원사무내용이 들어갑니다.민원사무내용이 들어갑니다.민원사무내용이 들어갑니다.민원사무내용이 들어갑니다.민원사무내용이 들어갑니다.</td>
			</tr>
			<tr>
				<th scope="row">접수부서</th>
				<td>민원위생과</td>
			</tr>
			<tr>
				<th scope="row">처리부서(주관부서)</th>
				<td>민원위생과</td>
			</tr>
			<tr>
				<th scope="row">경유/협의부서</th>
				<td>민원위생과</td>
			</tr>
			<tr>
				<th scope="row">제출처</th>
				<td>민원위생과</td>
			</tr>
			<tr>
				<th scope="row">처리일수</th>
				<td>8일</td>
			</tr>
			<tr>
				<th scope="row">전화</th>
				<td>042-555-5555</td>
			</tr>
			<tr>
				<th scope="row">접수방법</th>
				<td>우편</td>
			</tr>
			<tr>
				<th scope="row">구비서류</th>
				<td>000서류, xxx서류</td>
			</tr>
			<tr>
				<th scope="row">서식파일</th>
				<td>
					<a class="btn btn-ani btn-file" href="#">서면신고서.xls<span class="bico bticon right file"></span></a>
				</td>
			</tr>
			<tr>
				<th scope="row">처리절차</th>
				<td>000을 거쳐 000으로...</td>
			</tr>
			<tr>
				<th scope="row">수수료</th>
				<td>00원</td>
			</tr>
			<tr>
				<th scope="row">면허세</th>
				<td>00원</td>
			</tr>
			<tr>
				<th scope="row">기타비용</th>
				<td>00원</td>
			</tr>
			<tr>
				<th scope="row">심사기준</th>
				<td>아무개</td>
			</tr>
			<tr>
				<th scope="row">처리요령 및 유의사항</th>
				<td>유의하세요</td>
			</tr>
			<tr>
				<th scope="row">관련법규</th>
				<td>관련법규 내용이 들어갑니다.</td>
			</tr>
			<tr>
				<th scope="row">기타</th>
				<td>기타 내용이 들어갑니다.</td>	
			</tr>
		</tbody>
	</caption>
</table>

<div class="btn_wrap right">
  <a class="btn btn-ani btn-default" href="#">목록</a>    
</div>
