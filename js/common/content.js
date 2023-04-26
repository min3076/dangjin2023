
function targetOpener(btn,option){
	var btn = $(btn);

	$(option.obj).hide();

	if(getParameter("style") !== null){
		btn.removeClass("ov");
		$("[href='#"+getParameter("style")+"']").addClass("ov");
		$("#"+getParameter("style")).show();

	}else{
		$(option.obj).first().show();

	}


	btn.bind("click",function(event){
		var t = $(this);
		href = t.attr("href").substr(1);

		if(t.children().is('img')){
			var btnIMG = btn.find('img');
			var thisIMG = t.children();
			var thisSRC = thisIMG.attr('src');
				thisSRC = thisSRC.substr(thisSRC.lastIndexOf('_')).split(".");

			if(thisSRC[0] != "_ov"){
				$.each(btnIMG,function(){
					$(this).attr("src",$(this).attr('src').replace('_ov.'+thisSRC[1],'.'+thisSRC[1]));
				});

				thisIMG.attr("src",thisIMG.attr('src').replace('.'+thisSRC[1],'_ov.'+thisSRC[1]));

			}
		}

		if(option.lv == 0){
			if($("[id="+href+"]").css("display") == "none"){
				$("[id="+href+"]").show();
				t.addClass("ov");
			}else{
				$("[id="+href+"]").hide();
				t.removeClass("ov");
			}
		}

		if(option.lv == 1){
			$(option.obj).hide();
			$("[id="+href+"]").show();
			btn.removeClass("ov");
			t.addClass("ov");
		}
		event.preventDefault();
	});
}



function initServiceSelect(selectValue) {
	var form = document.frmMainService;
	var keywordCd = '';
	
	// select box check
	if(selectValue == "province" && form.province.value == "" ) {
		alert("분야별 선택을 해주세요.");
		var ck = document.getElementById("province")
		ck.focus();
		return;
	}
	if(selectValue == "visit" && form.visit.value == "" ) {
		alert("방문목적별 선택을 해주세요.");
		document.getElementById("visit").focus();
		return;
	}
	if(selectValue == "theme" && form.theme.value == "" ) {
		alert("주제별 선택을 해주세요.");
		document.getElementById("theme").focus();
		return;
	}
	
	//form.service_search_input.value = "";
	if(selectValue == "province" && form.province.value != "" ) {
		keywordCd = form.province.value;
	}
	if(selectValue == "visit" && form.visit.value != "" ) {
		keywordCd = form.visit.value;
	}
	if(selectValue == "theme" && form.theme.value != "" ) {
		keywordCd = form.theme.value;
	}
	searchService(selectValue, keywordCd);
	event.preventDefault();
}

/* 키워드검색 */
function searchService(targetId, keywordCd){
	$("#resultTitle").text($("#"+targetId+" option:selected").text());
	$("#service_banner").css("display","block");
	$("#keywordResult").children().remove();
	
	$.ajax({
			type:"post",
			url:"/prog/keywordResult/keywordResultAjax.do",
			data:{keywordCd:keywordCd},
			dataType: "xml",
			success: function(xmlData){
				if($(xmlData).find("root").find("item").length > 0){
					$(xmlData).find("root").find("item").each(function(idx){
						var url = decodeURIComponent($(this).find('value').text());
						var str = "<li><a href='"+url+"' target='_blank'  title='새창열림 '>"+ decodeURIComponent($(this).find("label").text()) +"</a></li>";
						//$("#keywordResult").html( );
						$("#keywordResult").append(str);
					
					});
				}
			}
		});
}

/* 키워드검색 닫기 */
function keywordResultClose(){
	$("#keywordResult").children().remove();
	$("#service_banner").hide(); 
}

/* 메인 최근게시물 */
function latest_bbs(param,btn,obj,img,event){
	var param = $(param);
	var btn = param.find(btn);
	var obj = param.find(obj);
	var currBtn = btn.eq(0).find("img");
	
	obj.hide().eq(0).show();
	btn.eq(0).addClass("ov");
	if(img == true) currBtn.attr("src",currBtn.attr("src").replace(".gif","_ov.gif"));
	
	btn.unbind();
	btn.bind(event,function(event){
		var t = $(this);
		if(img == true){
			var timg = t.find("img");
			var imgSrc = timg.attr("src");
			imgSrc = imgSrc.substr(imgSrc.lastIndexOf("_"));
			
			if(imgSrc != "_ov.gif"){
				for(var i=0;i<obj.size();i++){
					var res = btn.eq(i).find("img");
					res.attr("src",res.attr("src").replace("_ov.gif",".gif"));
				};
				timg.attr("src",timg.attr("src").replace(".gif","_ov.gif"));
			}
		}

		btn.removeClass("ov");
		t.addClass("ov");
		
		obj.hide();
		t.parent().next().show();
		
		event.preventDefault();
	});
}

$(document).ready(function(){
	var obj = $("#topsearch");
	var btn = $("#open_sc");
	var header = $("#header");

	if(navigator.userAgent.match("iPad") || navigator.userAgent.match("iPhone")){
	    $("#searchkeyword").on('click',function(){
	        lastFocus = $(this).attr('id');
	        checkFocusInterval = setInterval(blurApple, 200);
	    });
	}

	function blurApple() {
	    var focusNow = document.activeElement;
	    if(focusNow.getAttribute('id') != lastFocus) {
	    	clearInterval(checkFocusInterval);
	    	obj.removeClass("hiddenSearch");
	    	header.css({"margin-bottom":"0"});
	    }
	}

	btn.unbind().bind("click touchend",function(event){
		if(obj.css("display") == "none"){
			obj.addClass("hiddenSearch");
			header.css({"margin-bottom":"42px"});
			btn.addClass("ov");
			$("#searchkeyword").focus();
		}else{
			if(chaked_OS() == true) btn.focus(); else obj.removeClass("hiddenSearch");
			header.css({"margin-bottom":"0"});
			
			btn.removeClass("ov");
		}
		event.preventDefault();
		event.stopPropagation();
	});

	if(chaked_OS() == true){
		$("#searchkeyword").unbind().bind("focusout",function(){
			obj.removeClass("hiddenSearch");
			header.css({"margin-bottom":"0"});
		});

		obj.find(":submit").unbind().bind("touchstart",function(event){
			obj.find("form").submit();
			event.preventDefault();
		});

		var nowWidth = return_width();
		$(window).resize(function(){
			if(nowWidth != $(this).width()){
				obj.removeClass("hiddenSearch");
				header.css({"margin-bottom":"0"});
				nowWidth = return_width();
			}
		});
	}
});

$(document).ready(function(){
	var param = $("#lang");
	var obj = param.find("#lang_site");
	var btn = param.find("dt>a");
	var close = param.find(".close>a");
	btn.unbind().bind("click",function(event){
		var t = $(this);
		if(obj.css("display") == "none"){
			obj.stop(true,true).slideDown(300);
		}else{
			obj.stop(true,true).slideUp(300);
		}
		t.toggleClass('fold');
		event.preventDefault();
		event.stopPropagation();
	});
	close.unbind().bind("click",function(event){
		var t = $(this);
		if(obj.css("display") == "none"){
			obj.stop(true,true).slideDown(300);
		}else{
			obj.stop(true,true).slideUp(300);
		}
		t.toggleClass('fold');
		event.preventDefault();
		event.stopPropagation();
	});
});




