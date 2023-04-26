<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.SimpleDateFormat"%>
<script type="text/javascript" src="/onepass/js/onepass-client-1.0.0.js"></script>
<%
	Calendar today = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	String day = sdf.format(today.getTime());

	java.util.Random ran = new Random();
	
	int numLength = 6;
	String randomStr = "";

	for (int i = 0; i < numLength; i++) {
		randomStr += ran.nextInt(10);
	}

	String reqNum = day + randomStr;
	String certDate = day;

	String returnUrl = "";

	returnUrl = (String) session.getAttribute("returnUrl");

	if ("".equals(returnUrl) || null == returnUrl) {
		String siteCode = (String) request.getAttribute("siteCode");
		returnUrl = "/" + siteCode + ".do";
	}

	String id = "SDNJ001"; // 본인실명확인 회원사 아이디  SCYG001
	String srvNo = "005004"; // 본인실명확인 서비스번호

	String exVar = "0000000000000000"; // 복호화용 임시필드
	String retUrl = "32https://www.dangjin.go.kr/real/result_seed.jsp"; // 본인실명확인 결과수신 URL
	String certGb = "H"; // 본인실명확인 본인확인 인증수단
	String addVar = returnUrl; // 본인실명확인 추가 파라메터
	String host = "https://www.dangjin.go.kr";
	
	session.setAttribute("reqNum", reqNum);
	com.sci.v2.pcc.secu.SciSecuManager seed = new com.sci.v2.pcc.secu.SciSecuManager();

	String encStr = "";
	String reqInfo = id + "^" + srvNo + "^" + reqNum + "^" + certDate + "^" + certGb + "^" + addVar + "^"
			+ exVar;
	encStr = seed.getEncPublic(reqInfo);

	com.sci.v2.pcc.secu.hmac.SciHmac hmac = new com.sci.v2.pcc.secu.hmac.SciHmac();
	String hmacMsg = hmac.HMacEncriptPublic(encStr);

	reqInfo = seed.getEncPublic(encStr + "^" + hmacMsg + "^" + "0000000000000000"); //2차암호화
%>

<%
	String id2 = "DNJ003";
	String reqNum2 = "";
	String retUrl2 = "23http://www.dangjin.go.kr/siren24/ipin_result_seed.jsp";
	String srvNo2 = "002001";
	String exVar2 = "0000000000000000"; // 복호화용 임시필드
	String verSion2 = "2";

	Calendar today2 = Calendar.getInstance();
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
	String day2 = sdf2.format(today2.getTime());

	java.util.Random ran2 = new Random();
	//랜덤 문자 길이
	int numLength2 = 6;
	String randomStr2 = "";

	for (int i = 0; i < numLength2; i++) {
		//0 ~ 9 랜덤 숫자 생성
		randomStr2 += ran2.nextInt(10);
	}

	//reqNum은 최대 40byte 까지 사용 가능
	reqNum2 = day2 + randomStr2;

	// 암호화 모듈 선언

	com.sci.v2.ipinv2.secu.SciSecuManager seed2 = new com.sci.v2.ipinv2.secu.SciSecuManager();

	seed2.setInfoPublic(id2, "EF7A55395C88B04EF28858FB37B6C4AB");

	String encStr2 = "";
	String reqInfo2 = reqNum2 + "/" + id2 + "/" + srvNo2 + "/" + exVar2; // 데이터 암호화

	// 1차 암호화
	encStr2 = seed2.getEncPublic(reqInfo2);
	// 위변조 검증 값 등록
	String hmacMsg2 = seed2.getEncReq(encStr2, "HMAC");

	// 2차 암호화
	reqInfo2 = seed2.getEncPublic(encStr2 + "/" + hmacMsg2 + "/" + "00000000"); //2차암호화

	session.setAttribute("reqNum2", reqNum2);
	session.setAttribute("encReqNum", seed2.getEncPublic(seed2.getEncReq(reqNum2, "HMAC")));

	//암호화키 값을 위한 아이디
	reqInfo2 = seed2.EncPublic(reqInfo2 + "/" + id2 + "/" + "00000000");
%>
<%
Set pathSet = request.getSession().getServletContext().getResourcePaths("/");
%>
<script type="text/javascript" language="javascript">

	var PCC_window;

	function openPCCWindow() {
			
		if (!$("#agreeYn").is(":checked")) {
			alert("개인정보 수집동의에 동의하셔야 서비스를 이용하실 수 있습니다.");
			$("#agreeYn").focus();
			return false;
		}
		if (!$("#agreeYn2").is(":checked")) {
			alert("제 3자 제공에 동의하셔야 서비스를 이용하실 수 있습니다.");
			$("#agreeYn2").focus();
			return false;
		}
		
		if($("input[name=child_nm1]").length > 0){
	  		if($("input[name=child_nm1]").val() == ""){
	  			alert("14세 미만 아동 이름을 입력하세요.");
	  			$("input[name=child_nm1]").focus();
	  		}
	  		return false;
	  	}

		var PCC_window = window
				.open('',
					  'PCCV3Window',
					  'width=430, height=560, resizable=1, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200');

		if (PCC_window == null) {
			alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
		}

		document.reqPCCForm.action = 'https://pcc.siren24.com/pcc_V3/jsp/pcc_V3_j10.jsp';
		document.reqPCCForm.target = 'PCCV3Window';
		document.reqPCCForm.submit();
		return true;
	}

</script>

<script>
	var CBA_window;

	function openCBAWindow() {
		
		if (!$("#agreeYn").is(":checked")) {
			alert("개인정보 수집동의에 동의하셔야 서비스를 이용하실 수 있습니다.");
			$("#agreeYn").focus();
			return false;
		}
		if (!$("#agreeYn2").is(":checked")) {
			alert("제 3자 제공에 동의하셔야 서비스를 이용하실 수 있습니다.");
			$("#agreeYn2").focus();
			return false;
		}
		
		if($("input[name=child_nm2]").length > 0){
	  		if($("input[name=child_nm2]").val() == ""){
	  			alert("14세 미만 아동 이름을 입력하세요.");
	  			$("input[name=child_nm2]").focus();
	  		}
	  		return false;
	  	}

		CBA_window = window
				.open(
						'',
						'IPINWindow',
						'width=450, height=500, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200');

		if (CBA_window == null) {
			alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n 화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
		}

		document.reqCBAForm.action = 'https://ipin.siren24.com/i-PIN/jsp/ipin_j10.jsp';
		document.reqCBAForm.target = 'IPINWindow';
		document.reqCBAForm.submit();
		return true;
	}
</script>

<script type="text/javascript" language="javascript">
	$(function(){
		$("#certifiedChild").click(function(){
			if($(this).is(":checked") == true){
				$(".childNm1").empty();
				$(".childNm2").empty();
				$(".childNm3").empty();
				
				$(".childNm1").append("<p class='color-orange mt_10'><b>14세 미만 본인 인증 시 법정대리인의 디지털원패스로 인증 바랍니다.</b></p>");
				$(".childNm1").append("<p class='btn_l' style='display: block;'><label for='childNm1' class='flow' style='position: absolute; visibility: visible;'></label><input name='child_nm1' type='text' id='childNm1' class='input_blue' value='' placeholder='14세 미만 아동 이름'></p>");
				
				$(".childNm2").append("<p class='color-orange mt_10'><b>14세 미만 본인 인증 시 법정대리인의 휴대폰으로 인증 바랍니다.</b></p>");
				$(".childNm2").append("<p class='btn_l' style='display: block;'><label for='childNm2' class='flow' style='position: absolute; visibility: visible;'></label><input name='child_nm2' type='text' id='childNm2' class='input_blue' value='' placeholder='14세 미만 아동 이름'></p>");
				
				$(".childNm3").append("<p class='color-orange mt_10'><b>14세 미만 본인 인증 시 법정대리인의 I-PIN으로 인증 바랍니다.</b></p>");
				$(".childNm3").append("<p class='btn_l' style='display: block;'><label for='childNm3' class='flow' style='position: absolute; visibility: visible;'></label><input name='child_nm3' type='text' id='childNm3' class='input_blue' value='' placeholder='14세 미만 아동 이름'></p>");

			}else{  
				$(".childNm1").empty();
				$(".childNm2").empty();
				$(".childNm3").empty();
				
				$(".childNm1").append("<p class='color-orange mt_10'><b>14세 미만 본인 인증 시 법정대리인의 I-PIN으로 인증 바랍니다.</b></p>");
				$(".childNm2").append("<p class='color-orange mt_10'><b>14세 미만 본인 인증 시 법정대리인의 I-PIN으로 인증 바랍니다.</b></p>");
				$(".childNm3").append("<p class='color-orange mt_10'><b>14세 미만 본인 인증 시 법정대리인의 I-PIN으로 인증 바랍니다.</b></p>");
			}
		});
	});
</script>
				
<script type="text/javascript">    
  
  var onepass;
  function onepassClientLoad() {
	   
	  	if (!$("#agreeYn").is(":checked")) {
			alert("개인정보 수집동의에 동의하셔야 서비스를 이용하실 수 있습니다.");
			$("#agreeYn").focus();
			return false;
		}
		if (!$("#agreeYn2").is(":checked")) {
			alert("제 3자 제공에 동의하셔야 서비스를 이용하실 수 있습니다.");
			$("#agreeYn2").focus();
			return false;
		}
		
		if($("input[name=child_nm3]").length > 0){
	  		if($("input[name=child_nm3]").val() == ""){
	  			alert("14세 미만 아동 이름을 입력하세요.");
	  			$("input[name=child_nm3]").focus();
	  			return false;
	  		}
	  	}
		
		onepass = new OnepassClientUtil();
		onepass.idpUrl = 'http://saml.egaf2017.com';
		if($("input[name=child_nm3]").val() == ""){
			onepass.intfUrl.loginout = "/onepass/loginout.jsp?url="+$("input[name=returnUrl]").val();	
		}else{
			onepass.intfUrl.loginout = "/onepass/loginout.jsp?url="+$("input[name=returnUrl]").val()+"&child_nm3="
					+$("input[name=child_nm3]").val();	
		}
		onepass.onepassLogin();
	  }
  
 </script>  



<form name="reqPCCForm" method="post" onsubmit="return openPCCWindow()">
	<input type="hidden" name="reqInfo" value="<%=reqInfo%>"> <input
		type="hidden" name="retUrl" value="<%=retUrl%>"> <input
		type="hidden" name="child_nm1" value="">
</form>


<form name="reqCBAForm" method="post" onsubmit="return openCBAWindow()">
	<input type="hidden" name="reqInfo" value="<%=reqInfo2%>"> <input
		type="hidden" name="retUrl" value="<%=retUrl2%>"> <input
		type="hidden" name="returnUrl" value="<%=returnUrl%>"> <input
		type="hidden" name="verSion" value="2"> <input type="hidden"
		name="child_nm2" value="">
</form>

<div class="uit3">
	<div class="inner_normal icowrap">
		<span class="ico ico5"></span> <strong>본인인증서비스</strong>
		<p class="color-orange mb_10">
			휴대폰인증 본인확인 서비스 및 I-PIN 인증 페이지입니다. <br>원하시는 인증방법을 선택하세요
		</p>
		<p>14세 미만 아동 이용자는 정보통신망법 제31조, 개인정보보호법 제22조에 의거 법정대리인의 동의가
			필요합니다.14세 미만 아동 및 법적대리인 정보가 허위이거나, 부정 사용됨에 따라 발생한 손해 등에 대한 모든 책임은
			이용자에게 있으며, 당진시는 책임을 지지 않습니다.</p>

		<p class="mt_20">
			<input type="checkbox" id="certifiedChild" value="Y"/>
			<label for="checkbox">만 14세 미만 시민 인증하기</label>
		</p>
	</div>
</div>

<h2>개인정보 수집 및 이용안내</h2>
<div class="holds-terms">
	<div class="terms-content" tabindex="0">
		<p>당진시 홈페이지는 게시판 등, 기타 서비스를 이용하시고자 할 경우에 필요한 최소한의 개인정보를 수집하며, 이에
			대한 동의를 얻고 있습니다.</p>
		<div class="ui-box mt_20">
			<p class="txt-tip txt-small">
				<i class="fa fa-fw fa-exclamation-circle"></i>이 개인정보 수집동의를 거부 하실 수
				있으며, 필수항목 입력 거부 시 본인확인서비스가 제한됩니다. 작성 된 개인정보는 공개되지 않으며 수집목적 이외의 목적으로
				사용하지 않습니다.
			</p>
		</div>
		<h3>수집하는 개인정보 항목</h3>
		<ul class="list_1st m_0">
			<li>필수항목 : <span class="red">이름, 생년월일, 성별, 휴대폰번호</span></li>
			<li>14미만 아동 법적대리인 정보 :<span class="red">이름, 생년월일, 성별,
					휴대폰번호</span></li>
			<li>컴퓨터에 의해 자동 수집되는 항목 : <span class="red">접속IP정보, 서비스
					이용기록, 접속로그등</span></li>
		</ul>
		<h3>개인정보의 수집 및 이용목적</h3>
		<p>서비스 이용을 위한 본인 확인, 각종 게시판 글쓰기, 민원처리, 각종통계, 행사안내, 설문조사, 정보제공메일 송신
			등 목적을 위해 활용됩니다.</p>
		<h3>개인정보의 보유 및 이용기간</h3>
		<ul class="list_1st m_0">
			<li>개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기 합니다.</li>
			<li>각종 게시판 이용자정보 보유기간은 사용자 본인 작성게시물 삭제시까지이며, 삭제시 보유하고 있는 개인정보는
				지체 없이 파기합니다.</li>
		</ul>
		<p class="txtp mt_40">당진시가 운영하는 여러 웹페이지에 포함된 링크 또는 배너를 클릭하여 다른 사이트
			또는 웹페이지로 옮겨갈 경우 개인정보보호방침은 그 사이트 운영기관이 게시한 방침이 적용됨으로 새로 방문한 사이트의 방침을
			확인하시기 바랍니다.</p>
		<p class="txtp">당진시가 운영하는 웹사이트에서 식별할 수 있는 개인정보를 취득하여서는 아니 됩니다. 부정한
			방법으로 이러한 개인정보를 열람 또는 제공받은 자는 관련 규정에 의하여 처벌 받을 수 있습니다.</p>

		<div class="btn_wrap center">
			<a class="btn btn-ani btn-line large white"
				href="/kor/sitemap_13_01.do" target="_blank" title="새창이동"
				tabindex="0"> 개인정보처리방침확인<span class="bico bticon home"></span></a>
		</div>
	</div>
	<p class="right mt_5">
		<input type="checkbox" id="agreeYn" name="agreeYn" value="Y"
			tabindex="0" /> <label for="agreeYn" class="h-item">개인정보 수집에
			동의합니다.</label>
	</p>
</div>
<h2>개인정보 수집 목적 내 제 3자제공</h2>
<div class="holds-terms mb_50">
	<div class="terms-content" tabindex="0">
		<p>당진시 홈페이지에서는 회원 서비스 제공을 위해 필요한 실명인증 및 I-PIN 인증 시에만 수집한 개인정보의 제3자
			제공을 하고 있으며, 정보주체의 동의 없이는 제공되지 않습니다.</p>

		<table class="tbl_basic center mt_10">
			<caption>
				<strong>개인정보 수집 목적 내 제 3자제공</strong>
				<details> 제공 받는 자, 제공받는 자의 개인정보 이용 목적, 제공하는 개인정보의 항목, 제공받는
					자의 개인정보 보유 및 이용 기간, 서울 신용 평가정보(주), SCI평가정보를 포함하는 표
				</details>
			</caption>
			<colgroup>
				<col style="width: 16%;">
				<col style="width: 20%;">
				<col>
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>제공 받는 자</th>
					<th>제공받는 자의 개인정보 이용 목적</th>
					<th>제공하는 개인정보의 항목</th>
					<th>제공받는 자의 개인정보 보유 및 이용 기간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>서울 신용 평가정보(주)</th>
					<td>본인확인 인증</td>
					<td>이름, 성별, 생년월일, 휴대폰번호, 14세 미만 아동의 법정대리인의 정보</td>
					<td>이미 보유하고 있는 개인정보이므로 별도 저장하지 않음</td>
				</tr>
				<tr>
					<th>SCI평가정보</th>
					<td>I-PIN 인증</td>
					<td>I-PIN(개인식별번호), 14세 미만 아동의 법정대리인 정보(I-PIN(개인식별번호))</td>
					<td>이미 보유하고 있는 개인정보이므로 별도 저장하지 않음</td>
				</tr>

			</tbody>
		</table>
		<p class="mt_20">정보주체는 개인정보의 제3자 제공 동의를 거부하실 수 있습니다. 다만 이 경우 서비스를
			이용할 수 없습니다.</p>
		<div class="ui-box mt_20">
			<p class="txt-tip txt-small">
				<i class="fa fa-fw fa-exclamation-circle"></i>단, 다음 중 어느 하나에 해당하는
				경우에는 정보주체 또는 제3자의 이익을 부당하게 침해할 우려가 있을 때를 제외하고는 개인정보를 목적 외의 용도로 이용하거나
				이를 제3자에게 제공할 수 있습니다.
			</p>
		</div>
		<ul class="list_1st">
			<li>정보주체로부터 별도의 동의를 받은 경우</li>
			<li>다른 법률에 특별한 규정이 있는 경우</li>
			<li>정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수
				없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우</li>
			<li>통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 개인정보를
				제공하는 경우</li>
			<li>개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게 제공하지 아니하면 다른 법률에서 정하는 소관 업무를
				수행할 수 없는 경우로서 보호위원회의 심의·의결을 거친 경우</li>
			<li>조약, 그 밖의 국제협정의 이행을 위하여 외국정부 또는 국제기구에 제공하기 위하여 필요한 경우</li>
			<li>범죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우</li>
			<li>법원의 재판업무 수행을 위하여 필요한 경우</li>
			<li>형(刑) 및 감호, 보호처분의 집행을 위하여 필요한 경우</li>
		</ul>

	</div>

	<p class="right mt_5">
		<input type="checkbox" id="agreeYn2" name="agreeYn2" value="Y"
			tabindex="0" /> <label for="agreeYn2" class="h-item">개인정보 수집
			목적 내 제3자 제공에 동의합니다. </label>
	</p>
</div>

<div class="join_cer">
	<div class="box">
		<div class="item">
			<span class="icon icon_onepass"></span> <strong class="ti">디지털원패스</strong>
			<div class="text_box">
				<p>하나의 아이디로 본인이 선택한 인증수단(휴대폰의 패턴, 지문‧안면인식 등)을 사용하여 안전하고, 편리하게 여러 전자정부 서비스를 이용할 수 있는 서비스입니다.</p>

				<div class="tipbox">
					<h3 class="m_0">디지털원패스는?</h3>
					<ul class="list_1st">
						<li>디지털원패스 홈페이지: <a target="_blank" title="새창"
							href="https://onepass.go.kr">https://onepass.go.kr</a></li>
						<li>이용문의 02-374-0980~1 (운영시간 : 평일, 9:00~18:00)</li>

					</ul>

				</div>
			</div>
			<div class="childNm3">
				<p class="color-orange mt_10">
					<b>14세 미만 본인 인증 시 법정대리인의 디지털원패스로 인증 바랍니다</b>
				</p>
			</div>
			<p class="center mt_20">
				<a href="#" id="onepassLogin" onclick="javascript:onepassClientLoad();return false;" class="btn btn-ani btn-blue" title="새창열림" tabindex="0">디지털원패스로
					로그인</a>
			</p>
		</div>
		</div>
		<div class="box">

			<div class="item">
				<span class="icon icon1"></span> <strong class="ti">휴대폰인증</strong>
				<div class="text_box">
					<p>휴대전화번호를 이용한 본인확인 서비스입니다. 2014년 08월 07일부터 개정되는 개인정보보호법에 따라
						주민등록번호를 이용한 실명인증 서비스를 중단하고, 휴대전화 번호로 본인임을 확인할 수 있는 휴대폰인증 서비스입니다.</p>

					<div class="tipbox">
						<h3 class="m_0">휴대폰 본인확인 서비스는?</h3>
						<ul class="list_1st">
							<li>서울신용평가정보(주) 홈페이지: <a target="_blank" title="새창"
								href="http://www.sci.co.kr/">http://www.sci.co.kr/</a></li>
							<li>서울신용평가정보(주) 고객센터 : 1577-1006</li>

						</ul>

					</div>
				</div>
				<div class="childNm1">
					<p class="color-orange mt_10">
						<b>14세 미만 본인 인증 시 법정대리인의 휴대폰으로 인증 바랍니다.</b>
					</p>
				</div>
				<p class="center mt_20">
					<a href="#" onclick="javascript:openPCCWindow();return false;"
						id="ipin" class="btn btn-ani btn-default" title="새창열림"
						tabindex="0">휴대폰인증 바로가기</a>
				</p>
			</div>
		</div>
		<div class="box">

			<div class="item">
				<span class="icon icon2"></span> <strong class="ti">I-PIN
					인증</strong>
				<div class="text_box">
					<p>아이핀(I-PIN)은 주민등록번호 대체수단으로 회원님의 주민등록번호 대신 식별id를 행정자치부로부터 발급받아
						본인확인을 하는 서비스입니다.</p>

					<div class="tipbox">
						<h3 class="m_0">I-PIN은 인증은?</h3>
						<ul class="list_1st">
							<li>I-PIN 홈페이지 : <a target="_blank" title="새창"
								href="https://www.siren24.com/mysiren/ipin/sir_e0101_01.jsp">https://www.siren24.com/</a></li>
							<li>SCI평가정보 : 1577-1006<br>(운영시간 : 평일 09시 ~ 18시)
							</li>
						</ul>
					</div>
				</div>
				<div class="childNm2">
				<p class="color-orange mt_10">
					<b>14세 미만 본인 인증 시 법정대리인의 I-PIN으로 인증 바랍니다.</b>
				</p>
				</div>
				<p class="center mt_20">
					<a href="#" onclick="javascript:openCBAWindow();return false;"
						id="gpin" class="btn btn-ani btn-danger" title="새창열림" tabindex="0">
						아이핀(I-PIN) 인증</a>
				</p>
				<!--<p class="center"><a href="#" onclick="javascript:alert('인증모듈을 서버에 세팅 중입니다. 지금은 이용하실 수 없습니다.');"  class="btn btn-ani btn-danger">아이핀(I-PIN) 인증</a></p>-->
			</div>
		</div>

	</div>