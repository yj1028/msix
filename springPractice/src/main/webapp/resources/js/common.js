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

function chkData(item,msg){

   if($(item).val().replace(/\s/g,"")==""){

      $(item).attr('placeholder',msg+'입력해주세요.');

      $(item).val("");

      $(item).focus();

      return false;

   }else{

      return true;
	}
}