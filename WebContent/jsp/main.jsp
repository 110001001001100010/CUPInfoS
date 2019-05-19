<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>JerRy'sHOme</title>
<style type="text/css">
*{
	margin:0;
	padding:0;
}
body {
	background-repeat: no-repeat;
	height: 100%;
	width: 100%;
	overflow: hidden;
}

a:link {
	text-decoration: none;
	color: #000000;
}
a:visited {
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: none;
	color: #F00;
}
a:active {
	text-decoration: none;
	color: #000000;
}
.index {
	float: left;
	height: 936px;
	width: 20%;
	position: relative;
	background-size: 100% 100%;
	background-color: #8A8A8A;
}
.index div {
	font-size: 60px;
	font-family: "方正舒体";
	font-weight: bold;
	width: 100%;
	position: relative;
	top: 200px;
	left: 0px;
	color: #000000;
}
.index_list {
	font-size: 36px;
	margin-bottom: 50px;
	list-style-type: none;
	font-family: "方正舒体";
}
.index ul {
	position: relative;
	left: 120px;
	top: 300px;
	width: 200px;
	background-color: #8A8A8A;
}
</style>
<script type="text/javascript">
	function goTo(aim){
		document.getElementById("myFrame").src=aim;
	}
</script>
</head>


<body>
<div class="index">
  <div style="width:100px;height:100px;margin-left:150px;margin-top:-140px;"><img src="../imgs/logo+.jpg" width="98px" height="89px"></div>
  <div>JerRy'sHOme</div>
<ul>
<li class="index_list"><a href="#" onClick="goTo('../iframe/right1.jsp')">课程资料</a></li>
<li class="index_list"><a href="#" onClick="goTo('../iframe/right2.jsp')">贡献资料</a></li>
<li class="index_list"><a href="#" onClick="goTo('../iframe/right3.jsp')">课程评价</a></li>
<li class="index_list"><a href="#" onClick="goTo('../iframe/right4.jsp')">提交评价</a></li>
<li class="index_list"><a href="#" onClick="goTo('../iframe/right5.jsp')">毕业留言</a></li>
<li class="index_list"><a href="#" onClick="goTo('../iframe/right6.jsp')">个人资料</a></li>
</ul>
</div>
<div style= "height: 30px; width: 1536px; margin: 0px; padding: 0px; float: right; position: relative; background-color: #CCCCCC; layer-background-color: #CCCCCC; border: 1px none #000000;" >
<div style="float:right;width:50px;height:30px;">
<a href="../index.html" >退出</a></div>
</div>
<iframe id="myFrame" src="../iframe/right1.jsp" width="80%" height="1000px" scrolling="no" frameborder="0px"><iframe>

</body>

</html>
