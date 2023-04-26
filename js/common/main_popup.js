
function collection_Obj(){
	var param = $("#advertising");
	var obj = param.find(".obj>li");
	var btn = param.find(".control>a");
	var elem = 0;
	var vsize;
	var rel,r,l,n;
	var duration = 1000;
	var method = "easeInOutCubic";
	
	$.each(obj,function(e){
		$(this).attr("id","adver"+(e+1));

	});
	
	//alert(param.width());
	function itemwidth(){
		obj.width(param.find(".wrapper").width()/2);
	}
	$(document).ready(function(){
		$(window).resize(function(event){
			itemwidth(); 
			event.stopPropagation();
		});
	});
	
	function init_movement(){
		if(obj.parent().find(":animated").size()) return false;
		if(rel == "prev"){
			if(elem > 0) elem--; else elem = obj.size()-1;
			obj.parent().css({left:(obj.eq(elem).outerWidth())*-1});
			obj.parent().prepend(obj.eq(elem).detach());
			obj.parent().stop(true,false).animate({left:0},duration,method);
			//paginate();
		}
		
		if(rel == "next"){
			if(elem < obj.size()-1) elem++; else elem = 0;
			obj.parent().stop(true,false).animate({left:(obj.eq(elem).outerWidth())*-1},duration,method,function(){
				obj.parent().append(obj.eq(elem).prev().detach());
				obj.parent().css({left:0});
			});
			//paginate();
		}
	}
	// 컨트롤
	btn.unbind().bind("click ",function(event){
		var t = $(this); 
		rel = t.attr("rel");
		init_movement();
		event.preventDefault();
	});
	itemwidth();
}

$(document).ready(function(){
	
	$("#advertising").hide();
	function init(){
		if(chaked_OS() == false){
			if(return_width()>768){
				$("#advertising").show().stop().animate({marginTop:0},{duration:1000,easing:"easeInOutCubic"});
				$("#weather_box").css({paddingTop:415});
			}
		}
	}
	
	function out(){
		$("#weather_box").removeAttr("style");
		$("#advertising").hide().stop().animate({marginTop:-150},{duration:1000,easing:"easeInOutCubic"});
	}
	

	$(".close>a").click(function(event){
		setTimeout(out,500);
		event.preventDefault();
	});
	/*
	$(".pzopen").click(function(event){
		$("#pzwrap").show().stop().animate({opacity:1},{duration:700/2,easing:"easeOutExpo"});
		event.preventDefault();
	});*/

	var exit = $("#advertising").find(".close_day");
	var key = getCookie("advertising");

	function setDay(){
		var d = new Date();
		d.setTime(d.getTime() + (arguments[0]*24*60*60*1000));
		
		return d.toUTCString();
	}

	function setCookie(){
		document.cookie = "advertising=1;expires="+setDay(1);
	}

	exit.on("click",function(event){
		setCookie();
		setTimeout(out,500);
		event.preventDefault();
	});

	if(key != 1){
		$(window).resize(function(event){
			setTimeout(init,500);
			event.stopPropagation();
		});

		setTimeout(init,500);
	}

});
