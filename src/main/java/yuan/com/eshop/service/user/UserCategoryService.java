package yuan.com.eshop.service.user;

import com.google.gson.internal.bind.util.ISO8601Utils;
import yuan.com.eshop.bean.category;
import yuan.com.eshop.dao.categoryDao;

import java.util.List;

public class UserCategoryService {
    public List<category> findCategoryList(){
        return new categoryDao().findCategoryList();
    }

}

