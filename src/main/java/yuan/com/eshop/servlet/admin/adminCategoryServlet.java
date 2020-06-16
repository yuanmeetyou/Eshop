package yuan.com.eshop.servlet.admin;

import yuan.com.eshop.bean.category;
import yuan.com.eshop.service.admin.adminProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "adminCategoryServlet",urlPatterns = {"/admin/category"})
public class adminCategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        adminProjectService adminProjectService = new adminProjectService();
        List<category> findcategory = adminProjectService.findcategory();
        request.setAttribute("findcategory",findcategory);
        request.getRequestDispatcher("/admin/product/add.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          doPost(request,response);
    }
}
