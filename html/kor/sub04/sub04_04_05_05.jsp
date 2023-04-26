<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="box_dept">
	<!--자치행정국--> <c:import url="/prog/deptPerson/5680279/listDirect.do" charEncoding="utf-8" />

	<div class="tab"> 
		<a href="/kor/sub04_04_05_05.do" class="tab_ov">자치행정과<i></i></a>
		<a href="/kor/sub04_04_05_05.do?partCode=01">안전총괄과</a>
		<a href="/kor/sub04_04_05_05.do?partCode=02">공동체새마을과</a>
		<a href="/kor/sub04_04_05_05.do?partCode=03">회계과</a>
		<a href="/kor/sub04_04_05_05.do?partCode=04">세무과</a>
		<a href="/kor/sub04_04_05_05.do?partCode=05">민원정보과</a>
	</div>

	<div class="grep"> 
		<div class="obj"><!--자치행정과--> <c:import url="/prog/deptPerson/5680282/listDirect.do" charEncoding="utf-8" /></div>
	</div>
</div>

