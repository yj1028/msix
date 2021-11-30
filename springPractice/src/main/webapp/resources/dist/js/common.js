/* 함수명 : chkSubmit(유효성 체크 대상, 메세지 내용)
   출력영역 : laert로
   예시 : if (!chkSubmit($('#keyword'), "검색어를")) return;
*/
function chkSubmit(item, msg){
	if (item.val().replace(/\s/g, "") ==""){
		alert(msg + " 입력해 주세요.");
		item.val("");
		item.focus();
		return false;
	} else {
		return true;
	}
}

/* 함수명: chkData(유효성 체크 대상, 메세지 내용)
 * 출력영역: alert로
 * 예시: if (!chkSubmit('#keyword', '검색어를')) return;
 */
function chkData(item, msg){
	if ($(item).val().replace(/\s/g, "") == ""){
		alert(msg + " 입력해 주세요. ");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}