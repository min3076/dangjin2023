<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="box_dept">
	<!--자치행정국--> <c:import url="/prog/deptPerson/5680281/listDirect.do" charEncoding="utf-8" />

	<div class="tab">
		<a href="/kor/sub04_04_05_07.do">건설과</a>
		<a href="/kor/sub04_04_05_07.do?partCode=01" class="tab_ov">도시과</a>
		<a href="/kor/sub04_04_05_07.do?partCode=02">도로과</a>
		<a href="/kor/sub04_04_05_07.do?partCode=03">건축과</a>
		<a href="/kor/sub04_04_05_07.do?partCode=04">주택과</a>
		<a href="/kor/sub04_04_05_07.do?partCode=05">교통과</a>
		<a href="/kor/sub04_04_05_07.do?partCode=06">토지관리과</a>
		<a href="/kor/sub04_04_05_07.do?partCode=07">수도과</a>
	</div>

	<div class="grep"> 
		<div class="obj"><!--자치행정과--> <c:import url="/prog/deptPerson/5680355/listDirect.do" charEncoding="utf-8" /></div>
	</div>
</div>

