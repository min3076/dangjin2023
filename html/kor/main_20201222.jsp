<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="egovframework.com.cmm.LoginVO" %>
<%@ page import="net.acego.common.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.*" %>
<%@ page import="java.io.*"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	Date timeOut = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if (loginVO != null) {
		request.setAttribute("loginVO", loginVO);
		timeOut.setTime(session.getCreationTime());
		timeOut.setSeconds(session.getMaxInactiveInterval());
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
      <link rel="stylesheet" type="text/css" href="/css/common/new_layout.css"> <!--오픈시 파일명 수정 -->
      <link rel="stylesheet" type="text/css" href="/css/${siteCode}/layout.css">
      <link rel="stylesheet" type="text/css" href="/css/${siteCode}/respond.css">
      <link rel="stylesheet" type="text/css" href="/css/${siteCode}/main.css">
	  <link rel="stylesheet" type="text/css" href="/css/${siteCode}/slick.css">
	  <link rel="stylesheet" type="text/css" href="/css/${siteCode}/slick-theme.css">

      <script src="/js/${siteCode}/jquery-3.2.0.min.js"></script>
      <script src="/js/common/jquery-ui.min.js"></script>
      <script src="/js/common/script.js"></script>
	  <script src="/js/common/common-scroll.js"></script><!-- popup -->
      <script src="/js/common/common-popup.js"></script><!-- popup -->
	  <script src="/js/${siteCode}/stateScrollObj.js"></script>


	  <script src="/js/${siteCode}/con_slider.js"></script> <!-- main slider -->
	  <script src="/js/${siteCode}/mainui.js"></script> <!-- main slider -->
	  <script src="/js/${siteCode}/main.js"></script>
      <script src="/js/common/webfont.js"></script>
	  <script src='/js/${siteCode}/lottie.js'></script><!-- animation -->
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

	  <!--[if lt IE 7]>
		<style>
		h1 span {
		  background: none;
		  filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='/images/kor/new_main/gr_1.png', sizingMethod='scale');
		}
		</style>

	  <![endif]-->

<script type="text/javascript">
	if("${loginVO.id}" !== ""){
	 	console.log("<%=formatter.format(timeOut)%>");
		var timeOut = "<%=formatter.format(timeOut)%>";
			var bits = timeOut.split(/\D/);
			var date = new Date(bits[0], --bits[1], bits[2], bits[3], bits[4]);
			if (date < new Date()) {
				alert("로그인 시간이 만료되어 자동 로그아웃이 되었습니다.");
				location.href = "/uat/uia/actionLogout.do";
			}
		}
	</script>

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
          inImg.html('<img height="44px" src="/images/kor/new_main/weather/icon_wt0'+skyNumber+'.png" alt="'+skyAlt+'">');
          inTemp.html(temp);
          inText.html(skyAlt);
          }
          //]]>
         readTodayMsrstnInfo();
         readTodayweatherInfo();
      });
      </script>



 
	


<!--팝업창-->
<style type="text/css">
#popup{position:absolute;top:250px;left:10px;width:550px; height:auto; background:#3d3d3d; color:#fff; text-align:center;border:2px solid #000;z-index: 20006}
#popup a{display:block;width: 100%;height: 100%;}
#popup a:first-child{border-bottom:1px solid #3c6bb2;}
#popup2{position:absolute;top:250px;left:570px; width:550px; height:auto; background:#3d3d3d; color:#fff; text-align:center;border:2px solid #000;z-index: 20006}
#popup3{position:absolute;top:250px;left:570px; width:478px; height:auto; background:#3d3d3d; color:#fff; text-align:center;border:2px solid #000;z-index: 20006}
#popup3 a{display:block;width: 100%;height: 100%;}
#popup3 a:first-child{border-bottom:1px solid #3c6bb2;}
#popup4{position:absolute;top:250px;left:1130px; width:550px; height:auto; background:#3d3d3d; color:#fff; text-align:center;border:2px solid #000;z-index: 20006}

.popup_box{background: #fff;}
.close_wrap{padding:4px 0;background: #000;}
.check{font-size:12px;font-family:'돋움';padding-left:10px;display: inline-block;}
.close{display: inline-block;}
.close a{font-size:12px;padding:1px; font-weight:bold;color:#fff;}

.popup_box img {width:100%;}

@media all and (max-width:1630px){
	#popup{width:35%;left:6%;top:20%;}
	#popup2{width:35%;left:55%;top:20%;}
	#popup3{width:35%;left:6%;top:45%;}
	#popup4{width:50%;left:40%;top:62%;}
}

@media all and (max-width:600px){
	#popup{width:90%;left:5%;top:20%;}
	#popup2{width:90%;left:5%;top:35%;}
	#popup3{width:90%;left:5%;top:62%;}
	#popup4{width:90%;left:5%;top:60%;}
}



</style>


<div id="popup_wrap">
	
	<div id="popup">
		<div class="popup_box">
			<a href="http://corona19.dangjin.go.kr/corona19/index.do?menu=1" target="_blank" title="새창열림"><img src="/images/common/main/popup_5_6_new.png" border="0" 
				alt="당진시 코로나19 발생현황 자세히보러가기" /></a>
			<a href="http://corona19.dangjin.go.kr/corona19/index.do?menu=2" target="_blank" title="새창열림"><img src="/images/common/main/popup_5_6_new2.png" border="0"
				alt="당진시 코로나19 확진자 이동경로 자세히보러가기" /></a>
			<img src="/images/common/main/popup_5_6_new6.png" border="0" alt="코로나19 예방을 위한 마스크 착용 안내 마스크 착용 의무화 발령, 준수명령 위반 시 과태료 부과처분(2020. 11. 13. ∼)(위반 당사자 10만원 / 관리 운영자 300만원 이하)" />
			<a href="/cop/bbs/BBSMSTR_000000000013/selectBoardArticle.do?nttId=1071084" target="_blank" title="새창열림"><img src="/images/common/main/popup_corona_2_5.jpg" border="0" alt="사회적거리두기 2.5단계 격상 자세히보러가기"></a>
		<div class="close_wrap">
			<form name="pop_form" id="pop_form">
				<div class="check">
					<label class="" for="popup_today1" >오늘 하루동안 보지 않기</label>
					<input type="checkbox" id="popup_today1" name="chkbox" value="checkbox"></div>
				<div class="close" style="margin:0 0 0 20px;"><a href="javascript:closePop('popup', 'pop_form');">CLOSE</a></div>
			</form>
		</div>
		</div>
	</div>
	
	<!--
	<div id="popup2">
		<div class="popup_box">
			<img src="/images/common/main/popup_0908.jpg" border="0" />
		
		<div class="close_wrap">
			<form name="pop2_form" id="pop2_form">
				<div class="check">
					<label class="" for="popup_today2" >오늘 하루동안 보지 않기</label>
					<input type="checkbox" id="popup_today2" name="chkbox" value="checkbox"></div>
				<div class="close" style="margin:0 0 0 20px;"><a href="javascript:closePop('popup2', 'pop2_form');">CLOSE</a></div>
			</form>
		</div>
		</div>
	</div>-->

	<!--
	<div id="popup2">
		<div class="popup_box">
			<a href="https://www.dangjin.go.kr/viewer/skin/doc.html?fn=BBS_202011110126376120.pdf&rs=/viewer/result/BBSMSTR_000000000450/" target="_blank" title="새창열림">
			<img src="/images/common/main/popup_5_6_new4.png" border="0" alt="당진시 사회적 거리두기 1단계 완화 안내" /></a>
			
			<div class="close_wrap">
				<form name="pop2_form" id="pop2_form">
					<div class="check">
						<label class="" for="popup_today3" >오늘 하루동안 보지 않기</label>
						<input type="checkbox" id="popup_today3" name="chkbox" value="checkbox"></div>
					<div class="close" style="margin:0 0 0 20px;"><a href="javascript:closePop('popup2', 'pop2_form');">CLOSE</a></div>
				</form>
			</div>
		</div>
	</div> 
	-->
<!--
	<div id="popup4">
		<div class="popup_box">
			<img src="/images/common/main/popup_7_new.jpg" border="0" />
		
			<div class="close_wrap">
				<form name="pop4_form" id="pop4_form">
					<div class="check">
						<label class="" for="popup_today4" >오늘 하루동안 보지 않기</label>
						<input type="checkbox" id="popup_today4" name="chkbox" value="checkbox"></div>
					<div class="close" style="margin:0 0 0 20px;"><a href="javascript:closePop('popup4', 'pop4_form');">CLOSE</a></div>
				</form>
			</div>
		</div>
	</div> 
-->

</div>

<script type="text/javascript">

	function setCookie( name, value, expiredays ) {
	     var todayDate = new Date();
	     todayDate.setDate( todayDate.getDate() + expiredays );
	     document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	
	function getCookie(name) 
	{ 
		var arg = name + "="; 
		var alen = arg.length; 
		var clen = document.cookie.length; 
		var i = 0; while(i< clen) 
		{ 
			var j = i + alen; 
			if(document.cookie.substring(i,j)==arg)
				{ 
				var end = document.cookie.indexOf(";",j); 
				if(end == -1) end = document.cookie.length;
				return unescape(document.cookie.substring(j,end)); 
				} 
			i=document.cookie.indexOf(" ",i)+1; 
			if (i==0) break; 
		} 
		return null; 
	}

	function closePop(layer_id, form_id) {
		
		var frm = document.getElementById(form_id);
		
		if ( frm.chkbox.checked ){
	        setCookie( layer_id, "done" , 1 );
	    }

	    document.all[layer_id].style.visibility = "hidden";
	}

	if(getCookie('popup') != 'done') 
	{ 
		document.all['popup'].style.visibility = "visible";
	}else {
	    document.all['popup'].style.visibility = "hidden";
	}
	
	if(getCookie('popup2') != 'done') 
	{ 	
		document.all['popup2'].style.visibility = "visible";
	}else {
	    document.all['popup2'].style.visibility = "hidden";
	}	

	if(getCookie('popup3') != 'done') 
	{ 	
		document.all['popup3'].style.visibility = "visible";
	}else {
	    document.all['popup3'].style.visibility = "hidden";
	}	

	if(getCookie('popup4') != 'done') 
	{ 	
		document.all['popup4'].style.visibility = "visible";
	}else {
	    document.all['popup4'].style.visibility = "hidden";
	}	

</script>

   
</head>



   <body>
      <div id="accessibility">
         <a href="#container">본문 바로가기</a>
         <a href="#gnb">대메뉴 바로가기</a>
      </div>
      <h1 class="skip">당진시청 포털 웹사이트 입니다.</h1>
      <div id="wrap">




	  <div id="conA">

		  <jsp:include page="/tmpl/skin/util/util_common_quick.jsp"></jsp:include>
		  <jsp:include page="/tmpl/skin/util/util_common_${siteCode}.jsp"></jsp:include>

		  <!-- header :s -->
		  <jsp:include page="/tmpl/skin/header/header_skin_${siteCode}.jsp" >
			 <jsp:param name="siteCode" value="${siteCode}" />
			 <jsp:param name="mno" value="sub00_00_00" />
		  </jsp:include>
		  <!-- header :e -->
		  
		


		  <div id="accessibility-mcontent"></div>
	
	  </div>



	  <!-- conB : s -->
      <div id="conB">

	  	<!-- 가을스킨 -->
	  	<div class="skin_bg">
		  <div class="inner">
			<div class="bg_obj obj01"></div>
			<div class="bg_obj autumn1_wrap"></div>
			<div class="bg_obj autumn2_wrap"></div>
		  </div>
	  	</div>
		<!-- 가을스킨 -->



		<!-- 롤링컨텐츠 : s -->
		<div id="container">

			<div id="controlTab">
				<ul style="position: relative">
					<li id="life_btn"><a href="#none" class="life">생활</a></li>
					<li id="admin_btn" class="on"><a href="#none" class="admin">행정</a></li>
					<li id="civil_btn"><a href="#none" class="civil">민원</a></li>
					
				</ul>
			</div>
			<span class="is slideGuide" style="opacity:0;top:300px;">좌우로 움직여보세요</span>




			<div>

				<!-- 행정 : s -->
				<div id="admin" class="on">

					<div class="ti">
						<h2>
						<svg height="50" width="100">
						   <defs>
							 <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
							   <stop offset="0%" style="stop-color:rgb(29,118,201);stop-opacity:1" />
							   <stop offset="100%" style="stop-color:rgb(17,130,84);stop-opacity:1" />
							 </linearGradient>
						   </defs>
						   <text fill="url(#grad1)" font-size="38" font-family="BRBA" x="10" y="40" style="font-family:'BRBA'">
							행정
							</text>
						</svg> 
						</h2>
						<span>투명하고 청렴한 당진</span>
					</div>

					<div class="box">

						<!-- 행정 팝업존 -->
						<div class="con1">
							<div class="pZone">
								<ul class="control">
									<li><a href="#" class="is prev topPzonePrev" id="">이전</a></li>
									<li><a href="#" class="is stop topPzoneStop" id="">멈춤</a></li>
									<li><a href="#" class="is next topPzoneNext" id="">다음</a></li>
								</ul>
								<div class="list">
									<ul>
										<jsp:include page="/tmpl/skin/popupZone/popupZone_skin_category_kor.jsp">
										  <jsp:param value="popupZone" name="code"/>
										  <jsp:param value="siteKor" name="siteCode"/>
										  <jsp:param value="1" name="number"/>
									    </jsp:include>
									</ul>
								</div>
							</div>
						</div>
						<!-- //행정 팝업존 -->

						<!-- 자주찾는행정정보 -->
						<div class="con2">
						<!--
							<div class="corona">
								<h4 class="title">코로나바이러스감염증-19</h4>
								<h3 class="title">당진시 대응상황 실시간 알리미 서비스</h3>

								<div class="box">
									<p>위기단계 : <span class="point">심각</span> (2020. 2. 23. 발령)	</p>
									<p>당진시 발생상황</p>		
									<ul class="list">
										<li class="all">
											<p class="title">총계</p>
											<p class="cont type1">7 명</p>
										</li>
										<li>
											<p class="title">격리중</p>
											<p class="cont type1">3 명</p>
										</li>
										<li>
											<p class="title">격리해제</p>
											<p class="cont type1">4 명</p>
										</li>
									</ul>
									<a href="http://ncov.mohw.go.kr/index_main.jsp" target="_blank">코로나바이러스감염증-19(COVID-19) 알아보기</a>
									<a href="https://www.mois.go.kr/frt/bbs/type002/commonSelectBoardArticle.do?bbsId=BBSMSTR_000000000205&nttId=75598" target="_blank">코로나-19 팩트체크 8가지</a>
								</div>
						-->

						
							<div>
								<h3>자주찾는 행정</h3>
								<ul>
									<li class="ico1"><a href="/cyber/hall/" target="_blank">청사안내</a></li>
									<li class="ico2"><a href="/kor/sub04_04_02.do">조직도</a></li>
									<li class="ico3"><a href="/prog/deptPerson/kor/sub04_04_03/deptList.do">직원안내</a></li>
								</ul>
								<div class="table">
									<div class="table-row">
										<a href="/prog/reprsntInfrmEdu/kor/sub05_11_01/list.do" class="table-col">
										시민정보화교육</a>
										<a href="/prog/giftCertificate/kor/sub05_06_11_03/list.do" class="table-col">당진사랑상품권</a>
									</div>
									<div class="table-row">
										<a href="/cop/bbs/BBSMSTR_000000000380/selectBoardList.do" class="table-col">홈페이지 바로잡기</a>
										<a href="/prog/waitingPollutn/kor/sub05_09_05/list.do" class="table-col">실시간대기오염도</a>
									</div>
								</div>
							</div>
						</div>
						<!-- //자주찾는행정정보 -->


						<!-- 열린시장실 -->
						<div class="con3">
							<div class="mayor">
								<div class="titlebox"><a href="http://www.dangjin.go.kr/mayor/index.html" target="_blank"  title="새창열림">소통하는 당진시장 시민,김홍장</a></div>

								<ul class="mayor_lnk">
									<li><a href="http://www.dangjin.go.kr/mayor/html/sub04/0402.html" target="_blank" title="새창열림">약속은 꼭 지키겠습니다</a></li>
									<li><a href="http://www.dangjin.go.kr/mayor/html/sub04/040304.html" target="_blank" title="새창열림">공약 이행현황</a></li>
									<li><a href="http://www.dangjin.go.kr/mayor/html/sub04/040301.html" target="_blank" title="새창열림">시민과약속</a></li>
								 </ul>
								 <div class="mayor_btn"><a href="http://www.dangjin.go.kr/mayor/html/sub04/0401.html" target="_blank" title="새창열림">매니페스토</a></div>
							</div>
						</div>
						<!-- //열린시장실 -->

						<!-- 주요사이트 -->
						<div class="con4">
							<div class="siteLink_inner">
								<h3><strong>주요사이트</strong></h3>

								<div class='autoplay'>		  	
									<div class="ico1">
										<a href="https://www.dangjin.go.kr/shimhoon" target="_blank" title="새창열림">심훈기념관</a>
									</div>
									<div class="ico2">
										<a href="https://www.dangjin.go.kr/beogeunae" target="_blank" title="새창열림">버그내순례길</a>
									</div>
									<div class="ico3">
										<a href="http://dangjin.evermbc.com/p12/site/dangjin/2019/" target="_blank" title="새창열림">사이버강좌</a>
									</div>
									<div class="ico4">
										<a href="https://www.dangjin.go.kr/jejung.do" target="_blank" title="새창열림">재정운용상황공개</a>
									</div>
									<div class="ico5">
										<a href="http://www.dangjinart.kr/" target="_blank" title="새창열림">당진문화재단</a>
									</div>
									<div class="ico6">
										<a href="http://www.dangjin.go.kr/samsun.do" target="_blank" title="새창열림">삼선산수목원</a>
									</div>
									<div class="ico7">
										<a href="https://www.dangjin.go.kr/stat.do" target="_blank" title="새창열림">당진통계</a>
									</div>
									<div class="ico8">
										<a href="https://www.dangjin.go.kr/gyeyak" target="_blank" title="새창열림">계약정보공개</a>
									</div>
									<div class="ico9">
										<a href="http://www.dangjin.go.kr/woman.do" target="_blank" title="새창열림">여성의전당</a>
									</div>
									<div class="ico8">
										<a href="http://www.dangjin.go.kr/lll.do" target="_blank" title="새창열림">평생학습포털</a>
									</div>
									<div class="ico4">
										<a href="/cop/bbs/BBSMSTR_000000000330/selectBoardList.do" title="새창열림">재정공시</a>
									</div>
									<div class="ico10">
										<a href="http://www.dangjin.go.kr/bokji/sub02_03_01.do" target="_blank" title="새창열림">아동친화도시</a>
									</div>
									<div class="ico11">
										<a href="http://www.dangjin.go.kr/bokji/sub03_04_01.do" target="_blank" title="새창열림">여성친화도시</a>
									</div>								
									<div class="ico12">
										<a href="http://www.dangjin.go.kr/fmportal/" target="_blank" title="새창열림">시설관리사업소</a>
									</div>
									<div class="ico13">
										<a href="http://www.dangjin.go.kr/fmres/" target="_blank" title="새창열림">통합예약시스템</a>
									</div>
									<div class="ico14">
										<a href="https://ccfsm.foodnara.go.kr/dangjin/" target="_blank" title="새창열림">어린이급식관리<br>지원센터</a>
									</div>

								 </div>

								  <div class="mvis_control ctrl">
									<button type="button" class="button mvis_prev" data-control="prev">팝업 이전</button>
									<button type="button" class="button mvis_ctr mvis_stop" data-control="stop">팝업 정지</button>
									<button type="button" style="display: none" class="button mvis_ctr mvis_play" data-control="play">팝업 재생</button>
									<button type="button" class="button mvis_next" data-control="next">팝업 다음</button>
								  </div>								  

							</div>
						</div>
						<!-- //주요사이트 -->
					
					</div>
				</div>
				<!-- 행정 :e -->

				



				
				<!-- 민원 :s -->
				<div id="civil" class="off">

					<div class="ti">
						<h2>
						<svg height="50" width="100">
						   <defs>
							 <linearGradient id="grad2" x1="0%" y1="0%" x2="100%" y2="0%">
							   <stop offset="0%" style="stop-color:rgb(8,161,196);stop-opacity:1" />
							   <stop offset="100%" style="stop-color:rgb(32,92,174);stop-opacity:1" />
							 </linearGradient>
						   </defs>
						   <text fill="url(#grad2)" font-size="38" font-family="BRBA" x="10" y="40" style="font-family:'BRBA'">
							민원
							</text>
						</svg> 
						</h2>
						<span>편리한 민원서비스</span>
					</div>

					<div class="box">

						<!-- 민원 팝업존 -->
						<div class="con1">
							<div class="pZone">
								<ul class="control">
									<li><a href="#" class="is prev topPzonePrev" >이전</a></li>
									<li><a href="#" class="is stop topPzoneStop">멈춤</a></li>
									<li><a href="#" class="is next topPzoneNext">다음</a></li>
								</ul>
								<div class="list">
									<ul>
										<jsp:include page="/tmpl/skin/popupZone/popupZone_skin_category_kor.jsp">
										  <jsp:param value="popupZone" name="code"/>
										  <jsp:param value="siteKor" name="siteCode"/>
										  <jsp:param value="3" name="number"/>
									    </jsp:include>
									</ul>
								</div>
							</div>
						</div>	
						<!-- //민원 팝업존 -->
						
						<!-- 자주찾는민원정보 -->
						<div class="con2">
							<div>
								<h3>자주찾는 민원정보</h3>
								<ul>
									<li class="ico1"><a href="/kor/sub01_03_01_01.do">자동차민원</a></li>
									<li class="ico2"><a href="/kor/sub01_06_01.do">지방세민원</a></li>
									<li class="ico3"><a href="https://kras.go.kr:444/cmmmain/goMainPage.do" target="_blank" title="새창열림">부동산민원</a></li>
								</ul>
								<div class="table">
									<div class="table-row">
										<a href="/kor/sub01_01_03_01.do" class="table-col">무인민원발급기</a>
										<a href="/kor/sub01_01_04_01.do" class="table-col">여권발급안내</a>
									</div>
									<div class="table-row">
										<a href="http://www.minwon.go.kr/main?a=AA020InfoMainApp" target="_blank" title="새창열림" class="table-col">민원24</a>
										<a href="/kor/sub01_01_01_01.do" class="table-col">민원업무안내</a>
									</div>
								</div>
							</div>
						</div>
						<!-- //자주찾는민원정보 -->

						<!-- 참여/신고 -->
						<div class="con3">
							<div class="part">
								<h3>참여/신고</h3>
								<ul>
									<li class="l1"><a href="/kor/sub02_03_01.do"><span>제안을 받습니다</span></a></li>
									<li class="l2"><a href="/cop/bbs/BBSMSTR_000000000500/selectBoardList.do"><span>시민로1번가</span></a></li>
									<li class="l3"><a href="/prog/inhbtntPartcptnBudget/kor/sub02_04_01/list.do"><span>주민참여예산안내</span></a></li>
									<li class="l3"><a href="/cop/bbs/BBSMSTR_000000000350/selectBoardList.do"><span>칭찬합시다</span></a></li>
								</ul>
							</div>
						</div>
						<!-- //참여/신고 -->

						<!-- 바로가기 -->
						<div class="con4">
							<div class="service_inner">
								<h3 class="hide"><strong>바로가기</strong></h3>
								<ul>
									<li><a href="https://www.dangjin.go.kr/sudo/"  target="_blank" title="새창열림"  class="ico ico1">수도요금 조회납부</a></li>
									<li><a href="https://www.wetax.go.kr/main/?cmd=LPTINB1R0" target="_blank" title="새창열림" class="ico ico2">건축물 시가표준액 조회</a></li>
									<li><a href="https://car.dangjin.go.kr/" target="_blank" title="새창열림" class="ico ico3">자동차과태료 조회납부</a></li>
									<li><a href="https://parkingsms.dangjin.go.kr/" target="_blank" title="새창열림"  class="ico ico4">주정차단속 문자알림</a></li>
									<li><a href="http://kras.chungnam.go.kr/land_info/info/landprice/landprice.do" target="_blank" title="새창열림" class="ico ico5">개별공시지가 열람</a></li>
									<li><a href="https://www.wetax.go.kr/main/" target="_blank" title="새창열림" class="ico ico6">지방세 조회납부</a></li>
								</ul>
								
							</div>
						</div>
						<!-- //바로가기 -->


					</div>
				</div>			
				<!-- 민원 : e -->



				<!-- 생활 : s -->
				<div id="life" class="off">

					<div class="ti">
						<h2>
						<svg height="50" width="100">
						   <defs>
							 <linearGradient id="grad3" x1="0%" y1="0%" x2="100%" y2="0%">
							   <stop offset="0%" style="stop-color:rgb(186,75,151);stop-opacity:1" />
							   <stop offset="100%" style="stop-color:rgb(28,98,190);stop-opacity:1" />
							 </linearGradient>
						   </defs>
						   <text fill="url(#grad3)" font-size="38" font-family="BRBA" x="10" y="40" style="font-family:'BRBA'">
							생활
							</text>
						</svg> 
						</h2>
						<span>살기좋은 당진 생활</span>
					</div>

					<div class="box">
						
						<!-- 생활 팝업존 -->
						<div class="con1">
							<div class="pZone">
								<ul class="control">
									<li><a href="#" class="is prev topPzonePrev" >이전</a></li>
									<li><a href="#" class="is stop topPzoneStop">멈춤</a></li>
									<li><a href="#" class="is next topPzoneNext">다음</a></li>
								</ul>
								<div class="list">
									<ul>
										<jsp:include page="/tmpl/skin/popupZone/popupZone_skin_category_kor.jsp">
										  <jsp:param value="popupZone" name="code"/>
										  <jsp:param value="siteKor" name="siteCode"/>
										  <jsp:param value="2" name="number"/>
									    </jsp:include>
									</ul>
								</div>
							</div>
						</div>	
						<!-- //생활 팝업존 -->

						<!-- 자주찾는생활정보 -->
						<div class="con2">
							<div>
								<h3>자주찾는 생활정보</h3>
								<ul>
									<li class="ico1"><a href="/prog/empmnPblanc/kor/sub03_03_05/list.do">채용정보</a></li>
									<li class="ico2"><a href="/bokji/sub03_03_01.do">출산지원안내</a></li>
									<li class="ico3"><a href="/kor/sub05_07_04.do">교통정보</a></li>
								</ul>
								<div class="table">
									<div class="table-row">
										<a href="http://www.dangjin.go.kr/waste" target="_blank" title="새창열림" class="table-col">대형폐기물 배출안내</a>
										<a href="/prog/giftCertificate/kor/sub05_06_11_03/list.do" class="table-col">당진사랑상품권</a>
									</div>
									<div class="table-row">
										<a href="https://www.dangjin.go.kr/prog/saleGood/kor/sub05_06_07/list.do" title="새창열림" class="table-col">
										착한가격업소</a>
										<a href="/synapsoft/FileViewer.do?atchFileId=FILE_000000001051585&fileSn=0" target="_blank" title="새창열림" class="table-col">
										전입시민 생활안내서</a>
									</div>
								</div>
							</div>
						</div>
						<!-- //자주찾는생활정보 -->

						<!-- 배너 -->
						<div class="con3">
							<div>
								<a href="http://www.dangjin.go.kr/job.do" target="_blank" title="새창열림"><img src="/images/kor/new_main/con3_banner01.jpg" alt="당진시 일자리종합지원센터, 잡아라 JOB, 다양한 일자리정보 및 취업지원서비스 제공, 바로가기" /></a>
							</div>
						</div>
						<!-- //배너 -->

						<!-- 바로가기 -->
						<div class="con4">
							<div class="service_inner">
								<h3 class="hide"><strong>바로가기</strong></h3>
								<ul>
									<li><a href="/tour.do" target="_blank" title="새창열림" class="ico ico1">당진 문화관광</a></li>
									<li><a href="https://www.dangjin.go.kr/prog/tursmCn/tour/sub02_02_01/view.do?cntno=10" target="_blank" title="새창열림" class="ico ico2">관광명소</a></li>
									<li><a href="https://www.dangjin.go.kr/prog/tursmCn/tour/sub02_06_01/view.do?cntno=41" target="_blank" title="새창열림" class="ico ico3">문화행사</a></li>
									<li><a href="https://www.dangjin.go.kr/prog/foodData/tour/sub05_03/list.do?code=%EB%AA%A8%EB%B2%94%EC%9D%8C%EC%8B%9D%EC%A0%90" target="_blank" title="새창열림" class="ico ico4">맛집정보</a></li>
									<li><a href="https://www.dangjin.go.kr/prog/hongbo/tour/sub05_07/list.do" target="_blank" title="새창열림" class="ico ico5">관광책자신청</a></li>
									<li><a href="https://www.dangjin.go.kr/cyber/tour/index.html" target="_blank" title="새창열림" class="ico ico6">사이버투어</a></li>
								</ul>
								
							</div>
						</div>
						<!-- //바로가기 -->


					</div>
				</div>			
				<!-- 생활 : e -->


			

			</div>
			
		  </div>
		  <!-- 롤링컨텐츠 : s -->
	  </div>
	  <!-- conB : e -->



	  <!-- conC : s -->
	  <div id="conC">
		<div class="layout">
			
			<!--게시판 -->
			  <div id="mboard">
				 <div class="mboard-wrap">
					<h2 class="skip">주요 게시판 최근 게시물</h2>
					<h3>Notice</h3>
					<div class="mboardbox">
					   <strong class="firstchild"><a class="ov bd_lbk" href="#mboard-1">공지사항</a></strong>
					   <div id="mboard-1" class="grap">
						  <ul class="obj">
						  	 <!--<span class="tag">공지</span>--> 
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



			  <!-- 바로가기-->
			  <div class="mlnk">
				  <ul>
					<li><a href="/kor/sub02_09_01.do" class="ico1">주민자치<span>주민 스스로가 참여하는 <br>행복하고 살기 좋은 당진</span></a></li>
					<li class="develop">
						<jsp:include page="/tmpl/skin/mainIconLink/mainIconLink_skin_kor.jsp">
						  <jsp:param value="mainIconLink" name="code"/>
						  <jsp:param value="kor" name="siteCode"/>
						</jsp:include>
					</li>
					<li><a href="https://www.open.go.kr/" target="_blank" title="새창열림" class="ico3">정보공개</a></li>
				  </ul>
			  </div>
			  <!-- //바로가기 -->



			  <!--팝업존 -->
			  <div id="mpopup">
				 <h2>팝업존</h2>

				 <div class="control">
					<div class="state">
					   <button type="button" class="ir" data-type="prev">팝업존 이전</button>
					   <button type="button" class="ir" data-type="stop">팝업존 멈춤</button>
					   <button type="button" class="ir" data-type="play" style="display: none;">팝업존 시작</button>
					   <button type="button" class="ir" data-type="next">팝업존 다음</button>
					</div>
				 </div>

				 <div class="grap">
					<div class="obj">
					   <jsp:include page="/tmpl/skin/popupZone/popupZone_skin_kor.jsp">
						  <jsp:param value="popupZone" name="code"/>
						  <jsp:param value="kor" name="siteCode"/>
					   </jsp:include>
					</div>
					<div class="count"><i>5</i>/5</div>
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

		</div>
	  </div>
	  <!-- conC : e -->




	  <!-- conD : s -->
	  <div id="conD">
		<div class="layout">

			<div class="ti">
				<h2>
				
					<svg height="50" width="185">
					   <defs>
						 <linearGradient id="grad4" x1="0%" y1="0%" x2="100%" y2="0%">
						   <stop offset="0%" style="stop-color:rgb(28,98,190);stop-opacity:1" />
						   <stop offset="100%" style="stop-color:rgb(186,75,151);stop-opacity:1" />
						 </linearGradient>
					   </defs>
					   <text fill="url(#grad4)" font-family="BRBA" x="10" y="40" style="font-family:'BRBA'">
						미디어당진
						</text>
					</svg> 
				
				</h2>
				<span><a href="https://www.dangjin.go.kr/media/Main" target="_blank" title="미디어당진 새창열림">소셜정책포털 미디어당진</a></span>
			</div>

			<ul class="link">
				<li><a href="https://www.facebook.com/dangjin" target="_blank" title="새창열림" class="sns_ico ico1">facebook</a></li>
				<!--<li><a href="https://twitter.com/dangjinsi" target="_blank" title="새창열림" class="sns_ico ico2">twitter</a></li>-->
				<li><a href="https://www.instagram.com/dangjincity/?hl=ko" target="_blank" title="새창열림" class="sns_ico ico3">instagram</a></li>
				<li><a href="http://blog.naver.com/dangjin2030" target="_blank" title="새창열림" class="sns_ico ico4">blog</a></li>				
				<li><a href="https://www.kakaocorp.com/service/KakaoTalk?lang=ko" target="_blank" title="새창열림" class="sns_ico ico5">kakao</a></li>
				<li><a href="https://www.youtube.com/" target="_blank" title="새창열림" class="sns_ico ico6">youtube</a></li>
			</ul>
		</div>

		<div class='autoplay1'>		
			<jsp:include page="/tmpl/skin/blog/blog_skin_new_kor.jsp" >
				 <jsp:param name="siteCode" value="kor" />
				 <jsp:param name="code" value="blog" />
			</jsp:include>  	
	<!--<div> -->
	<!--	<a href="#" target="_blank" title="새창열림"> -->
	<!--		<div class="text"> -->
	<!--			<strong>'청춘공감 삶이 그림을 만날 때' 개인부스전 300점전</strong> -->
	<!--			<p>그림을 그리는 이들이 모인 동아리 '청춘공감 삶이 그림을 만날때'가 1년간 그림을 그려온 작품들을 군민들에게 선보입니다! 이번 주제는 청출어람[靑出於藍] 각각 부스를 갖는 첫 개...</p> -->
	<!--			<span class="date">2019.12.20</span> -->
	<!--		</div> -->
	<!--		<span class="sns_ico ico1"></span> -->
	<!--	</a> -->
	<!--</div> -->
	
	<!--<div> -->
	<!--	<a href="#" target="_blank" title="새창열림"> -->
	<!--		<div class="thumb"><img src="/images/kor/new_main/test_sns.jpg" alt=""></div> -->
	<!--		<div class="text2"> -->
	<!--			<strong>'청춘공감 삶이 그림을 만날 때' 개인부스전 300점전</strong> -->
	<!--			<span class="date">2019.12.20</span> -->
	<!--		</div> -->
	<!--		<span class="sns_ico ico2"></span> -->
	<!--	</a> -->
	<!--</div> -->
	
	<!--<div> -->
	<!--	<a href="#" target="_bla	nk" title="새창열림"> -->
	<!--		<div class="text"> -->
	<!--			<strong>'청춘공감 삶이 그림을 만날 때' 개인부스전 300점전</strong> -->
	<!--			<p>그림을 그리는 이들이 모인 동아리 '청춘공감 삶이 그림을 만날때'가 1년간 그림을 그려온 작품들을 군민들에게 선보입니다! 이번 주제는 청출어람[靑出於藍] 각각 부스를 갖는 첫 개...</p> -->
	<!--			<span class="date">2019.12.20</span> -->
	<!--		</div> -->
	<!--		<span class="sns_ico ico1"></span> -->
	<!--	</a> -->
	<!--</div> -->
	
	<!--<div> -->
	<!--	<a href="#" target="_blank" title="새창열림"> -->
	<!--		<div class="text"> -->
	<!--			<strong>'청춘공감 삶이 그림을 만날 때' 개인부스전 300점전</strong> -->
	<!--			<p>그림을 그리는 이들이 모인 동아리 '청춘공감 삶이 그림을 만날때'가 1년간 그림을 그려온 작품들을 군민들에게 선보입니다! 이번 주제는 청출어람[靑出於藍] 각각 부스를 갖는 첫 개...</p> -->
	<!--			<span class="date">2019.12.20</span> -->
	<!--		</div> -->
	<!--		<span class="sns_ico ico1"></span> -->
	<!--	</a> -->
	<!--</div> -->
	
	<!--<div> -->
	<!--	<a href="#" target="_blank" title="새창열림"> -->
	<!--		<div class="thumb"><img src="/images/kor/new_main/test_sns.jpg" alt=""></div> -->
	<!--		<div class="text2"> -->
	<!--			<strong>'청춘공감 삶이 그림을 만날 때' 개인부스전 300점전</strong> -->
	<!--			<span class="date">2019.12.20</span> -->
	<!--		</div> -->
	<!--		<span class="sns_ico ico2"></span> -->
	<!--	</a> -->
	<!--</div> -->
	
	<!--<div> -->
	<!--	<a href="#" target="_blank" title="새창열림"> -->
	<!--		<div class="thumb"><img src="/images/kor/new_main/test_sns.jpg" alt=""></div> -->
	<!--		<span class="sns_ico ico2"></span> -->
	<!--	</a> -->
	<!--</div> -->

		 </div>
		 <div class="mvis_control ctrl1">
			<button type="button" class="button mvis_prev" data-control="prev">팝업 이전</button>
			<button type="button" class="button mvis_next" data-control="next">팝업 다음</button>
		  </div>

	  </div>
	  <!-- conD : e -->



	  <!-- 분야별정보 -->
	  <div id="conE">
		<div class="layout">
			<h3 class="hide"><strong>분야별정보</strong></h3>

			<div class='autoplay2'>		  	
				<div class="ico1">
					<a href="/kor/sub05_01.do" target="_blank" title="새창열림">복지</a>
				</div>
				<div class="ico2">
					<a href="/kor/sub05_02.do" target="_blank" title="새창열림">보건</a>
				</div>
				<div class="ico3">
					<a href="/kor/sub05_03_01_01.do" target="_blank" title="새창열림">기업/경제</a>
				</div>
				<div class="ico4">
					<a href="/kor/sub05_04_01.do" target="_blank" title="새창열림">농/수/축산업</a>
				</div>
				<div class="ico5">
					<a href="/kor/sub05_14_01.do" target="_blank" title="새창열림">경관/옥외광고</a>
				</div>
				<div class="ico6">
					<a href="/kor/sub05_05_01.do" target="_blank" title="새창열림">주택/지적</a>
				</div>
				<div class="ico7">
					<a href="/kor/sub05_13_02.do" target="_blank" title="새창열림">건축</a>
				</div>
				<div class="ico8">
					<a href="/kor/sub05_06_01_01.do" target="_blank" title="새창열림">생활</a>
				</div>
				<div class="ico9">
					<a href="/kor/sub05_07_01.do" target="_blank" title="새창열림">교통</a>
				</div>
				<div class="ico10">
					<a href="/kor/sub05_08_01.do" target="_blank" title="새창열림">취업</a>
				</div>
				<div class="ico11">
					<a href="/kor/sub05_09_01.do" target="_blank" title="새창열림">환경/청소</a>
				</div>
				<div class="ico12">
					<a href="/kor/sub05_10_01.do" target="_blank" title="새창열림">재난/안전/민방위</a>
				</div>
				<div class="ico13">
					<a href="/prog/reprsntInfrmEdu/kor/sub05_11_01/list.do" target="_blank" title="새창열림">교육/강좌</a>
				</div>
				<div class="ico14">
					<a href="/prog/parkInfo/kor/sub05_12_01/list.do" target="_blank" title="새창열림">문화/체육</a>
				</div>
			 </div>

			  <div class="mvis_control ctrl2">
				<button type="button" class="button mvis_prev" data-control="prev">팝업 이전</button>
				<button type="button" class="button mvis_next" data-control="next">팝업 다음</button>
			  </div>								  

		</div>
	  </div>
	  <!-- //분야별정보 -->

	  
	 

	  <!-- 배너 추가 -->
      <section id="slider_banner" class="banner_wrap">
		<div class="layout">
	  	<!-- 배너시작 -->
    	<div class="body_wrap">
	    	<h2 class="hide">배너광장</h2>
            <div class="grap">
            	<div  class="obj">
	           		<jsp:include page="/tmpl/skin/banner/banner_skin_kor.jsp" >
		                <jsp:param name="siteCode" value="kor" />
		                <jsp:param name="listCnt" value="100" />
		                <jsp:param name="bnYN" value="N" />
	               	</jsp:include>
                </div >
            </div>
            <div class="control">
                <button style="display: inline-block;" class="prev" data-control="prev">이전</button>
				<button style="display: inline-block;" class="next" data-control="next">다음</button>
				<button style="display: inline-block;" class="act stop" data-control="stop">멈춤</button>
				<button style="display: none;" class="act play" data-control="play">시작</button>
            </div>
        </div>
		<!-- //배너시작 -->

		

		<!-- sitebox Modal :s -->
		
		<!-- Modal document -->
		<div id="ex1" class="modal"  tabindex=0>
		  <h2 class="ti">패밀리사이트</h2>
		  <div class="modal_cont">
			<ul class="siteLink_inner">
				<li class="ico1">
					<a href="https://www.dangjin.go.kr/shimhoon" target="_blank" title="새창열림">심훈기념관</a>
				</li>
				<li class="ico2">
					<a href="https://www.dangjin.go.kr/beogeunae" target="_blank" title="새창열림">버그내순례길</a>
				</li>
				<li class="ico3">
					<a href="http://dangjin.evermbc.com/p12/site/dangjin/2019/" target="_blank" title="새창열림">사이버강좌</a>
				</li>
				<li class="ico4">
					<a href="https://www.dangjin.go.kr/jejung.do" target="_blank" title="새창열림">재정운용상황공개</a>
				</li>
				<li class="ico5">
					<a href="http://www.dangjinart.kr/" target="_blank" title="새창열림">당진문화재단</a>
				</li>
				<li class="ico6">
					<a href="http://www.dangjin.go.kr/samsun.do" target="_blank" title="새창열림">삼선산수목원</a>
				</li>
				<li class="ico7">
					<a href="https://www.dangjin.go.kr/stat.do" target="_blank" title="새창열림">당진통계</a>
				</li>
				<li class="ico8">
					<a href="https://www.dangjin.go.kr/gyeyak" target="_blank" title="새창열림">계약정보공개시스템</a>
				</li>
				<li class="ico9">
					<a href="http://www.dangjin.go.kr/woman.do" target="_blank" title="새창열림">여성의전당</a>
				</li>
			</ul>
			<div class="conbox">
				<div class="listbox">
					<ul class="">
						<li><a href="https://www.dangjin.go.kr/lib.do" target="_blank" title="새창">시립도서관</a></li>
						<li><a href="https://www.dangjin.go.kr/port.do" target="_blank" title="새창">당진항서부두관리사업소</a></li>
						<li><a href="https://www.dangjin.go.kr/health.do" target="_blank" title="새창">보건소</a></li>
						<li><a href="https://www.dangjin.go.kr/atc.do" target="_blank" title="새창">농업기술센터</a></li>
					</ul>
				</div>
				<!-- //.listbox -->

				<div class="listbox">
					<ul class="">
						<li><a href="http://www.dangjinvc.co.kr/" target="_blank" title="새창">자원봉사센터</a></li>
						<li><a href="https://dangjinfc.familynet.or.kr/index.jsp" target="_blank" title="새창">건강가정지원센터</a></li>
						<li><a href="https://www.dreamstart.go.kr/dang/index.asp" target="_blank" title="새창">드림스타트</a></li>
						<li><a href="https://www.dangjin.go.kr/dj1388/sub01_01_01.do" target="_blank" title="새창">청소년상담복지센터</a></li>
					</ul>
				</div>
				<!-- //.listbox -->

				<div class="listbox">
					<ul class="">
						<li><a href="https://www.dangjin.go.kr/dj1388/sub03_00.do" target="_blank" title="새창">당진청소년문화의집</a></li>
						<li><a href="https://www.dangjin.go.kr/dj1388/sub04_00.do" target="_blank" title="새창">합덕청소년문화의집</a></li>
						<li><a href="http://www.dangjin.go.kr/job.do" target="_blank" title="새창">일자리종합지원센터</a></li>
						<li><a href="http://cn.gumjungstudy.com/" target="_blank" title="새창">사이버검정고시학습센터</a></li>
					</ul>
				</div>
				<!-- //.listbox -->

				<div class="listbox">
					<ul class="">
						<li><a href="http://www.dangjin.go.kr/lll.do" target="_blank" title="새창">평생학습포털</a></li>
						<li><a href="https://www.dangjin.go.kr/welfare.do" target="_blank" title="새창">당진근로자종합복지관</a></li>
						<li><a href="http://amrb.dangjin.go.kr/" target="_blank" title="새창">농기계임대서비스</a></li>
						<li><a href="https://www.dangjin.go.kr/saeil.do" target="_blank" title="새창">여성새로일하기센터</a></li>
					</ul>
				</div>
				<!-- //.listbox -->

				<div class="listbox">
					<ul class="">
						<li><a href="https://www.dangjin.go.kr/welfare/sub06_01.do" target="_blank" title="새창">노동상담소</a></li>
						<li><a href="http://www.dangjin.go.kr/cs/sub02_01_01.do" target="_blank" title="새창">교육문화스포츠센터</a></li>
						<li><a href="http://xn--ok1b150bsqb58t4nb.xn--3e0b707e/" target="_blank" title="새창">당진장학회</a></li>
						<li><a href="https://www.dangjin.go.kr/narae.do" target="_blank" title="새창">당진청년센터 나래</a></li>
					</ul>
				</div>
				<!-- //.listbox -->
			</div>

		  </div>
		</div>
		<!-- //Modal document -->

		<!-- Link to open the modal -->
		<div class="sitebox"><a href="#ex1" rel="modal:open"><span>패밀리사이트</span></a></div>
		<script src="/js/common/jquery.modal.js"></script>
		<script>
			$('.sitebox a').click(function(event) {
			  $(this).modal({
				fadeDuration: 250
			  });
			  $(this).addClass('current');
			  return false;
			});

		</script>
		<link rel="stylesheet" type="text/css" href="/css/${siteCode}/jquery.modal.css">

		<!-- sitebox Modal :e -->

	
		</div>
      </section>
    

	  <footer id="footer">
		 <h1 class="skip">추가정보</h1>
		 <div class="layout">
			<div class="etc">
				<span class="call">당진시 민원콜센터 <b>1522-3113</b> </span>
			</div>
			<div class="finfo">
				<div class="footer_menu">
					<ul>
						 <li class="privacy"><a href="/kor/sitemap_13_01.do" target="_blank" title="새창으로 이동">개인정보처리방침</a></li>
						 <li><a href="/kor/sitemap_16.do" target="_blank" title="새창으로 이동">저작권보호정책</a></li>
						<li><a href="https://www.mois.go.kr/frt/sub/popup/p_taegugki_banner/screen.do" target="_blank" title="새창열림">국가상징알아보기</a></li>                
						<li><a href="/gonet/FileDownload.do?fileName=Phone_2017.pdf&code=download" title="다운로드">행정전화번호부</a></li>
						 <li><a href="/kor/sub04_09.do" target="_blank" title="새창으로 이동">오시는길</a></li>
						
					</ul>
				</div>
		 
				<address class="pc">
					<div class="addr">[31773] 충청남도 당진시 시청1로 1 (수청동 1002번지)<br><span class="tel"><strong>TEL</strong> : 1522-3113</span><span class="tel"><strong>FAX</strong>  : (041) 350-3699</span></div>
				</address>
				<p class="copy">COPYRIGHT ⓒ 2020. DANGJINCITY. ALL RIGHTS RESEVED.</p>
			</div>
			
			
			<p class="mark"><a href="http://www.webwatch.or.kr/Situation/WA_Situation.html?MenuCD=110" title="국가 공인 인증기관 : 웹와치" target="blank"><img src="/images/kor/new_common/wa_mk.jpg" alt="과학기술정보통신부 WEB ACCESSIBILITY 마크(웹 접근성 품질인증 마크)"></a></p>

			
					
			
				
				
			

			<div id="relationSelect">
				<h2 class="hide">관련기관</h2>
				<div>
					<div>
						<a href="#none" class="open">공사/유관기관</a>
						<ul class="obj">
							<li><a href="http://sacvc.kcva.or.kr" target="_blank" title="서산지역범죄피해자지원센터,새창으로 이동합니다.">서산지역범죄피해자지원센터</a></li>
							<li><a href="http://www.dpto.or.kr/" target="_blank" title="당진항만관광공사,새창으로 이동합니다.">당진항만관광공사</a></li>
							<li><a href="http://cn.nec.go.kr/cn/cndangjin/sub1.jsp" target="_blank" title="당진시선거관리위원회,새창으로 이동합니다.">당진시선거관리위원회</a></li>
							<li><a href="http://www.cnpolice.go.kr/SEO/DJ/" target="_blank" title="당진경찰서,새창으로 이동합니다.">당진경찰서</a></li>
							<li><a href="http://www.cn119.go.kr/dangjin/index.cn119" target="_blank" title="당진소방서,새창으로 이동합니다.">당진소방서</a></li>
							<li><a href="http://www.koreapost.go.kr/cc/343/" target="_blank" title="당진우체국,새창으로 이동합니다.">당진우체국</a></li>
							<li><a href="http://www.cndje.go.kr/" target="_blank" title="당진교육지원청,새창으로 이동합니다.">당진교육지원청</a></li>
							<li><a href="http://www.shinsung.ac.kr/" target="_blank" title="신성대학교,새창으로 이동합니다.">신성대학교</a></li>
							<li><a href="http://www.sehan.ac.kr/" target="_blank" title="세한대학교,새창으로 이동합니다.">세한대학교</a></li>
							<li><a href="http://www.hoseo.ac.kr/intro.jsp" target="_blank" title="호서대학교,새창으로 이동합니다.">호서대학교</a></li>
							<li><a href="http://dangjincci.korcham.net" target="_blank" title="당진상공회의소,새창으로 이동합니다.">당진상공회의소</a></li>
							<li><a href="http://djlc.co.kr/" target="_blank" title="당진축산업협동조합,새창으로 이동합니다.">당진축산업협동조합 </a></li>
							<li><a href="http://d.nts.go.kr/menu/intro/intro.asp?tax_code=311#map" target="_blank" title="예산세무서당진지서,새창으로 이동합니다.">예산세무서당진지서</a></li>
							<li><a href="http://www.nps.or.kr/jsppage/hqCenter/hq/jisa1.jsp?areaCd=111B&amp;jisaCd=5112" target="_blank" title="국민연금공단홍성지사,새창으로 이동합니다.">국민연금공단홍성지사</a></li>
							<li><a href="http://www.nhic.or.kr/static/html/wbd/i/e/wbdie0101.html" target="_blank" title="국민건강보험공단[대전지역본부],새창으로 이동합니다.">국민건강보험공단[대전지역본부]</a></li>
							<li><a href="https://ciuc.or.kr" target="_blank" title="충남산학융합원,새창으로 이동합니다.">충남산학융합원</a></li>
						</ul>
					</div>
					
				</div>
			</div>

			<script>
				$(window).resize(function(){
					windowWidth = $(window).width()
				}).resize();

				$("#relationSelect>div>div").click(function(){
					$(this).siblings().children('ul').slideUp();
					$(this).children('ul').slideToggle();
				});
			</script>








		 </div>
		 
		 </footer>

	  



<script>
	$(function(){
		setTimeout(function(){
			$('#slider_banner .grap .obj').slick({
				//infinite: true,
				prevArrow: $('#slider_banner .body_wrap .control .prev'),
				nextArrow: $('#slider_banner .body_wrap .control .next'),
				 infinite: false,
				  speed: 300,
				  slidesToShow: 4,
				  slidesToScroll: 1,
				  variableWidth : true, //width 가변폭
			});
			$('#slider_banner .control .act').click(function(){
				$(this).css('display','none').siblings('.act').css('display','inline-block');
				($(this).hasClass('stop')) ? $('#slider_banner .grap .obj').slick('slickPause') : $('#slider_banner .grap .obj').slick('slickPlay');
				
					
			});
		}, 500);
	});
	
</script>



<!-- slick  -->

<script src="/js/${siteCode}/slick.js"></script> 

<script type="text/javascript">
   $ ( window ). on ( ' resize orientationchange ' , function () {
   $ ( '.autoplay' ). slick ( ' resize ' );
	});
  $(document).ready(function(){
	$('.autoplay').slick({
	  slidesToShow: 9,
	  slidesToScroll: 1,
	  autoplay: true,
	  autoplaySpeed: 4000,
	  arrows:true,
	  prevArrow: $('.ctrl .mvis_prev'),
	  nextArrow: $('.ctrl .mvis_next'),
	  responsive: [
		{
		  breakpoint: 1280,
		  settings: {
			slidesToShow: 8,
			slidesToScroll: 3,
			infinite: true,
			dots: false
		  }
		},
		{
		  breakpoint: 1024,
		  settings: {
			slidesToShow: 6,
			slidesToScroll: 2
		  }
		},
		{
		  breakpoint: 768,
		  settings: {
			slidesToShow: 4,
			slidesToScroll: 2
		  }
		},
		{
		  breakpoint: 600,
		  settings: {
			slidesToShow: 3,
			slidesToScroll: 1
		  }
		}
	   ]

	});

	$('.ctrl .mvis_ctr').click(function(){
		$(this).css({display: 'none'}).siblings('.ctrl .mvis_ctr').css({display: 'inline-block'});
		if ($(this).hasClass('mvis_stop')) {
			tar.slick('slickPause');
		} else {
			tar.slick('slickPlay');
		};
	});

	
});
</script>

<script type="text/javascript">
  $(document).ready(function(){
	$('.autoplay1').slick({
	  slidesToShow: 5,
	  slidesToScroll: 1,
	  centerPadding: '40px',
	  autoplay: false,
	  autoplaySpeed: 4000,
	  arrows:true,
	  prevArrow: $('.ctrl1 .mvis_prev'),
	  nextArrow: $('.ctrl1 .mvis_next'),
	  dots: true,
	  responsive: [
		 {
		  breakpoint: 1400,
		  settings: {
			slidesToShow: 4,
			infinite: true
		  }
		},
		{
		  breakpoint: 1280,
		  settings: {
			slidesToShow: 3,
			infinite: true

		  }
		},
		{
		  breakpoint: 900,
		  settings: {
			slidesToShow: 2,
			infinite: true
		  }
		},
		{
		  breakpoint: 600,
		  settings: {
			slidesToShow: 1
		  }
		}
		// You can unslick at a given breakpoint now by adding:
		// settings: "unslick"
		// instead of a settings object
	  ]

	});
	$('.ctrl1 .mvis_ctr').click(function(){
		$(this).css({display: 'none'}).siblings('.ctrl1 .mvis_ctr').css({display: 'inline-block'});
		if ($(this).hasClass('mvis_stop')) {
			tar.slick('slickPause');
		} else {
			tar.slick('slickPlay');
		};
	});

	
		
});
</script>
<script type="text/javascript">
  $(document).ready(function(){
	$('.autoplay2').slick({
	  slidesToShow: 10,
	  slidesToScroll: 1,
	  autoplay: false,
	  autoplaySpeed: 4000,
	  arrows:true,
	  prevArrow: $('.ctrl2 .mvis_prev'),
	  nextArrow: $('.ctrl2 .mvis_next'),
	  dots: false,
	  responsive: [
		{
		  breakpoint: 1280,
		  settings: {
			slidesToShow: 7,
			infinite: true,
			dots: false
		  }
		},
		{
		  breakpoint: 768,
		  settings: {
			slidesToShow: 6
		  }
		},
		{
		  breakpoint: 600,
		  settings: {
			slidesToShow: 4
		  }
		}
		// You can unslick at a given breakpoint now by adding:
		// settings: "unslick"
		// instead of a settings object
	  ]

	});
	$('.ctrl2 .mvis_ctr').click(function(){
		$(this).css({display: 'none'}).siblings('.ctrl2 .mvis_ctr').css({display: 'inline-block'});
		if ($(this).hasClass('mvis_stop')) {
			tar.slick('slickPause');
		} else {
			tar.slick('slickPlay');
		};
	});

	
		
});
</script>
<!-- slick  -->











	
<script>
	var isInfoShow = true;
	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		
		if (scroll > 750){
			$("#controlTab").addClass("fix");
			// 좌오 스크롤 안내 표시
			if(isInfoShow){
				isInfoShow = false;
				$('#conB>#container>span.slideGuide').show().css("opacity",0);
				$('#conB>#container>span.slideGuide').animate({opacity:1},800,function(){
					setTimeout(function(){
						$('#conB>#container>span.slideGuide').animate({opacity:0},700,function(){
							$('#conB>#container>span.slideGuide').hide();
						});
					},1000);
				});
			}
		} else { 
			$("#controlTab").removeClass("fix"); 
			// 좌오 스크롤 안내 가림
			$('#conB>#container>span.slideGuide').hide();
			isInfoShow = true;
		}
		
		// 모바일 스크롤시 검색창 닫힘
		try{
			if($(window).outerWidth(true)<=640){
				$(".inc_search>div").slideUp();
				$(".inc_search>h2>a").removeClass('close');
			}
		}catch(e){}
	});

	//$(".off div.box .con1>div").css('left','100%');
	//$(".on div.box .con1>div").animate({left:'0'});
</script>

<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
		<script type="text/javascript">
		if(!wcs_add) var wcs_add = {};
		wcs_add["wa"] = "718545b144fb7c";
		if(window.wcs) {
		  wcs_do();
		}
	</script>

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
	if('2020040400' <= today && today <= '2020041518' ) {
		if ( getCookie( "elect0531" ) != "done" ){
	        window.open("/html/popup/elect/", '선거인명부', "width=374, height=400, menubar=no, status=no");
		}else{
	         
		}
	}
</script>

${analytics}
	</div>
   </body>
</html>
