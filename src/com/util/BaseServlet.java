package com.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * 1.接收到action 参数
 * 2.根据不同参数调用不同方法
 * 3.目的：通过传递参数调用不同方法逻辑，减少servlet请求
 */
public class BaseServlet extends HttpServlet{
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 获取action参数值
        String action = req.getParameter("action");
        // 2.通过反射得到指定方法名的方法对象,并调用方法
        try {
            Method method = this.getClass().getDeclaredMethod(action,HttpServletRequest.class,
                    HttpServletResponse.class);
            method.invoke(this,req,resp);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
