<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
		<html lang="ko">
		<head>
		<meta charset="utf-8">
			



		<title>게시판 이용 주의사항</title>

		<link rel="shortcut icon" type="image/x-icon" href="/images/common/favicon.ico">
		<link rel="apple-touch-icon-precomposed" href="/images/common/favicon_152.png">
		<link rel="stylesheet" type="text/css" href="/css/common/font-awesome.min.css">

		<link rel="stylesheet" type="text/css" href="/css/common/common.css">
		<link rel="stylesheet" type="text/css" href="/css/common/cmpt.css">
		<link rel="stylesheet" type="text/css" href="/css/common/prog.css">
		<link rel="stylesheet" type="text/css" href="/css/common/ui.css">
		<link rel="stylesheet" type="text/css" href="/css/common/sitemap.css">
		<link rel="stylesheet" type="text/css" href="/css/common/layout.css">
		<link rel="stylesheet" type="text/css" href="/css/kor/layout.css">
		<link rel="stylesheet" type="text/css" href="/css/kor/respond.css">

		<link rel="stylesheet" type="text/css" href="/css/common/content.css">

		<link rel="stylesheet" type="text/css" href="/css/kor/content2.css">
		<link rel="stylesheet" type="text/css" href="/css/kor/content.css">
		<link rel="stylesheet" type="text/css" href="/css/kor/prog2.css">
		<link rel="stylesheet" type="text/css" href="/css/kor/prog.css">


		<script type="text/javascript" src="/js/common/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="/js/common/jquery-ui.min.js"></script>

		<link rel="stylesheet" type="text/css" href="/css/flexcroll/flexcrollstyles.css" />
		<script type="text/javascript" src="/js/flexcroll/flexcroll.js"></script>
		
		<script type="text/javascript" src="/js/common/script.js"></script>
		
		<script type="text/javascript" src="/js/common/commonUtil.js"></script>

		<script type="text/javascript" src="/js/common/common-scroll.js"></script>
		<script type="text/javascript" src="/js/common/common-popup.js"></script>
		<script type="text/javascript" src="/js/common/unitySearch.js"></script>
		<script type="text/javascript" src="/js/print/jquery.PrintArea.js"></script>
		<script type="text/javascript" src="/js/kor/content.js"></script>
		<script type="text/javascript" src="/js/common/webfont.js"></script>
		<script type="text/javascript">
			WebFont.load({
				custom:{
				families: ['ntk','nsr'],
				urls: ['/css/common/font.css']
				}
			});
		</script>

		<!--[if lt IE 9]>
		<script type="text/javascript" src="/js/common/html5.js"></script>
		<![endif]-->

			
		<script type="text/javascript" src="/js/common/paginate.js"></script>
		<script type="text/javascript">
		//페이지목록 수 :  10
		//페이지 갯수 : 10
		//현재 페이지번호  : 1
		//총갯수 :  8238
		$(document).ready(function(){
		var a = "10";
		var mode = "list";
		if(mode == "list"){
		if(a != ""){
		paginate('10','10','8238','1');
		}
		}
		});
		</script>
			
		<link rel="stylesheet" type="text/css" href="/css/egovframework/com/cop/bbs/board_basic.css" media="all" />
		<script type="text/javascript" src="/js/egovframework/com/cop/bbs/EgovBBSMng.js"></script>

			

		<script type="text/javascript">
		$(function(){

		function _in(event){
		$("#content").printArea({
		popWd:$(window).width(),
		popHt:$(window).height(),
		mode:"popup",
		popClose:true,
		extraCss:"/css/kor/print.css",
		retainAttr:["id","class"],
		extraHead:"<meta charset=\"utf-8\"><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">"
		});

		event.preventDefault();
		}

		$("#print").on("click",_in);

		});
		</script>
		</head>

<body>
<!--레이어팝업_20170309_s-->
<div id='popup_content' name='popup_content'></div>
     <script>
          var center = (screen.width - 400)/2;
          var middle = (screen.height - 415)/2;
     </script>


<div id='temp4' name='temp4'>
      <div class="pop_bg">
           <div class='pop_con_box'>                
<div>
<!-- <h2>통보 없이 삭제되거나 이동될 수 있는 경우</h2> -->
<div class="ui uit type2 bgw">
    <div class="inner">
        <!-- <h4 class="tit_inner"></h4> -->
		<ul>
			<li><span class="num num-default">01</span>국가안전이나 보안에 위배되는 경우</li>
			<li><span class="num num-default">02</span>선거와 관련한 내용, 정치적 목적이나 성향이 있는 경우</li>
			<li><span class="num num-default">03</span>특정기관, 단체, 부서를 근거 없이 비난하는 경우</li>
			<li><span class="num num-default">04</span>특정인을 비방하거나 명예훼손의 우려가 있는 경우</li>
			<li><span class="num num-default">05</span>영리목적의 상업성 광고, 저작권을 침해할 수 있는 내용</li>
			<li><span class="num num-default">06</span>욕설, 음란물 등 불건전한 내용</li>
			<li><span class="num num-default">07</span>실명을 원칙으로 하는 경우에 실명을 사용하지 않았거나 실명이 아닌 것으로 판단되었을 경우</li>
			<li><span class="num num-default">08</span>동일인 또는 동일인이라고 인정되는 자가 똑같은 내용을 주 2회 이상 게시하거나, 비슷한 내용을 1일 2회 이상 게시하는 경우</li>
			<li><span class="num num-default">09</span>연습성, 오류, 장난성의 내용</li>
			<li><span class="num num-default">010</span>기타 관계법령에 위배된다고 판단되는 경우
				<ul class="list_2st">
					<li>등록된 게시물로 인한 문제 발생 시 당진시는 책임을 지지 않으며, 게시자가 민형사상의 모든 책임을 져야 합니다.</li>
					<li>홈페이지를 통하여 불법유해 정보를 게시하거나 배포할 경우, 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 민·형사상의 책임을 질수 있습니다.</li>
				</ul>
			</li>
		</ul>
    </div>
</div>

            </div>
      </div>
      <div class="pop_bt_bg">
           <div class='pop_close'><a href='javascript:;' onclick="closeWin();"><img src='/images/common/pop_close.gif' alt='닫기' border='0' /></a></div>
      </div>
</div>     
<script type="text/javascript">
     function closeWin(){
		  self.close();
		}
</script>
<!--레이어팝업_20170309_e-->

</div>
</body>
</html>
