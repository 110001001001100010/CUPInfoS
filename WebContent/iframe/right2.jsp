<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<base href=" <%=basePath%>">
<meta charset="utf-8">
<title>JerRy'sHOme</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	overflow: hidden;
}
</style>
</head>

<body>
	<div style="width: 100%; height: 100px;"></div>
	<form action="ResourceCL" method="get">
		<input type="hidden" value="add" name="type" />
		<div style="width: 100%; height: 50px;">
			<span style="margin-left: 50px;">院系： </span> <select
				name="department">
				<option>-----------------------------</option>
				<option>经济管理学院</option>
				<option>地球科学学院</option>
				<option>石油工程学院</option>
				<option>化学工程与环境学院</option>
				<option>机械与储运工程学院</option>

			</select> <span style="margin-left: 50px;">专业： </span> <select
				name="profession">
				<option>-----------------------------</option>
				<option>信息管理与信息系统</option>
				<option>能源经济</option>
				<option>会计</option>
				<option>财务管理</option>
				<option>国际贸易</option>

			</select> <span style="margin-left: 50px;">课程： </span> <select name="course">
				<option>-----------------------------</option>
				<option>WEB实验设计</option>
				<option>数据库原理</option>
				<option>Python</option>
				<option>Linux系统与应用</option>
				<option>高数上</option>
				<option>高数下</option>


			</select>
		</div>
		<div
			style="margin-top: 100px; margin-left: 100px; float: left; width: 500px; height: 500px;">
			<div style="margin-bottom: 50px;">
				<span>教师姓名: </span><input name="teacher" type="text" size="40px" />
			</div>
			<div style="margin-bottom: 50px;">
				<span>链接地址: </span><input name="location" type="text" size="40px" />
			</div>
			<div style="margin-bottom: 50px;">
				<span>链接密码: </span><input name="lockey" type="text" size="40px" />
			</div>
			<div style="margin-bottom: 50px;">
				<span>您的学号: </span><input name="stuno" type="text" size="40px" />
			</div>
			<div style="margin-bottom: 50px;">
				<span>您的姓名: </span><input name="stuname" type="text" size="40px" />
			</div>

		</div>
		<div
			style="margin-top: 100px; margin-right: 400px; float: right; width: 500px; height: 500px;">
			<div style="margin-bottom: 50px;">
				<span>提交主题: </span><input name="topic" type="text" size="40px" />
			</div>
			<div style="margin-bottom: 50px;">
				<span>提交说明: </span><br />
				<textarea name="description"
					style="resize: none; width: 400px; height: 100px;"></textarea>
			</div>
			<div style="margin-bottom: 50px; text-align: center; width: 400px;">
				<input type="image" src="imgs/submit.png"
					style="width: 130px;; height: 50px;" />
			</div>
		</div>

	</form>
</body>
</html>
