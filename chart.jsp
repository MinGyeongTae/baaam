<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	//잔액
	int balance = 3000000;
	int remain = 0;
	//자동이체
	String jadong1_str = "";
	String jadong2_str = "";
	String jadong3_str = "";
	String jadong4_str = "";
	String jadong5_str = "";
	
	int jadong1_day = 0;
	int jadong2_day = 0;
	int jadong3_day = 0;
	int jadong4_day = 0;
	int jadong5_day = 0;

	int jadong1_num = 0;
	int jadong2_num = 0;
	int jadong3_num = 0;
	int jadong4_num = 0;
	int jadong5_num = 0;

	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("balance") != null){
		balance = Integer.parseInt(request.getParameter("balance"));	
	}

	if(request.getParameter("jadong1_str") != null){
		jadong1_str = request.getParameter("jadong1_str");
	}
	if(request.getParameter("jadong2_str") != null){
		jadong2_str = request.getParameter("jadong2_str");
	}
	if(request.getParameter("jadong3_str") != null){
		jadong3_str = request.getParameter("jadong3_str");
	}
	if(request.getParameter("jadong4_str") != null){
		jadong4_str = request.getParameter("jadong4_str");
	}
	if(request.getParameter("jadong5_str") != null){
		jadong5_str = request.getParameter("jadong5_str");
	}

	
	if(!"".equals(jadong1_str)){
		jadong1_num = Integer.parseInt(request.getParameter("jadong1_num"));
		jadong1_day = Integer.parseInt(request.getParameter("jadong1_day"));	
	}
	if(!"".equals(jadong2_str)){
		jadong2_num = Integer.parseInt(request.getParameter("jadong2_num"));
		jadong2_day = Integer.parseInt(request.getParameter("jadong2_day"));		
	}
	if(!"".equals(jadong3_str)){
		jadong3_num = Integer.parseInt(request.getParameter("jadong3_num"));
		jadong3_day = Integer.parseInt(request.getParameter("jadong3_day"));		
	}
	if(!"".equals(jadong4_str)){
		jadong4_num = Integer.parseInt(request.getParameter("jadong4_num"));
		jadong4_day = Integer.parseInt(request.getParameter("jadong4_day"));		
	}
	if(!"".equals(jadong5_str)){
		jadong5_num = Integer.parseInt(request.getParameter("jadong5_num"));
		jadong5_day = Integer.parseInt(request.getParameter("jadong5_day"));		
	}
	
	remain=balance -(jadong1_num + jadong2_num + jadong3_num + jadong4_num + jadong5_num);
	
%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

	<!-- 부트스트랩 -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default">
		<div class='container'>
			<div class="navbar-header">
		      	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
		      	</button>
		      	<a class="navbar-brand" href="#"><img src="image/logo40.png"></a>
		      	<a class="navbar-brand" href="#">baaam.</a>
		    </div>
    		
		</div>
	</nav>
	<div class="container">
		<a class="main" href="modify_regular.html">	
			<h1 class="purple">월급통장 
				<small class="float-right">NH농협 302-0********-71</small>
			</h1>
	        <h2 class="black">
	           잔액<span class="float-right" id="balance"></span>
	        </h2>
	        <hr>
	        <div class="form-group">
	            <h4 class="purple">예약된 자동이체</h4>
	        </div>
		    <ul class="form-group">
				<li><span id="jadong1_str">#</span><span class="float-right" id="jadong1_num"></span></li>
				<li><span id="jadong2_str">#</span><span class="float-right" id="jadong2_num"></span></li>
				<li><span id="jadong3_str">#</span><span class="float-right" id="jadong3_num"></span></li>
				<li><span id="jadong4_str">#</span><span class="float-right" id="jadong4_num"></span></li>
				<li><span id="jadong5_str">#</span><span class="float-right" id="jadong5_num"></span></li>
		    </ul>
	        <hr>
	        <h3 class="form-group">
	           <span>자동이체 후 남을 돈</span>
	           <span class="float-right" id="remain"></span>
	        </h3>
        </a>
	</div>
	<div class = "container">
		<h3>이체 계좌 관리 </h3>
		
		<div id="chart_div" style="width:100%; height:500px;"></div>
	
		<div class="form-group">
			<!-- <a class="btn btn-default btn-lg btn-block" href="join.html">이체하기</a> -->
			<a class="btn btn-default btn-lg btn-block" onclick="alert('이체되었습니다.');">이체하기</a>
		</div>
	</div>
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/jquery-2.1.4.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
	var data;
	var chart;

      // Load the Visualization API and the piechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create our data table.
        data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
                  	['living 250000', 250000],
                  	['date 100000', 100000],
                  	['fee 500000', 500000],
                  	['remain <%=remain-250000-100000-500000%>',<%=remain-250000-100000-500000%>],
                  	['add',<%=remain*0.1%>]
                  	]);

        // Set chart options
        var options = {
        	legend: 'none',
        	pieSliceText : 'label'
        };

        // Instantiate and draw our chart, passing in some options.
        chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        google.visualization.events.addListener(chart, 'select', selectHandler);
        chart.draw(data, options);
    }

    function selectHandler(e) {
    	var selectedItem = chart.getSelection()[0];
    	var value = data.getValue(selectedItem.row, 0);
        
        //location.href = "http://www.naver.com";
        console.log ('legend onClick', event);
        console.log('legd item', data.kc[0][0]);
        //alert(data.getValue(chart.getSelection()[0].row, 1));
        location.href = "modifytransfer.jsp?title="+data.getValue(chart.getSelection()[0].row, 0) + "&remain="+<%=remain%> + "&cur_cost="+data.getValue(chart.getSelection()[0].row, 1)+"&"+str;
    }

</script>
</html>


<script type="text/javascript">
	Number.prototype.number_format = function(round_decimal) {
		 
	    return this.toFixed(round_decimal).replace(/(\d)(?=(\d{3})+$)/g, "$1,");
	};

	var balance = <%=balance%>;
	var jadong1_str = "<%=jadong1_str%>";
	var jadong2_str = "<%=jadong2_str%>";
	var jadong3_str = "<%=jadong3_str%>";
	var jadong4_str = "<%=jadong4_str%>";
	var jadong5_str = "<%=jadong5_str%>";
	
	var jadong1_day = "<%=jadong1_day%>";
	var jadong2_day = "<%=jadong2_day%>";
	var jadong3_day = "<%=jadong3_day%>";
	var jadong4_day = "<%=jadong4_day%>";
	var jadong5_day = "<%=jadong5_day%>";
	
	var jadong1_num = <%=jadong1_num%>;
	var jadong2_num = <%=jadong2_num%>;
	var jadong3_num = <%=jadong3_num%>;
	var jadong4_num = <%=jadong4_num%>;
	var jadong5_num = <%=jadong5_num%>;
	
	var remain = balance - (jadong1_num + jadong2_num + jadong3_num + jadong4_num + jadong5_num);
</script>
<script type="text/javascript">
$("#balance").html(balance.number_format()+"원");
$("#jadong1_str").html(jadong1_str);
$("#jadong2_str").html(jadong2_str);
$("#jadong3_str").html(jadong3_str);
$("#jadong4_str").html(jadong4_str);
$("#jadong5_str").html(jadong5_str);
if(jadong1_num!=0){$("#jadong1_num").html("-"+jadong1_num.number_format()+"원");}
if(jadong2_num!=0){$("#jadong2_num").html("-"+jadong2_num.number_format()+"원");}
if(jadong3_num!=0){$("#jadong3_num").html("-"+jadong3_num.number_format()+"원");}
if(jadong4_num!=0){$("#jadong4_num").html("-"+jadong4_num.number_format()+"원");}
if(jadong5_num!=0){$("#jadong5_num").html("-"+jadong5_num.number_format()+"원");}
$("#remain").html(remain.number_format()+"원");

var modi_href= "modify_regular.jsp?";
var str = "";
if(jadong1_str !== ""){ str = str+ "jadong1_str=" + jadong1_str;}
if(jadong2_str !== ""){ str = str+ "&"+ "jadong2_str=" + jadong2_str;}
if(jadong3_str !== ""){ str = str+ "&"+ "jadong3_str=" + jadong3_str;}
if(jadong4_str !== ""){ str = str+ "&"+ "jadong4_str=" + jadong4_str;}
if(jadong5_str !== ""){ str = str+ "&"+ "jadong5_str=" + jadong5_str;}

if(jadong1_day != 0){ str = str+ "&"+"jadong1_day=" + jadong1_day;}
if(jadong2_day != 0){ str = str+ "&"+"jadong2_day=" + jadong2_day;}
if(jadong3_day != 0){ str = str+ "&"+"jadong3_day=" + jadong3_day;}
if(jadong4_day != 0){ str = str+ "&"+"jadong4_day=" + jadong4_day;}
if(jadong5_day != 0){ str = str+ "&"+"jadong5_day=" + jadong5_day;}

if(jadong1_num != 0){ str = str+ "&"+"jadong1_num=" + jadong1_num;}
if(jadong2_num != 0){ str = str+ "&"+"jadong2_num=" + jadong2_num;}
if(jadong3_num != 0){ str = str+ "&"+"jadong3_num=" + jadong3_num;}
if(jadong4_num != 0){ str = str+ "&"+"jadong4_num=" + jadong4_num;}
if(jadong5_num != 0){ str = str+ "&"+"jadong5_num=" + jadong5_num;}
$(".main").attr('href',modi_href+str);
</script>



