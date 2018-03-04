package com.util;

import java.util.UUID;

// 拷贝请求数据到javabean的工具类
public class WebUtil {
    public static String uuid(){
        return UUID.randomUUID().toString().replace("-","");
    }
}
