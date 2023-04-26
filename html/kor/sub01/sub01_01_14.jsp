<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
 <style>
/* topbox */
.uit.type {
    overflow: hidden;
    position: relative;
    margin-bottom: 30px;
    border: 1px solid #d2d2d2;
    background-color: #f5f5f5;
}

.uit.type:after {
    content: "";
    display: block;
    clear: both;
    visibility: hidden;
}

.uit.type .inner {
    position: relative;
    padding: 30px 25px
}

.uit.type .inner .txtwrap {
    position: relative;
}

.uit.type .inner .txtwrap p {
    margin: 0;
    font-size: 16px;
    color: #333;
    word-break: break-word;
    line-height: 24px;
}

.uit.type .inner .txtwrap b {
    font-family: 'nsr';
    display: block;
    font-weight: 600;
    color: #000;
    font-size: 20px;
    line-height: 21px;
    margin: 0 0 20px 0;
    padding: 0;
}
</style>
 
 
<%-- 
cntNo = 1 : 수요 야간민원 신청
cntNo = 2 : 법률상담
 --%>
<c:set var="cntNo" value="1" /> 

<script type="text/javascript">

loginCheck();

if ("${message}" != "") {
    alert("${message}");
    location.href=window.location.pathname;
}

 var date = new Date(); 
//달력 연도
 var calendarYear =  date.getFullYear();
 // 달력 월
 var calendarMonth = ("0" + (1 + date.getMonth())).slice(-2);
 
//달력 일
 var calendarToday = ("0" + date.getDate()).slice(-2);
 
 var year_month =  calendarYear +""+ calendarMonth;
 
 var day = calendarYear + "-" + calendarMonth + "-" + calendarToday;
 
 
 
/*     var year_month = "${yearMonth}";
    var day = "${civilDate}";
 */
    function getCalandar(yearMonth) {
        
        $.ajax({
                    type : "POST",
                    url : "/prog/civil/${siteCode}/${mno}/getCalendar.do?cntNo=${cntNo}",
                    data : {
                        "yearMonth" : yearMonth
                    },
                    dataType : "json",
                    success : function(result) { 
                        
                        // 오늘날짜로부터 + 30일 이후부터는 신청 불가
                        var req_dt = (result[1].REQ_DT);
                        var today = new Date(req_dt.substring(0,4),req_dt.substring(5,7),req_dt.substring(8,10));
                        today.setMonth(today.getMonth() + 12);
                        var year = today.getFullYear();
                        var month = today.getMonth() + 1;
                        if(month < 10) month = "0" + month;
                        var date = today.getDate() - 1; // -1은 한달 추가시 1일 감소, +1은 한달 감소시
                        if(date < 10) date = "0" + date;
                        var limitDate = year + "-" + month + "-" + date;
                        //var limitDate = year + "-12-31";
                        var numberDay; 
                        if($("input:hidden[name=civil_date]").val() == ""){
                            numberDay = parseInt(day.replace(/-/gi, "")); 
                        }else{
                            numberDay = parseInt($("input:hidden[name=civil_date]").val().replace(/-/gi, "")); 
                        } 
                        var calendarStr = "<tr>";

                        for (var i = 0; i < result[1].D; i++) {
                            calendarStr += "<td class=\"off\"></td>";
                        }

                        for (var i = 1; i <= result[1].length; i++) {
                               
                            var numberDT = parseInt(result[i].DT.replace(/-/gi, "")); 
   
                            
                            if (result[i].D == 0) {
                                calendarStr += "<tr>";
                            };
                            
                            var holyDay = false;
                            var restde = false;
                            
                            if(result[i].rentList != undefined && result[i].rentList.length > 0 && !holyDay) {
                                restde = true;
                            } else if ((result[i].rentList == undefined || result[i].rentList.length < 1) && holyDay) {
                                restde = true;
                            }
                            
                            if (restde) {
                                calendarStr += "<td class=\"holiday " + result[i].WEEK + "\">";
                                var rentList = result[i].rentList;
                                for (var j = 0; j < rentList.length; j++) {
                                    //calendarStr += "<div>" + i + "<p>"+ rentList[j].restde_sj +"</p></div>";
                                    calendarStr += "<div>" + i + "<p></p></div>";
                                }
                            }else if(result[i].DT > limitDate){
                                calendarStr += "<td class=\"holiday " + result[i].WEEK + "\">";
                                calendarStr += "<div>" +i+ "</div>";
                            }else if(parseInt(day.replace(/-/gi, "")) > numberDT){
                                calendarStr += "<td class=\"holiday " + result[i].WEEK + "\">";
                                calendarStr += "<div>" +i+ "</div>";
                            }else if(result[i].cnt <= 0){
                                calendarStr += "<td class=\"holiday " + result[i].WEEK + "\">";
                                calendarStr += "<div>" +i+ "</div>";
                            }else if(numberDay == numberDT){
                                calendarStr += "<td class=\"selected " + result[i].WEEK + "\">";
                                calendarStr += "<div><a onclick='setDate(this,\""  
                                    + result[i].DT + "\"); return false;'>" + i
                                    + "</a></div>";  
                            }else{
                                calendarStr += "<td class=\"" + result[i].WEEK + "\">";  
                                calendarStr += "<div><a onclick='setDate(this,\""
                                    + result[i].DT + "\"); return false;'>" + i
                                    + "</a></div>";
                            }   
                            
                            calendarStr += "</td>";

                            if (result[i].D == 6) {
                                calendarStr += "</tr>";
                            }
                        }

                        for (var i = Number(result[result[1].length].D) + 1; i < 7; i++) {
                            calendarStr += "<td class=\"off\"></td>";
                        }

                        calendarStr += "</tr>";

                        $("#calTitle").html(
                                result[1].DT.split("-")[0] + "."
                                        + result[1].DT.split("-")[1]);
                        $("#calBody").html(calendarStr);

                    }
                });
    }
    function setDate(obj, date) {
        if(obj != null){
            $("#calBody").find("td").removeClass("selected");
            $(obj).parents("td").addClass("selected");
        }
        $("#civil_date").val(date);
        /*         $("form[name='frm']").find("input[name='civil_date']").remove();
                $("form[name='frm']").prepend("<input type='hidden' name='civil_date' value='"+date+"'>");
         */
         var  category =  $('input:radio[name=category]:checked').val();
 
         if(typeof category != "undefined" && category != "") getTimes(category);
    }
 
    
    function getTimes(category) {
 
        if ($("#civil_date").val() == "")
        {
            alert("날짜를 선택 해주세요.");    
            return false;
        }
            
            
        /* $("#civil_de").html(date); */
        /* $("form[name='frm']").find("input[name='civil_date']").reZmove();
        $("form[name='frm']").prepend("<input type='hidden' name='civil_date' value='"+date+"'>");
         */
        $("form[name='frm']").find("input[name='timeKeys']").remove();

        $.ajax({
                    type : "POST",
                    url : "/prog/civil/${siteCode}/getTimeGroup.do?civil_no=${cntNo}",
                    data : {
                        "category" : category,
                        "civil_date" : $("#civil_date").val()
                    },
                    dataType : "json",
                    success : function(result) {
                        
                        
                        var reqstTimeStr = "";
                        
                        if(result != null){

                            reqstTimeStr += "<ul id='timeList'>";
 
                            for (var i = 0; i < result.length; i++) {                                
                                reqstTimeStr += "<li>";                                
                                if(result[i].cnt > 0){
                                    reqstTimeStr += "<input type=\"radio\" name=\"timeKeys\" value=\""+result[i].time_key+"\" onclick='setTime(this, \""+result[i].time_key+"\");'>";
                                }else{
                                    reqstTimeStr += "<input type=\"radio\" name=\"timeKeys\" value=\""+result[i].time_key+"\" onclick='setTime(this, \""+result[i].time_key+"\");' class=\"not\">";
                                }
                                
                                
                                reqstTimeStr += "<div class=\"timeBtn\"><label class=\"time\">";
                                reqstTimeStr += result[i].time;
                                reqstTimeStr += "(" + result[i].notation + ")";
                                reqstTimeStr += "</label></div>";
                                reqstTimeStr += "</li>";
                               // reqstTimeStr += "<input type=\"hidden\" id=\"reqst_time_" + i + "\" value=" + i + " class=\"reqst_time\">";
                            }
                            
                            reqstTimeStr += "</ul>";
                        
                    }else{
                        
                        reqstTimeStr += "<div class='ui uit type mb_30 mt_30'>";
                        reqstTimeStr += "<div class='inner'>";   
                        reqstTimeStr += "<div class='txtwrap'>";
                        reqstTimeStr += "<b>신청 가능한 시간이 존재하지 않습니다.</b>";
                        reqstTimeStr += "<p>다른 일자를 선택해주세요.</p>";
                        reqstTimeStr += "</div>";            
                        reqstTimeStr += "</div>";    
                        reqstTimeStr += "</div>";
                        
                    }
                        $("#reqstTime").html(reqstTimeStr);
                    }
                });
    }

    function setTime(obj, time_key) {
        
        if($(obj).hasClass("disable")) {
            alert("이미 예약되어 있습니다.\n다른 시간대를 선택해 주세요.");
            return false;
        }
/*         
        if ($(obj).children('p').length > 0) {
            if ($(obj).parents("li").next().find("p").length == 1
                    && $(obj).parents("li").prev().find("p").length == 1) {
                alert("연속되게 선택하셔야 합니다.");
                return false;
            }
            $(obj).children('p').remove();
            $("form[name='frm']").find(
                    "input[name=timeKeys][value='" + time_key + "']").remove();
        } else {
            if ($("#timeList").find("p").length != 0) {
                if ($(obj).parents("li").next().find("p").length == 0
                        && $(obj).parents("li").prev().find("p").length == 0) {
                    alert("연속되게 선택하셔야 합니다.");
                    return false;
                }
            }
            $(obj).prepend("<p class='check'><b class='sr-only'>선택</b></p>");
            $("form[name='frm']")
                    .prepend(
                            "<input type='hidden' name='timeKeys' value='"+time_key+"'>");
        } */

        $("#time").empty();

        for (var i = 0; i < $("#timeList").find("p").length; i++) {
            $("#time").append(
                    "<li>예약시간  : "
                            + $("#timeList").find("p").eq(i).closest("li")
                                    .find(".time").text() + "</li>");
        }

    }
    
    function checkForm(){
        
/*         var minTime = parseInt("${civilBean.min_time}");
        var maxTime = parseInt("${civilBean.max_time}"); */
        var chkTime = document.getElementsByName('timeKeys').length;
        
        if (loginCheck() == false) return false;
        
        if(chkTime == 0){
            alert("시간을 선택해주세요.");
            return false;   
        }

        if(!$("input:radio[name=category]").is(':checked')) {   
              alert("업무를 선택해주세요.");
            $("#input1_0_1").focus();
            return false;
        }
        
/*         if(chkTime < minTime){
            alert("최소 "+minTime+"시간이상 선택 가능합니다.");
            return false;
        } 
        
        if(chkTime > maxTime){
            alert("최대 "+maxTime+"시간이하 선택 가능합니다.");
            return false;
        }
               */  
        return true;
        
    }
    function loginCheck() {
        var loginChk = true;
        
        $.ajax({
            type : "POST", 
            url : "/prog/civil/${siteCode}/${mno}/loginChk.do",
            data : {
                "cntNo" : $("#civil_no").val() 
            },
            dataType : "json",
            async: false,
            success : function(result) {
                loginChk = result;
            }
        });
 
        if(loginChk == false){
            location.href = "/${siteCode}/sitemap_12.do?returnUrl=" + window.location.pathname;
            
            /*             if(confirm("로그인이 필요한 서비스입니다. 로그인페이지로 이동 하시겠습니까?") == true){
                            location.href = "/${siteCode}/sitemap_12.do?returnUrl=" + window.location.pathname;
                        }
             */
                        return false;
        }
        
    }
    
    $(document).ready(
           
            function() {

                getCalandar(year_month);
                //getTimes(null, day);
                $(".calBtn").click(
                        function(e) {
                            e.preventDefault();
                            var yearMonth = $("#calTitle").html();
                            var d = new Date(Number(yearMonth.split(".")[0]),
                                    Number(yearMonth.split(".")[1] - 1), 1);

                            if ($(this).hasClass("prev")) {
                                d.setMonth(d.getMonth() - 1);
                            } else {
                                d.setMonth(d.getMonth() + 1);
                            }
                            var month = d.getMonth() + 1;
                            getCalandar(d.getFullYear()
                                    + ""
                                    + (month.toString().length > 1 ? month
                                            : "0" + month));
                        });
                
                $("input[name='category']:radio").change(function () {
                    getTimes(this.value)
                });
                
            } 

    );
    /*     window.onload = function(){
    loginCheck();
}     */
</script>

<form name="frm" id="frm" class="form-horizontal" method="post"
    action="/prog/civilApplcnt/${siteCode}/${mno}/insert.do"
    onsubmit="javascript:return checkForm();">
    <input type="hidden" id="civil_no" name="civil_no" value="${cntNo}">
    <input type='hidden' id='civil_date' name='civil_date' value=''>
    <div class="reservationWrap">
        <div class="section calendarArea">
            <h3 class="title">날짜선택</h3>
            <div class="info">
                <span class="not">불가</span>
                <span class="ok">가능</span>
                <span class="select">선택</span>
            </div>
            <div class="calendar">
                <div class="calHeader">
                    <p class="calDate" id="calTitle"></p>
                    <a href="#"><span class="prev calBtn"><i></i>이전달</span></a>
                    <a href="#"><span class="next calBtn">다음달<i></i></span></a>
                </div>
              
                <table class="schcal_tbl">
                    <caption>
                        <strong>야간민원 신청 날짜선택</strong>
                        <details>
                            <summary>날짜 선택 달력입니다. 원하는 날짜를 클릭하면 신청 가능 시간을 확인할 수 있습니다.</summary>
                        </details>
                    </caption>
                    <colgroup>
                        <col span="7">
                    </colgroup>
                    <thead>
						<tr>
							<th scope="col" class="sun">일</th>
							<th scope="col" class="mon">월</th>
							<th scope="col" class="tue">화</th>
							<th scope="col" class="wed">수</th>
							<th scope="col" class="thu">목</th>
							<th scope="col" class="fri">금</th>
							<th scope="col" class="sat">토</th>
						</tr>
                    </thead>
					<tbody id="calBody">
						<!-- <tr>
							<td class="off"></td>
							<td class="off"></td>
							<td class="off"></td>
							<td class="holiday"><div>1</div></td>
							<td class="holiday"><div>2</div></td>
							<td class="holiday"><div>3</div></td>
							<td class="holiday sat"><div>4</div></td>
						</tr>
						<tr>
							<td class="holiday sun"><div>5</div></td>
							<td class="holiday"><div>6</div></td>
							<td class="holiday"><div>7</div></td>
							<td class="selected"><div><a onclick="">8</a></div></td>
							<td class="holiday"><div>9</div></td>
							<td class="holiday"><div>10</div></td>
							<td class="holiday sat"><div>11</div></td>
						</tr>
						<tr>
							<td class="holiday sun"><div>12</div></td>
							<td class="holiday"><div>13</div></td>
							<td class="holiday"><div>14</div></td>
							<td><div><a onclick="">15</a></div></td>
							<td class="holiday"><div>16</div></td>
							<td class="holiday"><div>17</div></td>
							<td class="holiday sat"><div>18</div></td>
						</tr>
						<tr>
							<td class="holiday sun"><div>19</div></td>
							<td class="holiday"><div>20</div></td>
							<td class="holiday"><div>21</div></td>
							<td><div><a onclick="">22</a></div></td>
							<td class="holiday"><div>23</div></td>
							<td class="holiday"><div>24</div></td>
							<td class="holiday sat"><div>25</div></td>
						</tr>
						<tr>
							<td class="holiday sun"><div>26</div></td>
							<td class="holiday"><div>27</div></td>
							<td class="holiday"><div>28</div></td>
							<td><div><a onclick="">29</a></div></td>
							<td class="holiday"><div>30</div></td>
							<td class="holiday"><div>31</div></td>
							<td class="off"></td>
						</tr> -->
					</tbody>
                </table>
            </div>
        </div>
        <!-- calendarArea -->

        <div class="section workArea">
        	<h3 class="title">업무선택</h3>
        	<span class="txt"><p class="txt-tip txt-small"><i class="fa fa-fw fa-exclamation-circle"></i>민원 업무를 선택해주세요.</p></span>
        	<div class="BtnGroup">
        		<ul id="workList">
        			<li>
						<input type="radio" name="category" value="01"  id="input1_0_1" >
						<div class="workBtn"><label class="time">여권접수</label></div>
        			</li>
        			<li>
						<input type="radio" name="category" value="02"  id="input1_0_2" >
						<div class="workBtn"><label class="time">여권교부</label></div>
        			</li>
        			<li class="wd">
						<input type="radio" name="category" value="03"  id="input1_0_3" >
						<div class="workBtn"><label class="time">주민등록증, 초본 발급</label></div>
        			</li>
        			<li>
						<input type="radio" name="category" value="04"  id="input1_0_4" >
						<div class="workBtn"><label class="time">인감 발급</label></div>
        			</li>
        			<li class="wd">
						<input type="radio" name="category" value="05"  id="input1_0_5" >
						<div class="workBtn"><label class="time">가족관계등록 발급</label></div>
        			</li>
        		</ul>
        	</div>
        </div>
        <!-- workArea -->        

        <div class="section timeArea">
            <h3 class="title">시간선택</h3>
            <div class="info">
                <span class="not">예약마감</span> <span class="ok">예약가능</span>
            </div>
			<div class="BtnGroup">
				<div id="reqstTime">
					<!-- <ul id="timeList">
	        			<li>
							<input type="radio" name="timeSelect" value="" class="not">
							<div class="timeBtn"><label class="time">18:00</label></div>
	        			</li>
	        			<li>
							<input type="radio" name="timeSelect" value="">
							<div class="timeBtn"><label class="time">18:10</label></div>
	        			</li>
	        			<li>
							<input type="radio" name="timeSelect" value="">
							<div class="timeBtn"><label class="time">18:20</label></div>
	        			</li>		
	        			<li>
							<input type="radio" name="timeSelect" value="">
							<div class="timeBtn"><label class="time">18:30</label></div>
	        			</li>
	        			<li>
							<input type="radio" name="timeSelect" value="">
							<div class="timeBtn"><label class="time">18:40</label></div>
	        			</li>
	        			<li>
							<input type="radio" name="timeSelect" value="">
							<div class="timeBtn"><label class="time">18:50</label></div>
	        			</li>
	        			<li>
							<input type="radio" name="timeSelect" value="">
							<div class="timeBtn"><label class="time">19:00</label></div>
	        			</li>
	        			<li>
							<input type="radio" name="timeSelect" value="">
							<div class="timeBtn"><label class="time">19:10</label></div>
	        			</li>
	        			<li>
							<input type="radio" name="timeSelect" value="">
							<div class="timeBtn"><label class="time">19:20</label></div>
	        			</li>	
	        			<li>
							<input type="radio" name="timeSelect" value="">
							<div class="timeBtn"><label class="time">19:30</label></div>
	        			</li>	
	        			<li>
							<input type="radio" name="timeSelect" value="">
							<div class="timeBtn"><label class="time">19:40</label></div>
	        			</li>	
	        			<li>
							<input type="radio" name="timeSelect" value="">
							<div class="timeBtn"><label class="time">19:50</label></div>
	        			</li>
					</ul>   -->
				</div>
			</div>
        </div>
        <!-- timeArea -->
    </div>
    <!-- reservationWrap -->


    <div class="btnArea">
        <button type="submit" class="btn btn-ani btn-line btn-blue large">신청하기</button>
    </div>
</form>
