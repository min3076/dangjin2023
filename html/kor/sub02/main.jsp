<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="egovframework.com.cmm.LoginVO" %>
<%@ page import="net.acego.common.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.*" %>
<%@ page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%
	// 로그인 정보
	LoginVO loginVO = (LoginVO) session.getAttribute("loginVO");
	if (loginVO != null) {

		request.setAttribute("loginVO", loginVO);
	}

	String siteCode = (String) request.getAttribute("siteCode");
	String mno = "sub00_00_00";

	// cms xml List 형태로 불러 오기
	XmlUtil util = new XmlUtil();
	//사이트 코드 확인
	//사이트 코드 확인
	List<XmlBean> siteList = util.makeSiteMenuXmlList("siteCode", "siteCode");
	if (siteList != null) {
		request.setAttribute("siteList", siteList);

		int siteLen = siteList.size();
		String siteName = "";
		String add_mata = "";
		String analytics = "";
		String footer = "";
		//String ltype = "";

		int siteCheckVal = 0;
		for (int k = 0; k < siteLen; k++) {
			XmlBean sbean = siteList.get(k);
			if (sbean.getCode().equals(siteCode)) {
				siteCheckVal = k + 1;
				siteName = sbean.getTitle();
				add_mata = sbean.getAdd_mata();
				analytics = sbean.getAnalytics();
				footer = sbean.getFooter();
				//ltype = sbean.getLayout();
			}

		}
		// 사이트 코드가 없을 경우 / 로 보낸다.
		if (siteCheckVal <= 0)
			response.sendRedirect("/");

		request.setAttribute("siteName", siteName);
		request.setAttribute("add_mata", add_mata);
		request.setAttribute("analytics", analytics);
		request.setAttribute("footer", footer);
		//request.setAttribute("ltype", ltype);
	} else {
		response.sendRedirect("/");
	}

	List<XmlBean> xmlCmsList = util.makeSiteMenuXmlList(siteCode + "_cms", "cms");
	request.setAttribute("xmlCmsList", xmlCmsList);

	// cms xml HashMap 형태로 불러 오기
	HashMap<String, XmlBean> xmlCmsMap = util.makeSiteMenuXmlMap(siteCode);
	request.setAttribute("xmlCmsMap", xmlCmsMap);

	// 메뉴코드를 숫자로 불러오기 (sub01_01 ==> 0101)
	String xmlCmsMcode = util.getSearchCode(mno);

	request.setAttribute("xmlCmsMcode", xmlCmsMcode);

	String userAgent = request.getHeader("User-Agent");

	if (userAgent.indexOf("Trident/7.0; rv:11.0) like Gecko") > -1) {
		//IE11
		userAgent = "MSIE";
	} else if (userAgent.indexOf("MSIE") > -1) {
		userAgent = "MSIE";
	} else
		userAgent = "";
%>
<!DOCTYPE HTML>
<html lang="ko" id="sub01_00">
   <head>
      <meta charset="utf-8">
      <%if(userAgent.equals("MSIE")){%>
      <meta http-equiv="X-UA-compatible" content="IE=edge,chrome=1">
      <%}%>
      ${add_mata}
      <title>${siteName }</title>
      <link rel="shortcut icon" type="image/x-icon" href="/images/common/favicon.ico">
      <link rel="apple-touch-icon-precomposed" href="/images/common/favicon_152.png">
      <link rel="stylesheet" type="text/css" href="/css/common/font-awesome.min.css">
      <link rel="stylesheet" type="text/css" href="/css/common/common.css">
      <link rel="stylesheet" type="text/css" href="/css/common/layout.css">
      <link rel="stylesheet" type="text/css" href="/css/${siteCode}/layout.css">
      <link rel="stylesheet" type="text/css" href="/css/${siteCode}/respond.css">
      <!--
         <link rel="stylesheet" type="text/css" href="/css/common/${ltype}/layout.css">
         <link rel="stylesheet" type="text/css" href="/css/common/${ltype}/respond.css">
         <link rel="stylesheet" type="text/css" href="/css/${siteCode}/layout.css">
         -->
      <link rel="stylesheet" type="text/css" href="/css/${siteCode}/main.css">
      <script src="/js/common/jquery-1.11.2.min.js"></script>
      <script src="/js/common/jquery-ui.min.js"></script>
      <script src="/js/common/script.js"></script>
      <script src="/js/common/common-scroll.js"></script>
      <script src="/js/common/common-popup.js"></script>
      <script src="/js/${siteCode}/main.js"></script>
      <script src="/js/${siteCode}/stateScrollObj.js"></script>
      <script src="/js/common/webfont.js"></script>
      <script>
         WebFont.load({
         custom:{
         families: ['ntk','nsr'],
         urls: ['/css/common/font.css']
         }
         });
         
      </script>

<%
	try {
		List<XmlBean> weatherList = util.makeSiteMenuXmlList("weather","weather");
	    
	    String temp = "";
	    String sky = "";
	    String wfKor = "";
	    String pm10Value = "";
	    String pm10Grade = "";
	    String pm25Value = "";
	    String pm25Grade = "";
	    String ozoneValue = "";
	    
	    if(weatherList != null) {
			XmlBean weather = weatherList.get(0);
			temp = CommonUtil.checkNull(weather.getXmlNo(), "");
			sky = CommonUtil.checkNull(weather.getTitle(), "");
			wfKor = CommonUtil.checkNull(weather.getMno(), "");
			pm10Value = CommonUtil.checkNull(weather.getCode(), "");
			pm10Grade = CommonUtil.checkNull(weather.getMcode(), "");
			pm25Value = CommonUtil.checkNull(weather.getMdir(), "");
			pm25Grade = CommonUtil.checkNull(weather.getDepth(), "");
			ozoneValue = CommonUtil.checkNull(weather.getDescript(), "");
		}
	    
		pageContext.setAttribute("temp", temp);
		pageContext.setAttribute("sky", sky);
		pageContext.setAttribute("wfKor", wfKor);
		pageContext.setAttribute("pm10Value", pm10Value);
		pageContext.setAttribute("pm10Grade", pm10Grade);
		pageContext.setAttribute("pm25Value", pm25Value);
		pageContext.setAttribute("pm25Grade", pm25Grade);
		pageContext.setAttribute("ozoneValue", ozoneValue);
		
	} catch (Exception e) {
		System.out.println("NOTICE BOARD ERROR = "+e.getStackTrace());
	}
%>
      <!--[if lt IE 9]>
      <script src="/js/common/html5.js"></script>
      <![endif]-->
      <script src="/js/common/jquery.xdomainajax.js"></script>
      <script>
      $(function() {

          //<![CDATA[
          //1.에어코리아
          function readTodayMsrstnInfo() {
              var iniozone = $("#ozone");
              var iniPm10 = $("#pm_10");
              var iniPm10_txt = $("#pm_10_txt");
              var iniPm25 = $("#pm_25");
              var iniPm25_txt = $("#pm_25_txt");
              var ozoneValue="<c:out value='${ozoneValue}' default='0'/>";
              var pm10Value="<c:out value='${pm10Value}' default='0'/>";
              var pm10Grade="<c:out value='${pm10Grade}' default='-'/>";
              var pm25Value="<c:out value='${pm25Value}' default='0'/>";
              var pm25Grade="<c:out value='${pm25Grade}' default='-'/>";

              if(isNaN(ozoneValue)||!ozoneValue||ozoneValue=="-"){
                  ozoneValue=" - ";
              }else {
                  ozoneValue = Number(ozoneValue).toFixed(3);    
              }
              if(isNaN(pm10Value)||!pm10Value||pm10Value=="-"){
                  pm10Value=" - ";
              }else {
                  pm10Value = Number(pm10Value).toFixed(1);
              }
              
              if(isNaN(pm25Value)||!pm25Value||pm25Value=="-"){
                  pm25Value=" - ";
              }else {
                  pm25Value = Number(pm25Value).toFixed(1);
              }
              iniozone.html(ozoneValue);
              iniPm10.html(pm10Value);
              iniPm25.html(pm25Value);
              iniPm10_txt.html(pm10Grade);
              iniPm25_txt.html(pm25Grade);
          }
          function readTodayweatherInfo(){

          //2.기상청
          var inDay = $("#weather_day");
          var inImg = $("#weather_img");
          var inTemp = $("#weather_temp");
          var inText = $("#weather_text");
          
          var d = new Date();
          var week = new Array('일','월','화','수','목','금','토');
          var toDay = (d.getMonth()+1)+"."+d.getDate()+" "+week[d.getDay()];
          inDay.html(toDay);
          
          var skyNumber = '<c:out value="${sky}" default="1"/>';
          var skyAlt = '<c:out value="${wfKor}" default="맑음"/>';
          var temp = '<c:out value="${temp}" default="0℃"/>';
          inImg.html('<img height="46px" src="/images/kor/main/weather/icon_wt0'+skyNumber+'.png" alt="'+skyAlt+'">');
          inTemp.html(temp);
          inText.html(skyAlt);
          }
          //]]>
         readTodayMsrstnInfo();
         readTodayweatherInfo();
      });
      </script>
   </head>
   <body>
      <div id="accessibility">
         <a href="#accessibility-mcontent">본문 바로가기</a>
         <a href="#accessibility-gnb">대메뉴 바로가기</a>
      </div>
      <h1 class="skip">당진시청 포털 웹사이트 입니다.</h1>
      <div id="wrap">

			<script type="text/javascript" src="/js/kor/top-popup.js"></script>
	<!--<link rel="stylesheet" type="text/css" href="/css/common/top-popup.css">-->
	





      <jsp:include page="/tmpl/skin/util/util_common_quick.jsp"></jsp:include>
      <jsp:include page="/tmpl/skin/util/util_common_${siteCode}.jsp"></jsp:include>
      <!-- header :s -->
      <jsp:include page="/tmpl/skin/header/header_skin_${siteCode}.jsp" >
         <jsp:param name="siteCode" value="${siteCode}" />
         <jsp:param name="mno" value="sub00_00_00" />
      </jsp:include>
      <!-- header :e -->
	  
	


      <div id="accessibility-mcontent"></div>
      <div id="mcontainer">
         <div id="mvisual">
            <div class="layout">
               <div class="loader-five">
                  <div class="spinner one"></div>
                  <div class="spinner two"></div>
                  <div class="spinner three"></div>
               </div>
               <div class="vtitle">
                  <h2>더 큰 도약, 살맛 나는 당진</h2>
                  <p>Energetic Dangjin</p>
               </div>
               <!-- 홍보팝업 -->
               <div id="mpromot">
                  <div class="control">
                     <!--
                        <button type="button" class="ir" data-type="prev">이전</button>
                        <button type="button" class="ir" data-type="next">다음</button>
                        -->
                     <div class="state">
                        <div class="count">
                           <button type="button" class="ir">1</button>
                           <button type="button" class="ir ov">2</button>
                        </div>
                        <button type="button" class="ir" data-type="play">홍보팝업 시작</button>
                        <button type="button" class="ir" data-type="stop">홍보팝업 멈춤</button>
                     </div>
                  </div>
                  <div class="grap">
                     <div class="obj">
                        <jsp:include page="/tmpl/skin/popupZone/popupZone_skin_kor_main.jsp">
                           <jsp:param value="popupZone" name="code"/>
                           <jsp:param value="kor_main" name="siteCode"/>
                        </jsp:include>
                     </div>
                  </div>
               </div>
               <script>
                  (function(){
                  var param = "#mpromot",
                  btn = ".control",
                  obj = ".item",
                  auto = true,
                  f = 1000,
                  s = 3000,
                  p = {use:true,path:".control .count"},
                  h = true;
                  popzone(param,btn,obj,auto,f,s,p,h);
                  }());
               </script>
               <!-- 홍보팝업 -->


			   <!-- 시장실 및 청사안내도 버튼 -->
			   <div class="mayor_wrap">
				   <div class="mayor_info">
					 <h2><a href="https://www.dangjin.go.kr/mayor.do" target="_blank" title="새창열림">시민과 소통하는 당진시장 김홍장</a></h2>
					 <ul class="mayor_lnk">
						<li><a href="http://1.234.83.199:8080/web/detail/6526" target="_blank" title="새창열림">민선7기 취임사 영상보기</a></li>
						<li><a href="/mayor/sub01_03_01.do" target="_blank" title="새창열림">민선7기 취임사</a></li>
						<li><a href="/mayor/sub02_02.do" target="_blank" title="새창열림">당진시에바란다</a></li>
						<li><a href="/mayor/sub04_02.do" target="_blank" title="새창열림">공약과 실천</a></li>
					 </ul>
				  </div>
				  <div class="lnk_box">
					<!--<a href="/cyber/hall/"  target="_blank" title="새창열림" class="info_lnk first"><span class="lnk1 ir-line"></span>3D청사안내</a>-->
					<a href="/kor/sub04_04_02.do" class=""><span class="lnk2 ir-line"></span>조직도</a>
					<a href="/prog/deptPerson/kor/sub04_04_03/deptList.do"><span class="lnk3 ir-line"></span>직원안내</a>
				  </div>
			  </div>
			  <!-- // 시장실 및 청사안내도 버튼 -->



               <!-- 날씨 -->
               <div id="cont_grount">
                  
                  <div class="row srow" id="mweather">
					 <div class="option op2">
                        <span id="weather_day" class="temp1">1. 26(금)</span>
                    </div>
                     <div class="option op1">
                        <div id="weather_temp" class="temp"></div>
                        <div id="weather_text" class="text"></div>
                        <div id="weather_img"></div>
                     </div>
                    
                    <div class="weather_info">
                     <div class="option op3">
                        <strong>초미세먼지</strong>
                        	<span id="pm_25" class="temp2"></span>
                    		<em>㎍/㎥</em>
                    		<span id="pm_25_txt" class="temp2"></span>
                     </div>
                     <div class="option op4">
                        <strong>미세먼지</strong>
                           <span id="pm_10" class="temp3"></span>
                           <em>㎍/㎥</em>
                           <span id="pm_10_txt" class="temp3"></span>
                     </div>
                      <div class="option op5">
                        <strong>오존농도</strong>
                           <span id="ozone" class="temp4"></span>
                           <em>ppm</em>
                           
                     </div>
					 <p>출처 : 기상청 및 에어코리아</p>
                     <a href="https://www.chungnam.go.kr/healthenv/smsForm.do" target="_blank" title="새창열림" class="sms">SMS 신청</a>
                     </div>
                  </div>    
               </div>
               <!-- 날씨 -->

            </div>
         </div>
         <div id="mcontent">
            <!-- 메인내비 -->
            <nav id="mquick">
               <h2 class="skip">본문 컨트롤</h2>
               <div id="mnav" class="layout">
                  <a class="lnkst" href="#scene1"><span>지금 당진은?</span></a>
                  <a href="#scene2" class="lnkst"><span>민원정보</span></a>
                  <span class="line-logo">DANGJIN Line</span>
                  <a href="#scene3" class="lnkst"><span>편의서비스</span></a>
                  <a href="#scene4" class="lnkst"><span>소통공간</span></a>
               </div>
			   <!--
               <div class="line">
                  <a href="#" id="favorite_open">
                     <span>당진라인LINEUP!</span>
                     <div class="icon-wrapper">
                        <div class="hand-icon">
                           <div class="hand">
                              <div class="circle"></div>
                           </div>
                        </div>
                     </div>
                  </a>
               </div>
			   -->
            </nav>
            <!-- 메인내비 -->
            <!--지금당진은 -->
            <div id="scene1" class="section">
               <div class="layout">
                  <div class="title">
                     <h2>지금당진은?</h2>
                     <p>시민의 목소리를 경청하겠습니다.</p>
                  </div>
                  <div class="mlnk">
                     <h3>바로가기</h3>
                     <ul>
                        <li><a href="/cop/bbs/BBSMSTR_000000000380/selectBoardList.do">홈페이지 바로잡기</a></li>
                        <li><a href="/prog/waitingPollutn/kor/sub05_09_05/list.do">실시간대기오염도</a></li>
                        <li><a href="/prog/reprsntInfrmEdu/kor/sub05_11_01/list.do">시민정보화교육</a></li>
						<li><a href="/synapsoft/FileViewer.do?atchFileId=FILE_000000001044018&fileSn=0" target="_blank">당찬 당진살이 (전입생활안내서)</a></li>
						<li><a href="/prog/giftCertificate/kor/sub05_06_11_03/list.do">당진사랑상품권 가맹점찾기</a></li>
                     </ul>
                  </div>
                  <!--당진소식 -->
                  <div id="mnews" class="float">
                     <div class="control">
                        <!--
                           <button type="button" class="ir" data-type="prev">이전</button>
                           <button type="button" class="ir" data-type="next">다음</button>
                           -->
                        <div class="state">
                           <div class="count">
                              <button type="button" class="ir">1</button>
                              <button type="button" class="ir ov">2</button>
                           </div>
                           <button type="button" class="ir" data-type="play">당진소식 시작</button>
                           <button type="button" class="ir" data-type="stop">당진소식 멈춤</button>
                        </div>
                     </div>
                     <div class="grap">
                        <div class="obj">
                           <jsp:include page="/tmpl/skin/notice/notice_skin_kor_bodo_main.jsp" >
                              <jsp:param name="code" value="BBSMSTR_000000000014" />
                           </jsp:include>
                        </div>
                     </div>
                  </div>
                  <script>
                     (function(){
                     var param = "#mnews",
                     btn = ".control",
                     obj = ".item",
                     auto = true,
                     f = 1000,
                     s = 3000,
                     p = {use:true,path:".control .count"},
                     h = true;
                     popzone(param,btn,obj,auto,f,s,p,h);
                     }());
                  </script>
                  <!--당진소식 -->
                  <!--팝업존 -->
                  <div class="float" id="mpopup">
                     <h2>팝업존</h2>
                     <div class="grap">
                        <div class="obj">
                           <jsp:include page="/tmpl/skin/popupZone/popupZone_skin_kor.jsp">
                              <jsp:param value="popupZone" name="code"/>
                              <jsp:param value="kor" name="siteCode"/>
                           </jsp:include>
                        </div>
                        <div class="count"><i>5</i>/5</div>
                     </div>
                     <div class="control">
                        <div class="state">
                           <button type="button" class="ir" data-type="prev">팝업존 이전</button>
                           <button type="button" class="ir" data-type="stop">팝업존 멈춤</button>
                           <button type="button" class="ir" data-type="play" style="display: none;">팝업존 시작</button>
                           <button type="button" class="ir" data-type="next">팝업존 다음</button>
                        </div>
                        <div class="more">
                           <button class="ir list-expand" type="button" value="#expandListTarget1">팝업존 확장</button>
                        </div>
                     </div>
                     <!-- 확장보기 -->
                     <div id="expandListTarget1" class="expand-target">
                        <ul>
                           <jsp:include page="/tmpl/skin/popupZone/popupZone_skin_kor_list.jsp">
                              <jsp:param name="siteCode" value="kor" />
                              <jsp:param name="code" value="popupZone" />
                           </jsp:include>
                        </ul>
                        <button class="ir expend-exit" type="button">팝업존 확장목록 닫기</button>
                     </div>
                     <!-- 확장보기 -->
                  </div>
                  <script>
                     (function(){
                     var param = "#mpopup",
                     btn = ".control",
                     obj = ".item",
                     auto = true,
                     f = 1000,
                     s = 3000,
                     p = {use:true,type:1,path:".count"},
                     h = true;
                     popzone(param,btn,obj,auto,f,s,p,h);
                     }());
                  </script>
                  <!-- 이것도 추가됨 -->
                  <script>
                     $(document).ready(function(){
                     
                     var expands = $(".list-expand");
                     var expandsTarget = $(".expand-target");
                     var expandsClose = $(".expend-exit");
                     
                     expands.on("click",    function(event){
                     
                     var t = $(this);
                     var obj = $(t.val());
                     
                     if(obj.css("display") === "none"){
                     obj.show();
                     
                     }
                     else{
                     obj.hide();
                     
                     }
                     
                     });
                     
                     expandsClose.on("click",function(event){
                     
                     expandsTarget.hide();
                     
                     });
                     
                     });
                     
                  </script>
                  <!--팝업존 -->
                  <!--게시판 -->
                  <div id="mboard">
                     <div class="mboard-wrap">
                        <h2 class="skip">주요 게시판 최근 게시물</h2>
                        <div class="mboardbox">
                           <strong class="firstchild"><a class="ov bd_lbk" href="#mboard-1">공지사항</a></strong>
                           <div id="mboard-1" class="grap">
                              <ul class="obj">
                                 <jsp:include page="/tmpl/skin/notice/notice_skin_kor1.jsp" >
                                    <jsp:param name="code" value="BBSMSTR_000000000013" />
                                 </jsp:include>
                                 <jsp:include page="/tmpl/skin/notice/notice_skin_kor2.jsp" >
                                    <jsp:param name="code" value="BBSMSTR_000000000013" />
                                 </jsp:include>
                              </ul>
                              <div class="more"><a href="/cop/bbs/BBSMSTR_000000000013/selectBoardList.do"><span class="skip">공지사항</span>더보기</a></div>
                           </div>
                           <strong><a href="#mboard-2" class="bd_lbk">보도자료</a></strong>
                           <div id="mboard-2" class="grap">
                              <ul class="obj">
                                 <jsp:include page="/tmpl/skin/notice/notice_skin_kor1.jsp" >
                                    <jsp:param name="code" value="BBSMSTR_000000000014" />
                                 </jsp:include>
                                 <jsp:include page="/tmpl/skin/notice/notice_skin_kor2.jsp" >
                                    <jsp:param name="code" value="BBSMSTR_000000000014" />
                                 </jsp:include>
                              </ul>
                              <div class="more"><a href="/cop/bbs/BBSMSTR_000000000014/selectBoardList.do"><span class="skip">보도자료</span>더보기</a></div>
                           </div>
                           <strong><a href="/kor/sub03_03_01_01.do">고시공고</a></strong>
                           <div id="mboard-3" class="grap">
                              <div class="more"><a href="/kor/sub03_03_01_01.do"><span class="skip">고시공고</span>더보기</a></div>
                           </div>
                           <strong><a href="/kor/sub03_03_02.do">입법예고</a></strong>
                           <div id="mboard-4" class="grap">
                              <div class="more"><a href="/kor/sub03_03_02.do"><span class="skip">입법예고</span>더보기</a></div>
                           </div>
                           <strong><a href="#mboard-5" class="bd_lbk">채용공고</a></strong>
                           <div id="mboard-5" class="grap">
                              <ul class="obj">
                                 <jsp:include page="/tmpl/skin/notice/notice_skin_kor3.jsp" >
                                    <jsp:param name="code" value="empmnPblanc" />
                                    <jsp:param name="siteCode" value="kor" />
                                 </jsp:include>
                                 <jsp:include page="/tmpl/skin/notice/notice_skin_kor4.jsp" >
                                    <jsp:param name="code" value="empmnPblanc" />
                                    <jsp:param name="siteCode" value="kor" />
                                 </jsp:include>
                              </ul>
                              <div class="more"><a href="/prog/empmnPblanc/kor/sub03_03_05/list.do"><span class="skip">채용공고</span>더보기</a></div>
                           </div>
                           <strong><a href="#mboard-6" class="bd_lbk">주간행사계획</a></strong>
                           <div id="mboard-6" class="grap">
                              <ul class="obj">
                                 <jsp:include page="/tmpl/skin/notice/notice_skin_kor1.jsp" >
                                    <jsp:param name="code" value="BBSMSTR_000000000015" />
                                 </jsp:include>
                                 <jsp:include page="/tmpl/skin/notice/notice_skin_kor2.jsp" >
                                    <jsp:param name="code" value="BBSMSTR_000000000015" />
                                 </jsp:include>
                              </ul>
                              <div class="more"><a href="/cop/bbs/BBSMSTR_000000000015/selectBoardList.do"><span class="skip">주간행사계획</span>더보기</a></div>
                           </div>
                        </div>
                        <script>
                           $(document).ready(function(){
                           var btn = "#mboard strong>.bd_lbk";
                           var option = {lv:1,obj:"#mboard .grap"};
                           targetOpener(btn,option);
                           });
                        </script>
                     </div>
                  </div>
                  <!--게시판 -->
               </div>
            </div>
            <!--지금당진은 -->
            <!--민원정보 -->
            <div id="scene2" class="section">
               <div class="layout">
                  <div class="title">
                     <h2>민원 정보</h2>
                     <p>시민의 목소리를 경청하겠습니다.</p>
                  </div>
                  <div class="grap float">
                     <div class="item float" id="mwetax">
                        <div class="obj">
                           <h2>지방세<b>민원</b></h2>
                           <ul>
                              <li><a href="http://www.wetax.go.kr/" target="_blank" title="새창열림">지방세 조회납부</a></li>
                              <li><a href="https://www.wetax.go.kr/main/?cmd=LPTIHA0R0" target="_blank" title="새창열림">지방세 미리계산해보기</a></li>
                              <li><a href="https://www.wetax.go.kr/main/?cmd=LPTINB1R0" target="_blank" title="새창열림">건축물시가 표준액조회</a></li>
                           </ul>
                        </div>
                     </div>
                     <div class="item float" id="mland">
                        <div class="obj">
                           <h2>부동산<b>민원</b></h2>
                           <ul>
                              <li><a href="http://kras.chungnam.go.kr/land_info/info/houseprice/houseprice.do" target="_blank" title="새창열림">개별주택가격</a></li>
                              <li><a href="http://kras.chungnam.go.kr/land_info/info/landprice/landprice.do" target="_blank" title="새창열림">개별공시지가</a></li>
                              <li><a href="http://www.kras.go.kr/" target="_blank" title="새창열림">부동산통합민원</a></li>
                           </ul>
                        </div>
                     </div>
                     <div class="item" id="micon">
                        <div class="obj">
                           <ul>
                              <li class="first"><a href=" https://www.dangjin.go.kr/sudo/" target="_blank" title="새창열림"><span class="ir ir-icon icon1"></span>상하수도요금 조회/납부</a></li>
                              <li><a href="http://car.dangjin.go.kr/" target="_blank" title="새창열림"><span class="ir ir-icon icon2"></span>자동차과태료 조회/납부</a></li>
                              <li><a href="https://parkingsms.dangjin.go.kr/" target="_blank" title="새창열림"><span class="ir ir-icon icon3"></span>주정차단속 사전문자알림</a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="item" id="mminwon">
                     <div class="obj">
                        <h2 class="ir">자주찾는민원</h2>
                        <p>언제나 열려있는 민원서비스</p>
                        <ul>
                           <li><a href="/kor/sub01_01_01_01.do">민원업무안내</a></li>
                           <li><a href="/kor/sub01_01_04_01.do">여권발급안내</a></li>
                           <li><a href="/kor/sub01_01_03_01.do">무인민원발급기</a></li>
                           <li><a href="/kor/sub01_03_01_01.do">자동차민원</a></li>
                           <li><a href="/kor/sub01_04_01_01.do">민원상담신청</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <!--민원정보 -->
            <!--편의서비스 -->
            <div id="scene3" class="section">
               <div class="layout">
                  <div class="title">
                     <h2>편의 서비스</h2>
                     <p>시민의 목소리를 경청하겠습니다.</p>
                  </div>
                  <div id="marea" class="float">
                     <div class="obj">
                        <h2>분야별<b>정보</b></h2>
                        <ul>
                           <li><a href="/bokji.do" target="_blank" title="새창열림">복지</a></li>
                           <li><a href="/health.do" target="_blank" title="새창열림">보건</a></li>
                           <li><a href="/kor/sub05_03_01_01.do">기업/경제</a></li>
                           <li><a href="/kor/sub05_04_01.do">농/수/축산업</a></li>
                           <li><a href="/kor/sub05_05_01.do">주택/지적/건축</a></li>
                           <li><a href="/kor/sub05_06_01_01.do">생활</a></li>
                           <li><a href="/kor/sub05_07_01.do">교통</a></li>
                           <li><a href="/kor/sub05_08_01.do">취업</a></li>
                           <li><a href="/kor/sub05_09_01.do">환경/청소/위생</a></li>
                           <li><a href="/kor/sub05_10_01.do">재난/안전/민방위</a></li>
                           <li><a href="/prog/reprsntInfrmEdu/kor/sub05_11_01/list.do">교육/강좌</a></li>
                           <li><a href="/prog/parkInfo/kor/sub05_12_01/list.do">문화/체육</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="grap">
                     <ul>
						 <li class="item area1">
							<a href="/kor/sub05_04_04_01.do">
							<em>농어촌희망프로젝트</em>
							<strong>3농혁신</strong>
							<span class="icon"></span>
							</a>
						 </li>
						 <li class="item area2"><a href="/kor/sub02_09_01.do">주민자치</a></li>
						 <li class="item area3"><a href=" https://www.dangjin.go.kr/kor/sub03_11.do">지속가능발전</a></li>
					 </ul>				 			 
					 
					<!--
					 <div class="item area1">
                        <a href="/kor/sub05_04_04_01.do">
                        <em>농어촌희망프로젝트</em>
                        <strong>3농혁신</strong>
                        <span class="icon"></span>
                        </a>
                     </div>
                     <div class="item area2 float"><a href="/kor/sub02_09_01.do">주민자치</a></div>
                     <div class="item area3 float"><a href=" https://www.dangjin.go.kr/kor/sub03_11.do" target="_blank" title="새창열림"> 2035 지속가능발전</a></div>
					 <div class="item area4 float"><a href="/cop/bbs/BBSMSTR_000000000020/selectBoardList.do">재정공시</a></div>-->
                  </div>
                  <div id="mlink">
                     <div class="obj">
                        <ul>
                           <li><a href="/stat.do" target="_blank" title="새창열림"><span class="ir ir-icon lnk1"></span>당진통계</a></li>
                           <li><a href="https://www.dangjin.go.kr/gyeyak" target="_blank" title="새창열림"><span class="ir ir-icon lnk2"></span>입찰(계약)정보</a></li>
                           <li><a href="/jejung.do" target="_blank" title="새창열림"><span class="ir ir-icon lnk3"></span>재정운용상황공개</a></li>
                           <li><a href="/safe.do" target="_blank" title="새창열림"><span class="ir ir-icon lnk4"></span>재난안전대책본부</a></li>
                           <li><a href="http://www.elis.go.kr/newlaib/laibLaws/h1126/laws.jsp?regionId=44270&isfez=" target="_blank" title="새창열림"><span class="ir ir-icon lnk5"></span>자치법규</a></li>
                           <li><a href="http://lll.dangjin.go.kr/" target="_blank" title="새창열림"><span class="ir ir-icon lnk6"></span>평생학습포털</a></li>
                           <li><a href="http://job.dangjin.go.kr/" target="_blank" title="새창열림"><span class="ir ir-icon lnk7"></span>구인구직</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <!--편의서비스 -->
            <!--소통공간 -->
            <div id="scene4" class="section">
               <div class="layout">
                  <div class="title">
                     <h2>소통 공간</h2>
                     <p>함께 소통하는 당진의 실시간 소통공간</p>
                  </div>
                  <div class="sns">
                     <a href="https://www.facebook.com/dangjin" target="_blank" title="새창열림" class="ir ir-sns fb">당진시청페이스북</a>
                     <a href="http://blog.naver.com/dangjin2030" target="_blank" title="새창열림" class="ir ir-sns bl">당진시청블로그</a>
                     <!--<a href="#" class="ir ir-sns ks">당진시청카카오스토리</a>-->
                     <a href="https://twitter.com/dangjinsi" target="_blank" title="새창열림" class="ir ir-sns tw">당진시청트위터</a>
                     <!--<a href="#" class="ir ir-sns is">당진시청인스타</a>-->
                  </div>
                  <div id="mmedia">
                     <div class="tab_btn_box">
                        <ul>
                           <li><a href="#" class="tab_btn total ov" title="선택된 정보">전체</a></li>
                           <li><a href="#" class="tab_btn" title="선택된 정보">소식/행사</a></li>
                           <li><a href="#" class="tab_btn" title="선택된 정보">미디어당진</a></li>
                           <li><a href="#" class="tab_btn" title="선택된 정보">포토갤러리</a></li>
                           <li class="last"><a href="#" class="tab_btn" title="선택된 정보">블로그</a></li>
                        </ul>
                     </div>
                     <div id="ajaxbox">
                        <div id="roll_list" class="rolling_list mvisual_img01 roll_show">
                           <div class="rolling_box">
                              <!--
                                 <div class="control">
                                 <a href="#" class="ir prev" data-control="prev">이전</a>
                                 <a href="#" class="ir next" data-control="next">다음</a>
                                 </div>
                                 -->
                              <div class="grap">
                                 <ul class="obj">
                                    <jsp:include page="/tmpl/skin/notice/photo_skin_kor1.jsp" >
                                       <jsp:param name="code" value="BBSMSTR_000000000016" />
                                       <jsp:param value="2" name="listCnt"/>
                                    </jsp:include>
                                    <jsp:include page="/tmpl/skin/notice/photo_skin_kor2.jsp" >
                                       <jsp:param name="siteCode" value="${siteCode}" />
                                       <jsp:param value="2" name="listCnt"/>
                                    </jsp:include>
                                    <jsp:include page="/tmpl/skin/notice/photo_skin_kor3.jsp" >
                                       <jsp:param name="code" value="BBSMSTR_000000000026" />
                                       <jsp:param value="2" name="listCnt"/>
                                    </jsp:include>
                                    <jsp:include page="/tmpl/skin/notice/photo_skin_kor4.jsp" >
                                       <jsp:param value="blog" name="code"/>
                                       <jsp:param value="kor" name="siteCode"/>
                                       <jsp:param value="2" name="listCnt"/>
                                    </jsp:include>
                                    <jsp:include page="/tmpl/skin/notice/photo_skin_kor1.jsp" >
                                       <jsp:param name="code" value="BBSMSTR_000000000016" />
                                       <jsp:param value="8" name="listCnt"/>
                                    </jsp:include>
                                    <jsp:include page="/tmpl/skin/notice/photo_skin_kor2.jsp" >
                                       <jsp:param name="siteCode" value="${siteCode}" />
                                       <jsp:param value="8" name="listCnt"/>
                                    </jsp:include>
                                    <jsp:include page="/tmpl/skin/notice/photo_skin_kor3.jsp" >
                                       <jsp:param name="code" value="BBSMSTR_000000000026" />
                                       <jsp:param value="8" name="listCnt"/>
                                    </jsp:include>
                                    <jsp:include page="/tmpl/skin/notice/photo_skin_kor4.jsp" >
                                       <jsp:param value="blog" name="code"/>
                                       <jsp:param value="kor" name="siteCode"/>
                                       <jsp:param value="8" name="listCnt"/>
                                    </jsp:include>
                                 </ul>
                              </div>
                           </div>
                           <div class="more">
                              <a href="#roll_list" class="btn_more">더보기</a>
                              <a href="#roll_list" class="btn_close">닫기</a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <script>
                     $(function(){
                        var liArr = $("#scene4").find(".obj li");
                        if ( liArr.length >= 40 ){
                        //if ( liArr.length >= 32 ){
                        //console.log(liArr[0]);
                        //liArr[0].after('aaaa');
                        
                        liArr.eq(0).after(liArr.eq(2));
                        liArr.eq(2).after(liArr.eq(4));
                        liArr.eq(4).after(liArr.eq(6));
                        
                        }
                     }());
                  </script>
                  <div class="copy">
                     <h2>더 큰 도약, 살맛 나는 당진</h2>
                     <p>Energetic Dangjin</p>
                  </div>
               </div>
            </div>
            <!--소통공간 -->
         </div>
         <script>
            (function(){
            
            var elem = 0;
            
            var catrgory = { length:5 }
            
            catrgory.area = $("#scene4");
            
            catrgory.item = function(t){
            return (t < 1) ? catrgory.area.find(".item") : catrgory.area.find(".item").filter("[data-category="+t+"]");
            
            }
            catrgory.total = catrgory.area.find(".tab_btn_box .total");
            catrgory.tab = catrgory.area.find(".tab_btn_box a");
            catrgory.more = catrgory.area.find(".btn_more");
            catrgory.close = catrgory.area.find(".btn_close");
            
            catrgory.close.hide();
            
            //catrgory.btn = catrgory.area.find(".control a");
            
            catrgory.array = [];
            
            for(var i=0; i<catrgory.length; i++){
            catrgory.array[i] = catrgory.item(i);
            
            }
            
            catrgory.currunt = catrgory.array[0];
            
            function movement(t){
            if(catrgory.currunt.parent().is(":animated")){
            return false;
            
            }
            
            if(t === "prev"){
            if(elem > 0){
            elem--;
            
            }
            else{
            elem = catrgory.currunt.length-1;
            
            }
            
            catrgory.currunt.parent().css({left:catrgory.currunt.eq(elem).outerWidth(true)*-1}).prepend(catrgory.currunt.eq(elem).detach());
            catrgory.currunt.parent().stop(true,false).animate({left:0},300,"easeOutCubic");
            
            }
            
            if(t === "next"){
            if(elem < catrgory.currunt.length-1){
            elem++;
            
            }
            else{
            elem = 0;
            
            }
            
            catrgory.currunt.parent().stop(true,false).animate({left:catrgory.currunt.eq(elem-1).outerWidth(true)*-1},300,"easeOutCubic",function(){
            catrgory.currunt.parent().removeAttr("style").append(catrgory.currunt.eq(elem-1).detach());
            
            });
            
            }
            
            }
            
            function _in(event){
            event.preventDefault();
            
            var t = $(this);
            
            if(event.handleObj.namespace === "tab"){
            
            catrgory.area.find(".obj").html(catrgory.array[catrgory.tab.index(t)]);
            
            catrgory.currunt = catrgory.array[catrgory.tab.index(t)];
            
            
            
            elem = 0;
            catrgory.area.find(".rolling_box").removeAttr("style");
            catrgory.more.removeAttr("style");
            
            catrgory.tab.removeClass("ov");
            
            t.addClass("ov");
            catrgory.currunt.eq(0).hide();
            catrgory.currunt.eq(1).hide();
            
            catrgory.close.hide();
            
            
            }
            
            if(event.handleObj.namespace === "tab_all"){
            
            catrgory.area.find(".obj").html(catrgory.array[catrgory.tab.index(t)]);
            
            catrgory.currunt = catrgory.array[catrgory.tab.index(t)];
            
            
            
            elem = 0;
            catrgory.area.find(".rolling_box").removeAttr("style");
            catrgory.more.removeAttr("style");
            
            catrgory.tab.removeClass("ov");
            
            t.addClass("ov");
            catrgory.area.find(".item").show();
            
            
            }
            
            if(event.handleObj.namespace === "btn"){
            
            movement(t.attr("data-control"));
            
            }
            
            if(event.handleObj.namespace === "more"){
            
            var totcnt = 2;
            var boxheight = Math.floor(catrgory.area.find(".grap").outerHeight()) * 2;
            var t = $(this);
            
            catrgory.area.find(".rolling_box").stop(true,false).animate({height:boxheight},300,"easeOutCubic");
            
            t.hide();
            catrgory.close.css({"display":"inline-block"});
            
            
            
            
            
            }
            
            if(event.handleObj.namespace === "close"){
            
            
            
            
            catrgory.area.find(".rolling_box").removeAttr("style");
            t.hide();
            catrgory.more.show();
            
            
            
            
            
            }
            
            }
            
            catrgory.tab.on("click.tab",_in);
            catrgory.total.on("click.tab_all",_in);
            //catrgory.btn.on("click.btn",_in);
            catrgory.more.on("click.more",_in);
            catrgory.close.on("click.close",_in);
            
            }());
            
         </script>
      </div>
      <script>
         (function(){
         
         var data = false;
         
         var elem = 0;
         
         var dir = 0;
         
         var sensit = 2; // 휠 민감도
         
         var scene = $("#mcontent");
         scene.clip = $(".section");
         scene.remote = $(".remote");
         
         var quick = $("#mnav");
         quick.btn = quick.find(".lnkst");
         
         /*
         scene.palette = function(h){
         return (h != undefined) ? $(window).height()-$(h).height() : $(window).height();
         
         };
         */
         
         
         scene.pos = function(t){
         var pos = [];
         
         return function(){
         for(var i=0; i<t[0].length; i++){
         pos[i] = (i != t[0].length-1 ? ($(t[0][i]).height()*i)*-1 : pos[i-1]-$(t[0][i]).height());
         
         }
         
         return pos;
         
         }()[t[1]];
         
         };
         
         var sumdir = 0;
         var clear;
         
         scene.ani = function(t){
         for(var i=0; i<quick.btn.length; i++){
         if(elem === 4){
         break;
         
         }else if(i === elem){
         $(quick.btn[i]).addClass("ov");
         
         }
         else{
         $(quick.btn[i]).removeClass("ov");
         
         }
         }
         
         scene.stop(true,false).animate({marginTop:t},300,'easeOutExpo');
         
         return true;
         
         }
         
         scene.move = function(t){
         if(scene.is(":animated")){
         return false;
         
         }
         
         sumdir+=dir;
         
         clearTimeout(clear);
         clear = setTimeout(function(){
         sumdir = 0;
         
         },100);
         
         
         // -- 내용 이동
         switch(sumdir){
         // 위
         case sensit:
         clearTimeout(clear);
         
         if(elem > 0){
         elem--;
         scene.ani(scene.pos([scene.clip,elem]));
         
         }
         
         sumdir = 0;
         
         break;
         
         // 아래
         case sensit*-1:
         clearTimeout(clear);
         
         if(elem < scene.clip.length-1){
         elem++;
         scene.ani(scene.pos([scene.clip,elem]));
         
         
         }
         
         sumdir = 0;
         
         break;
         }
         
         
         if(elem > 0 && elem < 4){
         scene.remote.addClass("show");
         
         }else{
         scene.remote.removeClass("show");
         
         }
         
         return true;
         };
         
         scene.dir = function(t){
         // 휠 방향 [ 1:위, -1:아래 ]
         return (t < 0) ? t = 1 : t = -1;
         }
         
         
         scene.enter = function(t){
         if(t === undefined){
         t = 0;
         
         $("html,body").scrollTop(0);
         
         }
         
         for(var i=0; i<scene.clip.length; i++){
         
         if(i === elem){
            scene.clip.removeClass("action");
            $(scene.clip[t]).addClass("action");
            
         
         
         
            break;
         }
         
         }
         }
         
         
         
         function _in(event){ // 이벤트
         var t = $(this);
         
         if(data === false && event.type === "scroll"){
         t.body = document.body;
         t.maxscroll = t.body.scrollHeight-t.body.clientHeight;
         
         if(t.scrollTop() > Math.ceil($(scene.clip[elem]).offset().top)+$(scene.clip[elem]).height()/2){
         elem++;
         
         for(var i=0; i<quick.btn.length; i++){
         if(elem === 4){
         break;
         
         }else if(i === elem){
         $(quick.btn[i]).addClass("ov");
         
         
         
         }
         else{
         $(quick.btn[i]).removeClass("ov");
         
         }
         
         }
         
         }else{
         if(elem != 0){
         elem--;
         
         }
         else{
         quick.btn.removeClass("ov").eq(elem).addClass("ov");
         
         }
         
         }
         
         
         if(t.scrollTop() > Math.ceil($(scene.clip[0]).offset().top)+$(scene.clip[0]).height()/2){
         scene.remote.addClass("show");
         $('#scene1').removeAttr("style");
         }
         else{
         scene.remote.removeClass("show");
         
         $(scene.clip[t]).css({"marginTop":"160px"});
         
         }
         
         
         if(t.scrollTop() >= t.maxscroll-$(scene.clip[4]).height()){
         scene.remote.addClass("stop");
         
         $(scene.clip[t]).css({"marginTop":"160px"});
         }
         else{
         scene.remote.removeClass("stop");
         $(scene.clip[t]).removeAttr("style");
         }
         
         }
         
         
         if(event.type === "click"){
         elem = quick.btn.index(t);
         
         
         if(elem > 0 && elem < 4){
         scene.remote.addClass("show");
         
         }else{
         scene.remote.removeClass("show");
         
         }
         
         if(data === true){
         scene.ani(scene.pos([scene.clip,elem]));
         
         }
         else{
         $("html,body").stop(true,false).animate({scrollTop:$(t.attr("href")).offset().top},700,'easeOutExpo');
         
         }
         
         
         scene.enter(elem);
         
         return false;
         }
         
         if(data === true){
         event.preventDefault();
         
         if(event.originalEvent.wheelDelta != undefined){
         dir = scene.dir(event.originalEvent.wheelDelta*-1); // IE
         
         }else{
         dir = scene.dir(event.originalEvent.detail); // FF,CROME,SFARI
         
         }
         
         scene.move();
         
         }
         
         scene.enter(elem);
         
         return true;
         }
         
         
         $("html,body").on("mousewheel DOMMouseScroll touchmove",_in);
         
         
         $(window).on("scroll",_in);
         
         
         quick.btn.on("click",_in);
         
         /*
         $(window).resize(function(){
            clearTimeout(scene.timeout);
            scene.timeout = setTimeout(function(){
                return scene.setScreen(1280);
            },100);
         });
         
         scene.setScreen(1280);
         */
         
         scene.enter();
         
         }());
         
      </script>
      <script>
         $(window).scroll(function () {
            $(window).resize(function(){
                checkTopSnb();
            });
         checkTopSnb();
         });//end scroll
         
         function checkTopSnb(){
            if($(window).width() > 1024){
                var _top = $('#header').innerHeight()+$('#mvisual').innerHeight();
            }else{
                var _top = $('#header').innerHeight()+$('#mvisual').innerHeight()-$('#mquick').innerHeight()-$('#header').innerHeight();
            }
         
            if($(window).scrollTop() >= _top){
                $('#mcontent').css({"paddingTop":"130px"});
                $('#mquick').addClass('fix');
         
            }else if($(window).scrollTop() < _top){
         
                $('#mnav>a').removeClass('ov');
                $('#mcontent').removeAttr("style");
                $('#mquick').removeClass('fix');
            }
         }
      </script>
      

      <!-- 배너 추가 -->
      <section id="slider_banner" class="banner_wrap">
    	<div class="body_wrap">
	    	<h2>배너광장</h2>
            <div class="grap">
            	<ul class="obj">
	           		<jsp:include page="/tmpl/skin/banner/banner_skin_kor.jsp" >
		                <jsp:param name="siteCode" value="kor" />
		                <jsp:param name="listCnt" value="100" />
		                <jsp:param name="bnYN" value="N" />
	               	</jsp:include>
                </ul>
            </div>
            <div class="control">
                <button type="button" data-control="prev" class="btn_prev"><span>배너광장 이전</span></button>
                <button type="button" data-control="play" class="btn_play"><span>배너광장 시작</span></button>
                <button type="button" data-control="stop" class="btn_stop"><span>배너광장 정지</span></button>
                <button type="button" data-control="next" class="btn_next"><span>배너광장 다음</span></button>
            </div>
            <script>
				(function(){
					var param = "#slider_banner";
					var obj = ".obj .item";
					var btn = "#slider_banner .control";
					var interval = 3000;
					var speed = 100;
					var viewSize = 0;
					var moreSize = 0;
					var dir = "x";
					var data = 0;
					var auto = true;
					var hover = false;
					var method = "easeInOutCubic";
					var op1 = false;
					stateScrollObj(param, obj, btn, interval, speed, viewSize, moreSize, dir, data, auto, hover, method, op1);
				}());
			</script>
        </div>
      </section>
    
      <jsp:include page="/tmpl/skin/linksite/link_common.jsp"></jsp:include>
      <!-- footer :s -->
      <jsp:include page="/tmpl/skin/footer/footer_skin.jsp" >
         <jsp:param name="siteCode" value="${siteCode}" />
         <jsp:param name="mno" value="sub00_00_00" />
      </jsp:include>
      <!-- footer :e -->
      <script>
		var now = new Date()
		var year = now.getFullYear();   
		var month = now.getMonth()+1;
		var day = now.getDate();
		var time = now.getHours() ;
		if ( month < 10) {
		    month = "0"+month;
		}
		if ( day < 10) {
		    day = "0"+day;
		}
		if ( time < 10) {
		    time = "0"+time;
		}
		var today = year+''+month+''+day+''+time;
		   //today = '2014052500';  
	    if('2018060200' <= today && today <= '2018061318' ) {
			if ( getCookie( "elect0531" ) != "done" ){
		        window.open("/prog/vote/search.do", '선거인명부', "width=374 height=500 menubar=no status=no");
			}else{
		         
			}
		}
      </script>
	  </div>
   </body>
</html>