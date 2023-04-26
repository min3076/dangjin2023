<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="basic_serch_bbs">
<form id="searchForm" name="searchForm" method="post" class="board_search" action="/prog/yesanInfo/kor/sub03_04_01/list.do">
<fieldset>
<legend class="hide">검색</legend>
	<div class="basic_search yesan_list">
		<div class="grap">
			<select name="year">
				<option value="2017" selected="selected">2017</option>
				<option value="2016">2016</option>
				<option value="2015">2015</option>
				<option value="2014">2014</option>
			</select>
			<select name="chasu">
				<option value="0" selected="selected">본예산</option>
				<option value="1">1회추경</option>
				<option value="2">2회추경</option>
				<option value="3">3회추경</option>
				<option value="4">4회추경</option>
				<option value="5">간주예산</option>
			</select>
		</div>
		<input type="submit" value="검색" name="submitTy">
	</div>
</fieldset>
</form>
</div>

<ul class="yesan_list clearfix">
	<li class="depth_table_0th">2017년 본예산 세입세출예산서</li>
	<li class="depth_table_1th odd">예산총칙 <span class="btn_down"><span class="pdf"><a href="#"><span class="hide">첨부파일</span></a></span></span></li>


</ul>