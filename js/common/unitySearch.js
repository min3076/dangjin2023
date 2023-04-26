
/* 검색*/
function windowsSearchOpen(url) {
    winPp = window.open( url, "WIN_TK", "width=907, height=600, resizable=no,scrollbars=yes");
    winPp.focus();
}

function unitySearch(){
    var frm = document.forms.searchFrm;
    var sField = frm.qt.value;
    if(sField.length > 0){
        /*
        frm.target = "";
        searchAlert();
        return;
        */
        windowsSearchOpen("");
        frm.target = "WIN_TK";        
        frm.action="http://search.yesan.go.kr/RSA/front/Search.jsp";        
        return true;        
    }else{
        alert("검색어를 입력하세요");
        return false;
    }
}