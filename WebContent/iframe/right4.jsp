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
	overflow: hidden;
}
</style>
</head>

<body>
<div style="width:100%;height:100px;"></div>
<form action="#" method="get">
<div style="width:100%;height:50px;">
<span style="margin-left:50px;">院系： </span>
<select>
<option>-----------------------------</option>
</select>
<span style="margin-left:50px;">专业： </span>
<select>
<option>-----------------------------</option>
</select>
<span style="margin-left:50px;">课程： </span>
<select>
<option>-----------------------------</option>
</select>
</div>
<div style="margin-top:100px;margin-left:100px;float:left;width:500px;height:500px;">
<div style="margin-bottom:50px;"><span>教师姓名: </span><input type="text" size="40px"/></div>
<div style="margin-bottom:50px;"><span>您的学号: </span><input type="text" size="40px"/></div>
<div style="margin-bottom:50px;"><span>您的姓名: </span><input type="text" size="40px"/></div>
<div style="margin-bottom:50px;"><span>总体评价: </span>
<select>
<option>--------</option>
<option>好</option>
<option>中</option>
<option>差</option>
</select>
</div>
</div>
<div style="margin-top:100px;margin-right:400px;float:right;width:500px;height:500px;">
<div style="margin-bottom:50px;"><span>评价主题: </span><input type="text" size="40px"/></div>
<div style="margin-bottom:50px;"><span>评价内容: </span><br/><textarea  style="resize:none;width:400px;height:100px;"></textarea>
</div>
<div style="margin-bottom:50px;text-align:center;width:400px;"><input formaction='#' type="image" src="../imgs/submit.png" style="width:130px;;height:50px;"/></div>
</div>
</form>
</body>
</html>
