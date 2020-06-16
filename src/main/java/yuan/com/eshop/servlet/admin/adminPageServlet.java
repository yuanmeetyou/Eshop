package yuan.com.eshop.servlet.admin;

import yuan.com.eshop.bean.Productlist;
import yuan.com.eshop.bean.admin.ProductPage;
import yuan.com.eshop.service.admin.adminProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "adminPageServlet",urlPatterns = {"/admin/page"})
public class adminPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           /*
           * 1、当前页
           * 2、当前条数
           * 3、总条数
           * 4、总页数（总条数/当前条数）
           * 5、每页显示的数据
           * */
           int countpage=1;
           int curretskip=5;
           int totalskip=new adminProjectService().findTotalSkip();
        adminProjectService adminProductService = new adminProjectService();
        ProductPage productPage = adminProductService.ProductPaging(countpage, curretskip, totalskip);
        request.setAttribute("productPage",productPage);
        request.getRequestDispatcher("/admin/product/list.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          doPost(request,response);
    }
}
