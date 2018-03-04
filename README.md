1. BaseDao 运用反射 + 泛型编写通用 查询接口
    - findAll
    - findByID
2. EncodingFilter：使用装饰者模式,装饰HttpServletRequest 对象
    对post/get字符编码过滤
3. BaseServlet ： 反射得到指定方法名的方法对象,并调用方法
4. 