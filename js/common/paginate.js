function paginate(viewNumber,viewListSize,total,thisIndex){
     //var viewNumber = 한 페이지에 보여질 페이지 갯수;
     //var viewListSize = 한 페이지에 보여질 목록 갯수;
     //var total = 전체 목록 갯수;
     //var thisIndex = 현재 페이지 번호;

     var param = $(".paginate");
     var maxPages = Math.floor(total/viewListSize)+1;
     var btnPrev = param.find(".dir").eq(1);
     var btnFirst = param.find(".dir").eq(0);

     var btnNext = param.find(".dir").eq(2);
     var btnLast = param.find(".dir").eq(3);

     var nextp = maxPages-thisIndex;
     var prevp = (maxPages-nextp)-1; 

     if(nextp > viewNumber){ if(nextp > viewNumber){ nextp = viewNumber } }
     if(prevp > viewNumber){ if(prevp > viewNumber){ prevp = viewNumber } }

     btnPrev.find('img').attr('alt','이전 '+prevp+' 페이지');
     btnNext.find('img').attr('alt','다음 '+nextp+' 페이지');

     if(thisIndex <= 1){
          btnPrev.hide();
          btnFirst.hide();
     }

     if(thisIndex >= maxPages){
          btnNext.hide();
          btnLast.hide();
     }
}