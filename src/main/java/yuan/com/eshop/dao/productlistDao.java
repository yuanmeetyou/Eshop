package yuan.com.eshop.dao;

import yuan.com.eshop.bean.Productlist;
import yuan.com.eshop.bean.user;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class productlistDao {
    /*
     * 查询前台商品信息
     * */
    public List<Productlist> UserproductAllList(String cid){
        List<Productlist> productlists = new ArrayList<>();
        String sql="select * from product where cid=?";
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
            conn=jdbcutil.getConnection();
            try {
                pre = conn.prepareStatement(sql);
                pre.setString(1,cid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            res = pre.executeQuery();
            while (res.next()) {
                String pid = res.getString("pid");
                String pname = res.getString("pname");
                double market_price = res.getDouble("market_price");
                double shop_price = res.getDouble("shop_price");
                String pimage = res.getString("pimage");
                Date pdate = res.getDate("pdate");
                String date=null;
                if (pdate != null) {
                    date = new SimpleDateFormat("yyyy-MM-dd").format(pdate);
                }
                int is_hot = res.getInt("is_hot");
                String pdesc = res.getString("pdesc");
                int pflag = res.getInt("pflag");
                String cid1 = res.getString("cid");

                Productlist product = new Productlist(pid,pname,market_price,shop_price,pimage,
                        date,is_hot,pdesc,pflag,cid1);
                productlists.add(product);
            }
            return productlists;
        }catch (SQLException e){
            System.out.println("查询手机商品信息失败"+e.getMessage());
        }finally {
            jdbcutil.close(conn,pre,res);
        }
        return null;
    }
    /*
    * 查询后台商品信息
    * */
    public List<Productlist> productAllList(){
        List<Productlist> productlists = new ArrayList<>();
        String sql="select * from product";
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
            conn=jdbcutil.getConnection();
            try {
                pre = conn.prepareStatement(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            res = pre.executeQuery();
            while (res.next()) {
                String pid = res.getString("pid");
                String pname = res.getString("pname");
                double market_price = res.getDouble("market_price");
                double shop_price = res.getDouble("shop_price");
                String pimage = res.getString("pimage");
                Date pdate = res.getDate("pdate");
                String date=null;
                if (pdate != null) {
                   date = new SimpleDateFormat("yyyy-MM-dd").format(pdate);
                }
                int is_hot = res.getInt("is_hot");
                String pdesc = res.getString("pdesc");
                int pflag = res.getInt("pflag");
                String cid1 = res.getString("cid");

                Productlist product = new Productlist(pid,pname,market_price,shop_price,pimage,
                        date,is_hot,pdesc,pflag,cid1);
                productlists.add(product);
            }
            return productlists;
        }catch (SQLException e){
            System.out.println("查询手机商品信息失败"+e.getMessage());
        }finally {
            jdbcutil.close(conn,pre,res);
        }
        return null;
    }

     //查询最新商品列表
    public List<Productlist> findNewProduct() {
        List<Productlist> productlists = new ArrayList<>();
        String sql="select * from product  order by pdate desc limit 0,9";
        Connection conn = null;
        PreparedStatement pre=null;
        ResultSet res=null;
        try {
            conn=jdbcutil.getConnection();
            try {
                pre = conn.prepareStatement(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            res = pre.executeQuery();
            while (res.next()) {
                String pid = res.getString("pid");
                String pname = res.getString("pname");
                double market_price = res.getDouble("market_price");
                double shop_price = res.getDouble("shop_price");
                String pimage = res.getString("pimage");
                Date pdate = res.getDate("pdate");
                String date=null;
                if (pdate != null) {
                    date = new SimpleDateFormat("yyyy-MM-dd").format(pdate);
                }
                int is_hot = res.getInt("is_hot");
                String pdesc = res.getString("pdesc");
                int pflag = res.getInt("pflag");
                String cid = res.getString("cid");

                Productlist product = new Productlist(pid,pname,market_price,shop_price,pimage,
                        date,is_hot,pdesc,pflag,cid);
                productlists.add(product);
            }
            return productlists;
        }catch (SQLException e){
            System.out.println("查询最新商品信息失败"+e.getMessage());
        }finally {
            jdbcutil.close(conn,pre,res);
        }
        return null;
    }
    /*
    * 获取最热门的商品数据
    * */
    public List<Productlist> findHotProduct() {
        List<Productlist> productlists = new ArrayList<>();
        String sql="select * from product where is_hot=0 limit 0,9";
        Connection conn = null;
        PreparedStatement pre=null;
        ResultSet res=null;
        try {
            conn=jdbcutil.getConnection();
            try {
                pre = conn.prepareStatement(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            res = pre.executeQuery();
            while (res.next()) {
                String pid = res.getString("pid");
                String pname = res.getString("pname");
                double market_price = res.getDouble("market_price");
                double shop_price = res.getDouble("shop_price");
                String pimage = res.getString("pimage");
                Date pdate = res.getDate("pdate");
                String date=null;
                if (pdate != null) {
                    date = new SimpleDateFormat("yyyy-MM-dd").format(pdate);
                }
                int is_hot = res.getInt("is_hot");
                String pdesc = res.getString("pdesc");
                int pflag = res.getInt("pflag");
                String cid = res.getString("cid");

                Productlist product = new Productlist(pid,pname,market_price,shop_price,pimage,
                        date,is_hot,pdesc,pflag,cid);
                productlists.add(product);
            }
            return productlists;
        }catch (SQLException e){
            System.out.println("查询最热门商品信息失败"+e.getMessage());
        }finally {
            jdbcutil.close(conn,pre,res);
        }
        return null;
    }

     //购物
    public Productlist shoppingProduct(String pid) {
        String sql="select * from product where pid=?";
        Connection conn = null;
        PreparedStatement pre=null;
        ResultSet res=null;
        try {
            conn=jdbcutil.getConnection();
            try {
                pre = conn.prepareStatement(sql);
                pre.setString(1,pid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            res = pre.executeQuery();
            while (res.next()) {
                String pid1 = res.getString("pid");
                String pname = res.getString("pname");
                double market_price = res.getDouble("market_price");
                double shop_price = res.getDouble("shop_price");
                String pimage = res.getString("pimage");
                Date pdate = res.getDate("pdate");
                String date=null;
                if (pdate != null) {
                    date = new SimpleDateFormat("yyyy-MM-dd").format(pdate);
                }
                int is_hot = res.getInt("is_hot");
                String pdesc = res.getString("pdesc");
                int pflag = res.getInt("pflag");
                String cid = res.getString("cid");
                return new Productlist(pid,pname,market_price,shop_price,pimage,
                        date,is_hot,pdesc,pflag,cid);

            }

        }catch (SQLException e){
            System.out.println("查询最热门商品信息失败"+e.getMessage());
        }finally {
            jdbcutil.close(conn,pre,res);
        }
        return null;
    }
}
