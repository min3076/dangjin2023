var pagingfn = {
    type : "default", //  fix or default. 
    offset : "5",
    totalCnt : "0", 
    currPage : "1",
    splitCnt : "10",
    pageOffset : "10",
    targetId : "#pageNav",
    initPage : function(){   
    pagingfn.currPage = 1;
 //       if (pagingfn.offset%2 == "0")
 //           pagingfn.offset = parseInt(pagingfn.offset)+1;
        pagingfn.makePageNav(1);  
    } ,
  
    makePageNav : function(i) {       
        var str = "";  
        var totalPage = Math.ceil((pagingfn.totalCnt / pagingfn.splitCnt)); 
        str = pagingfn.makePageNavStr(totalPage, i);
        $(pagingfn.targetId).empty();  
        $(pagingfn.targetId).append(str);
        pagingfn.appendListStr(); 
    } ,
      makePageNavStr : function(totalPage, curr) {
        pagingfn.currPage = curr;
        var i = 1; 
        var str = "";
        
        if((pagingfn.offset < totalPage && pagingfn.currPage > 2) || (pagingfn.currPage > 1)){
        	str += "<span class='dir'>";
        }
        
        if (pagingfn.offset < totalPage && pagingfn.currPage > 2) {   
            str += "<a href=\"javascript:pagingfn.makePageNav('1');\" class='first'>처음</a>";
        }
        
        if (pagingfn.currPage > 1) {  
            str += "<a href=\"javascript:pagingfn.makePageNav('" + parseInt(parseInt(pagingfn.currPage) - 1) + "');\" class='prev'>이전</a>";
        }
        
        if((pagingfn.offset < totalPage && pagingfn.currPage > 2) || (pagingfn.currPage > 1)){
        	str += "</span>";
        }
        
        
        var multiplyCnt = Math.ceil((pagingfn.currPage / pagingfn.offset)); 
        var temp=1;
        
        var endOffset = pagingfn.pageOffset;
        endOffset = endOffset * multiplyCnt;  
        if (endOffset > totalPage)
            endOffset = totalPage; 
       
        str += "<span class='dir'>";
        	
        if (pagingfn.type === "default"){ 
//            while (temp < multiplyCnt) {  
//                i = i + parseInt(pagingfn.offset);
//                temp += 1;
//            }  
            while (i <= endOffset) { 
                if (i == pagingfn.currPage) {
                    str += "<span class=\"number\"><a href=\"#\"><em>" + i + "</em></a></span>";
                }
                else {
                    str += "<span class=\"number\"><a href=\"javascript:pagingfn.makePageNav('"+i+"');\">" + i + "</a></span>";
                }
                i += 1;
            }
        }
        else{ 
//            while (temp < multiplyCnt) {      
//                i = i + parseInt(pagingfn.offset);
//                temp += 1;
//            }   
            while (i <= endOffset) { 
                if (i == pagingfn.currPage) {
                	str += "<span class=\"number\"><a href=\"#\"><em>" + i + "</em></a></span>";
                }
                else {
                    str += "<span class=\"number\"><a href=\"javascript:pagingfn.makePageNav('"+i+"');\">" + i + "</a></span>";
                }
                i += 1;
            } 
        }
        str += "</span>";
        
        if ((pagingfn.currPage < totalPage) || (pagingfn.offset < totalPage && pagingfn.currPage < totalPage)) {
        	str += "<span class='dir'>";
        }
        
        if (pagingfn.currPage < totalPage) {
        	str += "<a href=\"javascript:pagingfn.makePageNav('" + parseInt(parseInt(pagingfn.currPage) + 1) + "');\" class='next'>다음</a>";
        }
        
        if (pagingfn.offset < totalPage && pagingfn.currPage < totalPage) {
            str += "<a href=\"javascript:pagingfn.makePageNav('" + totalPage + "');\" class='last'>마지막</a>";
        }
        
        if ((pagingfn.currPage < totalPage) || (pagingfn.offset < totalPage && pagingfn.currPage < totalPage)) {
        	str += "</span>";  
        }
        
        return str;
    } 
}

