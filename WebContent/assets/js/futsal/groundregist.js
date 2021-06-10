/**
 * 
 */

$(document).ready(function(){
	hottime();
	weekendhottime();
	function hottime(){
		tag = '';
		tag +='평일 핫타임 가격 지정<br>시작시간<select name = weekDaystarttime id = starttime><option value="0">- 시간선택  -</option>';
		for (var i = 0,j = 1; i <= 22, j <=12; i+=2,j++) {
			tag += '<option value = '+j+'>'+(i<10?'0'+i:i)+':00</option>'
		}
		tag += '</select>끝시간<select name = weekDayendtime id = endtime><option value="0">- 시간선택  -</option>';
		for (var i = 0,j = 1; i < 22, j <=12; i+=2,j++) {
			tag += '<option value = '+j+'>'+(i<10?'0'+i:i)+':00</option>'
		}
		tag +='</select>가격입력<input name = weekDayHotTimeFee type="text" placeholder="가격입력">';
		$("#weekDayHot").html(tag);
	}
	
	function weekendhottime(){
		tag = '';
		tag +='주말 핫타임 가격 지정<br>시작시간<select name = weekEndstarttime id = starttime><option value="0">- 시간선택  -</option>';
		for (var i = 0,j = 1; i < 22, j <=12; i+=2,j++) {
			tag += '<option value = '+j+'>'+(i<10?'0'+i:i)+':00</option>'
		}
		tag += '</select>끝시간<select name = weekEndEndtime id = endtime><option value="0">- 시간선택  -</option>';
		for (var i = 0,j = 1; i < 22, j <=12; i+=2,j++) {
			tag += '<option value = '+j+'>'+(i<10?'0'+i:i)+':00</option>'
		}
		tag +='</select>가격입력<input name = weekEndHotTimeFee type="text" placeholder="가격입력">';
		$("#weekEndHot").html(tag);
	}
	document.addEventListener('keydown', function(event) {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	        tagstack();
	    }
	}, true);
});

var tagArr = new Array();
function tagstack(){
	if($('#hashtag').val() != ''){
		var stacktag = '';
		console.log($('#hashtag'))
		tagArr.push($('#hashtag').val());
		console.log(tagArr[0]);
		$('#hashtag').val('');
		$('#tagdisplay').html('');
		for (var i = 0; i < tagArr.length; i++) {
			$('#tagdisplay').append('<div id = tagString>#'+tagArr[i]+'<button class = tagRemoveBtn type = "button" onclick = "removetag(this)">x</button></div>');
		}
	}
}
function Hashinputtag(epuserid){
	console.log('Hashinputtag()');
		$('#Hashinput').val(tagArr);
		$('#epuserid').val(epuserid);
		document.registForm.submit();
}

function removetag(e){
	spliceVal = $(e).parent().text();
	tagArr.splice($(e).parent().text().substr(1,(spliceVal.length-2)),1);
	$(e).parent().remove();
}

function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을
						addr = data.roadAddress;
						mapMaker(addr);
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
						mapMaker(addr);
					}
					if (data.userSelectedType === 'R') {
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						document.getElementById("sample6_extraAddress").value = extraAddr;
					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
}
function mapMaker(addr){
	$('#makeMap').html('<div id="map" style="width:100%;height:350px;"></div>');
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 10 // 지도의 확대 레벨
	    };  
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	var geocoder = new kakao.maps.services.Geocoder();
	geocoder.addressSearch(addr, function(result, status) {
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        
	        infowindow.open(map, marker);
	        map.setCenter(coords);
	    } 
	});
}