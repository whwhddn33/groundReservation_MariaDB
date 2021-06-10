/*google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {
	var chart = new google.visualization.LineChart(document.getElementById('chart'));

    var data = new google.visualization.DataTable();
    //타입, 이름
     data.addColumn('string', '월');
     data.addColumn('number', '승');
     data.addRows([
    	 ['1월',0],
    	 ['2월',1],
    	 ['3월',2],
    	 ['4월',0],
    	 ['5월',3]
     ])
   
     var options = {
    		height :'80%',
	        width :'100%',
	        backgroundColor: 'transparent',
	        padding:'20%',
	        title: '월별 전적',
	        curveType: 'function',
	        fontSize: 12,
	        legendTextStyle: { color: '#FFF' },
	        titleTextStyle: { color: '#FFF' },
	        animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                startup: true,
                duration: 1000,
                easing: 'linear' },
       hAxis: {
         title: '',
         textStyle:{color: '#FFF'}	 
       },
       vAxis: {
         title: '',
         textStyle:{color: '#FFF'},	
         viewWindow:{min:0},
         format: '0'
       }
     };
      chart.draw(data, options);
      
    }*/