//** remeber */

//if (JSON.parse(localStorage.getItem('user_Id'))) {
//  document.querySelector('#remember_id').setAttribute('checked', true);
//  document.querySelector('#user_id').setAttribute('value', JSON.parse(localStorage.getItem('user_Id')).userId)
//}
//
//document.getElementById('remember_id').onclick = function () {
//  const checked = document.getElementById('remember_id').checked
//
//  if (checked) {
//    localStorage.setItem('user_Id', JSON.stringify({checked: true}));
//  } else {
//    localStorage.removeItem('user_Id');
//  }
//}
//
//document.getElementById('login_btn').onclick = function () {
//  const userId = JSON.parse(localStorage.getItem('user_Id'));
//
//  if (userId.checked) {
//    const id = document.getElementById('user_id').value;
//    localStorage.setItem('user_Id', JSON.stringify({...userId, userId: id}))
//  }
//}

/* naver login */

var naverLogin = new naver.LoginWithNaverId(
  {
     clientId: "pXAA8v0qsTAN9qONvPL9",
     callbackUrl: "http://localhost:1234/",
     isPopup: false,
     loginButton: {color: "green", type: 3, height: 44}
  }
);

naverLogin.init();


/** callback page - 로그인 후 main page에 넣을 script */

// var callbackNaverLogin = new naver.LoginWithNaverId(
//   {
//      clientId: "pXAA8v0qsTAN9qONvPL9",
//      callbackUrl: "http://localhost:1234/",
//      isPopup: false,
//      callbackHandle: true
//   }
// );
// callbackNaverLogin.init();

// window.addEventListener('load', function () {
//   callbackNaverLogin.getLoginStatus(function (status) {
//      if (status) {
//         var email = callbackNaverLogin.user.getEmail();
//         if( email == undefined || email == null) {
//            alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
//            callbackNaverLogin.reprompt();
//            return;
//         }
//         console.log(callbackNaverLogin.user) // 로그인 정보.
//      } else {
//         console.log("callback 처리에 실패하였습니다.");
//      }
//   });
// });

function tryLogin(){
	const loginform = document.loginform;

	if (loginform.userid.value == null || loginform.userid.value == "") {
		alert("아이디를 입력하세요.");
		loginform.userid.focus();
		return false;
	}
	if (loginform.userpw.value == null || loginform.userpw.value == "") {
		alert("비밀번호를 입력하세요.");
		loginform.userpw.focus();
		return false;
	}
	loginform.submit();
}