package com.chen.test;

import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.xmlbeans.XmlException;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class ReadWord {
    public static void main(String[] args) {
        // 要读取的文件夹
        String path = "D:\\word";
        // 调用方法
        readfile(path);
    }

    public static void readfile(String filepath) {
        // 在指定的文件夹中获取所有的文件
        File file = new File(filepath);
        if (!file.isDirectory()) {
            System.out.println("文件");
            System.out.println("path=" + file.getPath());
            System.out.println("absolutepath=" + file.getAbsolutePath());
            System.out.println("name=" + file.getName());
        } else if (file.isDirectory()) {
            System.out.println("文件夹");
            String[] filelist = file.list();
            for (int i = 0; i < filelist.length; i++) {
                File readfile = new File(filepath + "\\" + filelist[i]);
                if (!readfile.isDirectory()) {
                    System.out.println("path=" + readfile.getPath());
                    System.out.println("absolutepath=" + readfile.getAbsolutePath());
                    System.out.println("name=" + readfile.getName());

                    // 调用 readWord 方法读取 word
                    try {
                        readWord(readfile.getAbsolutePath());
                    } catch (XmlException e) {
                        throw new RuntimeException(e);
                    }
                } else if (readfile.isDirectory()) {
                    readfile(filepath + "\\" + filelist[i]);
                }
            }
        }
    }

    public static void readWord(String path) throws XmlException {
        try {
            // 判断文件是否存在
            if (!new File(path).exists()) {
                System.out.println("文件不存在");
            } else {
                // 读取word文件
                if (path.endsWith(".doc")) {
                    // 创建输入流
                    FileInputStream is = new FileInputStream(new File(path));
                    // 创建word文档
                    WordExtractor ex = new WordExtractor(is);
                    // 读取word文档里面的内容
                    String text = ex.getText();
                    // 输出word文档里面的内容
                    System.out.println(text);
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}