function sendIt(){
	const joinform=document.joinform;
	if(joinform.username.value=="" || joinform.username.value==null){
		alert("이름을 입력해 주세요");
		joinform.username.focus();
		return false;
	}if(joinform.nickname.value=="" || joinform.nickname.value==null){
		alert("닉네임을 입력해 주세요");
		joinform.nickname.focus();
		return false;
	}if(joinform.usertel.value=="" || joinform.usertel.value==null){
		alert("연락처를 입력해 주세요");
		joinform.usertel.focus();
		return false;
	}if(joinform.mainposition.value=="" || joinform.mainposition.value==null){
		alert("주 포지션을 입력해 주세요");
		joinform.mainposition.focus();
		return false;
	}else{
		$(joinform).submit();
	}
	
}