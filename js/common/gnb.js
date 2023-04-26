
// 모바일
function gnb_open(param,obj,btn,index1,index2,index3,dur,meth){
	var param = $(param);
	var obj = $(obj);
	var btn = $(btn);
	var index1 = index1-1;
	var index2 = index2;
	var index3 = index3;
	var n = index1;
	var w = 224;
	var data = false;
	var str = location.href;
	var notbad = false;

	if(str.match("sitemap")){
		notbad = true;
	}

	param.find(".th2").hide();

	var _open = function(){
		obj.css({'overflow':'visible'}).animate({left:w},dur,meth);
		$("#shadow_device").stop(true,true).fadeIn(dur/2);
		$("html,body").css({"overflow":"hidden","height":$(window).height()});
		param.css({opacity:1,height:$(window).height()});
		param.find(".th3").hide();
		
		// if(notbad != true){ param.stop(true,true).delay(dur/2).animate({scrollTop:param.find(".th1_lnk").eq(index1).offset().top},dur,meth); }

		// if(mno != "" && notbad != true){
		// 	var tobj = param.find(".th1_lnk").eq(index1).next().find(">li").eq(index2).find(".th3");
		// 	if(tobj.is($(".th3"))){
		// 		tobj.find("a").eq(index3).addClass("ov");
		// 		param.stop(true,true).delay(dur).animate({scrollTop:tobj.parent().offset().top},dur,meth,function(){
		// 			tobj.slideDown(150);
		// 		});
		// 	}
		// }

		data = true;

	};

	var _close = function(){
		// obj.stop(true,true).animate({left:0},dur,meth,function(){
		// 	if(mno != "" && notbad != true){
		// 		param.find(".th1_lnk").not(n).removeClass("ov").eq(n).addClass("ov").next().show();
		// 	}else{
		// 		param.find(".th1_lnk").removeClass("ov").next().hide();
		// 	}
		// });

		$("#shadow_device").stop(true,true).fadeOut(dur/2,function(){
			$("html,body").removeAttr("style");
			obj.removeAttr("style");
			data = false;
		});

		param.stop(true,true).delay(dur).animate({opacity:0,scrollTop:0},0,meth);

	};

	btn.bind("touchend click",function(event){
		if(data == false) obj.queue(_open).dequeue(); else obj.queue(_close).dequeue();
		$(window).resize(function(){
			$("#shadow_device").click();
		});
		event.preventDefault();
		event.stopPropagation();
	});

	param.find("a").bind("click",function(event){
		if($("#topmenu:animated").size()){ return false; }
		if($("#topmenu :animated").size()){ return false; }
		event.stopPropagation();
		
	})

	// 터치 아웃 영역
	$("#shadow_device").unbind().bind("click touchmove",function(event){
		obj.queue(_close).dequeue();
		event.preventDefault();
		event.stopPropagation();
	});

	// // 트리메뉴 컨트롤
	// if(mno != "" && notbad != true){ 
	// 	param.find(".th1_lnk").not(index1).next().hide().eq(index1).show().prev().addClass("ov");
	// }

	// param.find(".th1_lnk").bind("click",function(event){
	// 	n = $(this).parent().index();
	// 	if($(this).next().css("display") == "none"){
	// 		param.find(".th1_lnk").not(n).removeClass("ov").next().stop(true,true).delay(150).slideUp(150);
	// 		param.find(".th1_lnk").eq(n).addClass("ov").next().stop(true,true).slideDown(150);
	// 	}
	// 	event.preventDefault();
	// 	event.stopPropagation();
	// });

	// param.find(".th2>li>a").bind("click",function(event){
	// 	if($(this).next().attr("class") == "th3"){
	// 		if($(this).next().css("display") != "block"){
	// 			$(this).next().slideDown(150);
	// 		}else{
	// 			$(this).next().slideUp(150);
	// 		}
	// 		event.preventDefault();
	// 		event.stopPropagation();
	// 	}
	// });

}

$(document).ready(function(){
	var param = $("#mobile_languege");
	var obj = param.find(".obj");
	var btn = param.find(".btn");

	btn.bind("click",function(event){
		if($("#topmenu:animated").size()){ return false; }
		if($("#topmenu :animated").size()){ return false; }

		if(obj.css("display") == "none"){
			obj.stop(true,true).slideDown(300);
		}else{
			obj.stop(true,true).slideUp(300);
		}

		event.preventDefault();
		event.stopPropagation();
	});
});


(function($) {
	$.fn.gnb = function(options) {
		// 컨트롤 기본 설정
		var opt = {
			param: null, // 타겟
			index1: null, // 1차메뉴 index
			index2: null, // 2차메뉴 index
			img: {use: null, chr: null, format: null}, // 이미지 사용 유무 설정 img{use: "true", chr: "_ov", format: "gif"} 
			isMain: null, // 메인일경우 확인
			control: "mouseover focus", // 헨들러 설정 단일, 복수 설정 가능.
			addRound: null, // 2차메뉴 처음과 끝 요소에 leftCap, rightCap 클래스 추가
			avoid: null // 마지막 메뉴  기능 삭제
		};
		// 설정 끝
		
		// 로직 시작
		$.extend(opt,options);

		var param = $(opt.param);
		var btn = param.find(">li>a");
		var obj = param.find("ul");
		var elem = opt.index1;
		var toBack = elem;

		btn.parent().first().addClass("firstChild");
		obj.hide();
		

		$.each(obj,function(c){
			$(this).addClass("sm_0"+(c+1));
			//$(this).parent().addClass("ln_gnb"+(c+1));
		});
		$("#mservice").show();
		if(opt.isMain != ""){
			if(btn.eq(toBack).next().is(btn.eq(toBack).next())){
				$("#tnb").height(117); 
				$("#mservice").hide();
			}
			btn.eq(elem).addClass("current").next().show().find("li:eq("+(opt.index2-1)+") a").addClass("ov");
		}else{
			$("#tnb").height(50);
			$("#mservice").show();
		}

		btn.bind(opt.control,function(){
			var t = $(this);

			if(opt.avoid == true){
				if(t.parent().index() == obj.size()){
					return false;
				}
			}

			btn.removeClass("current");
			t.addClass("current");
			$("#mservice").hide();

			if(t.next().is(t.next())){
				$("#tnb").stop(true,false).animate({'height':'117px'},300,'easeInOutCubic');

				$("#mservice").hide();
				obj.hide();
				t.next().show();
			}else{
				$("#tnb").stop(true,false).animate({'height':'50px'},300,'easeInOutCubic');
				$("#mservice").show();
			}

			if(opt.img.use == true){
				var on  = t.find("img");
				var off  = btn.eq(elem).find("img");
				var src = on.attr("src");

				src = src.substr(src.lastIndexOf("_"));

				if(src != opt.img.chr+"."+opt.img.format){
					if(opt.index1 <= btn.size()-1){
						off.attr("src",off.attr("src").replace(opt.img.chr+"."+opt.img.format,"."+opt.img.format));
					}else{
						for(var i=0; i<btn.size(); i++ ){
							off = btn.eq(i).find("img");
							off.attr("src",off.attr("src").replace(opt.img.chr+"."+opt.img.format,"."+opt.img.format));
						}
					}
					on.attr("src",on.attr("src").replace("."+opt.img.format,opt.img.chr+"."+opt.img.format));
				}
			}

			elem = t.parent().index();
		});

		$("#tnb").bind("mouseleave",function(){
			if(opt.isMain == ""){
				$("#tnb").stop(true,false).animate({'height':'50px'},700,'easeInOutCubic');
				obj.hide();
				$("#mservice").show();
				
				btn.removeClass("current");
			}else{
				if(btn.eq(toBack).next().is(btn.eq(toBack).next())){
					$("#tnb").stop(true,false).animate({'height':'117px'},700,'easeInOutCubic');
					
					$("#mservice").show();
				}else{
					$("#tnb").stop(true,false).animate({'height':'50px'},700,'easeInOutCubic');
				
					$("#mservice").hide();
					
					
				}
				//$(".gnbline").hide(); 
				obj.hide();
				$("#mservice").show();
				btn.removeClass("current").eq(toBack).addClass("current").next().show();
			}

		});
		
		if(opt.addRound == true ){
			obj.find("li:first-child").addClass("leftCap").parent().find("li:last-child").addClass("rightCap");
		}
		
		if(opt.isMain != ""){
			btn.removeClass("current").eq(elem).addClass("current");
		}
		
		if(opt.img.use == true && opt.index1 <= btn.size()-1){
			var timg = btn.eq(opt.index1).find("img");
			timg.attr("src",timg.attr("src").replace("."+opt.img.format,opt.img.chr+"."+opt.img.format));
		}
	}
})(jQuery);