<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="com.zhi.domain.*"
	import="com.zhi.service.*"%>
<%
	String myPageNow = (String) request.getParameter("myPageNow");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ArrayList<Message> al = null;
	int pageCount, pageSize = 2, pageNow = 1;
	if (myPageNow != null) {
		pageNow = Integer.parseInt(myPageNow);
	}
	pageCount = MessageService.getPageCount(pageSize);
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function check() {

		if (document.getElementsByName("stuno")[0].value == "") {
			window.alert("学号不能为空");
			return false;
		}
		return true;

	}
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	overflow: hidden;
}
</style>
<base href=" <%=basePath%>">
<meta charset="utf-8">
</head>

<body>
	<div style="width: 100%; height: 100px;"></div>
	<form action="MessageCL" method="get" onsubmit="return check()">
		<input type="hidden" value="query" name="type" /> <input
			type="hidden" value=<%=pageNow%> name="pageNow" /> <input
			type="hidden" value=<%=pageSize%> name="pageSize" />
		<div style="margin-left: 200px; width: 1200px; height: 200px;">
			<div style="width: 1200px; height: 50px;">
				<span>您的学号: </span><input name="stuno" type="text" size="40px" /> <span
					style="margin-left: 200px;">您的姓名: </span><input name="stuname"
					type="text" size="40px" />
			</div>
			<div>
				<textarea style="resize: none; width: 600px; height: 100px;"
					name="message"></textarea>
				<input type="image" src="imgs/submit.png"
					style="margin-left: 100px;; width: 130px;; height: 50px;" />
			</div>
		</div>

	</form>
	<div style="margin-left: 200px; width: 1000px; height: 400px;">
		<%
			al = MessageService.getMessagesByPage(pageNow, pageSize);

			for (Message r : al) {
		%>
		<div style="margin-top: 40px; width: 1000px; height: 50px;">
			<span style="color: gray;">学号: < <%=r.getStuno()%> >
			</span> <span style="color: gray; margin-left: 200px;">姓名: < <%=r.getStuname()%>
				>
			</span>
		</div>
		<div style="width: 1000px; height: 80px;">
			<p>
				<font color="red">-->留下了一句旷世名言:</font>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=r.getMessage()%>
			</p>
		</div>
		<%
			}
		%>
	</div>


	<div style="float: left; margin-left: 600px;">
		<%
			if (pageNow == 1) {
		%>

		<a href="iframe/right6.jsp?myPageNow=<%=pageNow%>">上一页</a>

		<%
			} else {
		%>

		<a href="iframe/right6.jsp?myPageNow=<%=pageNow - 1%>">上一页</a>
		<%
			}
		%>


		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<%
			for (int i = 1; i <= pageCount; i++) {
		%>
		<a href="iframe/right6.jsp?myPageNow=<%=i%>"> < <%=i%> >
		</a>
		<%
			}
		%>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%
			if (pageNow == pageCount) {
		%>
		<a href='iframe/right6.jsp?myPageNow=<%=pageNow%>'>下一页</a>
		<%
			} else {
		%>
		<a href='iframe/right6.jsp?myPageNow=<%=pageNow + 1%>'>下一页</a>
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
