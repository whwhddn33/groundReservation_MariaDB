var tryCount = 1;// 함수호출횟수
var tags = '';
var lastsign = 0;
var cycleController = 0;
console.log(tryCount);
var addr = "서울 중구 세종대로 110";
var mapTop = $("#mapwrapper").offset().top;

$(document).ready(function(){
	callAjax();
	mapMaker(addr)
	$(".custom_calendar_table").on("click", "td", function () {
		tryCount = 1;
		console.log();
		tags = '';
		lastsign = 0;
		if (lastsign ===0)callAjax();
	});
	$("#futsalcontent").on("mouseenter",".futsallist", function () {
		console.log("listclick");
		addr = $(this).children().children("#addr").text().substr(5);
		mapMaker(addr);
	});
	$(window).scroll(function(){
		var scrollBottom = $(document).height() - $(window).height() - $(window).scrollTop();
		console.log(scrollBottom);
		if(scrollBottom <=30 && cycleController ==0){
			cycleController++;
			console.log("0입니다 : "+scrollBottom);
			if (lastsign ===0)callAjax();
			console.log("스크롤시 : "+tryCount);
		}else if(scrollBottom >=30) cycleController = 0;
	})
	$(window).scroll(function(){
		console.log("$(window).scrollTop() : " +$(window).scrollTop());
		if ($(window).scrollTop()>600) {
			console.log("600이상")
			$("#mapwrapper").addClass('slide_down');
		}else{
		$("#mapwrapper").removeClass('slide_down');
		}
	})
});
	function callAjax(){
		//연월
		var year = new Date().getFullYear(),
			month = new Date().getMonth() + 1;
		
		//선택된 날짜의 연월일
		var selectDay = $('.select_day').text();
			selectDay = selectDay<10?'0'+selectDay:selectDay;
		//
		var selectMonth = month<10?'0'+month:month;
			selectYear = year,
			selectDate = ''.concat(selectYear+'.',selectMonth+'.',selectDay);

		$.ajax({
			url : contextPath+"/futsallistLoad.fu",
			type : "get",
			data: {"selectDate":selectDate , "tryCount" : tryCount},
			dataType:"json",
			beforeSend : showLoading()
		})
		.done(function(data){
			console.log(tryCount);
			console.log(contextPath+"/futsalFrontController/futsallistLoad.fu");
			console.log("통신성공");
			console.log(data);
			tryCount++;
			console.log("통신성공시 "+tryCount);
			console.log("json 로그 : " + data.json.length);
			if(data.json.length == 0 && lastsign ===0){
				tags += "<div id = endlist><a href=\"#\">끝까지 다봤어요!↑(click!)</a></div>"
				lastsign ++;
				$(".contents").html(tags);
			}else{
				tags = '';
				console.log("tags 초기화");
				tagsStack(data);
			}
		})
		.fail(function(xhr,error){
			console.log(contextPath+"/futsalFrontController/futsallistLoad.fu");
			console.log(contextPath+"/futsalFrontController/futsallistLoad.fu");
			console.log(tryCount);
			console.log("통신실패");
			$(".contents").text(".fail");
			console.log("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		})
	}
	function tagsStack(data) {
		console.log(data.json.length)
		for(i = 0; i <data.json.length; i++){
			var hashTagArr = [];
			if(data.json[i].hashTag != null){
			hashTagArr = data.json[i].hashTag.split(',');
			console.log(hashTagArr);
			}
			tags += '<div class = futsallist id = '+((tryCount*6-5)+i)+'>';
			if(data.json[i].imgrealname != null){
				tags += "<div id = imgdiv style = 'background-image: url(../app/futsal/img/"+data.json[i].imgrealname+");background-size:cover;'></div>";
			}else{
				tags += "<div><img alt='등록된이미지가 없습니다' src=''></div>";
			}
			tags += "<div>";
//			tags += "contents"+((tryCount*10-9)+i)+"<br>";
			tags += "구장이름 : "+data.json[i].groundname+"<br>";
			tags += "<div id = addr>주소 : "+data.json[i].useraddr+"</div><br>";
			if (data.json[i].hashTag != null) {
				for (var j = 0; j < hashTagArr.length; j++) {
					if(j==4){
						tags += "<div id = tagString>...</div><br>";
						break;
					}
					tags += "<div id = tagString>#"+hashTagArr[j]+"</div>";
				}
			}
			tags += "<a class = listbutton href='"+contextPath+"/reservation.fu?groundnum="+data.json[i].groundnum+"'>예약하기</a>";
			tags += "</div>"
			tags += "</div>";
		}
		console.log(tags);
		$(".contents").html(tags);
		console.log("tagstack : "+ tryCount);
	}
	function mapMaker(addr){
		$('#makeMap').html('<div id="map" style="width:100%;"></div>');
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
	function showLoading(){
		var tag = '<div id = loading style="position:absolute; top : 50%; left:50%; width : 200px; height : 200px; background-color : white; z-index : 2000; opacity : .8; line-height : 100px;">Loading...!</div>';
		$('#futsalcontent').html(tag);
	}