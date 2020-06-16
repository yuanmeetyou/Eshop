package yuan.com.eshop.dao.admin;

import yuan.com.eshop.bean.Productlist;
import yuan.com.eshop.bean.category;
import yuan.com.eshop.dao.jdbcutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PageProductDao {
    /*
    * 返回商品的总条数
    * */
    public int pageProduct(){
        int count=0;
        PreparedStatement pre=null;
        ResultSet res=null;
        String sql="select count(*) from product";
        Connection conn = jdbcutil.getConnection();
        try {
            pre = conn.prepareStatement(sql);
            res= pre.executeQuery();
            while (res.next()) {
                count++;
            }
            return count;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            jdbcutil.close(conn,pre,res);
        }
        return 0;
    }
    /*
    * 返回分页的数据
    * */
    public List<Productlist> ProductData(int index, int curretskip) {
        List<Productlist> productlists=new ArrayList<Productlist>();
        String sql="select * from product limit index,curretskip";
        Connection conn = null;
        PreparedStatement pre=null;
        ResultSet rs=null;
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
            rs= pre.executeQuery();
            while (rs.next()) {
                String pid = rs.getString("pid");
                String pname = rs.getString("pname");
                double market_price = rs.getDouble("market_price");
                double shop_price = rs.getDouble("shop_price");
                String pimage = rs.getString("pimage");
                String pdate = rs.getString("pdate");
                int is_hot = rs.getInt("is_hot");
                String pdesc = rs.getString("pdesc");
                int pflag = rs.getInt("pflag");
                String cid = rs.getString("cid");

                //String cno = rs.getString("cno");
                productlists.add(new Productlist(pid  ,pname,market_price,shop_price,pimage,pdate,is_hot,pdesc,pflag,cid)) ;
            }
            return productlists;
        }catch (SQLException e){
            System.out.println("当前页数获取失败"+e.getMessage());
        }finally {
            jdbcutil.close(conn,pre,rs);
        }
        return null;
    }
}
