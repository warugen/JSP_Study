/**
 * join_frm.id 는 3글자 이상
 * join_frm.pw == join_frm.pwChk, 이름, 메일체크
 */
function infoConfirm() {
	if(join_frm.id.value.length < 3){
		alert('아이디는 반드시 3글자 이상이여야한다');
		join_frm.id.focus();
		return;
	}
	
	if(!join_frm.pw.value){
		alert('비밀번호 입력하라');
		join_frm.pw.focus();
		return;
	}
	// 비밀번호체크
	if(join_frm.pw.value!=join_frm.pwChk.value){
		alert('비밀번호 맟춰');
		join_frm.pw.value = "";
		join_frm.pwChk.value = "";
		join_frm.pw.focus();
		return;
	}
	// 이름 체크
	if(!join_frm.name.value){
		alert('이름 입력필수');
		join_frm.name.focus();
		return;
	}
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
	
	join_frm.submit();	// 강제로 submit 이벤트 발생 이러면 폼에서 required="required"가 적용이 안된다.
}