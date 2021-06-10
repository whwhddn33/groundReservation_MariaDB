/**
 * 
 */

function weatherSetter(getdangi,getjungi,getupdateTime) {
	var dangi = getdangi;
	var jungi = getjungi;
	var updateTime = getupdateTime;
	var dangiItem = dangi.response.body.items.item;
	var dangiArray = new Array();
	var dangiPOPArray = new Array();
	var dangiSKYArray = new Array();
	var dangiInfo = {};
	
	console.log(dangi);
	console.log(jungi);
	
	for(i =0;i<dangiItem.length; i++){
		if(dangiItem[i].fcstTime==='1200'&&(dangiItem[i].category==='POP'||dangiItem[i].category==='SKY')){
			if(dangiItem[i].category==='POP'){
				dangiInfo = new Object();
				dangiInfo.Date = dangiItem[i].fcstDate;
				dangiInfo.POP = dangiItem[i].fcstValue;
			}
			if(dangiItem[i].category==='SKY'){
				dangiInfo.SKY = dangiItem[i].fcstValue;
				dangiArray.push(dangiInfo);
			}
		}
	}
	
	var jungiItem = jungi.response.body.items.item[0];
	
	for(i=0;i<dangiArray.length;i++){
		if(parseInt(dangiArray[i].Date) < parseInt(updateTime)){
			continue;
		}else{
			if (dangiArray[i].SKY <6) {
				dangiArray[i].SKY = '맑음';
			}else if(dangiArray[i].SKY<8){
				dangiArray[i].SKY = '구름많음';
			}else dangiArray[i].SKY ='흐림';
			document.getElementById('SKY'+i).innerHTML = dangiArray[i].SKY;
			document.getElementById('POP'+i).innerHTML = dangiArray[i].POP+"%";		
		}
	}
	
	if(new Date().getHours()<5){
		document.getElementById('SKY3').innerHTML = jungiItem.wf3Am;
		document.getElementById('POP3').innerHTML = jungiItem.rnSt3Am+"%";
		document.getElementById('SKY4').innerHTML = jungiItem.wf4Am;
		document.getElementById('POP4').innerHTML = jungiItem.rnSt4Am+"%";
		document.getElementById('SKY5').innerHTML = jungiItem.wf5Am;
		document.getElementById('POP5').innerHTML = jungiItem.rnSt5Am+"%";
		document.getElementById('SKY6').innerHTML = jungiItem.wf6Am;
		document.getElementById('POP6').innerHTML = jungiItem.rnSt6Am+"%";
	}else if(new Date().getHours()>=5){
		document.getElementById('SKY3').innerHTML = jungiItem.wf3Am;
		document.getElementById('POP3').innerHTML = jungiItem.rnSt3Am+"%";
		document.getElementById('SKY4').innerHTML = jungiItem.wf4Am;
		document.getElementById('POP4').innerHTML = jungiItem.rnSt4Am+"%";
		document.getElementById('SKY5').innerHTML = jungiItem.wf5Am;
		document.getElementById('POP5').innerHTML = jungiItem.rnSt5Am+"%";
		document.getElementById('SKY6').innerHTML = jungiItem.wf6Am;
		document.getElementById('POP6').innerHTML = jungiItem.rnSt6Am+"%";
	}
}