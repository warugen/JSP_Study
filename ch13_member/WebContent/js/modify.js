/**
 * 정보 수정시 
 * modify_frm.pw == modify_frm.pwChk, 이름, 메일체크
 */
function infoConfirm() {
	
	// 새비밀번호체크
	if(modify_frm.pw.value!=modify_frm.pwChk.value){
		alert('새로운 비밀번호 맟춰');
		modify_frm.pw.value = "";
		modify_frm.pwChk.value = "";
		modify_frm.pw.focus();
		return false;
	}
	/**
	// 메일형식 체크
	if(join_frm.email.value.length!=0 && 
			(join_frm.email.value.indexOf('@') <= 0) ||
			join_frm.email.value.lastIndexOf('@') == join_frm.email.value.length-1 ||
			join_frm.email.value.lastIndexOf('@') > join_frm.email.value.lastIndexOf('.')){
		
		alert('메일형식 확인하라');
		join_frm.email.value = "";
		join_frm.email.focus();
		return;
	}
	// 생일체크
	if(join_frm.tmpBirth.value.length == 0){
		alert('생일 입력해');
		join_frm.tmpBirth.focus();
		return;
	}
	*/
}