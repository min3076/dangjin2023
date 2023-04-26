<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="box_dept">
	<!--자치행정국--> <c:import url="/prog/deptPerson/5680281/listDirect.do" charEncoding="utf-8" />

	<div class="tab"> 
		<div>
			<a href="/kor/sub04_04_05_07.do">건설과</a>
			<a href="/kor/sub04_04_05_07.do?partCode=01">도시재생과</a>
			<a href="/kor/sub04_04_05_07.do?partCode=02">도로과</a>
			<a href="/kor/sub04_04_05_07.do?partCode=03">건축과</a>
			<a href="/kor/sub04_04_05_07.do?partCode=04">허가과</a>
	<!-- 	<a href="/kor/sub04_04_05_07.do?partCode=05" >산림녹지과</a> -->
			<a href="/kor/sub04_04_05_07.do?partCode=06">교통과</a>
			<a href="/kor/sub04_04_05_07.do?partCode=07">토지관리과</a>
			<a href="/kor/sub04_04_05_07.do?partCode=08" class="tab_ov">수도과</a>
		</div>
	</div>

	<div class="grep"> 
		<div class="obj"><!--자치행정과--> <c:import url="/prog/deptPerson/5680306/listDirect.do" charEncoding="utf-8" /></div>
	</div>
</div>

