<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <%
		request.setCharacterEncoding("UTF-8");
		String title="";
		int remain=0;
		int cur_cost=0;
    	if(request.getParameter("title") != null){
    		title = request.getParameter("title");
    		if ("add".equals(title)){
    			response.sendRedirect("addChart.html");
    		}
    	}
		remain = Integer.parseInt(request.getParameter("remain"));	
		cur_cost = Integer.parseInt(request.getParameter("cur_cost"));	
    %>
    <script>
    var title = "<%=title%>";
    var remain = "<%=remain%>";
    var cur_cost = "<%=cur_cost%>";
    </script>
<body>
	<nav class="navbar navbar-default">
		<div class='container'>
			<div class="navbar-header">
		      	<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-chevron-left"></span></a>
		      	<a class="navbar-brand" href="#">이체금액 수정</a>
		      	  <p class="navbar-text navbar-right float-left"><a href="#" class="navbar-link">수정 </a></p>
		    </div>
 		
		</div>
	</nav>
    <div class="container">

        <div class="form-group">
        <h3><%=title %>
        	<span class="float-right">NH농협은행 302-0****-71</span>
        </h3>  
        </div>
        <div class="form-group">
	        <div class="input-group">
			  	<input type="text" class="form-control" value="600000" id="transfer_acc"  aria-describedby="basic-addon2">
			  	<span class="input-group-addon" id="basic-addon2">원</span>
			</div> 
		</div>
	   	<div class="form-group">
		    <div id="seekbar-container" style="width:100%;height:40px">
		    </div>
	  	</div>
        <h4 class="form-group float-right">
		   남는 돈 <span id="calcul">123,330</span>원 
	  	</h4>
        <div class="form-group">
          <input class="btn btn-default btn-lg btn-block" value="저장" onclick="javascript:chkValue()">
        </div>
            <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
            <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
            <script src="js/bootstrap.min.js"></script>
    </div>
    
    <script type="text/javascript">
   	var mvalue = cur_cost;//60만원 
   	//var min =  mvalue*0.8;
   	var max = mvalue * 2;
    var seekbar = new Seekbar.Seekbar({
        renderTo: "#seekbar-container",
        minValue: 0, maxValue: max,
        value : mvalue,
        negativeColor : '#d5c1ee',
        thumbColor : '#d5c1ee',

        valueListener: function (value) {
            this.setValue(Math.round(value));
            updatePreview();
        },
        barSize:3,
        needleSize:0.2
    });
    function updatePreview() {
        var w1 = seekbar.value.toString();
        $("#transfer_acc").val(w1.toUpperCase());
        $("#calcul").html(remain - w1);
    }
    function chkValue(){
        if($("#transfer_acc").val()<=max)
        {
            seekbar.setValue($("#transfer_acc").val());
            drawToast("값을 저장하였습니다.");
        }
        else{
            drawToast("값을 다시입력하세요.");
        }
      
    }
    chkValue();
    updatePreview();
    </script>

</body>
</html>




