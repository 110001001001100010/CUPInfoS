<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.ArrayList" import="com.zhi.domain.*"
	import="com.zhi.service.*" pageEncoding="UTF-8"%>
<%
	String myPageNow = (String) request.getParameter("myPageNow");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ArrayList<Estimate> al = null;
	int pageCount, pageSize = 10, pageNow = 1;
	if (myPageNow != null) {
		pageNow = Integer.parseInt(myPageNow);
	}
	pageCount = EstimateService.getPageCount(pageSize);
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

table {
	table-layout: fixed;
	text-align: center;
}

tr {
	overflow: hidden text-overflow: ellipsis;
	-moz-text-overflow: ellipsis;
	white-space: nowrap;
	text-align: center;
}

td {
	height: 40px;
	overflow: hidden text-overflow: ellipsis;
	-moz-text-overflow: ellipsis;
	white-space: nowrap;
	text-align: center;
}
</style>
<script type="text/javascript">
	function show(i){
		alert(document.getElementById("des"+i).value);
		
	}
</script>
</head>

<body>
	<div style="width: 100%; height: 100px;"></div>
	<form action="EstimateCL" method="get">
		<input type="hidden" value="query" name="type" /> <input type="hidden"
			value=<%=pageNow%> name="pageNow" /> <input type="hidden"
			value=<%=pageSize%> name="pageSize" />
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


			</select> <input type='image'
				style="float: right; margin-right: 200px; margin-bottom: -5px;"
				width="55px" alt='Seek' src='imgs/seek.PNG' />
		</div>
	</form>

	<div
		style="margin-top: 100px; margin-left: 100px; float: left; width: 1400px; height: 500px;">
		<!--动态-->
		<table style="width: 1400px" border="1" cellspacing="0">

			<%
				if (request.getAttribute("rows") != null) {
					al = (ArrayList) request.getAttribute("rows");
				} else {
					al = EstimateService.getEstimatesByPage(pageNow, pageSize);
				}
			%>
			<tr>
				<th>院系</th>
				<th>专业</th>
				<th>课程</th>
				<th>教师</th>
				<th>主题</th>
				<th>课程评价留言</th>
				<th>学号</th>
				<th>姓名</th>
				<th>主观评价</th>
			</tr>
			<%
			int j=0;
				for (Estimate r : al) {
			%>
			<tr>
				<td><%=r.getDepartment()%></td>
				<td><%=r.getProfession()%></td>
				<td><%=r.getCourse()%></td>
				<td><%=r.getTeacher()%></td>
				<td><%=r.getTopic()%></td>
				<td><input style="width:80px;height:25px;" type="button" onclick="show(<%=j%>)" value="点击查看"/></td>
				<input type="hidden" id="des<%=j%>" value=<%=r.getDescription()%> />
				<td><%=r.getStuno()%></td>
				<td><%=r.getStuname()%></td>
				<td><%=r.getAll()%></td>
			</tr>

			<%
					j++;
				}
			%>
		</table>
	</div>
	<div style="float: left; margin-left: 600px;">
		<%
			if (pageNow == 1) {
		%>

		<a href="iframe/right3.jsp?myPageNow=<%=pageNow%>">上一页</a>

		<%
			} else {
		%>

		<a href="iframe/right3.jsp?myPageNow=<%=pageNow - 1%>">上一页</a>
		<%
			}
		%>


		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<%
			for (int i = 1; i <= pageCount; i++) {
		%>
		<a href="iframe/right3.jsp?myPageNow=<%=i%>"> < <%=i%> >
		</a>
		<%
			}
		%>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%
			if (pageNow == pageCount) {
		%>
		<a href='iframe/right3.jsp?myPageNow=<%=pageNow%>'>下一页</a>
		<%
			} else {
		%>
		<a href='iframe/right3.jsp?myPageNow=<%=pageNow + 1%>'>下一页</a>
		<%
			}
		%>
	</div>
	<br />
	<div style="float: right; margin-right: 100px;">
		当前是第 <font color='red'> <%=pageNow%> 
		</font>页 共有<font color='blue'> <%=pageCount%> </font>页
	</div>


</body>
</html>
