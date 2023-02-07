<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/upload.do" enctype="multipart/form-data" method="post">
    上传用户：<input type="text" name="username"><br/>
    上传文件1：<input type="file" name="file1"><br/>
    上传文件2：<input type="file" name="file1"><br/>
    <input type="submit" value="提交">
</form>
<a href="word.jsp">去看word文档</a>
<h1>markdown</h1>
<a href="mak.html"> markdown</a>

<a href="weqe.jsp">dfusidysu</a>
</body>
</html>
