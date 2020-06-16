package yuan.com.eshop.dao.admin;

import yuan.com.eshop.bean.Productlist;
import yuan.com.eshop.dao.jdbcutil;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
public class addProductDao {
    /*
     * 1、数据库添加商品数据
     *
     * */
    public void addProdut(Productlist productlist) {
        String sql="insert into product values (?,?,?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement pre=null;
        try {
            conn=jdbcutil.getConnection();
            try {
                pre = conn.prepareStatement(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            pre.setString(1,productlist.getPid());
            pre.setString(2,productlist.getPname());
            pre.setDouble(3,productlist.getMarket_price());
            pre.setDouble(4,productlist.getShop_price());
            pre.setString(5,productlist.getPimage());
            //将字符串转为日期格式存储到数据库中
            String pdate = productlist.getPdate();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date parse = df.parse(pdate);
            pre.setDate(6, java.sql.Date.valueOf(df.format(parse)));
            pre.setInt(7,productlist.getIs_hot());
            pre.setString(8,productlist.getPdesc());
            Integer pflag = productlist.getPflag();
            pre.setInt(9,pflag);
            pre.setString(10,productlist.getCid());
            pre.executeUpdate();
        }catch (SQLException | ParseException e){
            System.out.println("数据库添加商品信息失败"+e.getMessage());
        }finally {
            try {
                if (pre != null) {
                    pre.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


    }
    /*
    * 数据库删除商品信息
    * */
    public void delProduct(String pide) {
        String sql = "delete from product where pid=?";
        Connection conn = null;
        PreparedStatement pre = null;
        try {
            conn = jdbcutil.getConnection();
            try {
                pre = conn.prepareStatement(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            pre.setString(1,pide);
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println("数据库删除商品信息失败" + e.getMessage());
        } finally {
            try {
                if (pre != null) {
                    pre.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
/*
* 根据id查询一条商品的数据
* */
    public Productlist selectProductById(String pid1) {
        String sql="select * from product where pid=?";
        try {
            Connection connection = jdbcutil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,pid1);
            ResultSet rs = preparedStatement.executeQuery();
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
                return new Productlist(pid  ,pname,market_price,shop_price,pimage,pdate,is_hot,pdesc,pflag,cid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    /*
     * 修改商品的信息
     * */
    public boolean updateProduct(Productlist productlist) {
        String sql="update product set pname=?,market_price=?,shop_price=?,is_hot=?,pdesc=?,cid=?  where pid=?";
        Connection conn = null;
        PreparedStatement pre=null;
        try {
            conn=jdbcutil.getConnection();
            try {
                pre = conn.prepareStatement(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (productlist.getPname() != null && productlist.getPname().trim().length()>0) {
                pre.setString(1,productlist.getPname());
            }else{
                pre.setNull(1, Types.VARCHAR);
            }
            if (productlist.getMarket_price() >=0 ) {
                pre.setDouble(2,productlist.getMarket_price());
            }else{
                pre.setNull(2, Types.DOUBLE);
            }
            if (productlist.getShop_price() >=0 ) {
                pre.setDouble(3,productlist.getShop_price());
            }else{
                pre.setNull(3, Types.DOUBLE);
            }
            /*if (productlist.getPimage() != null) {
                pre.setString(4,productlist.getPimage());
            }else {
                pre.setNull(4,Types.VARCHAR);
            }*/
                pre.setInt(4,productlist.getIs_hot());
            if (productlist.getPdesc() != null && productlist.getPdesc().trim().length()>0) {
                pre.setString(5,productlist.getPdesc());
            }else {
                pre.setNull(5,Types.VARCHAR);
            }
            pre.setString(6,productlist.getCid());
            pre.setString(7,productlist.getPid());
            int i = pre.executeUpdate();
            return (i==1 ? true : false);
        }catch (Exception e){
            System.out.println("更新商品数据失败"+e.getMessage());
        }finally {
            try {
                if (pre != null) {
                    pre.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }


}
