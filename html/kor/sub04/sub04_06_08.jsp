<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- <h2>PORT OF DANGJIN 대한민국과 세계를 연결합니다.</h2>

<div class="ui uilnk type3 mb_10">
	<div class="box_col col_list">
		<ul>
	        <li class="lnk_port">
	            <span class="lnk_box">
	                <b class="tit"><span>당진항 브로슈어 보기</span></b>
	                <a class="ui_icon radius" href="/synapsoft/FileViewerWithName.do?path=port&fileName=port.pdf" target="_blank" title="새창열림"><span class="ui_icon home">홈페이지 바로가기</span></a>
	            </span>
	        </li>
	    </ul>
	</div>
</div> -->
<h2>당진항 홍보 영상</h2>

<div id="introLayer">
	<div id="enterMovie"></div>
	<div id="videoSubtitle"></div>
	<div id="buttonGroup"></div>
	<div id="checktoday"></div>
</div>


<div id="mozipMenu" class="wrap_applic_pdf">

<h2>당진항 브로슈어</h2>
<div class="wrapper ">

	<div class="applic_left">
	<!--span style="padding:5px 10px;font-size:14px;background-color:#ef4030;color:#fff;font-weight:bold;">모집요강보기</span-->

			<!-- <div class="left_1th applic_list"> -->

					<!--
		     		후기 신입생 모집요강
		     		<h2><span>2017</span><em>후기 신입생 모집요강</em></h2>
					-->
						<!-- <h2><span>PORT OF DANGJIN</span><em>대한민국과 세계를 연결합니다.</em></h2>

			 </div>
				  

			
			<div class="left_2th applic_list">

				<a target="_blank" href="/js/common/pdf.js/web/viewer.html?file=/uloads_clone/download/kor/sub04/in04_06_08_A.pdf">
		     		당진항 브로슈어 보기
		     	</a>

			 </div> -->
				 
				  

	</div>
	<div class="frameBox applic_right">
			<!-- <form id="searchForm" name="searchForm" method="post" class="board_search" action="/prog/info/admission/sub02_01/general/list.do">
			<input type="hidden" name="pageUnit" value="1000">
			<input type="hidden" name="pageIndex" value="1">
			<input type="hidden" name="pageSize" value="10">
				<fieldset>
					<legend>PDF파일 검색</legend>
					<div class="applic_select">
						<div class="select_pdf">
							<select id="applicPdf" name="yearChasu">
								<option value="">- 선택해 주세요-</option>
						  		
								<option value="2017,0">2017학년도 전기 신입생 모집요강(일반전형)</option>
								
								<option value="2017,1" selected="selected">2017학년도 후기 일반전형 신입생 모집요강</option>
								
								<option value="2016,0">2016학년도 후기 신입생 모집요강(일반전형)</option>
								
							</select>
						</div>
						<div class="searchinput">
							<input type="submit" name="submitTy" value="검색" title="모집요강 PDF검색">
						</div>
					</div>
				</fieldset>
			</form> -->
			<div id="PDFviewerDiv">
			<iframe style="display:block;width:100%;height:100%;border:0;" id="pdf_file" name="pdf_file" title="PDF 파일보기" src="/js/common/pdf.js/web/viewer.html?file=/uloads_clone/download/kor/sub04/in04_06_08_A.pdf"></iframe>
			</div>
	</div>

</div>

</div>


<script type="text/template" id="template-video">
	<div id="introLayer">
        <div id="enterMovie">

           <!--  <a id="skipMovie" title="동영상 레이어를 닫기" onclick="$('#introLayer').fadeOut(300,function(){ $(this).remove(); }); $('html,body').removeClass('removeScroll');" href="#wrap">
                <div class="text"><span class="skip">Skip</span></div>
                <div class="arrow"></div>

            </a> -->

        </div>

		<div id="videoSubtitle">

		</div>



        <div id="buttonGroup">
			<!-- <div class="item global">
	            <a class="button1" href="#myLayer1">
	            	<span>
	            		<i>01. GLOBAL UST</i>
	            		글로벌 선도 국가연구소대학
	            	</span>
	            </a>
	            <div id="myLayer1" class="myLayer">
					<div class="icon icon1"></div>
					<p><i>01. GLOBAL UST</i> 글로벌 선도 국가연구소대학</p>
					<a href="/kor/sub01_01.do ">VISION 2025</a>

	            </div>

	        </div>

			<div class="item entrepreneur">
	            <a class="button2" href="#myLayer2">
	            	<span>
		                <i>02. ENTREPRENEUR UST</i>
						산학연 일체화 대학실현, 32개 정부출연연구기관
					</span>
	            </a>
	            <div id="myLayer2" class="myLayer">
					<div class="icon icon2"></div>
					<p><i>02. ENTREPRENEUR UST</i> 산학연 일체화 대학실현,<br> 32개 정부출연연구기관</p>
					<a href="/prog/ustAreaCampus/kor/sub03_01_01/list.do ">캠퍼스소개</a>

	            </div>
            </div>

			<div class="item excellent">
	            <a class="button3" href="#myLayer3">
	            	<span>
		            	<i>03. EXCELLENT UST</i>
						세계 최고의 교육 경쟁력 확보
					</span>
	            </a>
	            <div id="myLayer3" class="myLayer">
					<div class="icon icon3"></div>
					<p><i>03. EXCELLENT UST</i> 세계 최고의 교육 경쟁력 확보</p>
					<a href="/kor/sub01_03_03.do">UST 교육운영시스템</a>

	            </div>
            </div> -->

        </div>

        <div id="checktoday">
			<!-- <form action="/" method="post">
				<label><input type="checkbox" name="checkout"> 앞으로 계속 보지않기</label>

				<label><input type="checkbox" name="checktoday"> 오늘하루 그만보기</label>

			</form> -->

        </div>

	</div>
	</script>
	<script src="/js/video/video.js" type="text/javascript"></script>
	<script type="text/javascript">

	(function(){
		if(chaked_OS() != true){ 


		var randomNum = function(num,range){
			var k=0, randomNum = [];

			while(k!=num){
			    var ramdomNum = Math.floor(Math.random() * range);
			    
			    for(var j=0;j<randomNum.length;j++){
			        if(randomNum[j]==ramdomNum) break;
			    }

			    if(j==randomNum.length){ randomNum.push(ramdomNum); k++; }
			}

			return randomNum;

		}(1,2);

		var movieString = function(t){
			var str = [];

			str[0] = ""+
				"<video id=\"vidRTMP\" class=\"video-js vjs-default-skin vjs-big-play-centered\" autoplay controls preload=\"auto\" width=\"100%\" height=\"100%\" data-setup=\"{}\" poster=\"/images/kor/intro/intro.png\">"+
					"<source src=\"/uloads_clone/download/kor/sub04/in04_06_08_B.mp4\" type=\"video/mp4\">"+
				"</video>";

			// str[1] = ""+
			// 	"<video id=\"vidRTMP\" class=\"video-js vjs-default-skin vjs-big-play-centered\" autoplay controls preload=\"auto\" width=\"100%\" height=\"100%\" data-setup=\"{}\" poster=\"/images/kor/intro/UST_Review_shor(1006)_02.jpg\">"+
			// 		"<source src=\"rtmp://210.98.46.49:1935/vod/_definst_/&mp4:OCW/UST_Review_shor(1006)_02.mp4\" type=\"rtmp/mp4\">"+
			// 		"<source src=\"http://210.98.46.49:1935/vod/_definst_/OCW/UST_Review_shor(1006)_02.mp4/playlist.m3u8\" type=\"application/x-mpegURL\">"+
			// 	"</video>";

			return str[t];
		}


		// var captionString = function(t){
		// 	var str = [];

			// str[0] = ""+
			// 	"<div class=\"wrapper\">"+
			// 		"<p title=\"UST 홍보영상 자막 원고\" tabindex=\"-1\">"+
			// 			"PROUD UST (PROFESSIONAL, UNIQUE, DIFFERENT)<br>"+
			// 			"창조적 교육환경 조성을 통한 자긍심 있는 USTian 양성<br>"+
			// 			"UST is 새로운 가능성(POSSIBILITY)을 실현하는<br>"+
			// 			"대한민국 유일의 국가연구소대학<br>"+
			// 			"국가연구소대학 교육시스템(EDUCATION)<br>"+
			// 			"차별화된 경쟁력의 1% 인재양성(DEVELOPMENT)<br>"+
			// 			"글로벌선도(BEST) 국가연구소대학<br>"+
			// 			"32개 정부출연 연구기관 기반의 캠퍼스(CAMPUS)<br>"+
			// 			"창조적 융합의 리더(LEADER) UST<br>"+
			// 			"과학기술연합대학원대학교(UNIVERSITY OF SCIENCE &amp; TECHNOLOGY) "+
			// 		"</p>"+
			// 	"</div>";

			// str[1] = ""+
			// 	"<div class=\"wrapper\">"+
			// 		"<p title=\"2016 UST 후기 신입생 예비교육 원고\" tabindex=\"-1\">"+
			// 			"[2016 UST Newcomers Orientation]<br>"+
			// 			"넓고 깊은 학문의 바다를 항해하기 전<br>"+
			// 			"우리에게 주어졌던 26일의 준비기간<br>"+
			// 			"열정적인 강사님들의 강의<br>"+
			// 			"열정적인 강사님들의 강의<br>"+
			// 			"참여하고 체험하는 배움의 시간<br>"+
			// 			"세계 각국에서 모인 학우를 만나<br>"+
			// 			"문화와 마음을 나누고<br>"+
			// 			"동료로 가족으로 거듭난 시간<br>"+
			// 			"뜨거운 땀과 열정이 빛난 시간<br>"+
			// 			"이제 새로운 항해의 돛을 폅니다!<br>"+
			// 			"넓은 대양을 향한 첫 발<br>"+
			// 			"2016 UST 신입생 예비교육!"+
			// 		"</p>"+
			// 	"</div>";

		// 	return str[t];
		// }

 

		if(getCookie("checkout") != 1 && getCookie("checktoday") != 1){
			$("#introLayer").removeAttr("style");

			// $("#accessibility").after($("#template-video").html());

			$("#enterMovie").prepend(movieString(randomNum));
			$("#videoSubtitle").prepend(captionString(randomNum));

			var myPlayer = videojs('vidRTMP');

			$(window).on("keyup",function(event){
				if(event.keyCode === 27){

					if(myPlayer.paused()){
						myPlayer.play();

					}else{
						myPlayer.pause();

					}

				}else{

					return false;
				}

			});

			// $(document).ready(function(){
			// 	var endVideo = setInterval(function(){
			// 		//console.log(myPlayer.ended());
			// 		if(myPlayer.ended()){
			// 			clearInterval(endVideo);
			// 			$("#introLayer").fadeOut(300,function(){
			// 				$(this).remove();
			// 				$("html,body").removeClass("removeScroll");


			// 			});

			// 		}

			// 	},1000);

			// });


		}


		// var buttons = {}

		// buttons.btn = $("#buttonGroup>.item>a");
		// buttons.myLayer = $("#buttonGroup .myLayer");

		// function _in(){
		//     var t = $(this);

	 //        t.next()
	 //            .css({"display":"block","opacity":"0","bottom":"-20px"})
	 //                .stop(true,false)
	 //                    .animate({"opacity":"1","bottom":"0"},300,"easeOutCubic");

		// }

		// function _out(){
		// 	var t = $(this);

		//     t.stop(true,false)
		//         .animate({"opacity":"0","bottom":"-20px"},300,"easeOutCubic",
		//             function(){
		//                 t.css({"display":"none"});

	 //                }
		// 		);

		// }

		// buttons.btn.on("mouseenter focusin",_in);
		// buttons.myLayer.on("mouseleave focusout",_out);
	


		/* 오늘하루 그만보기 */

		// function setDay(){
		// 	var d = new Date();
		// 	d.setTime(d.getTime() + (arguments[0]*24*60*60*1000));

		// 	return d.toUTCString();
		// }


		// $("#checktoday input").on("click",function(){
		// 	var checkstring = "";
		// 	var checkday = 1;

		// 	if(this.name === "checktoday"){
		// 		checkstring = "checktoday";

		// 	}

		// 	if(this.name === "checkout"){ 
		// 		checkstring = "checkout";
		// 		checkday = 365;

		// 	}

		// 	document.cookie = (getCookie(checkstring) != 1) ? checkstring+"=1;path=/;expires="+setDay(checkday) : document.cookie = checkstring+"=0;path=/";

		// 	$("#introLayer").remove();

		// });

		}


	}());
	</script>


	
