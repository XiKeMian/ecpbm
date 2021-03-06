<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	if (session.getAttribute("admin") == null)
		response.sendRedirect("/ecpbm/admin_login.jsp");
%>

<html>
<head>

<title>电商后台管理首页面</title>
	<link rel="short icon" href="picture/logo.png" />

<link href="EasyUI/themes/default/easyui.css" rel="stylesheet"
	type="text/css" />
<link href="EasyUI/themes/icon.css" rel="stylesheet" type="text/css" />
<link href="EasyUI/demo.css" rel="stylesheet" type="text/css" />
<script src="EasyUI/jquery.min.js" type="text/javascript"></script>
<script src="EasyUI/jquery.easyui.min.js" type="text/javascript"></script>
<script src="EasyUI/easyui-lang-zh_CN.js" type="text/javascript"></script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="height: 60px; background: #B3DFDA; padding: 10px">
		<div align="left">
			<div style="font-family: Microsoft YaHei; font-size: 14px; font-weight: bold">电商平台后台管理系统</div>
		</div>
		<div align="right">
			<div style="font-size: 10px; font-weight: bold">欢迎您，<font color="red">${sessionScope.admin.name}</font></div>
		</div>
	</div>
	<div data-options="region:'west',split:true,title:'功能菜单'"
		style="width: 180px">
		<ul id="tt"></ul>
	</div>
	<div data-options="region:'south',border:false"
		style="height: 50px; background: darkseagreen;  text-align: center">
		<p style="font-size: 14px; font-weight: bold; ">郑州工业应用技术学院</p>
	     </div>
	<div data-options="region:'center'">
		<div id="tabs" data-options="fit:true" class="easyui-tabs"
			style="width: 500px; height: 250px;"></div>
	</div>
	<script type="text/javascript">
		// 为tree指定数据
		$('#tt').tree({
			url : 'admininfo/getTree?adminid=${sessionScope.admin.id}'
		});
		$('#tt').tree({
			onClick : function(node) {
				if ("商品列表" == node.text) {
					if ($('#tabs').tabs('exists', '商品列表')) {
						$('#tabs').tabs('select', '商品列表');
					} else {
						$('#tabs').tabs('add', {
							title : node.text,
							href : 'productlist.jsp',
							closable : true
						});
					}
				} else if ("商品类型列表" == node.text) {
					if ($('#tabs').tabs('exists', '商品类型列表')) {
						$('#tabs').tabs('select', '商品类型列表');
					} else {
						$('#tabs').tabs('add', {
							title : node.text,
							href : 'typelist.jsp',
							closable : true
						});
					}
				} else if ("查询订单" == node.text) {
					if ($('#tabs').tabs('exists', '查询订单')) {
						$('#tabs').tabs('select', '查询订单');
					} else {
						$('#tabs').tabs('add', {
							title : node.text,
							href : 'searchorder.jsp',
							closable : true
						});
					}
				} else if ("创建订单" == node.text) {
					if ($('#tabs').tabs('exists', '创建订单')) {
						$('#tabs').tabs('select', '创建订单');
					} else {
						$('#tabs').tabs('add', {
							title : node.text,
							href : 'createorder.jsp',
							closable : true
						});
					}
				} else if ("客户列表" == node.text) {
					if ($('#tabs').tabs('exists', '客户列表')) {
						$('#tabs').tabs('select', '客户列表');
					} else {
						$('#tabs').tabs('add', {
							title : node.text,
							href : 'userlist.jsp',
							closable : true
						});
					}
				} else if ("退出系统" == node.text) {
					$.ajax({
						url : 'admininfo/logout',
						success : function(data) {
							window.location.href = "admin_login.jsp";
						}
					})
				}
			}
		});
	</script>
</body>
</html>
