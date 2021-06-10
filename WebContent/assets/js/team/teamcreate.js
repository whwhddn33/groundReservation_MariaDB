function sendIt(){
	const createform=document.createform;
	var checkText = document.getElementById("checkText");
	
	if(createform.teamname.value=="" || createform.teamname.value==null){
		alert("팀명을 입력해 주세요");
		createform.teamname.focus();
		return false;
	}else{
		var pr = /^.{3,}$/;
		if(!pr.test(createform.teamname.value)){
			alert("팀명은 최소 3자 이상이어야 합니다.");
			return false;
		}
	}if (checkText.innerHTML != "사용 가능한 팀명입니다.") {
		alert("아이디 중복검사를 먼저 해주세요");
		return false;
	}if(createform.captainname.value=="" || createform.captainname.value==null){
		alert("주장이름을 입력해 주세요");
		createform.captainname.focus();
		return false;
	}if(createform.teamtel.value=="" || createform.teamtel.value==null){
		alert("전화번호를 입력해 주세요");
		createform.teamtel.focus();
		return false;
	}if(createform.teamlocal.value=="selectlocal" || createform.teamlocal.value==null){
		alert("지역을 선택해 주세요");
		createform.teamlocal.focus();
		return false;
	}if(createform.teamlevel.value=="selectlevel" || createform.teamlevel.value==null){
		alert("실력을 선택해 주세요");
		createform.teamlevel.focus();
		return false;
	}
	createform.submit();
}



$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){// 값이 변경되면
	        if(window.FileReader){// modern browser
	            var filename = $(this)[0].files[0].name;
	        } else {
	            var filename = $(this).val().split('/').pop().split('\\').pop();// 파일명만 추출
	        }
	        // 추출한 파일명 삽입
	        $(this).siblings('.uploadname').val(filename);
	    });
	});


function checkName(){
    return new Promise(function(resolve, reject){
      console.log('첫번째 실행');
      var teamName = $('input[name=teamname]').val();
      $.ajax({
    	  url:contextPath+'/team/TeamNameCheck.te', 
    	  type:'post',
    	  data:"teamname="+teamName,//teamname=test
        success : function(data){
        	console.log($.trim(data));
        	if($.trim(data)=="success"){
                $('#checkText').html("사용 가능한 팀명입니다.");  
                $("#checkText").css("color", "#4CAF50");
                resolve();
            }else{
                $('#checkText').html("중복된 팀명입니다.");
                $("#checkText").css("color", "#f44336");
                reject();
            }
              }
      });
    });
  }

function successFunction(){
	console.log('성공');
  return false;
}
function errorFunction(){
	console.log('에러');
    return false;
  }
   
checkName()
//성공 시
.then(checkInput)
.then(successFunction)
//실패 시
.catch(errorFunction);














//팀명 체크
//function checkName() {
//	var teamname = $('input[name=teamname]').val();
//    $.ajax({
//        url:contextPath+'/team/TeamNameCheck.te', 
//        type:'post',
//        data:"teamname="+teamname,//teamname=test
//        success:function(data){
//        	/*console.log($.trim(data));*/
//            if($.trim(data)=="success"){
//                $('#checkText').html("사용 가능한 팀명입니다.");  
//                $("#checkText").css("color", "#4CAF50");
//            }else{
//                $('#checkText').html("중복된 팀명입니다.");
//                $("#checkText").css("color", "#f44336");
//            }
//        },
//        error:function(request,status,error){
//        	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
//        }
//    });
//};
//
//function checkInput(){
//	var captainName=$('input[name=captainname]').val();
//	$.ajax({
//		url:contextPath+'/team/TeamInputCheck.te', 
//        type:'post',
//        data:"captainname="+captainName,
//        success:function(data){
//        	console.log($.trim(data));
//            if($.trim(data)=="fail"){
//                $('#checkInput').html("주장 이름을 입력해 주세요");
//                $("#checkInput").css("color", "#f44336");
//            }
//        },
//        error:function(request,status,error){
//        	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
//        }
//        
//	});
//};



 
