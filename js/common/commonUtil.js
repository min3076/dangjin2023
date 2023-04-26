
/* ********************************************************
 * FUNCTION 명 : fnGetByte
 * FUNCTION 기능설명 :문자열의 바이트수를 리턴한다.
 ******************************************************** */
function fnGetByte(str){
	var byte = 0;
	
	for(var i=0; i<str.length; i++){
		if(escape(str.charAt(i)).length>3){
			byte+=2;
		}else{
			byte++;
		}
	}
	
	return byte;
}

/* ********************************************************
 * FUNCTION 명 : lengthCheck
 * FUNCTION 기능설명 :문자길이점검
 ******************************************************** */
function lengthCheck(name, obj){
	var str = obj.value.strip();

	if(fnGetByte(str)>obj.maxLength){
		alert("'"+name+"'의 최대문자수는 "+obj.maxLength+"(한글은 2자로인식)입니다. =>입력값길이:"+fnGetByte(str));
		obj.focus();
	}
}

/* ********************************************************
 * FUNCTION 명 : strFormat
 * FUNCTION 기능설명 :문자를 FORMAT형식으로 변환(ex: "aabbcc", "#-###-##" => "a-abb-cc")
 ******************************************************** */
function strFormat(str, format){
	var count = 0;
	var returnValue = "";
	
	for(var i=0, j=0; i<format.length && j<str.length; i++){
		if(format.charAt(i) == '#'){
			returnValue += str.charAt(j++);
		}else{
			returnValue += format.charAt(i);
		}
	}
	
	return returnValue;
}

/* ********************************************************
 * FUNCTION 명 : lpad
 * FUNCTION 기능설명 : str문자열  앞에 num길이가 되게 padStr문자 삽입
 ******************************************************** */
function lpad(str, padStr, num){
	var returnValue = "";
	
	if(str.length > num){
		return str.substring(0, num);
	}
		
	for(var i=0; i<num-str.length; i++){
		returnValue += padStr;
	}
	
	returnValue += str; 
	
	return returnValue;
}

/* ********************************************************
 * FUNCTION 명 : rpad
 * FUNCTION 기능설명 :str문자열 뒤에 num길이가 되게 padStr문자 삽입
 ******************************************************** */
function rpad(str, padStr, num){
	var returnValue = "";
	
	if(str.length > num){
		return str.substring(0, num);
	}
		
	for(var i=0; i<num-str.length; i++){
		returnValue += padStr;
	}
	
	returnValue = str + returnValue; 
	
	return returnValue;
}

/* ********************************************************
 * FUNCTION 명 : trim
 * FUNCTION 기능설명 : str 변수의 앞 뒤 공백문자 제거
 ******************************************************** */
function trim(str){
	if(str == null || str == ""){
		return str;
	}else{
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}
}

/* ********************************************************
 * FUNCTION 명 : checkApplno
 * FUNCTION 기능설명 : 출원번호의 년도와 시퀀스 체크 => (출원번호ID, 시퀀스ID)
 ******************************************************** */
function checkApplno(yearName, seqName){
	var yearObj = document.getElementById(yearName);
	var seqObj = document.getElementById(seqName);
	var year = trim(yearObj.value);
	var seq = trim(seqObj.value);

	if(year.length == 0 && seq.length == 0){
		alert("출원번호의 필드가 모두 비어 있습니다!");
		return false;
	}else if(year.length == 0 && seq.length > 0){
		alert("출원번호의 년도 필드가 비어 있습니다!");
		return false;
	}else if(year.length > 0 && seq.length == 0){
		alert("출원번호의 일련번호 필드가 비어 있습니다!");
		return false;
	}
	
	if(year.length != 4){
		alert("출원번호의 년도 길이가 틀립니다!");
		yearObj.focus();
		return false;
	}
	
	if(seq.length != 7){
		alert("출원번호의 일련번호 길이가 틀립니다!");
		seqObj.focus();
		return false;
	}
	
	return true;
}

/* ********************************************************
 * FUNCTION 명 : digitLengthCheck
 * FUNCTION 기능설명 : 
 ******************************************************** */
function digitLengthCheck(str, n){
	
	var strChar = str.value.strip();

	if(!strChar.maxLength == n ){
		alert(" '"+strChar+"'의 자릿수는 "+n+"입니다. 다시 입력하여 주십시요.");
		obj.focus();
	}
}

/* ********************************************************
 * FUNCTION 명 : getDate
 * FUNCTION 기능설명 :현재날짜   20110505
 ******************************************************** */
function getDate(){
	var d = new Date();
	return d.getYear() + lpad(d.getMonth()+1+"", "0", 2) + lpad(d.getDate()+"", "0", 2);
}

/* ********************************************************
 * FUNCTION 명 : replaceAll
 * FUNCTION 기능설명 : replace 는 처음 발견되는 하나의 문자에 대해서만 변경이 이루어져서 동일 모든 문자변환을 위한 함수정의
 ******************************************************** */
function replaceAll(str, src, tgt){
	return str.split(src).join(tgt);
}

/* ********************************************************
 * FUNCTION 명 : fnGetStringDate
 * FUNCTION 기능설명 : . 스트링 날짜를 스트링 날자로 변환(2009.01.01 -> 20090101)
 ******************************************************** */
function fnGetStringDate(sDate){
   var s = "";

   s += sDate.substr(0,4);
   s += sDate.substr(5,2);
   s += sDate.substr(8,2);

   return(s);
}

/* ********************************************************
 * FUNCTION 명 : fnTotSelct
 * FUNCTION 기능설명 :전체 선택 해제
 ******************************************************** */
function fnTotSelct(chk, objName) {
	var obj = document.getElementsByName(objName);
	for(i=0; i < obj.length; i++) {
		obj[i].checked = chk;
	}
}

/* ******************************************************************************
* FUNCTION 명 : fnSelectedCheck
* FUNCTION 기능설명 : checkBox check유무
****************************************************************************** */
function fnSelectedCheck(objNm) {
	var obj = document.getElementsByName(objNm);
	for(var i=0; i < obj.length; i++){
		if(obj[i].checked == true){
			return true;
		}
	}
	return false;
}

/* ******************************************************************************
* FUNCTION 명 : fnReturnCheckValue
* FUNCTION 기능설명 : checkBox check된 값을 ; 구분자로 String하나로 만들어 리턴한다. (ex: 출원번호1;출원번호2;)
****************************************************************************** */
function fnReturnCheckValue(objNm) {
	var obj = document.getElementsByName(objNm);
	var returnValue = "";
	
	for(var i=0; i < obj.length; i++){
		if(obj[i].checked == true){
			returnValue += obj[i].value + ";";
		}
	}
	return returnValue;
}

/* ******************************************************************************
* FUNCTION 명 : fnGetCheckCount
* FUNCTION 기능설명 : checkBox check된 수 리턴
****************************************************************************** */
function fnGetCheckCount(objNm) {
	var obj = document.getElementsByName(objNm);
	var count = 0;
	
	for(var i=0; i < obj.length; i++){
		if(obj[i].checked == true){
			count++;
		}
	}
	
	return count;
}

/* ******************************************************************************
* FUNCTION 명 : checkNumber
* FUNCTION 기능설명 : 입력된 값이 숫자인지를 체크 숫자가 아니면 return불가.
****************************************************************************** */
function checkNumber() {
	if(event.keyCode == 16){
		alert("숫자만 입력해주세요.");
		return false;
	}
	if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)){
		if(event.keyCode != 8){
			event.returnValue = false;	
		}
	}
}

/* ******************************************************************************
* FUNCTION 명 : checkNumberOnblur by JKH
* FUNCTION 기능설명 : 포커스를 잃었을 경우 해당 객체에 입력된 정보가 숫자가 아니면 경고처리한다.
****************************************************************************** */
function checkNumberOnblur(obj){
	if(isNaN(obj.value)){
		alert("숫자만 입력해주세요.");
		obj.focus();
	}
}
/* ******************************************************************************
* FUNCTION 명 : checkNumberOnkeyup by JKH
* FUNCTION 기능설명 : 입력된 값이 숫자인지를 체크 숫자가 아니면 지워버린다.
* 추가로 허용할 수 있는 문자를 두번째 인자에 배열로 넣을 수 있다. 필수인자 아님
****************************************************************************** */
function checkNumberOnkeyup(obj, availCharArr){
	var oStr = obj.value;
	var str = oStr.substring(oStr.length-1);
	var availArr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
	if(availCharArr != undefined && availCharArr.length > 0){
		for(var i=0; i<availCharArr.length; i++){
			availArr.push(availCharArr[i]);
		}
	}
	var check = false;
	for(var i=0; i<availArr.length; i++){
		if(availArr[i] == str){
			check = true;
			break;
		}
	}
	if(!check){
		obj.value = oStr.substring(0, oStr.length-1);
	}
}

/**
 * 전화번호로 받은 인자의 길이를 확인해 그에 맞는 전화번호 포맷으로 변환해준다.
 * 두번째 인자로 포맷팅
 * 
 * @param str
 * @param token
 * @return
 */
function makePhoneNumberFormat(obj, token){
	//alert(obj.value + " : " + token);
	if(obj == undefined || trim(obj.value) == ""){
		return false;
	}
	var str = obj.value;
	
	if(str.length < 7){
		if(!confirm("입력된 정보가 전화번호가 맞습니까?\n정확히 입력해주세요.")){
			obj.focus();
		}
	}
	else if(str.indexOf(token) > -1){
		obj.value = trim(str);
	}
	else if(str.length == 7){//지역번호 없는 전화번호 타입 531-0000
		obj.value = str.substring(0, 3) + token + str.substring(3);
	}
	else if(str.length == 8){//지역번호 없는 8자리 전화번호 타입 1577-1577
		obj.value = str.substring(0, 4) + token + str.substring(4);
	}
	else if(str.length == 9){//두자리 지역번호 있는 8자리 전화번호 타입 02-577-1577
		obj.value = str.substring(0, 2) + token + str.substring(2, 5) + token + str.substring(5);
	}
	else if(str.length == 10){//세자리 지역번호 있는 전화번호 타입 042-000-0000
		obj.value = str.substring(0, 3) + token + str.substring(3, 6) + token + str.substring(6);
	}
	else if(str.length == 11){//휴대폰 내지 070 전화번호 타입 010-0000-0000
		obj.value = str.substring(0, 3) + token + str.substring(3, 7) + token + str.substring(7);
	}
	else{
		if(!confirm("입력된 정보가 전화번호가 맞습니까?\n정확히 입력해주세요.")){
			obj.focus();
		}
	}
}

/* ******************************************************************************
* FUNCTION 명 : trimAll
* FUNCTION 기능설명 : 공백
*******************************************************************************/
function trimAll(str) {
	while(str && str.indexOf("") == 0)
		str = str.substring(1);
	
	while(str && str.lastIndexOf("") == str.length-1)
		str = str.substring(0,str.length-1);
	
	return str;
}

/* ******************************************************************************
* FUNCTION 명 : makeDatesAsc
* FUNCTION 기능설명 : makeDatesAsc(2011, 1, 12, "YYYY.MM.DD", "-") -> 2011.01, 2011.02, ... , 2011.12
*******************************************************************************/
function makeDatesAsc(year, sm, em, format, delimeter){
	var dates = new Array();
	for(var m = sm; m <= em; m++ ) {
		dates.push(formatString(year + length2(m), format, delimeter));
	}
	return dates;
}

function makeDatesDesc(year, sm, em, format, delimeter) {
	var dates = new Array();
	for (var m = em; m >= sm; m--) {
		dates.push(formatString(year + length2(m), format, delimeter));
	}
	
	return dates;
}

function length2(m) {
	if( m < 10)
		return "0" + m;
	else 
		return "" + m;
}

function dsFormatString(string, format, delimeter){
	if( string != null || string != "") {
		var fmElms  = format.split(delimeter, format.length);
		var array = new Array();
		
		var j = 0;
		for(var i = 0; i < fmElms.length; i++ ) {
			var fmElm = fmElms[i];
			
			for(var k = 0; k < fmElm.length; k++ ) {
				array.push(string.charAt(j++));
			}
			if( j < string.length - 1) {
				array.push(delimeter);
			}else{
				break;
			}
		}
		
		return arrayToString(array);
	}
}

/* ******************************************************************************
* FUNCTION 명 : formatToString
* FUNCTION 기능설명 : 일정한 구분자로 나누어진 숫자로 된 문자열에서 구분자만 제거된 결과를 반환한다.
*  					예) 30-1234-1234567 -> 3012341234567, 2010.06.10 -> 20100610
*******************************************************************************/
function formatToString(fString) {
	if( fString != null && fString != "")
		return arrayToString(fString.match(/\d+/g));
}

/* ******************************************************************************
* FUNCTION 명 : arrayToString
* FUNCTION 기능설명 : 배열({@code array})에 포함되어 있는 대상들을 문자열 형태로 반환한다.
*******************************************************************************/
 function arrayToString(array) {
	var retValue = "";
	for(var i = 0; i < array.length; i++) { 
		retValue += array[i];
	}
	return retValue;
} 

 /* ******************************************************************************
 * FUNCTION 명 : arrayToOptionsString
 * FUNCTION 기능설명 : 배열의 원소값들을 {@code option} 태그의 /value/, /name/에 적용한 결과를 문자열 형태로 반환한다.
 *******************************************************************************/
function arrayToOptionsString(array) {
	var retValue = "";
	for(var i = 0; i < array.length; i++ ) {
		retValue += makeHTMLStringOption(array[i], array[i]);
	}
	return retValue;
}

/* ******************************************************************************
* FUNCTION 명 : arrayToOptionsArray
* FUNCTION 기능설명 : 배열의 원소값들을 {@code option} 태그의 /value/, /name/에 적용한 결과를 배열형태로 반환한다.
*******************************************************************************/
function arrayToOptionsArray(array) {
	var retArray = new Array();
	for(var i = 0; i < array.length; i++ ) {
		retArray.push(makeHTMLStringOption(array[i], array[i]));
	}
	return retArray;
}

/* ******************************************************************************
* FUNCTION 명 : toHtmlContext
* FUNCTION 기능설명 : 
			<p>
			<code>var tableContext = toHtmlContext("td", "홍길동", ["class=\"Llast\", "id=\"name\""], <b>true</b>);</code> 인 경우<br>
			결과는 {@code <td class="Llast" id="name">홍길동</td>}이다.
			</p>
			<p> 
			<code>var tableContext = toHtmlContext("td", "홍길동", ["class=\"Llast\", "id=\"name\""], <b>false</b>);</code> 인 경우<br>
			결과는 {@code <td class="Llast" id="name">홍길동} 이다.<br><br>
			
			마지막 파라미터가 {@code true}인 경우는 {@code toHtmlContext(context, str, attr)}와 같은 결과를 반환한다.
			</p>
*******************************************************************************/
function toHtmlContext(context, attrs, str, isClosed) {
	//alert("params: [c]: " + context + ", [s]: " + str + ", [a]: " + attrs + ", [i]: " + isClosed);
	
	var retValue = "<" + context;
	if( attrs != null ) {
		for(var i = 0; i < attrs.length; i++ ) {
			retValue += " " + attrs[i];
		}
	}
	retValue += ">" + str + ((isClosed != null && !isClosed)? "" : "</" + context + ">"	);
	//alert("retValue: " + retValue);
	
	return retValue;
}

/* ******************************************************************************
* FUNCTION 명 : makeHTMLString
* FUNCTION 기능설명 : 파라미터를 <code>option</code> 태그에 적용한 후 <code>option</code> 문자열을 반환한다.
*******************************************************************************/
function makeHTMLStringOption(value, name) {
	return toHtmlContext("option", ["value=\"" + value + "\""], name);
}

/* ******************************************************************************
* FUNCTION 명 : setShow
* FUNCTION 기능설명 : HTML 콤포넌트의 노출 여부를 결정한다.
*******************************************************************************/
function setShow(comp, isShow) { 
	D$(comp).style.display = isShow ? "" : "none";	
}

/* ******************************************************************************
* FUNCTION 명 : insertOptionVN
* FUNCTION 기능설명 : Insert a {@code Option} at the end of a {@code Select} with the ID of {@code selectId(param)}.
*******************************************************************************/
function insertOptionVN(selectId, optValue, optName){
	var select = document.getElementById(selectId);
	select.options[select.length] = new Option(optName, optValue);
}

function insertOptionVNs(selectId, values, names, initIndex) { 
	if( names.length != values.length ) {
		alert("Invalid Arguments: values=" + values + ", names=" + names);
	}else{
		for(var i = 0; i < values.length; i++ ) {
			insertOptionVN(selectId, values[i], names[i]);
		}
		
		if( initIndex != null ) {
			document.getElementById(selectId).selectedIndex = initIndex;
		}
	}	
}

function insertHTMLStringOption(selectId, option) { 
	D$(selectId).insert(option);
}

function insertHTMLElementOption(selectId, option) { 
	var select = document.getElementById(selectId);
	
	select.options[select.length] = option;
}

function insertHTMLElementOptions(selectId, options) {
	var select = document.getElementById(selectId);
	for(var i = 0; i < options.length; i++ ) {
//		alert("value=" + options[i].value + ", text=" + options[i].text);
		select.options[select.length] = options[i];
	}
}
function insertHTMLStringOptionAndSetIndex(selectId, option, index){
	insertHTMLStringOption(selectId, option);
	D$(selectId).selectedIndex = index;
}

function insertHTMLStringOptions(selection, options) {
	for(var i = 0; i < options; i++ ) {
		D$(selection).insert(options[i]);
	}
}

 function insertHTMLStringOptionsAndSetIndex(selection, options, index) {
	insertHTMLStringOptions(selection, options);
	D$(selection).selectedIndex = index;
}

 /* ******************************************************************************
 * FUNCTION 명 : contains
 * FUNCTION 기능설명 : {@code value}가 배열({@code array})에 포함되어 있는지를 반환한다.
 *******************************************************************************/
function contains(array, value) { 
	for(var i = 0; i < array.length; i++ ) { 
		if( array[i] == value) {
			return true;
		}
	}
	return false;
}

/* ******************************************************************************
* FUNCTION 명 : getValue
* FUNCTION 기능설명 : {@code compId}에 해당하는 콤포넌트에 할당된 값({@code value} 속성)을 반환한다.<br>
* 값이 없는 경우 {@code initValue}를 반환한다.
*******************************************************************************/
function getValue(compId, initValue) { 
	var retValue = D$(compId).value;
	return isNull(retValue) ? initValue : retValue;
} 

/* ******************************************************************************
* FUNCTION 명 : isNull
* FUNCTION 기능설명 : 파라미터의 {@code null} 여부를 반환한다.
*******************************************************************************/
function isNull(obj){ 
	if( obj == null || obj == "") 
		return true;
	else 
		return false;
}

/** *****************************************************************************
 * Create context for a paging capability. The step is following.<br>
 * <ul>
 * <li>1. Create a {@code Selection} element for 'page size' and {@code Span} for 'total count'.
 * <li>2. Create a context for {@code pagination} information.
 * <li>3. Insert code fragments that are hidden data for {@code 'pageIndexId'} and {@code 'pageIndexHandleId'}.
 * </ul> 
 * <p>
 * <pre>
 * example:
 * createPagingContext("bodyId",
 *                     "resultTable",
 *                     "pageSizeId",
 *                     [10, 30, 50],
 *                     "totalCntId",
 *                     "pageIndexId",
 *                     "pageIndexHandleId")</pre>
 * </p>
 * 
 * <p>
 * Good luck!
 * </p>
 * 
 * @param bodyId ({@code String}): ID of {@code body} element in HTML.
 * @param tableId ({@code String}): ID of a table that shows query result.
 * @param pageSizeId ({@code String}): ID of a element that contains a value of page size.
 * @param pageSizes ({@code Array}): Data of page sizes in {@code Selection} element.
 * @param totCntId ({@code String}): ID of a element that contains a total count of query result.
 * @param pageIndexId ({@code String}): ID of a element that contains a current page number.
 * @param pageIndexHandleId ({@code String}): ID of a element that handles a event generated when a page index is clicked. <b>OPTIONAL</b> 
 * @author [디자인 심사] 박준홍
 * @since 2011. 6. 29. 오후 2:23:24
 ******************************************************************************/
function createPagingContext(bodyId, tableId, pageSizeId, pageSizes, totCntId, pageIndexId, pageIndexHandleId) {
	// count per a page and total count on the specific table
	var selectStr = toHtmlContext("select", ["class=\"totalRow\"", "id=\"" + pageSizeId + "\""], "", false);
	// insert Options
	for(var i = 0; i < pageSizes.length; i++ ) {
		selectStr += toHtmlContext("option", ["value=\"" + pageSizes[i] + "\""], pageSizes[i]);
	}
	selectStr += "</select> 건/페이지";
	
	var totalCntStr = "(총 " + toHtmlContext("span", [ "class=\"Ltotal_bold\"", "id=\"" + totCntId + "\""], "") + "건)";
	var spanStr = toHtmlContext("span", ["class=\"Ltotal\""], selectStr + totalCntStr);
	var divStr = toHtmlContext("div", ["class=\"LblockListInfo\""], spanStr);
	
	$("#" + tableId).before(divStr);
	
	// pagination info bottom the specific table
	var divStr_PgIndex = toHtmlContext("div", ["align=\"center\""],
								toHtmlContext("div", ["id=\".boardNavigation\""], 
									toHtmlContext("div", ["id=\"pagination\"", "class=\"pagination\""], "") 
							)
						); 
	$("#" + tableId).after(divStr_PgIndex);

	// hidden-typed data at the end of the contexts in a body
	// page index container
	addHiddenInputData(bodyId, pageIndexId);
	// page index click handler
	if( pageIndexHandleId != null) {
		addHiddenInputData(bodyId, pageIndexHandleId);
	}
}

function addHiddenInputData(beforeId, hiddenId, name) {
	$("#" + beforeId).append(toHtmlContext("input", ["type=\"hidden\"", "id=\"" + hiddenId + "\"", (name != null ? "name=\"" + name + "\"" : "")], ""));
}

/** *****************************************************************************
 * Set data for pagination capability.<br>
 * <p>
 * Each parameter's value of {@code pageIndexId} and {@code totalCntId} should be equal to {@code pagaIndexId} and {@code totalCntId}. 
 * 
 * <pre>
 * example:
 * setPaginationInfo(paginationInfo.pageSize,
 *                   data.cfmtnClssUnasnStReadQVO.pageUnit,
 *                   paginationInfo.currentPageNo,
 *                   paginationInfo.totalRecordCount,
 *                   "pageIndex",
 *                   "clickPageIndex",
 *                   "totalCntId");
 * </pre>
 * 
 * <p>
 * Good luck!
 * </p>
 * 
 * @param pageSize ({@code String}): Size of data shows per a display
 * @param pageUnit ({@code String}): 
 * @param currentPageNo ({@code String}): Current page number.
 * @param totalRecordCount ({@code String}):  Count of query result.
 * @param pageIndexId ({@code String}): ID of a element that contains a current page number.
 * @param pageIndexHandleId ({@code String}): ID of a element that handles a event generated when a page index is clicked.
 * @param totalCntId ({@code String}): ID of a element that contains total count.
 * 
 * @author [디자인 심사] 박준홍
 * @since 2011. 6. 28. 오후 9:26:19
*******************************************************************************/
 function setPaginationInfo(pageSize, pageUnit, currentPageNo, totalRecordCount, pageIndexId, pageIndexHandleId, totalCntId){
	/*alert("pageSize: " + pageSize + "\n" +
			"pageUnit: " + pageUnit + "\n" + 
			"currentPageNo: " + currentPageNo + "\n" +
			"totalRecordCount: " + totalRecordCount + "\n" +
			"pageIndexId: " + pageIndexId + "\n" + 
			"pageIndexHandleId: " + pageIndexHandleId + "\n" + 
			"totalCntId: " +  totalCntId	
			);*/
	
	$("#" + totalCntId).html(totalRecordCount);
	//$("#pageSize").val(pageSize);
	
    $("#pagination").quickPager( {
        pageSize: pageSize, 	
        pageUnit: pageUnit,
        pageIndexId: pageIndexId,
        searchButtonId: pageIndexHandleId,
        currentPage: currentPageNo,
        totalCount: totalRecordCount,
        searchUrl: "#" 
	});  
}
/** ***************************************************************************
 * Create the specific {@code Select} name of {@code selectId} with {@code Option}s that are {@code category}.<br>
 * The value of each category is an index of the parameterized array.
 * 
 * @param selectId ({@code String}): ID of a element that contains values of Category
 * @param categories ({@code Array}): Each value of Category
 * @param initIndex ({@code int}): initial index of {@code Select} 
 * @return
 * @author [디자인 심사] 박준홍
 * @since 2011. 7. 1. 오전 11:31:08
 * TODO
 ******************************************************************************/ 
function categorization(selectId, categories, initIndex){ 
	var select = document.getElementById(selectId);
	for(var i = 0; i < categories.length; i++ ) {
		select.options[i] = new Option(categories[i], i);
	}
	select.selectedIndex = initIndex;
}

/* ********************************************************
 * FUNCTION 명 : fn_fillSelectYear by. 김진수
 * FUNCTION 기능설명 : 원하는 범위의 년도 가져오기, 현재년도 기본선택
 * EX) 현재년도(2011)부터 4년전까지 가져오기
 * fn_fillSelectYear(셀렉트옵션ID, 4)
 * result : 2008, 2009, 2010, 2011 
 ******************************************************** */
function fn_fillSelectYear(selectOptionId,count){

		var date = new Date();
		yearArray = new Array();
		for(var i = 0; i < count; i++){
			yearArray[i] = date.getYear()-count+i;
			selectOptionId.options[i] = new Option(date.getYear()-count+i+1, date.getYear()-count+i+1);
			}
			selectOptionId.selectedIndex = count-1;
			
}

 /* ********************************************************
  * FUNCTION 명 : fn_fillSelectMonth by.김진수
  * FUNCTION 기능설명 : 전체월 가져오기, 현재월로 기본선택
  * result : 1~12까지 가져옴(단, 1~9까지는 0을 붙임 ex 01, 02..)
  ******************************************************** */
function fn_fillSelectMonth(selectOptionId){
	  	
		monthArray = new Array();
		for(var i = 0; i < 12; i++){
			monthArray[i] = i+1;
			if(i<=8)
				selectOptionId.options[i] = new Option(i+1, "0"+(i+1));
			else
				selectOptionId.options[i] = new Option(i+1, (i+1));
		}

		var date = new Date();
		thisMonth = date.getMonth();
		if(thisMonth<=8)
			selectOptionId.selectedIndex = "0"+thisMonth;
		else			
			selectOptionId.selectedIndex = thisMonth;
		
}

/* ********************************************************
 * FUNCTION 명 : fnChangeDisplay by 조길환
 * FUNCTION 기능설명 : 두개의 파라미터로 아이디 값을 받아와 
 * 첫번째 아이디의 디스플레이를 block으로 설정하고 다음의 아이디를 none으로 바꿔준다.
 ******************************************************** */
function fnToggleDisplay(blockId, noneId){
	//alert($("#"+blockId).css('display') + " : " + $("#"+noneId).css('display'));
//	if($("#"+blockId).css('display') == "none" && $("#"+noneId).css('display') != "none"){
//		$("#"+blockId).toggle();
//		$("#"+noneId).toggle();	
//	}
	$("#"+blockId).css({"display":"block"});
	$("#"+noneId).css({"display":"none"});
}

/* ********************************************************
 * FUNCTION 명 : fnToggleDisplayByIdArray by 조길환
 * FUNCTION 기능설명 : 디스플레이를 변경해줄 div들의 아이디를 배열로 받아
 * 선택된 아이디만 보여주고 나머지는 감춘다.
 ******************************************************** */
function fnToggleDisplayByIdArray(divs, selectId){
	for(i=0; i<divs.length; i++){
		if(divs[i] == selectId){
			continue;
		}
		//if($("#"+divs[i]).css('display') != 'none'){
			$("#"+divs[i]).css("display", "none");
		//}
	}
	
	if($("#"+selectId).css('display') == 'none'){
		$("#"+selectId).css("display", "block");
	}
	
}

/* ********************************************************
 * FUNCTION 명 : enterKeyCancel by 조길환
 * FUNCTION 기능설명 : Enter Key가 눌려졌을 경우 이를 무효화
 ******************************************************** */
function fnEnterKeyCancel(e){
	if(!e){
		var e = window.event;
	}
	if(e.keyCode){
		if(e.keyCode == 13){
			//alert('enter');
			return false;
		}
	}
	else if(e.which){
		if(e.which == 13){
			//alert('enter2');
			return false;
		}
	}
}

/* ********************************************************
 * FUNCTION 명 : enterKeyCancel by 조길환
 * FUNCTION 기능설명 : Enter Key가 눌려졌을 경우 이를 무효화하고 입력된 아이디로 포커스 이동
 ******************************************************** */
function fnChkFocusByEnterToId(e, focusObjId){
	if(!e){
		var e = window.event;
	}
	if(e.keyCode){
		if(e.keyCode == 13){
			//alert(13);
			fnChkFocusToId(focusObjId);
			return false;
		}
	}
	else if(e.which){
		if(e.which == 13){
			fnChkFocusToId(focusObjId);
			return false;
		}
	}
	return false;
}

/* ********************************************************
 * FUNCTION 명 : chkFocusToId by 조길환
 * FUNCTION 기능설명 : 입력된 아이디로 포커스 이동
 ******************************************************** */
function fnChkFocusToId(focusObjId){
	//document.getElementById(focusObjId).focus();
	$("#"+focusObjId).focus();
}

/* ********************************************************
 * FUNCTION 명 : fnValidateNumeric by 조길환
 * FUNCTION 기능설명 : 입력된 값이 번호인지여부를 체크
 ******************************************************** */
function fnValidateNumeric(checkStrVal){
	if(StringUtils.isEmpty(checkStrVal)) {
		return false;
	}
	checkStrVal = trim(checkStrVal);
    var checkOK = "0123456789";
    //alert("2"+ checkStrVal);
    for (var i = 0;  i < checkStrVal.length;  i++){
        ch = checkStrVal.charAt(i);
        for (var j = 0;  j < checkOK.length;  j++){
            if (ch == checkOK.charAt(j)){
                break;
            }
        }
        if (j == checkOK.length){
            return false;
            break;
        }
    }
    return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateNumericAndLength by 조길환
 * FUNCTION 기능설명 : 첫번째 인자값의 번호여부를 체크하고
 * 두번째 입력된 길이가 맞는지 유효성을 체크한다.
 ******************************************************** */
function fnValidateNumericAndLength(paramObj, length){
	if(fnValidateNumeric(paramObj.value) == false){
		return false;
	}
	if(paramObj.value.length != length){
		return false;
	}
	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateNumericAndLengthByValue by 조길환
 * FUNCTION 기능설명 : 첫번째 인자값의 번호여부를 체크하고
 * 두번째 입력된 길이가 맞는지 유효성을 체크한다.
 ******************************************************** */
function fnValidateNumericAndLengthByValue(value, length){
	if(fnValidateNumeric(value) == false){
		return false;
	}
	if(value.length != length){
		return false;
	}
	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateApplno by 조길환
 * FUNCTION 기능설명 : 출원번호의 유효성 체크
 ******************************************************** */
function fnValidateApplno(rgtTp, applYear, applSeq){
	//alert(1);
//	var rgtTp = document.getElementById("rgtTp");
//	var applYear = document.getElementById("applYear");
//	var applSeq = document.getElementById("applSeq");
	var rptTps = new Array(00, 10, 20, 30, 40, 41, 44, 45, 42, 43, 50, 51, 55, 52, 53, 60, 61, 65, 62, 63, 70, 71, 75, 72);
	var rptTpFlag = false;
	
	if(fnValidateNumericAndLength(rgtTp, 2) == false){
		alert("출원번호 권리구분을 확인해주세요.");
		rgtTp.focus();
		return false;
	}
	for(j=0; j<rptTps.length; j++){
		if(rptTps[j] == eval(rgtTp.value)){
			rptTpFlag = true;
			break;
		}
	}
	if(rptTpFlag == false){
		alert("출원번호 권리구분을 확인해주세요.");
		rgtTp.focus();
		return false;
	}
	if(fnValidateNumericAndLength(applYear, 4) == false){
		alert("출원년도를 확인해주세요.");
		applYear.focus();
		return false;
	}
	if(fnValidateNumericAndLength(applSeq, 7) == false){
		alert("출원일련번호를 확인해주세요.");
		applSeq.focus();
		return false;
	}

	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateApplnoById by 조길환
 * FUNCTION 기능설명 : 출원번호의 유효성 체크
 ******************************************************** */
function fnValidateApplnoById(rgtTp, applYear, applSeq){
	var rgtTp = document.getElementById(rgtTp);
	var applYear = document.getElementById(applYear);
	var applSeq = document.getElementById(applSeq);
	
	var rptTps = new Array(00, 10, 20, 30, 40, 41, 44, 45, 42, 43, 50, 51, 55, 52, 53, 60, 61, 65, 62, 63, 70, 71, 75, 72);
	var rptTpFlag = false;
	
	if(fnValidateNumericAndLength(rgtTp, 2) == false){
		alert("출원번호 권리구분을 확인해주세요.");
		rgtTp.focus();
		return false;
	}
	for(j=0; j<rptTps.length; j++){
		if(rptTps[j] == eval(rgtTp.value)){
			rptTpFlag = true;
			break;
		}
	}
	if(rptTpFlag == false){
		alert("출원번호 권리구분을 확인해주세요.");
		rgtTp.focus();
		return false;
	}
	if(fnValidateNumericAndLength(applYear, 4) == false){
		alert("출원년도를 확인해주세요.");
		applYear.focus();
		return false;
	}
	if(fnValidateNumericAndLength(applSeq, 7) == false){
		alert("출원일련번호를 확인해주세요.");
		applSeq.focus();
		return false;
	}

	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateOpnnoById by 이규성
 * FUNCTION 기능설명 : 공개번호의 유효성 체크
 ******************************************************** */
function fnValidateOpnnoById(rgtTp, opnYear, opnSeq){
	var rgtTp = document.getElementById(rgtTp);
	var opnYear = document.getElementById(opnYear);
	var opnSeq = document.getElementById(opnSeq);
	
	var rptTps = new Array(00, 10, 20, 30, 40, 41, 44, 45, 42, 43, 50, 51, 55, 52, 53, 60, 61, 65, 62, 63, 70, 71, 75, 72);
	var rptTpFlag = false;
	
	if(fnValidateNumericAndLength(rgtTp, 2) == false){
		alert("공개번호 권리구분을 확인해주세요.");
		rgtTp.focus();
		return false;
	}
	for(j=0; j<rptTps.length; j++){
		if(rptTps[j] == eval(rgtTp.value)){
			rptTpFlag = true;
			break;
		}
	}
	if(rptTpFlag == false){
		alert("공개번호 권리구분을 확인해주세요.");
		rgtTp.focus();
		return false;
	}
	if(fnValidateNumericAndLength(opnYear, 4) == false){
		alert("공개년도를 확인해주세요.");
		opnYear.focus();
		return false;
	}
	if(fnValidateNumericAndLength(opnSeq, 7) == false){
		alert("공개일련번호를 확인해주세요.");
		opnSeq.focus();
		return false;
	}

	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateRgstnoById by 이규성
 * FUNCTION 기능설명 : 등록번호의 유효성 체크
 ******************************************************** */
function fnValidateRgstnoById(rgtTp, rgstSeq, divTrans, rnwDiv) {
	var rgtTp = document.getElementById(rgtTp);
	var rgstSeq = document.getElementById(rgstSeq);
	var divTrans = document.getElementById(divTrans);
	var rnwDiv = document.getElementById(rnwDiv);
	var rgstno = rgtTp.value + rgstSeq.value + divTrans.value + rnwDiv.value;
	
	var rptTps = new Array(00, 10, 20, 30, 40, 41, 44, 45, 42, 43, 50, 51, 55, 52, 53, 60, 61, 65, 62, 63, 70, 71, 75, 72, 73, 90);
	var rptTpFlag = false;
	
	if(!fnValidateNumeric(rgstno)) {
		alert("등록번호는 숫자만으로 구성되어 있습니다.");
		return false;
	}
	
	for(j=0; j<rptTps.length; j++){
		if(rptTps[j] == eval(rgtTp.value)){
			rptTpFlag = true;
			break;
		}
	}
	
	if(rptTpFlag == false){
		alert("등록번호 권리구분을 확인해주세요.");
		rgtTp.focus();
		return false;
	}
	
	if(!fnValidateNumericAndLength(rgstSeq, 7)) {
		alert("등록일련번호는 7자리의 숫자입니다.");
		return false;
	}
	
	if(!fnValidateNumericAndLength(divTrans, 2)) {
		alert("분할이전은 2자리의 숫자입니다.");
		return false;
	}
	
	if(!fnValidateNumericAndLength(rnwDiv, 2)) {
		alert("갱신분할은 2자리의 숫자입니다.");
		return false;
	}
	
	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateTrlnoById by 이규성
 * FUNCTION 기능설명 : 심판번호의 유효성 체크
 ******************************************************** */
function fnValidateTrlnoById(trlYear, trlTp, trlSeq) {
	var trlYear = document.getElementById(trlYear);
	var trlTp = document.getElementById(trlTp);
	var trlSeq = document.getElementById(trlSeq);
	
	var trlno = trlYear.value + trlTp.value + trlSeq.value;
	
	if(trlno.length != 13) {
		alert("심판번호의 자리수가 맞지 않습니다.");
		return false;
	}
	
	if(!fnValidateNumeric(trlno)) {
		alert("심판번호는 숫자만으로 구성되어 있습니다.");
		return false;
	}
	
	if(!fnValidateNumericAndLength(trlYear, 4)) {
		alert("심판년도는 4자리의 숫자입니다.");
		return false;
	}
	
	if(!fnValidateNumericAndLength(trlTp, 3)) {
		alert("심판구분은 3자리의 숫자입니다.");
		return false;
	}
	
	if(!fnValidateNumericAndLength(trlSeq, 6)) {
		alert("심판일련번호은 2자리의 숫자입니다.");
		return false;
	}
	
	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateRgstno by 이진오
 * FUNCTION 기능설명 : 등록번호의 유효성 체크
 ******************************************************** */
function fnValidateRgstno(rgtTp, rgstSeq, divTrans, rnwDiv) {
	var rgstno = rgtTp.value + rgstSeq.value + divTrans.value + rnwDiv.value;
	var rgtTps = new Array(00, 10, 20, 30, 40, 41, 44, 45, 42, 43, 50, 51, 55, 52, 53, 60, 61, 65, 62, 63, 70, 71, 75, 72, 73, 90);
	
	var rgtTpFlag = false;
	for(j=0; j<rgtTps.length; j++){
		if(rgtTps[j] == eval(rgtTp.value)){
			rgtTpFlag = true;
			break;
		}
	}
	if(rgtTpFlag == false){
		alert("권리구분이 올바르지 않습니다.");
		rgtTp.focus();
		return false;
	}
	
	if(rgstno=="") {
		alert("등록번호를 입력하십시오.");
		return false;
	}
	
	if(rgstno.length != 13) {
		alert("등록번호의 자리수가 맞지 않습니다.");
		return false;
	}
	
	if(!fnValidateNumeric(rgstno)) {
		alert("등록번호는 숫자만으로 구성되어 있습니다.");
		return false;
	}
	
	if(!fnValidateNumeric(rgtTp.value)) {
		alert("권리구분이 올바르지 않습니다.");
		return false;
	}
	
	if(!fnValidateNumericAndLength(rgstSeq, 7)) {
		alert("등록일련번호는 7자리의 숫자입니다.");
		return false;
	}
	
	if(!fnValidateNumericAndLength(divTrans, 2)) {
		alert("분할이전은 2자리의 숫자입니다.");
		return false;
	}
	
	if(!fnValidateNumericAndLength(rnwDiv, 2)) {
		alert("갱신분할은 2자리의 숫자입니다.");
		return false;
	}
	
	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateIntnlApplno by 조길환
 * FUNCTION 기능설명 : 국제출원번호의 유효성 체크
 ******************************************************** */
function fnValidateIntnlApplno2(intnlYear, intnlSeq){
	//var intnlYear = document.getElementById("intnlYear");
	//var intnlSeq = document.getElementById("intnlSeq");
	
	if(fnValidateNumericAndLength(intnlYear, 4) == false){
		alert("국제출원년도를 확인해주세요.");
		intnlYear.focus();
		return false;
	}
	if(fnValidateNumericAndLength(intnlSeq, 6) == false){
		alert("국제출원일련번호를 확인해주세요.");
		intnlSeq.focus();
		return false;
	}
	if(intnlSeq.value.substring(0,1)!='0') {
		alert("존재하지 않는 국제출원번호 입니다.");
		intnlSeq.focus();
		return false;
	}
	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateIntnlApplno by 이진오
 * FUNCTION 기능설명 : 국제출원번호의 유효성 체크
 ******************************************************** */
function fnValidateIntnlApplno(intnlCntryCd, intnlYear, intnlSeq){
	
	if(intnlCntryCd.value.length!=2) {
		alert("국가코드를 입력하십시오.");
		intnlCntryCd.focus();
		return false;
	}
	if(fnValidateNumericAndLength(intnlYear, 4) == false){
		alert("국제출원년도를 확인해주세요.");
		intnlYear.focus();
		return false;
	}
	if(fnValidateNumericAndLength(intnlSeq, 6) == false){
		alert("국제출원일련번호를 확인해주세요.");
		intnlSeq.focus();
		return false;
	}
	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateIntnlApplnoById by 조길환
 * FUNCTION 기능설명 : 국제출원번호의 유효성 체크
 ******************************************************** */
function fnValidateIntnlApplnoById(intnlYearId, intnlSeqId){
	var intnlYear = document.getElementById(intnlYearId);
	var intnlSeq = document.getElementById(intnlSeqId);
	
	if(fnValidateNumericAndLength(intnlYear, 4) == false){
		alert("국제출원년도를 확인해주세요.");
		intnlYear.focus();
		return false;
	}
	if(fnValidateNumericAndLength(intnlSeq, 6) == false){
		alert("국제출원일련번호를 확인해주세요.");
		intnlSeq.focus();
		return false;
	}
	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateApagtCd by 조길환
 * FUNCTION 기능설명 : 출원인/대리인코드(신청인코드) 유효성 검사
 ******************************************************** */
function fnValidateApagtCd(apagtTpcd, apagtYear, apagtSeq, apagtDigit){
	if(fnValidateNumericAndLength(apagtTpcd, 1) == false){
		alert("출원인/대리인코드 구분을 확인해주세요.");
		apagtTpcd.focus();
		return false;
	}
	if(fnValidateNumericAndLength(apagtYear, 4) == false){
		alert("출원인/대리인코드 등록년도를 확인해주세요.");
		apagtYear.focus();
		return false;
	}
	if(fnValidateNumericAndLength(apagtSeq, 6) == false){
		alert("출원인/대리인코드 일련번호를 확인해주세요.");
		apagtSeq.focus();
		return false;
	}
	if(fnValidateNumericAndLength(apagtDigit, 1) == false){
		alert("출원인/대리인코드가 잘못되었습니다.\n확인해주세요.");
		apagtDigit.focus();
		return false;
	}
	
	var apagtCd = apagtTpcd.value + apagtYear.value + apagtSeq.value + apagtDigit.value;
	if(!fnValidateApagtCdNumber(apagtCd)) {
		return false;
	}
	
	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateApagtCdById by 조길환
 * FUNCTION 기능설명 : 출원인/대리인코드(신청인코드) 유효성 검사
 ******************************************************** */
function fnValidateApagtCdById(apagtTpcd, apagtYear, apagtSeq, apagtDigit){
	var apagtTpcd = document.getElementById(apagtTpcd);
	var apagtYear = document.getElementById(apagtYear);
	var apagtSeq = document.getElementById(apagtSeq);
	var apagtDigit = document.getElementById(apagtDigit);

	if(fnValidateNumericAndLength(apagtTpcd, 1) == false){
		alert("출원인/대리인코드 구분을 확인해주세요.");
		apagtTpcd.focus();
		return false;
	}
	if(fnValidateNumericAndLength(apagtYear, 4) == false){
		alert("출원인/대리인코드 등록년도를 확인해주세요.");
		apagtYear.focus();
		return false;
	}
	if(fnValidateNumericAndLength(apagtSeq, 6) == false){
		alert("출원인/대리인코드 일련번호를 확인해주세요.");
		apagtSeq.focus();
		return false;
	}
	if(fnValidateNumericAndLength(apagtDigit, 1) == false){
		alert("출원인/대리인코드가 잘못되었습니다.\n확인해주세요.");
		apagtDigit.focus();
		return false;
	}
	var apagtCd = apagtTpcd.value + apagtYear.value + apagtSeq.value + apagtDigit.value;
	if(!fnValidateApagtCdNumber(apagtCd)) {
		return false;
	}
	return true;
}

/* ********************************************************
 * FUNCTION 명 : fnValidateApagtCdNumber by 이진오
 * FUNCTION 기능설명 : 출원인/대리인코드(신청인코드) 숫자의 유효성 검사
 ******************************************************** */
function fnValidateApagtCdNumber(apagtCd) {
	var tempchar;
	var sum_total = 0;
	var len_of_cd = apagtCd.length;
	var j = 9;
	var sum = 0;
	
	for(var i=0; i<len_of_cd-1; i++) {
		tempchar = apagtCd.substring(i, i+1);
		sum += parseInt(tempchar) * j;
		j = j - 1;
		
		if(j<2) {
			j = 9;
		}
	}
	
	var mod = sum%11;
	
	if(mod==0) {
		mod = 1;
	} else if(mod==10) {
		mod = 0;
	}
	
	tempchar = apagtCd.substring(len_of_cd-1, len_of_cd);
	
	if(mod!=parseInt(tempchar)){
		if(len_of_cd==12) {
			alert("출원인대리인코드 입력 오류입니다.");
		} else {
			alert("입력이 완료되지 않았습니다.");
		}
		return false;
	} else {
		return true;
	}
}

/* ********************************************************
 * FUNCTION 명 : fnValidatePctRcptnoById
 * FUNCTION 기능설명 : 접수번호 유효성 검사
 ******************************************************** */
function fnValidatePctRcptnoById(rcptRgtTpCd, mailTpCd, rcptYear, rcptSeq, rcptDigit){
	//'rcptRgtTpCd', 'mailTpCd', 'rcptYear', 'rcptSeq', 'rcptDigit'
	
	var rcptRgtTpCd = document.getElementById(rcptRgtTpCd);
	var mailTpCd = document.getElementById(mailTpCd);
	var rcptYear = document.getElementById(rcptYear);
	var rcptSeq = document.getElementById(rcptSeq);
	var rcptDigit = document.getElementById(rcptDigit);

	if(fnValidateNumericAndLength(rcptRgtTpCd, 1) == false){
		alert("PCT접수번호의 권리구분을 확인해주세요.");
		rcptRgtTpCd.focus();
		return false;
	}
	if(fnValidateNumericAndLength(mailTpCd, 1) == false){
		alert("PCT접수번호의 Mail타입코드를 확인해주세요.");
		mailTpCd.focus();
		return false;
	}
	if(fnValidateNumericAndLength(rcptYear, 4) == false){
		alert("PCT접수번호의 접수년도를 확인해주세요.");
		rcptYear.focus();
		return false;
	}
	if(fnValidateNumericAndLength(rcptSeq, 7) == false){
		alert("PCT접수번호의 일련번호를 확인해주세요.");
		rcptSeq.focus();
		return false;
	}
	if(fnValidateNumericAndLength(rcptDigit, 2) == false){
		alert("PCT접수번호가 잘못되었습니다.");
		rcptDigit.focus();
		return false;
	}
	return true;
}

function fnNumberFormatForRcptno(value){
	var rsValue = ''; 
	//if(numTp == 'rcptno'){
		if(fnValidateNumericAndLengthByValue(value, 15) == false){
			alert("["+value+"]는 접수번호의 형식에 맞지 않습니다.");
			return value;
		}
		if(value.length == 15){
			rsValue = value.substring(0,1) + '-'
					+ value.substring(1,2) + '-'
					+ value.substring(2,6) + '-'
					+ value.substring(6,13) + '-'
					+ value.substring(13);
			//alert(value + " : " + rsValue);
			return rsValue;
		}
	//}
}

function fnGetDate(comma){
	//alert(11);
	var d = new Date();
	return d.getFullYear() + comma
		 + lpad(d.getMonth()+1+"", "0", 2) + comma 
		 + lpad(d.getDate()+"", "0", 2);

}

function fnApplnoToTextfield(applno, id1, id2, id3){
	$("#"+id1).val(applno.substring(0,2));
	$("#"+id2).val(applno.substring(2,6));
	$("#"+id3).val(applno.substring(6));
}

function fnIntnlApplnoToTextfield(intnlApplno, id1, id2){
	$("#"+id1).val(intnlApplno.substring(2,6));
	$("#"+id2).val(intnlApplno.substring(7));
	//$("#"+id3).val(applno.substring(6));
}

function fnResetInputValueById(inputIdArr){
	for(i=0; i<inputIdArr.length; i++){
		//alert($("#"+inputIdArr[i]).attr("id"));
		$("#"+inputIdArr[i]).val("");
		//alert($("#"+inputIdArr[i]).attr("type"));
	}
}

var PRFormat = {
		// 접수번호(rcptno) 포맷 
		rcptno: function(str) {
			if(!fnValidateNumericAndLengthByValue(str, 15)){
				return str;
			}
			else{
				var rsValue = str.substring(0,1) + '-'
				+ str.substring(1,2) + '-'
				+ str.substring(2,6) + '-'
				+ str.substring(6,13) + '-'
					+ str.substring(13);
				return rsValue;
			}
		}
		//접수번호(rcptno) 포맷 
		,rcptnoForList: function(str) {
			if(!fnValidateNumericAndLengthByValue(str, 15)){
				return str;
			}
			else{
				var rsValue = str.substring(6,13)
					+ "-" + str.substring(13);
				return rsValue;
			}
		}
		// 국제출원번호(intnlApplno) 포맷 : ex)2009000123 => KR/2009/000123
		, intnlApplno: function(str){
			if(!fnValidateNumericAndLengthByValue(str, 10)){
				return str;
			}
			else{
				return "KR"+str.substring(0,4)+"/"+str.substring(4);
			}
		}
		// 신청인코드(출원인/대리인코드)
		, acssPtitrCd: function(str){
			if(!fnValidateNumericAndLengthByValue(str, 12)){
				return str;
			}
			else{
				return str.substring(0,1)+"-"+str.substring(1,5)+"-"+str.substring(5,11)+"-"+str.substring(11);
			}
		}
		// 심판번호(trlno) 포맷 : ex) 2009100001803 => 2009-100-001803
		, trlno: function(str){
			if(!fnValidateNumericAndLengthByValue(str, 13)){
				return str;
			}
			else{
				return str.substring(0,4)+"-"+str.substring(4,7)+"-"+str.substring(7);
			}
		}
		// 날짜 포맷 : ex) 20010101 => 2001.01.01
		, date: function(str, token){
			if(!fnValidateNumericAndLengthByValue(str, 8)){
				return str;
			}
			else{
				return str.substring(0,4) + token + str.substring(4,6) + token + str.substring(6);
			}
		}
		// 발송번호 : ex) 552011001116755 => 5-5-2011-001116755
		, mlno: function(str){
			if(!fnValidateNumericAndLengthByValue(str, 15)){
				return str;
			}
			else{
				return str.substring(0, 1) + "-" + str.substring(1, 2) + "-" + str.substring(2, 6) + "-" + str.substring(6);
			}
		}
	};

/*******************************************************************************
* FUNCTION 명 : StringUtils
* FUNCTION 기능설명 : String 관련 Utility 들의 모음
* @author 김명래
*******************************************************************************/
var StringUtils = {
	isEmpty : function(str) {
		return typeof str == "undefined" || str == null || trim(str).length == 0;
	}
	// compare 가 들어있는 갯수
	, stringCount : function (str, compare) {
		if(StringUtils.isEmpty(str) || StringUtils.isEmpty(compare)) 
			return 0;

		var result = str.split(compare);
		return result ? result.length : 0;
	}
};

function focusToId(e, maxlength, length, prevId, postId){
	//alert(1);
	if(chkKeyEvent(e, 37)){//왼쪽 화살표 무시
		return false;
	}
	if(chkKeyEvent(e, 39)){//오른쪽 화살표 무시
		return false;
	}
	if(chkKeyEvent(e, 9)){//탭키 무시
		return false;
	}
	if(postId != null && postId != undefined && postId != ''){
		if(maxlength == length){
			$("#"+postId).focus();
			$("#"+postId).select();
		}
	}
	if(prevId != null && prevId != undefined && prevId != ''){
		if(chkKeyEvent(e, 8)){
			//alert("back" + " : " + length);
			if(length==0){
				//alert("focus");
				$("#"+prevId).focus();
				$("#"+prevId).select();
				return false;
			}
		}
	}
}

function chkKeyEvent(e, code){
	if(!e){
		var e = window.event;
	}
	if(e.keyCode){
		if(e.keyCode == code){
			return true;
		}
	}
	else if(e.which){
		if(e.which == code){
			return true;
		}
	}
	
}

function fnTrlnoToTextfield(trlno, id1, id2, id3, id4){
	$("#"+id1).val(trlno.substring(0,4));
	$("#"+id2).val(trlno.substring(4,7));
	$("#"+id3).val(trlno.substring(4,7));
	$("#"+id4).val(trlno.substring(7));
}

function fnChkLengthBoundary(value, min, max){
	if (StringUtils.isEmpty(value)){
		return false;
	}
	if (min > value.length || value.length > max){
		return false;
	}
	return true;
}

function fnChangeTrColor(rcptno){
	var listSize = $("#listContents tr").size();
	rcptno = PRFormat.rcptnoForList(rcptno);
	$("#listContents tr").css({"backgroundColor":""});
	//$("#listContents tr:contains("+rcptno+")").css({"backgroundColor":"#FFEFD5"});
	$("#listContents tr:contains("+rcptno+")").children("td[rowspan=1]").css('background-color', '#FFEFD5');
}

function fnSetYnToString(value, YStr, NStr){
	if(value == "Y" || value == "y" || value == "1" || value == 1){
		return YStr;
	}
	else if(value == "N" || value == "n" || value == "0" || value == 0){ 
		return NStr;
	}
	else return "[fnSetYnToString] 입력값 확인 : " + value;
}

function fnResetForm(formId){
	$("#"+formId).each(function(){
		this.reset();
	});
}

//cookie 조회
function getCookie(name){
  var cname = name + "=";
  var dc = document.cookie;
  if (dc.length > 0) {
    begin = dc.indexOf(cname);
    if (begin != -1) {
      begin += cname.length;
      end = dc.indexOf(";", begin);
      if (end == -1) end = dc.length;
        return unescape(dc.substring(begin, end));
    }
  }
  return null;
}

// cookie 등록
function setCookie(name, value, expires, path, domain, secure) {
  document.cookie = name + "=" + escape(value) +
  //((expires == null) ? "" : "; expires=" + expires.toGMTString()) +
  ((path == null) ? "" : "; path=" + path) +
  ((domain == null) ? "" : "; domain=" + domain) +
  ((secure == null) ? "" : "; secure");
}

// cookie 삭제
function delCookie (name,path,domain) {
  if (getCookie(name)) {
    document.cookie = name + "=" +
    ((path == null) ? "" : "; path=" + path) +
    ((domain == null) ? "" : "; domain=" + domain) + "; expires=Thu, 01-Jan-70 00:00:01 GMT";
  }
  //페이지 리로드
  document.location.reload();
}

/*******************************************************************************
* FUNCTION 명 : fnAutoDateForm
* FUNCTION 기능설명 : 자동날짜형식
*                    input - event handler ( onblur )
*                    obj - input object(this)
*******************************************************************************/
function fnAutoDateForm(obj) {
	var date = "";
	var dateLen = 0;
	var pttn = /[^(0-9)]/g;
	date = formatToString(obj.value);
	dateLen = date.length;
	if (pttn.test(date)) {
		alert("숫자가 아닌 문자가 포함되어있습니다. \n다시 입력해 주세요!");
		obj.value = "";
		obj.focus();
		return;
	}
	if (date != null && date != "") {
		if (dateLen == 8) {
			if(eval(date.substring(0,4)) == 0){
				alert("날짜형식의 년도를 확인해주세요.");
				obj.focus();
			}
			else if(date.substring(4,6) == '00' || eval(date.substring(4,6)) > 12){
				alert("날짜형식의 달을 확인해주세요.");
				obj.focus();
			}
			else if(date.substring(6) == '00' || eval(date.substring(6)) > 31){
				alert("날짜형식의 일자를 확인해주세요.");
				obj.focus();
			}
			else{
				obj.value = strFormat(date, "####-##-##");
			}
		} else if (dateLen < 8) {
			alert("날짜형식[ 예) 2011년1월1일 - 2011-01-01 ]에 맞게 입력해 주세요!");
			obj.value = "";
			obj.focus();
		} else if (dateLen > 8){  //날짜형식을 벗어났음
			alert("날짜형식 범위를 벗어났습니다. \n다시 입력해 주시기 바랍니다.");
			obj.value = "";
			obj.focus();
		} else {
			alert("날짜형식이 맞지 않습니다. \n다시 입력해 주시기 바랍니다.");
			obj.value = "";
			obj.focus();
		}
	}
}

/*******************************************************************************
* FUNCTION 명 : fnAutoDateForm
* FUNCTION 기능설명 : 자동날짜형식
*                    input - event handler ( onblur )
*                    obj - input object(this)
*******************************************************************************/
function fnAutoDateForm(obj, spec) {
	var date = "";
	var dateLen = 0;
	var pttn = /[^(0-9)]/g;
	date = formatToString(obj.value);
	//date = obj.value;
	dateLen = date.length;
	
	if (pttn.test(date)) {
		alert("숫자가 아닌 문자가 포함되어있습니다. \n다시 입력해 주세요!");
		obj.value = "";
		obj.focus();
		return;
	}
	if (date != null && date != "") {
		if (dateLen == 8) {
			if(eval(date.substring(0,4)) == 0){
				alert("날짜형식의 년도를 확인해주세요.");
				obj.focus();
			}
			else if(date.substring(4,6) == '00' || eval(date.substring(4,6)) > 12){
				alert("날짜형식의 달을 확인해주세요.");
				obj.focus();
			}
			else if(date.substring(6) == '00' || eval(date.substring(6)) > 31){
				alert("날짜형식의 일자를 확인해주세요.");
				obj.focus();
			}
			else{
				obj.value = strFormat(date, "####"+spec+"##"+spec+"##");
			}
		} else if (dateLen < 8) {
			alert("날짜형식[ 예) 2011년1월1일 - 2011"+spec+"01"+spec+"01 ]에 맞게 입력해 주세요!");
			obj.value = "";
			obj.focus();
		} else if (dateLen > 8){  //날짜형식을 벗어났음
			alert("날짜형식 범위를 벗어났습니다. \n다시 입력해 주시기 바랍니다.");
			obj.value = "";
			obj.focus();
		} else {
			alert("날짜형식이 맞지 않습니다. \n다시 입력해 주시기 바랍니다.");
			obj.value = "";
			obj.focus();
		}
	}
}

/*******************************************************************************
* FUNCTION 기능설명 : 조회조건의 년도 및 달 변경시 날짜를 자동으로 계산하는 이벤트 발생
*******************************************************************************/
$(function() {
	$("select[id='year']").change(function(){
		fnSetDate();
	});
	$("select[id='month']").change(function(){
		fnSetDate();
	});
});

/*******************************************************************************
* FUNCTION 명 : fnSetDate()
* FUNCTION 기능설명 : 조회조건의 년도 및 달 변경시 날짜를 자동으로 계산하여 세팅
*******************************************************************************/
function fnSetDate(){
	var year = $("select[id='year']").val();
	var month = $("select[id='month']").val();
	var date = $("select[id='date']").val();
	//$("#date");
	var thisDate = new Date(eval(year), eval(month-1), 1); //선택된 년달
	var nextDate = new Date(eval(year), eval(month), 1);//다음 년달
	
	var rsMillisecond = nextDate - thisDate;
	var rsDates = rsMillisecond/1000/60/60/24;
	
	//alert(rsDates);
	
	//$("#date").empty();
	var imsiHtml = "";
	for(var i=1; i<=rsDates; i++){
		imsiHtml += "<option value='"+i+"'>" + i +"</option>";
	}
	$("select[id='date']").html(imsiHtml);
	$("select[id='date']").val(date);
}

function fnReadCondReset(){
	var nowDate = fnGetDate(".");
	$("select[id='year']").val(nowDate.substring(0,4));
	$("select[id='month']").val(eval(nowDate.substring(5,7)));
	$("select[id='date']").val(eval(nowDate.substring(8)));
}

/*******************************************************************************
* FUNCTION 명 : makeNumberComma()
* FUNCTION 기능설명 : 숫자의 천단위 컴마를 표시한다.
*******************************************************************************/
function makeNumberComma(befString) {
	var str = strFormat(befString, "#0");
	if(str==null || str=="") {
		str = 0;
	}
	return str;
}

/*******************************************************************************
 * FUNCTION 명 : fncZeroPadding3
 * FUNCTION 기능설명 : 탭/엔터 입력시 자동 패딩 
 *******************************************************************************/
function fncZeroPadding3(obj, event){
	if(event.keyCode == 9 || event.keyCode == 13){
		var max = obj.maxLength;
		var zero = obj.zeropadding;
		var val = obj.value.length;

		if(zero=='true' && max!=undefined && max!=null) {
			var temp = obj.value;
			for(var i=0; i<max-val; i++) {
				temp = "0" + temp;
			}
			obj.value = temp;
		}
	}
}

//한글,특문,영문,숫자 체크
function word_check(check_string) {
	var char_ASCII = check_string.charCodeAt(check_string.length-1); 
 
	//숫자 
	if (char_ASCII >= 48 && char_ASCII <= 57 ) 
		return 1; 
	//영어 
	else if ((char_ASCII>=65 && char_ASCII<=90) || (char_ASCII>=97 && char_ASCII<=122)) 
        return 2; 
	//특수기호 
	else if ((char_ASCII>=33 && char_ASCII<=47) || (char_ASCII>=58 && char_ASCII<=64) || (char_ASCII>=91 && char_ASCII<=96) || (char_ASCII>=123 && char_ASCII<=126)) 
		return 4; 
	//한글 
	else if ((char_ASCII >= 12592) || (char_ASCII <= 12687)) 
        return 3; 
	else  
        return 0; 
}

//한글 포함여부 체크
function isInKorean(str){
	for(var i=0; i<str.length; i++){
		if(word_check(str.charAt(i)) == 3){
			return true;
		}
	}
	return false;
}

//영어포함여부 체크
function isInEnglish(str){
	for(var i=0; i<str.length; i++){
		if(word_check(str.charAt(i)) == 2){
			return true;
		}
	}
	return false;
}

//특수문자 포함여부 체크
function isInSpecialChar(str){
	for(var i=0; i<str.length; i++){
		if(word_check(str.charAt(i)) == 4){
			return true;
		}
	}
	return false;
}

//숫자 포함여부 체크
function isInNumber(str){
	for(var i=0; i<str.length; i++){
		if(word_check(str.charAt(i)) == 1){
			return true;
		}
	}
	return false;
}

//이메일 주소 유효성 체크
function isMail(str)
{
    //var str = obj;  
    var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    
    if (str.search(format) == -1) {       
        return false;
    }

    return true;
}

//IP의 유효성 체크 - 광역대는 ':'로 구별하고 추가 ip는 ','로 구별
function checkIp(str)
{
	var imsiFirstIP = '';
	
	str = str.replace(/(^\s*)|(\s*$)/gi,"");
	
    var format = /^([0-9\:\,\.]+?)$/;
    
    if (str.search(format) == -1) {       
        return false;
    }

    var comma = str.split(",");
	if(comma.length > 1){
		for(var i = 0; i < comma.length; i++){
			var semicol = comma[i].split(":");
			if(semicol.length > 2){
				return false;	
			}
			else if(semicol.length > 1){
				for(var j = 0; j < semicol.length; j++){
					if(imsiFirstIP == ''){
						imsiFirstIP = semicol[0];
					}
					if(!isIp(semicol[j])){
						return false;
					}
				}
			}
			else{
				if(imsiFirstIP == ''){
					imsiFirstIP = comma[0];
				}
				if(!isIp(comma[i])){
					return false;
				}
			}
		}
	}
	else{
		var semicol = str.split(":");
		if(semicol.length > 2){
			return false;	
		}
		else if(semicol.length > 1){
			for(var j = 0; j < semicol.length; j++){
				if(imsiFirstIP == ''){
					imsiFirstIP = semicol[0];
				}
				if(!isIp(semicol[j])){
					return false;
				}
			}
		}
		else{
			if(imsiFirstIP == ''){
				imsiFirstIP = str;
			}
			if(!isIp(str)){
				return false;
			}
		}
	}
    //alert('last : ' + imsiFirstIP);
    firstID = imsiFirstIP; 
    
    return true;
}

//ip의 유효성 체크
function isIp(str){
	var expUrl = /^(1|2)?\d?\d([.](1|2)?\d?\d){3}$/;
		// /^(1|2)?\d?\d([.](\d{1,3})){3}$/; 
		// /^(1|2)?\d?\d([.](1|2)?\d?\d){3}$/;
	//alert(str + ' : ' + expUrl.test(str));
	return expUrl.test(str);
}

function validateShortLength(str, length){
	if(str.length < length){
		return false;
	}
	return true;
}

// 문자열 길이 검사
function isLength(varCk) {
	var varLen = 0;
	// var agr = navigator.userAgent;

	for ( var i = 0; i < varCk.length; i++) {
		ch = varCk.charAt(i);
		if ((ch == "\n") || ((ch >= "ㅏ") && (ch <= "히"))
				|| ((ch >= "ㄱ") && (ch <= "ㅎ")))
			varLen += 2;
		else
			varLen += 1;
	}
	return (varLen);
}

//입력 문자열 검사 (숫자/특수문자)
function isInteger(varCk, charSet) {
	var chk = true;
	for ( var i = 0; i <= varCk.length - 1; i++) {
		ch = varCk.substring(i, i + 1);
		if (ch >= "0" && ch <= "9") {
			chk = true;
		} else {
			chk = false;
			for ( var j = 0; j <= charSet.length - 1; j++) {
				comp = charSet.substring(j, j + 1);
				if (ch == comp) {
					chk = true;
					break;
				}
			}
			if (!chk)
				break; // 숫자+특수문자외의 문자가 있는 경우만 error 종료 2002.04.08
		}
	}
	return chk;
}

//날짜 유효성 확인하기
function isDate(date){
	var pattern = new RegExp(/\b\d{4}[\/-](0|1)\d{1}[\/-](0|1|2|3)\d\b/);
	return pattern.test(date);
}

/* ********************************************************
 * FUNCTION 명 : isNumericPlusSpecStr by 조길환
 * FUNCTION 기능설명 : 입력된 값이 및 두번째 인자에 추가된 특수문자로만 이루어졌는지 체크
 ******************************************************** */
function isNumericPlusSpecStr(checkStrVal, specStr){
	if(StringUtils.isEmpty(checkStrVal)) {
		return false;
	}
	checkStrVal = trim(checkStrVal);
    var checkOK = "0123456789";
    if(specStr != undefined){
    	checkOK += specStr;
    }
    //alert("2"+ checkStrVal);
    for (var i = 0;  i < checkStrVal.length;  i++){
        ch = checkStrVal.charAt(i);
        for (var j = 0;  j < checkOK.length;  j++){
            if (ch == checkOK.charAt(j)){
                break;
            }
        }
        if (j == checkOK.length){
            return false;
            break;
        }
    }
    return true;
}

/* ********************************************************
 * FUNCTION 명 : checkImageFileExtension by 조길환
 * FUNCTION 기능설명 : 이미지 파일 확장자를 체크한다.
 ******************************************************** */
function checkImageFileExtension(str){
	var arr = str.split("\\");
	var fileName = arr[arr.length-1];
	var ext = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
	if(ext != 'gif' && ext != 'jpg'){
		alert("업로드할 수 없는 파일 형식 입니다.\n업로드 허용 파일 [gif,jpg]");
		return false;
	}
	return true;
}

/* ********************************************************
 * FUNCTION 명 : checkDocFileExtension by 조길환
 * FUNCTION 기능설명 : 문서 파일 확장자를 체크한다.
 ******************************************************** */
function checkDocFileExtension(str){
	var arr = str.split("\\");
	var fileName = arr[arr.length-1];
	var ext = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
	if(ext != 'hwp' && ext != 'doc' && ext != 'txt' && ext != 'xls'){
		alert("업로드할 수 없는 파일 형식 입니다.\n업로드 허용 파일 [hwp,doc,txt,xls]");
		return false;
	}
	return true;
}

/* ********************************************************
 * FUNCTION 명 : getFileExtension by 조길환
 * FUNCTION 기능설명 : 파일 확장자를 구한다. 
 ******************************************************** */
function getFileExtension(str){
	var arr = str.split("\\");
	var fileName = arr[arr.length-1];
	var ext = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
	return ext;
}

/* ********************************************************
 * FUNCTION 명 : isZipcode by 조길환
 * FUNCTION 기능설명 : 우편번호 여부 확인 
 ******************************************************** */
function isZipcode(str){
	if(!/^\d{5}$/.test(str)){
	   //alert("우편 번호 아닙니다.");
	   return false;
	}
	return true;
}
/**
 * 우편번호 검색
 * defaultAddr : 기본주소 Object Id
 * detailAddr : 상세주소 Object Id
 * zipCd01 : 우편번호 앞자리 Object Id
 * zipCd02 : 우편번호 뒷자리 Object Id
 */


