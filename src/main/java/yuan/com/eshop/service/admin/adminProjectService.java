package yuan.com.eshop.service.admin;

import yuan.com.eshop.bean.Productlist;
import yuan.com.eshop.bean.admin.ProductPage;
import yuan.com.eshop.bean.category;
import yuan.com.eshop.dao.admin.PageProductDao;
import yuan.com.eshop.dao.admin.SerarchProductDao;
import yuan.com.eshop.dao.admin.addProductDao;
import yuan.com.eshop.dao.admin.categoryDao;
import yuan.com.eshop.dao.productlistDao;

import java.util.List;

public class adminProjectService {
    /*
    * 返回后台所有商品数据
    * */
    public List<Productlist> findAllproduct(){
        productlistDao productlistDao = new productlistDao();
        List<Productlist> productlists = productlistDao.productAllList();
        return productlists;
    }
    /*
    * 返回所有商品列表
    * */
    public List<category> findcategory(){
        categoryDao categoryDao = new categoryDao();
        List<category> allcategory = categoryDao.findAllcategory();
        return  allcategory;
    }
    /*
    * 添加商品数据
    * */
    public void addprodut(Productlist productlist) {
        addProductDao addProductDao = new addProductDao();
       addProductDao.addProdut(productlist);
    }
    /*
    * 删除一条商品数据
    * */
    public void delProduct(String pid) {
        addProductDao addProductDao = new addProductDao();
        addProductDao.delProduct(pid);
    }

    /*
    * 搜索商品数据
    * */
    public List<Productlist> serarchProduct(Productlist productlist) {
        SerarchProductDao serarchProduct = new SerarchProductDao();
        List<Productlist> productlists = serarchProduct.serarchProduct(productlist);
        return productlists;
    }

    /*
     * 显示分页
     * */
    public ProductPage ProductPaging(int countpage, int curretskip,int totalskip) {
        ProductPage productPage = new ProductPage();
        // 1、当前页
        productPage.setPagecount(countpage);
        //2、当前条数
        productPage.setCurretskip(curretskip);
        //3、总条数
        productPage.setCurretskip(totalskip);
        //4、总页数（总条数/当前条数）
        int pagecount =(int)Math.ceil(1.0*totalskip/curretskip);
        productPage.setPagecount(pagecount);
        //5、每页显示的数据
        int index=(countpage-1)*curretskip;
        List<Productlist> productlists = new PageProductDao().ProductData(index, curretskip);
        productPage.setProductlists(productlists);
        return productPage;
    }
    /*
     * 查询数据库的数据的数目
     * */
    public int findTotalSkip() {
       return  new PageProductDao().pageProduct();
    }
    /*
    * 根据商品的ID来查询一条商品的数据
    * */
    public Productlist selectProductById(String pid) {
        return new addProductDao().selectProductById(pid);
    }
//
    public boolean updateProduct(Productlist productlist) {
       return new addProductDao().updateProduct(productlist);
    }


}
