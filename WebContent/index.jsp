<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GourmetSpices</title>
</head>
<body>
<!-- utilizzato per startare la servlet al momento dello start del server -->
	<% response.sendRedirect(request.getContextPath()+"/LoadProdotti?mode=home"); %>
</body>
</html>