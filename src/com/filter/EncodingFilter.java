package com.filter;

// 导入包 servlet-api
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


// 字符编码过滤器 (GET POST 统一 UTF_8)
public class EncodingFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        /**
         * 使用装饰者模式,装饰HttpServletRequest 对象
          */

        // 解决post 参数提交问题
        servletRequest.setCharacterEncoding("utf-8");
        MyRequest myRequest = new MyRequest((HttpServletRequest)servletRequest);
        filterChain.doFilter(myRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
// 装饰类
class MyRequest extends HttpServletRequestWrapper {

    private HttpServletRequest request;

    public MyRequest(HttpServletRequest request) {
        super(request);
        this.request = request;
    }

    /**
     * 解决GET 参数提交问题
     * @param name 参数名
     * @return
     */
    public String getParameter(String name){
        try{
            String value = this.request.getParameter(name);
            // 手动解码
            if(value != null){
                if("GET".equals(this.request.getMethod())){
                    value = new String(value.getBytes("iso-8859-1")
                            ,"utf-8");
                }
            }
            return value;
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public Map<String,String[]> getParameterMap(){
        try{
            Map<String,String[]> map = this.request.getParameterMap();
            if(map != null){
                if("GET".equals(this.request.getMethod())){
                    Map<String,String[]> newMap = new HashMap<>();
                    for(Map.Entry<String,String[]> entry : map.entrySet()){
                        String[] arr = entry.getValue();
                        String[] newArray = new String[arr.length];
                        for(int i = 0;i < newArray.length;i++){
                            newArray[i] = new String(arr[i].getBytes
                                    ("iso-8859-1"),"utf-8");
                        }
                        newMap.put(entry.getKey(),newArray);
                    }
                    map = newMap;
                }
            }
            return map;
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}