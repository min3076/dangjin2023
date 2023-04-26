// naming by kimgaram

(function(){

    var majorbox = $("#majorbox");

    majorbox.btn = majorbox.find("button");
    majorbox.item = majorbox.find(".info_major");
    majorbox.close = majorbox.item.find(".btn_close");

    majorbox.switch = function(t){
        switch(Math.round(t.outerWidth()/majorbox.outerWidth()*100)){
            case 100 : return 1; break;
            case 50 : return 2; break;
            case 33 : return 3; break;
            case 25 : return 4; break;
            default : return null; break;

        }
    };

    majorbox.each = function(t){
        var array = new Array();
        var n = 0;
        var i = 0;

        $.each(majorbox.btn,function(index){
            //console.log(n,i);

            if(index%t === 0){
                if(index > 0){
                    n++;

                }

                array[n] = new Array();

                i = 0;

            }

            array[n][i] = $(this);

            i++;


        });

        return array;

    }



    function _style(t,r,n){
        t.item = t.next();

        if(t.item.css("display") === "block"){
            t.removeClass("ov");

            // 현재 닫기
            r.css({"margin-bottom":0});
            t.item.removeAttr("style");

            return false;

        }

        if(!t.item.is(":animated")){

            for(var i=0; i<majorbox.item.length; i++){
                if($(majorbox.item[i]).css("display") === "block"){
                    _remove();

                    break;

                }
            }

            majorbox.btn.not(t).removeClass("ov")
            t.addClass("ov");

            t.item.show();
            
            // 스크롤박스 높이 설정
            t.boxheight = ($(window).width() > 1200) ? t.item.find(".major_left").height() : 300;
            t.item.find(".major_right").css({"height":t.boxheight});

            t.height = t.item.outerHeight();
            t.top = t.outerHeight()*(Number(n)+1);

            // 열기
            r.css({"margin-bottom":t.height});

            t.item.css({"height":t.height,"top":t.top});


        }

        return true;
    }


    function _remove(){
        majorbox.btn.removeClass("ov").removeAttr("style");
        majorbox.item.removeAttr("style");

    }


    function _init(event){
        var t = $(this);

        t.namespace = event.handleObj.namespace;
        t.index = majorbox.btn.index(t);
        t.array = majorbox.each(majorbox.switch(t));

        if(t.namespace === "open"){
            for(index1 in t.array){
                for(index2 in t.array[index1]){
                    t.returnArray = majorbox.btn.index(t.array[index1][index2]);

                    if(t.index === t.returnArray){
                        t.returnNumber = index1;

                        if(t.returnNumber === index1){
                            for(var i=0; i<t.array[index1].length; i++){
                                t.resultArray = majorbox.btn.eq(majorbox.btn.index(t.array[index1][i]));

                            }

                            _style(t,t.resultArray,t.returnNumber);

                            break;

                        }

                    }
                }
            }

        }
    }

    majorbox.btn.on("click.open",_init);




    function _close(event){

        _remove(); 

        event.preventDefault();

    }

    majorbox.close.on("click.close",_close);



    $(window).resize(function(){
        for(var i=0; i<majorbox.item.length; i++){
            if($(majorbox.item[i]).css("display") === "block"){
                _remove();

                break;

            }
        }

        return true;

    });


}());