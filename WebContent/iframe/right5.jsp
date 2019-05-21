<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href=" <%=basePath%>">
<meta charset="utf-8">
<!-- 引入 ECharts 文件 -->
<script src="js/echarts-all.js"></script>
<script src="js/jquery-3.2.1.js"></script>
<script src="js/echarts.common.min.js"></script>
</head>

<body>

	<div style="width: 100%; height: 100px;"></div>
	<div style="width: 100%; height: 50px;">
		<span style="margin-left: 50px;">院系： </span> <select name="department">
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
		<input type='image' onclick="toAsk()"
				style="float: right; margin-right: 200px; margin-bottom: -5px;"
				width="55px" alt='Seek' src='imgs/seek.PNG' />
	</div>


	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
	<center>
		<div id="main" style="margin-top: 80px; width: 1400px; height: 600px;"></div>
	</center>
	<%
		//if(request.getAttribute("flag")!=null){
	%>
	<script type="text/javascript">
		function toAsk() {
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));
			var url = '${pageContext.request.contextPath}/EchartService';
			var department = document.getElementsByName("department")[0].value;
			var profession = document.getElementsByName("profession")[0].value;
			var course = document.getElementsByName("course")[0].value;
			var parameters = {};
			parameters["department"] = department;
			parameters["profession"] = profession;
			parameters["course"] = course;
			$.getJSON(url, parameters).done(function(json) {
				// 2.获取数据
				//salesVolume = json.salesVolume;//销量
				teachers = json.teachers;//营业额
				goods = json.goods;//月份

				// 3.更新图表myChart的数据
				var option = {
					title : {
						text : '专业课程质量折线图'
					},
					tooltip : {},
					legend : {
						//data : [ '销量' ],
						data : [ '好评数' ]
					},
					xAxis : {
						type : 'category',
						data : teachers
					},
					yAxis : {
						type : 'value'
					},
					series : [ {
						data : goods,
						type : 'line'
					} ],
					toolbox : {
						show : true,
						feature : {
							mark : {
								show : true
							},
							dataView : {
								show : true,
								readOnly : true
							},
							magicType : {
								show : true,
								type : 'line'
							},
							restore : {
								show : false
							},
							saveAsImage : {
								show : true
							}
						}
					},
				}
				myChart.setOption(option);

			})
		}
	</script>
	<%
		//}
	%>

</body>

</html>

