
function Variable(param,btn,obj){
	var param = $(param);
	var btn = param.find(btn);
	var obj = param.find(obj);
	var elem = 0;
	

	btn.bind("click",function(event){
		var t = $(this);
		var customType = t.data('filter');
		
		//console.log(customType);
		if(t.attr("data-filter") == "all"){
			
			obj.show().stop().animate({ opacity: 1 }, 150, 'swing');
		}
		else{
			obj.hide().css({opacity:0});
			$.each(obj,function(){
				
	         	var data = $(this).data('cat');
		        if (data == customType) {
		            $(this).show().stop().animate({ opacity: 1 }, 150, 'swing');
		        }
		    });
	    }
	    
	    btn.parent().removeClass("on");
		t.parent().addClass("on");
	    event.preventDefault();
	});
	
	
	obj.find('a').on({
            mouseenter: function(){
	            $(this).addClass('ov');
				$(this).find('.caption').stop().animate({bottom: 0}, 200, 'easeOutQuad');
				$(this).find('.thm_figure img').stop().animate({top: -30}, 500, 'easeOutQuad');
               
            },
            mouseleave: function(){
	            $(this).removeClass('ov');
				$(this).find('.caption').stop().animate({bottom: -40}, 200, 'easeInQuad');
				$(this).find('.thm_figure img').stop().animate({top: 0}, 300, 'easeOutQuad');
            }
        });
	
	
	
	

}
