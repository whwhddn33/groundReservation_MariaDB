function sendIt(){
	const modifyform=document.modify;
	var checkText = document.getElementById("checkText");
	
	if(modifyform.teamname.value=="" || modifyform.teamname.value==null){
		alert("팀명을 입력해 주세요");
		modifyform.teamname.focus();
		return false;
	}else{
		var pr = /^.{3,}$/;
		if(!pr.test(createform.teamname.value)){
			alert("팀명은 최소 3자 이상이어야 합니다.");
			return false;
		}
	}
	if (checkText.innerHTML != "사용 가능한 팀명입니다.") {
		alert("아이디 중복검사를 먼저 해주세요");
		return false;
	}	
	if(modifyform.captainname.value=="" || modifyform.captainname.value==null){
		alert("주장이름을 입력해 주세요");
		modifyform.captainname.focus();
		return false;
	}if(modifyform.teamtel.value=="" || modifyform.teamtel.value==null){
		alert("전화번호를 입력해 주세요");
		modify.teamtel.focus();
		return false;
	}if(modifyform.teamlocal.value=="selectlocal" || modifyform.teamlocal.value==null){
		alert("지역을 선택해 주세요");
		modifyform.teamlocal.focus();
		return false;
	}if(modifyform.teamlevel.value=="selectlevel" || modifyform.teamlevel.value==null){
		alert("실력을 선택해 주세요");
		modifyform.teamlevel.focus();
		return false;
	}
	modifyform.submit();
}

$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            var filename = $(this)[0].files[0].name;
	        } else {
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        }

	        $(this).siblings('.upload-name').val(filename);
	    });
	});

function checkName() {
	var teamname = $('input[name=teamname]').val();
    $.ajax({
        url:contextPath+'/team/TeamNameCheck.te', 
        type:'post',
        data:"teamname="+teamname,//teamname=test
        success:function(data){
        	/*console.log($.trim(data));*/
            if($.trim(data)=="success"){
                $('#checkText').html("사용 가능한 팀명입니다.");  
                $("#checkText").css("color", "#4CAF50");
            }else{
                $('#checkText').html("중복된 팀명입니다.");
                $("#checkText").css("color", "#f44336");
            }
        },
        error:function(request,status,error){
        	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
        }
    });
};

function deleteFile(teamlogo_image){
	if($.browser.msie){
		$("input[name='"+filename+"']").replaceWith(("input[name='"+filename+"']").clone(true));
	}else{
		$("input[name='"+filename+"']").val("");
	}
}





 
