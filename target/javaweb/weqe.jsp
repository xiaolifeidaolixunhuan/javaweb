<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %><%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2023/2/6
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
// 创建文件夹对象
File folder = new File("D:\\word");
// 获取文件夹里面所有文件
File[] listOfFiles = folder.listFiles();

for (int i = 0; i < listOfFiles.length; i++) {
if (listOfFiles[i].isFile()) {
// 读取文件内容
String content = new String(Files.readAllBytes(Paths.get(listOfFiles[i].getPath())));
// 显示文件内容
%>
<div>
    <%= content %>
</div>
<%
        }
        }


