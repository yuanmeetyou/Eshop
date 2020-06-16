package yuan.com.eshop.dao;

import yuan.com.eshop.bean.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class categoryDao {
    /*
    * 查询所有列表*/
    public List<category> findCategoryList() {
        List<category> lists=new ArrayList<category>();
        String sql="select * from category";
        Connection conn = null;
        PreparedStatement pre=null;
        ResultSet res=null;
        try {
            //1、加载驱动程序
            //2、连接数据库
            //3、通过Connection创建语句对象java.sql.Statement(发送sql语句)
            //4、执行预编译前，有占位符，还需要设置占位符的值
            //5、增删改查(CRUD),查询有结果集java.sql.Resultset
            //6、关闭数据库 Connection Statement Resultset
            conn= jdbcutil.getConnection();
            try {
                pre = conn.prepareStatement(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            res = pre.executeQuery();
            while (res.next()) {
                String cid = res.getString("cid");
                String cname = res.getString("cname");
                lists.add(new category(cid,cname));
            }
            return lists;
        }catch (SQLException e){
            System.out.println("登录失败"+e.getMessage());
        }finally {
            jdbcutil.close(conn,pre,res);
        }
        return null;
    }
}
