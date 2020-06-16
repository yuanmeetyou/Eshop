package yuan.com.eshop.servlet.admin;

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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "adminAddProductServlet",urlPatterns = {"/admin/AddProductServlet"})
public class adminAddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> parameterMap = request.getParameterMap();
        Productlist productlist = new Productlist();
        try {
            BeanUtils.populate(productlist,parameterMap);
            productlist.setPid(UUID.randomUUID().toString());
            productlist.setPimage("products/1/p40.jpg");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String format=null;
            format =simpleDateFormat.format(new Date());
            productlist.setPdate(format);
            productlist.setPflag(0);
            adminProjectService adminProjectService = new adminProjectService();
            adminProjectService.addprodut(productlist);
           response.sendRedirect(request.getContextPath()+"/admin/product");
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             doPost(request,response);
    }
}
