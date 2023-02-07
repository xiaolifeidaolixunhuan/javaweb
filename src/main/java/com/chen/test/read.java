package com.chen.test;

import java.io.File;

public class read {
    public static void main(String[] args) {
//读取文件名
//        File folder = new File("D:\\word");
//        File[] files = folder.listFiles();
//        for(File file:files){
//            System.out.println(file.getName());
//        }
        File file = new File("D:\\word");
        String[] fileList = file.list();
        for(String name:fileList){
            System.out.println(name);
        }


    }
}
