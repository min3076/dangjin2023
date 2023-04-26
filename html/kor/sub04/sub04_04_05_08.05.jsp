<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="box_dept">
	<!--자치행정국--> <c:import url="/prog/deptPerson/5680326/listDirect.do" charEncoding="utf-8" />

	<div class="tab"> 
		<div>
			<a href="/kor/sub04_04_05_08.do">문화관광과<i></i></a>
			<a href="/kor/sub04_04_05_08.do?partCode=01">평생학습과<i></i></a>
			<a href="/kor/sub04_04_05_08.do?partCode=02">사회복지과<i></i></a>
			<a href="/kor/sub04_04_05_08.do?partCode=03">체육진흥과<i></i></a>
			<a href="/kor/sub04_04_05_08.do?partCode=04">여성가족과<i></i></a>
			<a href="/kor/sub04_04_05_08.do?partCode=05" class="tab_ov">경로장애인과<i></i></a>
		</div>
	</div>

	<div class="grep"> 
	<div class="obj"><!--자치행정과--> <c:import url="/prog/deptPerson/5680332/listDirect.do" charEncoding="utf-8" /></div> 
	</div>
</div>

