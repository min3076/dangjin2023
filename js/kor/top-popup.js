var cookiedata = document.cookie;//상단팝업

$(document).ready(function() {
	var bannerNum = $("#open_popup_wrap ul li").size();//입학홈페이지 팝업존 수
	//console.log(">>>>>>>>> bannerNum:"+bannerNum);
	popup_slide(bannerNum);//상단팝업

	/*열림, 닫힘*/
	/*
	var param = $("#open_popup_wrap");
	var obj = param.find(".popup_box");
	var btn = $("#header .global_r a");
	var data = true;

	var OPEN = function(){
		if($(window).outerWidth() >= 768){
			obj.stop(true,false).delay(500).animate({height:500},500,'easeOutCubic');
		}else{
			obj.stop(true,false).delay(500).animate({height:160},500,'easeOutCubic');
		}
	}
	var CLOSE = function(){
		obj.stop(true,false).delay(300).animate({height:0},500,'easeOutCubic');
	}

	btn.bind("click",function(event){
		if($(this).attr("data-control") == "close"){
			$(".global_r .pop_btn_x").stop(true,false).hide();
			$(".global_r .pop_btn").stop(true,false).show();
			delay = 0;
			CLOSE();
			data = false;	
		}else if($(this).attr("data-control") == "open"){
			$(".global_r .pop_btn").stop(true,false).hide();
			$(".global_r .pop_btn_x").stop(true,false).show();
			OPEN();	
		};
	});	
	
	if(bannerNum == 0){
	} else {
		OPEN();
	}
	if(!getCookie("ncookie")){
	}else{
		$(".pzbtn").css("display","none");					
	}
	*/
});

// popup
function popup_slide (bannerNum){
	var bannerNum = bannerNum;
	
	var banner_intervalID = 0;
	/*var banner_intervalNum = 5000;
	var banner_isPlayNext  = true;
	var banner_isMovePlay  = false;
	var banner_isStopEvent = false;*/
		
	$(document).ready(function() {
		if($("#wrap").attr("class") == "sub"){
			//(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
			$("#open_popup_wrap").stop().animate({ height: 0}, 300, function(){
				$("#open_popup_wrap").css("display", "none");
				//$("#shadow_device").css("display", "none");
			});	
			$("#wrap .pop_btn_x").hide();
			$("#wrap .pop_btn").show();


				//pzClose(); 
				//$(".pzbtn").css("display","none");
			} else {
				if(!getCookie("ncookie")){
					//console.log(">>>>>>>>");
					if(bannerNum > 0){
						pzOpen();	
					}else{
						//$(".pzbtn").css("display", "none");
					}
				}else{
					$("#snb .pzbtn .pop_btn").show();
					$("#snb .pzbtn .pop_btn_x").hide();				
				}
			}


		function pzClose(){
			//(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
			$("#open_popup_wrap").stop().animate({ height: 0}, 300, function(){
				$("#open_popup_wrap").css("display", "none");
				//$("#shadow_device").css("display", "none"); 
			});	
			$("#wrap .pop_btn_x").hide();
			$("#wrap .pop_btn").show();
		}
		function pzOpen(){
				//(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
				//$("#shadow_device").css("display", "block");
				$("#open_popup_wrap").css("display", "block");
				$("#open_popup_wrap").stop().animate({ height: 403}, 300);
				$("#wrap .pop_btn").hide();
				$("#wrap .pop_btn_x").show();
				$("#pzone .pzbtn").addClass("on");
		}
			
		if (bannerNum < 1) {
			$(".prev_btn").hide();
			$(".next_btn").hide();
		} /* else {		
		banner_intervalID = setInterval(banner_fadeStart, banner_intervalNum);
			
			$(".open_popup_box .prev_btn").click(function(event){
				$("#slide_pop_list li:first").css("display", "none");
				$("#slide_pop_list li:first").appendTo( $("#slide_pop_list") );
				$("#slide_pop_list li:last").fadeIn(0);
				
				banner_isPlayNext = false;
				banner_isMovePlay = true;
				(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
			}).mouseenter(function() {
				clearInterval(banner_intervalID);
			}).mouseleave(function() {
				banner_intervalID = setInterval(banner_fadeStart, banner_intervalNum);
			});
		
			$(".open_popup_box .next_btn").click(function(event){
				$("#slide_pop_list li:last").fadeOut(0,function() {
					$(this).prependTo( $("#slide_pop_list") );
					$("#slide_pop_list li:first").css("display", "block");
				})
				banner_isPlayNext = true;
				banner_isMovePlay = true;
				(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
			}).mouseenter(function() {
				clearInterval(banner_intervalID);
			}).mouseleave(function() {
				banner_intervalID = setInterval(banner_fadeStart, banner_intervalNum);
			});
			
			
			$(".open_popup_box").find("[data-control=stop]").click(function(event){
				console.log(">> stop");
				$(".open_popup_box").find("[data-control=stop]").hide();
				$(".open_popup_box").find("[data-control=play]").show();
				banner_isPlayNext = false;
				banner_isMovePlay = false;
				(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
				clearInterval(banner_intervalID);
			});
			$(".open_popup_box").find("[data-control=play]").click(function(event){
				console.log(">> play");
				$(".open_popup_box").find("[data-control=play]").hide();
				$(".open_popup_box").find("[data-control=stop]").show();
				banner_isPlayNext = true;
				banner_isMovePlay = true;
				(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
				clearInterval(banner_intervalID);
				banner_intervalID = setInterval(banner_fadeStart, banner_intervalNum);
			});
			
			
			$(".open_popup #slide_pop_list li").mouseenter(function(){
				banner_isPlayNext = false;
				banner_isMovePlay = false;
				(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
			}).mouseenter(function() {
				clearInterval(banner_intervalID);
			}).mouseleave(function() {
				banner_intervalID = setInterval(banner_fadeStart, banner_intervalNum);
			});
			
			$("#slide_pop_list li a").focus(function(){
				banner_isPlayNext = false;
				banner_isMovePlay = false;
				(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
			}).focus(function() {
				clearInterval(banner_intervalID);
			}).focusout(function() {
				banner_intervalID = setInterval(banner_fadeStart, banner_intervalNum);
			});
		};	
		*/
		$("#open_popup_wrap .close_btn").click(function(event){
			(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
			$("#open_popup_wrap").stop().animate({ height: 0}, 300, function(){
				$("#open_popup_wrap").css("display", "none");
			});	
			$("#wrap .pop_btn_x").hide();
			$("#wrap .pop_btn").show();

			//console.log(">>>>>>>>>>> 팝업닫기");
			if (document.notice_form2.chkbox2.checked) {
				console.log(">>>>>>>>>>> 오늘하루:checked");
				setCookie("ncookie","done",1);
				//$(".pzbtn").css("display","none");
			}
			//console.log(">>>>>>>>>>> cookie:"+document.cookie);
		});

		$("#shadow_device").click(function(event){
			(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
			$("#open_popup_wrap").stop().animate({ height: 0}, 300, function(){
				$("#open_popup_wrap").css("display", "none");
			});	
			$("#wrap .pop_btn_x").hide();
			$("#wrap .pop_btn").show();

			console.log(">>>>>>>>>>> 팝업닫기");
			if (document.notice_form2.chkbox2.checked) {
				//console.log(">>>>>>>>>>> 오늘하루:checked");
				setCookie("ncookie","done",1);
				//$(".pzbtn").css("display","none");
			}
			//console.log(">>>>>>>>>>> cookie:"+document.cookie);
		});
		$("#wrap .pop_btn_x").click(function(event){
			(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
			$("#open_popup_wrap").stop().animate({ height: 0}, 300, function(){
				$("#open_popup_wrap").css("display", "none");
				//$("#shadow_device").css("display", "none");
			});	
			$("#wrap .pop_btn_x").hide();
			$("#wrap .pop_btn").show();
			setTimeout(function(){
				$("#pzone .pzbtn").removeClass("on");
			},300);

			//console.log(">>>>>>>>>>> 팝업닫기");
			if (document.notice_form2.chkbox2.checked) {
				console.log(">>>>>>>>>>> 오늘하루:checked");
				setCookie("ncookie","done",1);
				//$(".pzbtn").css("display","none");
			}
			//console.log(">>>>>>>>>>> cookie:"+document.cookie);
		});
		
		$("#wrap .pop_btn").click(function(event){
			event.preventDefault();
			if(bannerNum != 0){
				//if(!getCookie("ncookie")){
					(event.preventDefault) ? event.preventDefault() : event.returnValue = false;
					//$("#shadow_device").css("display", "block");
					$("#open_popup_wrap").css("display", "block");
					$("#open_popup_wrap").stop().animate({ height: 403}, 300);
					$(this).hide();
					$("#wrap .pop_btn_x").show();
					$("#pzone .pzbtn").addClass("on");
				//}
			}
		});	
		
	});
	
	function fadeBannerStart() {	
		$(".popup_box li:last").fadeOut("slow",function() {
			$(this).prependTo( $(".popup_box") );
			$(".popup_box li:first").css("display", "block");
		})
	}
	
	function banner_fadeStart() {
		if (banner_isPlayNext) {
			$("#slide_pop_list li:last").fadeOut("fast",function() {
				$(this).prependTo( $("#slide_pop_list") );
				$("#slide_pop_list li:first").css("display", "block");
			})
		} else {
			$("#slide_pop_list li:first").css("display", "none");
			$("#slide_pop_list li:first").appendTo( $("#slide_pop_list") );
			$("#slide_pop_list li:last").fadeIn("fast");
		}
	}	
}	

function setCookie( name, value, expiredays ){
	//console.log(">>>>>>>>>>> setCookie() 실행");
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
/*
function getCookie(sName) {
	var aCookie = document.cookie.split("; ");
	for(var i = 0; i < aCookie.length; i++) {
		var aCrumb = aCookie[i].split("=");
		if(sName == aCrumb[0]) {
			return unescape(aCrumb[1]);
		}
	}
	return null;
}
*/