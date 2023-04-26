function menulocate(param,control,code,mno,siteCode,dir){
	if(getCookie("menulocate") === null){
		document.cookie = "menulocate="+dir+";path=/";

	}

	var param = $(param);
	var control = param.find(control);

	var nodes = $("#tm>li>a");
	var code1 = code[0]-1;
	var code2 = code[1]-1;

	var mno = mno;
	var menu = {}

	menu.array = function(){
		var array = new Array();

		$.each(nodes,function(a){
			var tchild = $(this).next().next().find(">li>a");

			array[a] = new Array();

			if(a == nodes.length-1){
				array[a+1] = [["개인정보처리방침","/"+siteCode+"/sitemap_11.do"]];
			}

			$.each(tchild,function(b){
				array[a][b] = [$(this).text(),$(this).attr("href")];

			});

		});

		return array;

	};

	menu.state = getCookie("menulocate");

	if(!mno.match("sitemap")){
		if(code2 == 0){
			prev = (code1 != 0 ? menu.array()[code1-1].length-1 : menu.array()[nodes.length].length-1);
			menu.prevVal = (code1 != 0 ? menu.array()[code1-1][prev] : menu.array()[nodes.length][prev]);

		}else{
			prev = code2-1;
			menu.prevVal = menu.array()[code1][prev];
			
		}

		if(code2 == menu.array()[code1].length-1){
			next = 0;
			menu.nextVal = menu.array()[code1+1][next];

		}else{
			next = code2+1;
			menu.nextVal = menu.array()[code1][next];

		}

	}else{
		code1 = nodes.length;
		prev = menu.array()[code1].length-1;
		next = 0;

		menu.prevVal = (menu.state === "prev" ? menu.array()[code1-1][prev] : menu.array()[code1-1][next]);
		menu.nextVal = (menu.state === "prev" ? menu.array()[0][prev] : menu.array()[0][next]);

	}

	menu.prevStr = "<a data-control=\"prev\" href=\""+menu.prevVal[1]+"\"><div>"+menu.prevVal[0]+"<span class=\"icon prev\"></span></div></a>";
	menu.nextStr = "<a data-control=\"next\" href=\""+menu.nextVal[1]+"\"><div><span class=\"icon next\"></span>"+menu.nextVal[0]+"</div></a>";

	control.html(menu.prevStr+"\n"+menu.nextStr);

	menu.active = $("[data-control="+menu.state+"]");

	/*$(window).load(
		function(){
			menu.active.addClass("ov");
		}
	);*/

	// -----

	menu.button = control.find("[data-control]");

	function _in(event){
		var t = $(this);

		if(event.type === "click"){
			document.cookie = "menulocate="+t.attr("data-control")+";path=/";

			menu.button.removeClass("ov")
				.eq(menu.enter).addClass("ov");

		}else{

			if(event.type === "mouseenter" || event.type === "focusin"){
				menu.enter = t.index();
				menu.leave = menu.active.index();

				menu.button.removeClass("ov")
					.eq(menu.enter).addClass("ov");

			}

			if(event.type === "mouseleave" || event.type === "focusout"){
				menu.button.removeClass("ov")
					//.eq(menu.leave).addClass("ov");

			}

		}

	}

	menu.button.on("click mouseenter mouseleave focusin focusout",_in);

} 
