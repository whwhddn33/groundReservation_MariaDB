/**
 * 로그인 회원가입 버튼 클릭 js
 */
    $(document).click(function(e){
 		if(e.target.className =="indexBox"){return false}
 		$(".indexBox").stop().fadeOut(500);
 	});
    
	function signupBtnClick(){
		console.log("버튼클릭");
		var tag = '';
		$('#indexBtn').show();
		tag +='<div class = indexBox>';
		tag +='<div id = indexlogo>회원가입</div>';
		tag +='<button id = joinbtn1 type = "button" onclick="location.href =\''+contextPath+'/app/user/joinIndividualView.me\'"><i class="fas fa-male"></i><br><br>개인</button>'
		tag +='<button id = joinbtn2 type = "button" onclick="location.href =\''+contextPath+'/app/user/joinEnterpriseView.me\'"><i class="far fa-building"></i><br><br>기업</button>'
		tag +='</div>';
			$('#indexBtn').html(tag);
	}
	
	function loginBtnClick(){
			console.log("버튼클릭");
			var tag = '';
			$('#indexBtn').show();
			tag +='<div class = indexBox>';
			tag +='<div id = indexlogo>로그인</div>';
			tag +='<button id = joinbtn1 type = "button" onclick="location.href =\''+contextPath+'/app/user/loginView.me\'"><i class="fas fa-male"></i><br><br>개인</button>'
			tag +='<button id = joinbtn2 type = "button" onclick="location.href =\''+contextPath+'/app/user/enterpriseLoginView.me\'"><i class="far fa-building"></i><br><br>기업</button>'
			tag +='</div>';
				$('#indexBtn').html(tag);
	}