package yuan.com.eshop.servlet.admin;

import com.google.gson.Gson;
import org.apache.commons.beanutils.BeanUtils;
import yuan.com.eshop.bean.Productlist;
import yuan.com.eshop.service.admin.adminProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet(name = "adminUpdateProductServlet",urlPatterns = {"/admin/updateProduct"})
public class adminUpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          request.setCharacterEncoding("utf-8");
        String pid = request.getParameter("pid");
        Map<String, String[]> parameterMap = request.getParameterMap();
        Productlist productlist = new Productlist();
        productlist.setPid(pid);
        //productlist.setPimage("products/1/p40.jpg");
        try {
            BeanUtils.populate(productlist,parameterMap);
            adminProjectService adminProjectService = new adminProjectService();
            boolean b = adminProjectService.updateProduct(productlist);
            //new Gson().toJson(b,response.getWriter());
            if (b) {
                response.getWriter().write("{\"result\":1}");
            }
            else{
                response.getWriter().write("{\"result\":0}");
            }
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
