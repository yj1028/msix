/*chkSubmit(유효성 체크 대상, 메시지 내용)

예시 : if(!chkSubmit($('#keyword'),"검색어를"))*/

function chkSubmit(item, msg){

   if(item.val().replace(/\s/g,"")==""){

      item.attr('placeholder',msg+'입력해주세요.');

      item.val("");

      item.focus();

      return false;

   }else{

      return true;

   }

}

function chkData(item, msg){

   if($(item).val().replace(/\s/g,"")==""){

      $(item).attr('placeholder',msg+'입력해주세요.');

      $(item).val("");

      $(item).focus();

      return false;

   }else{

      return true;
	}
}

/* 유효성 체크 대상, 출력 영역, 메시지 내용.
	출력영역: 매개변수 두 번째 출력영역에.
 */
function formCheck(main, item, msg){
	if($(main).val().replace(/\s/g,"")==""){
		$(item).css("color","#000099").html(msg+" 입력해 주세요");
		$(main).val("");
		return false;
	}else{
		return true;
	}
}

/*	함수명: chkFile(파일명)
	설명: 이미지 파일 여부를 확인하기 위해 확장자 확인 함수.*/
function chkFile(item){
	/* 배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우에는 -1을 반환한다.)
		jQuery.inArray(찾을 값, 검색 대상의 배열)
		
		jquery에서 pop함수는 마지막(확장자)원소를 반환해오는 함수이다.
		split은 문자열을 배열로 변환하는 함수.
		해당 요소를 찾아오지 못하면 -1을 반환하여 alert를 출력하도록 한다.
	 */
	let ext = item.val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext, ['gif','png','jpg','jpeg']) == -1){
		alert('gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.');
		return false;
	}else{
		return true;
	}
}

