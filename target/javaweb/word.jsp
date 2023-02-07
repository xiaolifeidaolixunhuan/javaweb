<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.poi.POIXMLDocument" %>
<%@ page import="org.apache.poi.xwpf.extractor.XWPFWordExtractor" %>
<%@ page import="org.apache.poi.openxml4j.opc.OPCPackage" %>
<%@ page import="org.apache.poi.hwpf.extractor.WordExtractor" %>
<%@ page import="org.apache.poi.POIXMLTextExtractor" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>word文档内容输出</title>
</head>
<body>
<%
  // 要读取的文件夹路径
  String filePath = "D:\\word";
  // 获取文件夹下的所有文件
  List<String> fileList = getFiles(filePath);
  for (String fileName : fileList) {
    // 读取文件
    String content = readWord(filePath + "\\" + fileName);
%>
<p><%=content %></p>
<%
  }
%>

<%!
  /**
   * 读取Word文件内容
   *
   * @param path
   * @return buffer
   */
  private String readWord(String path) {
    String buffer = "";
    try {
      if (path.endsWith(".doc")) {
        InputStream is = new FileInputStream(new File(path));
        WordExtractor ex = new WordExtractor(is);
        buffer = ex.getText();
        ex.close();
      }  else {
        System.out.println("此文件不是word文件！");
      }

    } catch (Exception e) {
      e.printStackTrace();
    }

    return buffer;
  }

  /**
   * 获取指定文件夹下的所有文件
   *
   * @param filePath
   * @return
   */
  private List<String> getFiles(String filePath) {
    List<String> fileList = new ArrayList<String>();
    File root = new File(filePath);
    File[] files = root.listFiles();
    for (File file : files) {
      if (file.isFile()) {
        fileList.add(file.getName());
      }
    }
    return fileList;
  }
%>
</body>
</html>