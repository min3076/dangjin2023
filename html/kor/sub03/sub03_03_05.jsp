<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="ui uit type1 bgw mb_30">
    <div class="inner icowrap">
       <span class="tp_icon circle circle1">
            <span class="tp_icon icon icon1"></span>
        </span>
        <div class="txtwrap">
            <strong class="tit_inner">당진시에서 제공하는 시험, 채용공고 정보입니다.</strong>
            <p>공고관련 문의사항은 각 내용에서 문의전화를 이용해주세요</p>
        </div>            
    </div>    
</div>
        




<table class="tbl_basic center btn-width-same">
	<caption>
		<strong>시험, 채용공고 표</strong>
		<details><p>번호, 제목, 일자, 작성자, 등록일, 상태로 나누어 안내합니다.</p></details>
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
			<th scope="col">일자</th>
			<th scope="col">작성자</th>
			<th scope="col">등록일</th>
			<th scope="col">상태</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>5</td>
			<td><a href="#">당진시 채용공고입니다.</a></td>
			<td>2016-10-25 18:00 ~ 2016-11-02 18:00</td>
			<td>당진시청</td>
			<td>2016-11-23</td>
			<td><span class="btn btn-ani btn-primary small">접수</span></td>
		</tr>
		<tr>
			<td>4</td>
			<td><a href="#">당진시 채용공고입니다.</a></td>
			<td>2016-10-25 18:00 ~ 2016-11-02 18:00</td>
			<td>당진시청</td>
			<td>2016-11-23</td>
			<td><span class="btn btn-ani btn-success small">접수예정</span></td>
		</tr>			
		<tr>
			<td>3</td>
			<td><a href="#">당진시 채용공고입니다.</a></td>
			<td>2016-10-25 18:00 ~ 2016-11-02 18:00</td>
			<td>당진시청</td>
			<td>2016-11-23</td>
			<td><span class="btn btn-ani btn-info small">결과공고</span></td>
		</tr>
		<tr>
			<td>3</td>
			<td><a href="#">당진시 채용공고입니다.</a></td>
			<td>2016-10-25 18:00 ~ 2016-11-02 18:00</td>
			<td>당진시청</td>
			<td>2016-11-23</td>
			<td><span class="btn btn-ani btn-warning small">마감</span></td>
		</tr>											
	</tbody>
</table>



<h1 style="margin-top:50px;color:blue;font-size:30px;">여기서부터 시험, 채용공고 <em style="color:red;">상세</em> 화면입니다.</h1>


<table class="tbl_basic tbl_type1">
  <caption>
    <strong>채용공고 상세 표</strong>
    <details><p>제목, 작성자, 작성일, 상태, 접수일자, 사업위치, 사업비(추정), 기대효과, 첨부파일로 나누어 안내합니다.</p></details>
  </caption>
  <colgroup>
    <col style="width:18%;">
    <col style="width:32%;">
    <col style="width:18%;">
    <col style="width:32%;">
  </colgroup>
  <tbody>
    <tr>
      <th scope="row">제목</th>
      <td colspan="3">당진시 채용공고</td>  
    </tr>
    <tr>
      <th scope="row">작성자</th>
      <td>이용재</td>
      <th scope="row">작성일자</th>
      <td>2016-10-21</td>
    </tr>
    <tr>
      <th scope="row">상태</th>
      <td>접수중</td>
      <th scope="row">접수일자</th>
      <td>2016-10-25 18:00 ~ 2016-11-25 18:00</td>
    </tr>    
    <tr>
      <th scope="row">사업위치</th>
      <td>채운동</td>
      <th scope="row">사업비(추정)</th>
      <td>10,000천원</td>
    </tr>      
    <tr>
      <th scope="row">기대효과</th>
      <td colspan="3">기대효과 내용이 들어갑니다.</td>
    </tr>        
    <tr>
      <th scope="row">첨부파일</th>
      <td>
        <a class="btn btn-ani btn-file" href="#">주민제안사업 신청서.hwp<span class="bico bticon right file"></span></a>
      </td>
    </tr>
  </tbody>
</table>

<div class="btn_wrap right">
  <a class="btn btn-ani btn-default" href="#">목록</a>
</div>