package yuan.com.eshop.service.user;

import yuan.com.eshop.bean.Productlist;
import yuan.com.eshop.dao.UserProductSerarchDao;
import yuan.com.eshop.dao.productlistDao;

import java.util.List;

public class UserProductService {
    /*
    * ajax异步请求获取商品数据
    * */
    public List<Productlist> UserSearchProduct(String content){
       return new UserProductSerarchDao().UserSearchProduct(content);
    }
    /*
     * post请求获取商品数据
     * */
    public List<Productlist> PostSearchProduct(String serarch) {
        return new UserProductSerarchDao().PostSearchProduct(serarch);
    }
    /*
     * 获取最新商品数据
     **/
    public List<Productlist> findNewProduct() {
        return new productlistDao().findNewProduct();
    }
    /*
     * 获取最热门商品数据
     * */
    public List<Productlist> findHotProduct() {
        return new productlistDao().findHotProduct();
    }

    /*
    * 通过id购物
    * */
    public Productlist shoppingProduct(String pid) {
        return new productlistDao().shoppingProduct(pid);
    }

}
