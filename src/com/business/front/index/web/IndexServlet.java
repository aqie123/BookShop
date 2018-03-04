package com.business.front.index.web;

import com.util.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IndexServlet extends BaseServlet {
    /**
     * 显示首页图书分类的方法
     * url = /index?action=showIndex
     */
    public void showIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("showIndex 显示首页图书分类");
    }

    /**
     * 显示图书信息
     */
    public void queryBooks(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("queryBooks");
    }

    public void queryBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("queryBook");
    }
}
