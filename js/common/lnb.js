function leftmenu(){
	var param = $(".lm_2th");
	var btn = param.find(">li>a");
	var hide_obj = param.find(".link_2th").next();
	var show_obj = param.find(".link_2th_ov").next();

	

	param.find(".link_2th").next().hide();
	param.find(".link_2th_ov").next().show();

	param.find(">li").first().addClass("first");



	btn.bind("click",function(event){
		var t = $(this);
		if(t.attr("href") == "#none"){ // 메뉴 URL을 #none 으로 설정하면
			btn.attr("class","link_2th").next().hide();
			t.attr("class","link_2th_ov").next().show();
			event.preventDefault();
		}
	});


}