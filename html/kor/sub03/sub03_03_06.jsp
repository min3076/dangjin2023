<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="ui uit type1 bgw mb_30">
    <div class="inner icowrap">
       <span class="tp_icon circle circle1">
            <span class="tp_icon icon icon1"></span>
        </span>
        <div class="txtwrap">
            <strong class="tit_inner">당진시에서 제공하는 공고전 공모 리스트 입니다.</strong>
            <p>공고관련 문의사항은 각 내용에서 문의전화를 이용해주세요</p>
        </div>            
    </div>    
</div>
        




<table class="tbl_basic center btn-width-same">
	<caption>
		<strong>공모전 공고 표</strong>
		<details><p>번호, 제목, 접수기간, 주최, 첨부, 상태로 나누어 안내합니다.</p></details>
	</caption>
	<colgroup>
		<col style="width:8%">
		<col style="width:auto;">
		<col style="width:18%;">
		<col style="width:12%;">		
		<col style="width:12%;">		
		<col style="width:12%;">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">접수기간</th>
			<th scope="col">주최</th>
			<th scope="col">첨부</th>
			<th scope="col">상태</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>5</td>
			<td><a href="#">2017 시책구상 시민공모</a></td>
			<td>2016-10-25 18:00 ~ 2016-11-02 18:00</td>
			<td>당진시청</td>
			<td><a class="bico bticon file" href="#"></a></td>
			<td><span class="btn btn-ani btn-primary small">접수중</span></td>
		</tr>		
		<tr>
			<td>4</td>
			<td><a href="#">2017 시책구상 시민공모</a></td>
			<td>2016-10-25 18:00 ~ 2016-11-02 18:00</td>
			<td>당진시청</td>
			<td><a class="bico bticon file" href="#"></a></td>
			<td><span class="btn btn-ani btn-success small">접수마감</span></td>
		</tr>	
		<tr>
			<td>3</td>
			<td><a href="#">2017 시책구상 시민공모</a></td>
			<td>2016-10-25 18:00 ~ 2016-11-02 18:00</td>
			<td>당진시청</td>
			<td><a class="bico bticon file" href="#"></a></td>
			<td><span class="btn btn-ani btn-warning small">준비중</span></td>
		</tr>					
	</tbody>
</table>



<h1 style="margin-top:50px;color:blue;font-size:30px;">여기서부터 공모전 공고 <em style="color:red;">상세</em> 화면입니다.</h1>


<table class="tbl_basic tbl_type1">
  <caption>
    <strong>공모전 공고 상세 표</strong>
    <details><p>제목, 내용, 접수기간, 접수방법, 주최(주관), 문의, 상태, 첨부로 나누어 안내합니다.</p></details>
  </caption>
  <colgroup>
    <col style="width:18%;">
    <col style="width:72%;">
  </colgroup>
  <tbody>
    <tr>
    	<th scope="row">제목</th>
    	<td>2017년 시책구상 시민공모 제안</td>
    </tr>
    <tr>
    	<th scope="row">내용</th>
    	<td>2017년 시책구상 시민공모 제안을 진행합니다.</td>
    </tr>
    <tr>
    	<th scope="row">접수기간</th>
    	<td>2016-10-25 18:00 ~ 2016-11-17 18:00</td>
    </tr>
    <tr>
    	<th scope="row">접수방법</th>
    	<td>온라인 접수</td>
    </tr>	
    <tr>
    	<th scope="row">주최(주관)</th>
    	<td>당진시청</td>
    </tr>
    <tr>
    	<th scope="row">문의</th>
    	<td>000-000-0000으로 문의</td>
    </tr>
    <tr>
    	<th scope="row">상태</th>
    	<td><span class="btn btn-ani btn-primary small">접수중</span></td>
    </tr>
    <tr>
    	<th scope="row">첨부</th>
    	<td>
    		<a class="btn btn-ani btn-file" href="#">공모서식.hwp<span class="bico bticon right file"></span></a>
    	</td>
    </tr>
  </tbody>
</table>

<div class="btn_wrap right">
  <a class="btn btn-ani btn-default" href="#">목록</a>
</div>


<h1 style="margin-top:50px;color:blue;font-size:30px;">여기서부터 공모전 공고 <em style="color:red;">접수</em> 화면입니다.</h1>

<h2>공모전 명 : 2017년 시책구상 시민공모 제안</h2>

<form action="" method="" name="">
	<table class="tbl_basic response tbl_type1">
		<caption>
			<strong>공모전 공고 접수 표</strong>
			<details><p>성명, 연락처, 제안명, 사업개요(주요내용), 제안사유, 타 지역 유사사례, 첨부파일로 나누어 입력합니다.</p></details>
		</caption>
		<colgroup>
			<col style="width:18%;">
			<col style="width:32%;">
			<col style="width:18%;">
			<col style="width:32%;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row"><label for="nm">성명</label></th>
				<td>
					<div class="form-max">
						<input type="text" id="nm" name="">
					</div>
				</td>
				<th scope="row"><label for="tel">연락처</label></th>
				<td>
					<div class="form-max">
						<input type="tel" id="nm" name="">
					</div>					
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="proposal">제안명</label></th>
				<td colspan="3">
					<div class="form-max">
						<input type="text" id="proposal" name="">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="bs_overview">사업개요<br>주요내용</label></th>
				<td colspan="3">
					<textarea name="" id="bs_overview" cols="30" rows="10"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="propose_person">제안사유</label></th>
				<td colspan="3">
					<textarea name="" id="propose_person" cols="30" rows="10"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="out_example">타 지역<br>유사사례<br>없으면 생략가능</label></th>
				<td colspan="3">
					<textarea name="" id="out_example" cols="30" rows="10"></textarea>
				</td>
			</tr>		
			<tr>
				<th scope="row"><label for="file">첨부파일</label></th>
				<td><input type="file" id="file"></td>
			</tr>				
		</tbody>
	</table>


	<div class="btn_wrap right">
	  <a class="btn btn-ani btn-default" href="#">목록</a>  
	  <input type="submit" class="btn btn-ani btn-primary" value="접수">
	</div>


</form>
