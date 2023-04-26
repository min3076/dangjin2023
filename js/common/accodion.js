// v.1.2 default

function accordion(nodes,button){
    var variable = {}

    variable.nodes = $(nodes);
    variable.item = variable.nodes.find(".item");
    variable.button = variable.item.find(button);
    variable.height = function(t,display){
        if(display === "none"){
            return t.outerHeight(true)+t.next().outerHeight(true);

        }else{
            return t.outerHeight(true);

        }
    }

    variable.du = 300;
    variable.mat = "easeInOutCubic";

    // -----

    for(var i=0; i<variable.item.size(); i++){
        if(variable.item.eq(i).attr("class").match("ov")){
            variable.item.not(variable.item.eq(i)).next().hide();

            variable.item.eq(i).parent()
                .height(variable.height(variable.item.eq(i),"none")).next().show();

            break;
        }
    }

    // -----

    function _in(event){
        var t = $(this);
        var tParent = t.parent();
        var nt = variable.item.not(t);
        var nParent = nt.parent().not(tParent);
        var display = t.next().css("display");

        if(display === "none"){
            t.addClass("ov").next().stop(true,true).show();

            nParent
                .stop(true,true)
                    .animate({height:variable.height(t,"block")},variable.du,variable.mat);

            nt.removeClass("ov").next().stop(true,true).fadeOut(variable.du);

        }else{
            t.removeClass("ov").next().stop(true,true).fadeOut(variable.du);

        }

        tParent
            .stop(true,true)
                .animate({height:variable.height(t,display)},variable.du,variable.mat);
 
        event.preventDefault(); 
    }

    // -----

    variable.open = (button != undefined) ? variable.button : variable.item;
    variable.open.on("click",_in);

}
