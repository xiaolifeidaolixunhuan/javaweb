<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="org.apache.poi.hwpf.HWPFDocument" %>
<%@ page import="org.apache.poi.hwpf.usermodel.Range" %><%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2023/2/6
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% File file = new File("D:\\word");
    File[] files = file.listFiles();

    for(File f : files) {
        // 判断是否为word文档
        if(f.getName().endsWith(".html") || f.getName().endsWith(".htm")) {
            // 读取word文档
            FileInputStream fis = new FileInputStream(f);
            HWPFDocument doc = new HWPFDocument(fis);
            Range range = doc.getRange();
            // 获取word文档的源码
            String content = range.text();
            // 将源码输出到jsp页面
            out.println(content);
        }
    }%>

