package yuan.com.eshop.servlet.admin;

import yuan.com.eshop.bean.Productlist;
import yuan.com.eshop.service.admin.adminProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "adminProductServlet",urlPatterns = {"/admin/product"})
public class adminProductLIstServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        adminProjectService adminProjectService = new adminProjectService();
        List<Productlist> allproduct = adminProjectService.findAllproduct();
        request.setAttribute("allproduct",allproduct);
        request.getRequestDispatcher("/admin/product/list.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           doPost(request,response);
    }
}
