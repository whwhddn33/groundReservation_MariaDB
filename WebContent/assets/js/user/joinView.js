

// 아이디 중복 검사 함수 // 컨트롤러에서 action을 적용시키는 기능이니 추후에 추가!
	function checkId(){
		const useridTag = document.joinform.userid;
		var id = useridTag.value;
		var checkText = document.getElementById("checkText");
		if(id == '' || id==null){
			checkText.innerHTML="";
		}else{
			var xhr = new XMLHttpRequest();
			xhr.open("POST","/app/user/CheckId.me",true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("userid="+id);
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
					if(xhr.responseText.trim()=="ok"){
						checkText.innerHTML = "사용할 수 있는 아이디입니다."
					}else{
						checkText.innerHTML = "중복된 아이디입니다."
					}
				}
			}
		}
	}

// input:radio css를 위한 js
document.getElementById('male-btn').onclick = function() {
	document.querySelector('#female-radio').removeAttribute('checked', '')
	document.querySelector('#male-radio').setAttribute('checked', '');
}

document.getElementById('female-btn').onclick = function() {
	document.querySelector('#male-radio').removeAttribute('checked', '')
	document.querySelector('#female-radio').setAttribute('checked', '')
}

// 개인회원가입, 기업회원가입 탭 분류
document.getElementById('tab-btn-personal').onclick = function () {
  document.querySelector('#tab-btn-personal').classList.remove('no-seleted-item');
  document.querySelector('#tab-btn-personal').classList.add('seleted-item');
  document.querySelector('#tab-btn-company').classList.remove('seleted-item');
  document.querySelector('#tab-btn-company').classList.add('no-seleted-item');
}

document.getElementById('tab-btn-company').onclick = function () {
  document.querySelector('#tab-btn-personal').classList.remove('seleted-item');
  document.querySelector('#tab-btn-personal').classList.add('no-seleted-item');
  document.querySelector('#tab-btn-company').classList.remove('no-seleted-item');
  document.querySelector('#tab-btn-company').classList.add('seleted-item');
}

// 주소 검색 API
function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을
															// 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("sample6_extraAddress").value = extraAddr;

					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
}

// 회원가입 버튼 클릭시 실행되는 함수
function sendit() {
	const joinform = document.joinform;
	if (joinform.userid.value == "" || joinform.userid.value == null) {
		alert("아이디를 입력하세요.");
		joinform.userid.focus();
		return false;
	}
	var checkText = document.getElementById("checkText");
/*	if (checkText.innerHTML != "사용할 수 있는 아이디입니다.") {
		alert("아이디 중복검사를 확인해주세요!");
		return false;
	}*/
	if (joinform.userpw.value == "" || joinform.userpw.value == null) {
		alert("비밀번호를 입력하세요.");
		joinform.userpw.focus();
		return false;
	} else {// 정규표현식 적용하기 - 비밀번호 검사
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		// A~Z, a~z, 0~9, 특수문자들, 8자리 인지 검사하는 정규표현식
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~!@#$%^&*-]).{8,}$/;
		if (!reg.test(joinform.userpw.value)) {
			alert("비밀번호는 8자이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다.");
			return false;
		} else if (/(\w)\1\1\1/.test(joinform.userpw.value)) { // 4개의 연속된 문자열이
																// 있는지 검사하는
																// 정규표현식
			alert("비밀번호는 같은 문자를 4번 이상 사용할 수 없습니다.");
			return false;
		} else if (joinform.userpw.value.search(/\s/) != -1) { // 공백이 있는지 검사하는
																// 정규 표현식
			alert("비밀번호에 공백을 포함할 수 없습니다.");
			return false;
		} else if (hangle.test(joinform.userpw.value)) {// 한글이 포함되어 있는지 검사하는 정규
														// 표현식
			alert("비밀번호에 한글을 포함할 수 없습니다.");
			return false;
		}
	}
	if (joinform.username.value == "" || joinform.username.value == null) {
		alert("이름을 입력하세요.");
		joinform.username.focus();
		return false;
	}
	if (joinform.userphone.value == "" || joinform.userphone.value == null) {
		alert("핸드폰 번호를 입력하세요.");
		joinform.userphone.focus();
		return false;
	}
	if (joinform.userpostcode.value == ""
			|| joinform.userpostcode.value == null) {
		alert("우편번호를 입력하세요.");
		joinform.findaddr.focus();
		return false;
	}
	if (joinform.useraddr.value == "" || joinform.useraddr.value == null) {
		alert("주소를 입력하세요.");
		joinform.findaddr.focus();
		return false;
	}
	if (joinform.useraddrdetail.value == ""
			|| joinform.useraddrdetail.value == null) {
		alert("상세주소를 입력하세요.");
		joinform.findaddr.focus();
		return false;
	}

	joinform.submit();
}
