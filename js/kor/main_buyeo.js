//슬라이드 시작
function touchSlider(id,num,autoplay,slide,speed){
	var $touchSlider = $(id);
	var $autoplay = autoplay;
	var $slidNum = num;
	var $slide = slide;
	var $speed = speed;
	if($slidNum==null || $slidNum=="auto" || $slidNum==0){
		var boxWidth = $touchSlider.find(".sliderBox").width();
		var conWidth = $touchSlider.find(".sliderBox > ul > li").width();
		$slidNum = Number(boxWidth/conWidth).toFixed();
		//console.log("$slidNum:"+$slidNum);
	}
	if($autoplay==null || $autoplay == true){
		$touchSlider.find(".btn_play").hide();
		$touchSlider.find(".btn_stop").show();
	}else{
		$touchSlider.find(".btn_play").show();
		$touchSlider.find(".btn_stop").hide();
	}
	if ($touchSlider.find('.sliderBox > ul > li').length > 1) {
		$touchSlider.find("> .sliderBox").touchSlider({
			view:$slidNum,
			speed : $speed,
			transition : false,
			autoplay : {
				enable : $autoplay,
				pauseHover : false,
				addHoverTarget : "", // 다른 오버영역 추가 ex) ".someBtn, .someContainer"
				interval : 7500,
			},
			initComplete : function (e) {
				var _this = this;
				var $this = $(this);
				var paging = $touchSlider.find(".paging");
				
				this._btn_play = null;
				this._btn_stop = null;	
 
				paging.find(".btn_page").bind("click", function (e) {
					_this.go_page($(this).index());
					$touchSlider.find(".btn_play").show();
					$touchSlider.find(".btn_stop").hide();
					_this.autoStop();
				});				
				
				$touchSlider.find(".btn_play").bind("click", function() {
					$touchSlider.find(".btn_play").hide();
					$touchSlider.find(".btn_stop").show();
					_this.autoPlay();
				});
				$touchSlider.find(".btn_stop").bind("click", function() {
					$touchSlider.find(".btn_play").show();
					$touchSlider.find(".btn_stop").hide();
					_this.autoStop();
				});
				$(window).keyup(function(e){
					if(e.keyCode == 9){
						$this.find(" > ul > li *").on("focus",function(e){
							e.preventDefault();
							var _focusNum = $(this).attr("data-focus");
							//console.log("_focusNum :" + _focusNum);
							if(_focusNum != undefined){
								_this.go_page(_focusNum);
							}
						})
					}
				})
			},
			counter : function (e) {
				$touchSlider.find(".paging .btn_page").removeClass("on").eq(e.current-1).addClass("on");
				$touchSlider.find(".sliderBox > ul > li").removeClass("active").eq(e.current-1).addClass("active");
				$touchSlider.find(".pageCount").html("<span class='num'>"+e.current + "</span>/<span class='totalNum'>" + e.total+"</sapn>");				
				if($slide==false){
					$touchSlider.find(".sliderBox > ul > li").stop();
					$touchSlider.find(".sliderBox > ul > li").css({"opacity":"0","z-index":"1","left":"0"});
					$touchSlider.find(".sliderBox > ul > li.on").removeClass("on").css({"z-index":"2","opacity":"1","left":"0"});
					$touchSlider.find(".sliderBox > ul > li").eq(e.current-1).addClass("on").css({"z-index":"3","opacity":"0","left":"0"}).animate({"opacity":"1"},1000);
				}
			},
			btn_prev : $touchSlider.find(".btn_prev"),
			btn_next : $touchSlider.find(".btn_next")
		});
	}
}
//슬라이드 끝




//탭

function targetOpener(btn,option){
    var btn = $(btn);

    $(option.obj).hide().first().show();

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
                $("[id="+href+"]").show().css({'visibility':'visible'});
                t.addClass("ov");
            }else{
                $("[id="+href+"]").hide().css({'visibility':'hidden'});
                t.removeClass("ov");
            }
        }

        if(option.lv == 1){
            $(option.obj).hide().css({'visibility':'hidden'});
            $("[id="+href+"]").show().css({'visibility':'visible'});
            btn.removeClass("ov");
            t.addClass("ov");
        }
        event.preventDefault();
    });
}


//탭 시작
function tabObj(_target,_tabBtn,_tabCon,_active, _isAjax){
    _tabBtn.removeClass("on");
    if(_isAjax != true) _tabCon.removeClass("on");
    if(_active == undefined){
        _tabBtn.eq(0).addClass("on");
        if(_isAjax != true) _tabCon.eq(0).addClass("on");
    }
    _tabBtn.on("click",function(e){
        var _clickNum = $(this).parent().index()+1;
        _tabBtn.removeClass("on");
        $(this).addClass("on");
        if(_isAjax != true) {
            _tabCon.removeClass("on");
            $("#tab_"+_clickNum).addClass("on");
        }

        e.preventDefault();
    });
}
//탭 끝




$(function(){
	touch_slide_AC({
		obj:$(".main_sliderBox"),
		box:$(".main_sliderBox>ul"),
		item:$(".main_sliderBox>ul>li"),
		btn:$(".main_control"),
		plays:"N"
	},function(obj){
		obj.btn.removeClass("on").eq(obj.cnt).addClass("on");
	});

	touch_slide_AC({
		obj:$(".main_sliderBox .group1 .box1"),
		box:$(".main_sliderBox .group1 .box1 .photo_list-wrap"),
		item:$(".main_sliderBox .group1 .box1 .photo_list-wrap .photo_list-item"),
		btn:$(".main_sliderBox .group1 .box1 .control"),
		plays:"Y"
	},function(obj){
		//console.log(obj.attr("class")+" : "+obj.cnt);
		$('<div class="total">\
			<span class="current">'+(obj.cnt+1)+'</span> \
			<span class="line">/</span>\
			<span class="count">'+obj.item.size()+'</span>\
		   </div>').appendTo($(".main_tab .group.group1 .control .paging").empty());
	});
});

function touch_slide_AC(str,callback_fn){
	var obj = str.obj;
		obj.box = str.box;
		obj.item = str.item;
		obj.cnt = 0;
		obj.ch = "N";
		obj.autoPlay = str.plays;
		obj.saveTime = "";
		obj.saveTimeSpeed = 6000;
	if(str.btn){
		obj.btn = $(str.btn).eq(0).find(" [data-btn='count']");
		obj.btn_prev = $(str.btn).eq(0).find(" [data-btn='prev']");
		obj.btn_next = $(str.btn).eq(0).find(" [data-btn='next']");
		obj.btn_play = $(str.btn).eq(0).find(" [data-btn='play']");
		obj.btn_stop = $(str.btn).eq(0).find(" [data-btn='stop']");
	}
	function fn_set(){
		obj.box.css({
			//"overflow":"hidden",
			"position":"relative",
			"z-index":"0",
			"width":"100%",
			"height":"100%"
		});
		obj.item.css({
			"position":"absolute",
			"top":"0",
			"z-index":"0",
			"width":"100%"
		});

		fn_position(obj.cnt);
	}
	fn_set();

	function fn_position(idx){
		var lPoint = 0;
		obj.item.removeClass("active");
		for(var i=0; i<obj.item.size(); i++){
			if(idx > i) lPoint = -100;
			else if(idx < i) lPoint = 100;
			else {
				lPoint = 0;
				obj.item.eq(i).addClass("active");
				obj.box.height(obj.item.eq(i).innerHeight());
			}
			obj.item.eq(i).css({"left":lPoint+"%"});
		}

		callback_fn(obj);
	}

	if(str.btn){
		obj.btn.click(function(){
			obj.cnt = obj.btn.index($(this));
			fn_position(obj.cnt);
			return false;
		});

		obj.btn_prev.click(function(){
			fn_stop();
			obj.cnt--;
			if(obj.cnt < 0) obj.cnt = obj.item.size()-1;
			fn_position(obj.cnt);
			if(obj.autoPlay == "Y"){
				fn_play();
			}
			return false;
		});

		obj.btn_next.click(function(){
			fn_stop();
			obj.cnt++;
			if(obj.cnt > obj.item.size()-1) obj.cnt = 0;
			fn_position(obj.cnt);
			if(obj.autoPlay == "Y"){
				fn_play();
			}
			return false;
		});

		function fn_play(){
			obj.saveTime = setTimeout(function(){
				obj.btn_next.click();
			},obj.saveTimeSpeed);
		}
		function fn_stop(){
			clearTimeout(obj.saveTime);
		}

		obj.btn_play.click(function(){
			obj.autoPlay = "Y";
			obj.btn_play.hide();
			obj.btn_stop.show();
			fn_play();
			return false;
		});

		obj.btn_stop.click(function(){
			obj.autoPlay = "N";
			obj.btn_play.show();
			obj.btn_stop.hide();
			fn_stop();
			return false;
		});

		if(obj.autoPlay == "Y"){
			obj.btn_play.hide();
			obj.btn_stop.show();
			fn_play();
		}
	}


	var drags = [];
		drags.x = 0;

	obj.on("mousedown touchstart",function(e){
		drags.gap = obj.innerWidth()*10/100;
		drags.x = e.pageX || event.changedTouches[0].pageX;
		obj.unbind("click");
		obj.on("mousemove touchmove",function(e){
			if(event.changedTouches == undefined){
				e.preventDefault();
			}
			obj.on("mouseup touchend",function(e){
				var hitX = e.pageX || event.changedTouches[0].pageX;
				var checkX = drags.x - hitX;
				obj.bind("click",function(){return false;});
				if(checkX < (drags.gap*-1)){
					//console.log("왼쪽에서 오른쪽으로");
					obj.cnt--;
					if(obj.cnt < 0) obj.cnt = obj.item.size()-1;
					fn_position(obj.cnt);
				} else if(checkX > drags.gap){
					//console.log("오른쪽에서 왼쪽으로");
					obj.cnt++;
					if(obj.cnt > obj.item.size()-1) obj.cnt = 0;
					fn_position(obj.cnt);
				} else {
					//console.log("무효");
					obj.unbind("click");
				}
				obj.off("mousemove mouseup touchmove touchend");
				e.stopImmediatePropagation();
			});
		});
		e.stopImmediatePropagation();
	});

	//임시
	$(".main_sliderBox").off("mousedown mousemove mouseup touchstart touchmove touchend");

	

	
}





