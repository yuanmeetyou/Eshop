package yuan.com.eshop.servlet;

import com.google.gson.Gson;
import org.apache.commons.beanutils.BeanUtils;
import yuan.com.eshop.bean.*;
import yuan.com.eshop.dao.productlistDao;
import yuan.com.eshop.dao.registerDao;
import yuan.com.eshop.dao.userDao;
import yuan.com.eshop.service.user.UserCategoryService;
import yuan.com.eshop.service.user.UserProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "UserProductServlet",urlPatterns = {"/user/product"})
public class UserProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String method = request.getParameter("method");
        if ("categoryList".equals(method)){
             categoryList(request,response);
        }else if("index".equals(method)){
            index(request,response);
        }else if("login".equals(method)){
            login(request,response);
        }else if("productSearch".equals(method)){
             productSearch(request,response);
        }else if("userSearch".equals(method)){
           userSearch(request, response);
        }else if("productList".equals(method)){
              productList(request,response);
        }else if ("register".equals(method)) {
            register(request, response);
        }else if("shopping".equals(method)){
            shopping(request,response);
        }else if("addProductToCart".equals(method)){
            addProductToCart(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    //添加购物车
    public void addProductToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //获取用户商品的数量
        int number = Integer.valueOf(request.getParameter("number"));
        //获取商品的信息
        String pid = request.getParameter("pid");
        Productlist productlist = new UserProductService().shoppingProduct(pid);
        //把商品的信息添加到购物项
        CartItem cartItem = new CartItem();
        cartItem.setProductlist(productlist);
        cartItem.setNumber(number);
        double minTotal=number*productlist.getShop_price();
        cartItem.setMinTotal(minTotal);
        //购物车Cart是存放在会话session中
        Cart cart = (Cart)session.getAttribute("cart");
        if (cart == null) {
            cart=new Cart();
        }
        Map<String, CartItem> items = cart.getItems();
        if (items.containsKey(pid)) {
            CartItem cartItem1 = items.get(pid);
        }else {
            //把购物项放到购物车中
            cart.getItems().put(productlist.getPid(),cartItem);
        }
        //计算总计
        double total=cart.getTotal()+minTotal;
        cart.setTotal(total);
        session.setAttribute("cart",cart);
        response.sendRedirect(request.getContextPath()+"/cart.jsp");

    }
    //显示商品列表
    public void categoryList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<category> categoryList = new UserCategoryService().findCategoryList();
        String s = new Gson().toJson(categoryList);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(s);
    }
    //显示首页
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Productlist> newProduct = new UserProductService().findNewProduct();
        request.setAttribute("newProduct",newProduct);
        List<Productlist> hotProduct = new UserProductService().findHotProduct();
        request.setAttribute("hotProduct",hotProduct);
        //这是在服务器内部跳转
        request.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(request,response);
    }
    //登陆
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        userDao userDao = new userDao();
        user login = userDao.login(username, password);
        //request.getSession().setAttribute("login",login);
        /*
         * 1、请求转发
         * 2、重定向
         * */
        response.setContentType("text/html;charset=utf-8");
        if(login!=null){
            HttpSession session = request.getSession();
            session.setAttribute("user",login);
            response.sendRedirect(request.getContextPath()+"/user/product?method=index");
        }else {
            request.setAttribute("logoInfo","用户名或者密码错误");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }
    //用户商品搜索（post）
    public void productSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setCharacterEncoding("utf-8");
        String serarch = request.getParameter("serarch");
        UserProductService userProductService = new UserProductService();
        List<Productlist> productlists = userProductService.PostSearchProduct(serarch);
        request.setAttribute("serarch",serarch);
        request.setAttribute("prductlist",productlists);
        request.getRequestDispatcher("/product_list.jsp").forward(request,response);
    }
    //用户商品搜索(异步)
    public void userSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("content");
        List<Productlist> productlists= new UserProductService().UserSearchProduct(content);
        String pname = new Gson().toJson(productlists);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(pname);
    }
    //商品列表
    public void productList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        productlistDao productlistDao = new productlistDao();
        List<Productlist> productlists = productlistDao.UserproductAllList(cid);
        request.setAttribute("prductlist",productlists);
        request.getRequestDispatcher("/product_list.jsp").forward(request,response);
    }
    //注册
    public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取前台传过来的数据,适合多条数据传输market_price
        //request.setCharacterEncoding("utf-8");
        Map<String, String[]> parameterMap = request.getParameterMap();
        user user = new user();
        try {
            BeanUtils.populate(user,parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //因为前台的数据没有uid，所以需要手动封装
        //UUID可以随即生成32位字符串和4个（-），共36位
        user.setUid(UUID.randomUUID().toString());
        registerDao regiterDao = new registerDao();
        int register = regiterDao.register(user);
        if (register>0){
            response.getWriter().println("注册成功");
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }else {

            response.sendRedirect(request.getContextPath()+"/register.jsp");
        }
    }
    //购物
    public void shopping(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        Productlist productlist = new UserProductService().shoppingProduct(pid);
        request.setAttribute("shopping",productlist);
        request.getRequestDispatcher("/shopping.jsp").forward(request,response);

    }


}
