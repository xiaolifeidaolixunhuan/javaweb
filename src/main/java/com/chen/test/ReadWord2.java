package com.chen.test;

import org.apache.poi.hwpf.extractor.WordExtractor;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class ReadWord2 {
    public static void main(String[] args) {
        // 要读取的文件夹路径
        String filePath = "D:\\word";
        // 获取文件夹下的所有文件
        List<String> fileList = getFiles(filePath);
        for (String fileName : fileList) {
            // 读取文件
            String content = readWord(filePath + "\\" + fileName);
            System.out.println(content);
        }
    }

    /**
     * 读取Word文件内容
     *
     * @param path
     * @return buffer
     */
    private static String readWord(String path) {
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
    private static List<String> getFiles(String filePath) {
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
}
