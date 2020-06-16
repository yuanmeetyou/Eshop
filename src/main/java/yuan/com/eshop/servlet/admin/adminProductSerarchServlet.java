package yuan.com.eshop.servlet.admin;

import com.google.gson.Gson;
import org.apache.commons.beanutils.BeanUtils;
import yuan.com.eshop.bean.Productlist;
import yuan.com.eshop.bean.category;
import yuan.com.eshop.service.admin.adminProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "adminProductSerarchServlet",urlPatterns = {"/admin/products"})
public class adminProductSerarchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> parameterMap = request.getParameterMap();
        Productlist productlist = new Productlist();
        try {
            BeanUtils.populate(productlist,parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        adminProjectService adminProjectService = new adminProjectService();
        //获取商品的列表
        List<Productlist> productlists = adminProjectService.serarchProduct(productlist);
        request.setAttribute("productlist",productlist);
        request.setAttribute("allproduct",productlists);
        request.getRequestDispatcher("/admin/product/list.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
