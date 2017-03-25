<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
        <title>뺌::이체금액 수정</title>
    
        <!-- 부트스트랩 -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    
        <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
        <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script type="text/javascript" src="jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="seekbar.js"></script>
        <script type="text/javascript" src="toast.js"></script>
        <link rel="stylesheet" type="text/css" href="seekbar.css"/>
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
		      	<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-chevron-left"></span></a>
		      	
		      	<a class="navbar-brand" href="#">자동이체 목록 편집 </a>
		    </div>
    		
		</div>
	</nav>
    <div class="container">
		
        <div class="form-group">
        	<ul class="account-list">
				<li>
					<a class="main1" id="1" href="addregulartransfer.jsp?">
						<p id="">매달 xx일</p>
						<h3><span class="" id="jadong1_str"></span><span class="float-right" id="jadong1_num"></span></h3>		
					</a>
				</li>
				
				<li>
					<a class="main1" id="2" href="addregulartransfer.jsp?">
						<p id="">매달 xx일</p>
						<h3><span class="" id="jadong2_str"></span><span class="float-right" id="jadong2_num"></span></h3>		
					</a>
				</li>
				<li>
					<a class="main1" id="3" href="addregulartransfer.jsp?">
						<p id="">매달 xx일</p>
						<h3><span class="" id="jadong3_str"></span><span class="float-right" id="jadong3_num"></span></h3>		
					</a>
				</li>
				<li>
					<a class="main1" id="4" href="addregulartransfer.jsp?">
						<p id="">매달 xx일</p>
						<h3><span class="" id="jadong4_str"></span><span class="float-right" id="jadong4_num"></span></h3>		
					</a>
				</li>
				<li>
					<a class="main1" id="5" href="addregulartransfer.jsp?">
						<p id="">매달 xx일</p>
						<h3><span class="" id="jadong5_str"></span><span class="float-right" id="jadong5_num"></span></h3>		
					</a>
				</li>
        	</ul>
        </div>
       
            <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
            <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
            <script src="js/bootstrap.min.js"></script>
    </div>

</body>
</html>

<%
	request.setCharacterEncoding("UTF-8");
	//잔액
	int balance = 3000000;
	//자동이체
	String jadong1_str = "";
	String jadong2_str = "";
	String jadong3_str = "";
	String jadong4_str = "";
	String jadong5_str = "";

	int jadong1_num = 0;
	int jadong2_num = 0;
	int jadong3_num = 0;
	int jadong4_num = 0;
	int jadong5_num = 0;

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
	}
	if(!"".equals(jadong2_str)){
		jadong2_num = Integer.parseInt(request.getParameter("jadong2_num"));	
	}
	if(!"".equals(jadong3_str)){
		jadong3_num = Integer.parseInt(request.getParameter("jadong3_num"));	
	}
	if(!"".equals(jadong4_str)){
		jadong4_num = Integer.parseInt(request.getParameter("jadong4_num"));	
	}
	if(!"".equals(jadong5_str)){
		jadong5_num = Integer.parseInt(request.getParameter("jadong5_num"));	
	}
	
%>

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
	var jadong1_num = <%=jadong1_num%>;
	var jadong2_num = <%=jadong2_num%>;
	var jadong3_num = <%=jadong3_num%>;
	var jadong4_num = <%=jadong4_num%>;
	var jadong5_num = <%=jadong5_num%>;
	
	var remain = balance - (jadong1_num + jadong2_num + jadong3_num + jadong4_num + jadong5_num);
</script>
<script>
$("#jadong1_str").html(jadong1_str);
$("#jadong2_str").html(jadong2_str);
$("#jadong3_str").html(jadong3_str);
$("#jadong4_str").html(jadong4_str);
$("#jadong5_str").html(jadong5_str);
if(jadong1_num!=0){$("#jadong1_num").html(jadong1_num.number_format()+"원");}
if(jadong2_num!=0){$("#jadong2_num").html(jadong2_num.number_format()+"원");}
if(jadong3_num!=0){$("#jadong3_num").html(jadong3_num.number_format()+"원");}
if(jadong4_num!=0){$("#jadong4_num").html(jadong4_num.number_format()+"원");}
if(jadong5_num!=0){$("#jadong5_num").html(jadong5_num.number_format()+"원");}
</script>
<script type="text/javascript">
var str = "editregulartransfer.jsp?";
if(jadong1_str !== ""){ str = str+ "jadong1_str=" + jadong1_str;}
if(jadong2_str !== ""){ str = str+ "&"+ "jadong2_str=" + jadong2_str;}
if(jadong3_str !== ""){ str = str+ "&"+ "jadong3_str=" + jadong3_str;}
if(jadong4_str !== ""){ str = str+ "&"+ "jadong4_str=" + jadong4_str;}
if(jadong5_str !== ""){ str = str+ "&"+ "jadong5_str=" + jadong5_str;}
if(jadong1_num != 0){ str = str+ "&"+"jadong1_num=" + jadong1_num;}
if(jadong2_num != 0){ str = str+ "&"+"jadong2_num=" + jadong2_num;}
if(jadong3_num != 0){ str = str+ "&"+"jadong3_num=" + jadong3_num;}
if(jadong4_num != 0){ str = str+ "&"+"jadong4_num=" + jadong4_num;}
if(jadong5_num != 0){ str = str+ "&"+"jadong5_num=" + jadong5_num;}
$("#1").attr('href',str+"&order=1");
$("#2").attr('href',str+"&order=2");
$("#3").attr('href',str+"&order=3");
$("#4").attr('href',str+"&order=4");
$("#5").attr('href',str+"&order=5");
</script>
