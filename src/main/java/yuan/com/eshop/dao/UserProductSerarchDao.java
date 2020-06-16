package yuan.com.eshop.dao;

import yuan.com.eshop.bean.Productlist;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class UserProductSerarchDao {
    /*
    * 异步请求获取商品数据
    * */
    public List<Productlist> UserSearchProduct(String content) {
       List<Productlist> productlists=new ArrayList<>();
        String sql="select pname from product where pname like ? limit 0,5  ";
        try (Connection con = jdbcutil.getConnection();
        ) {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1,"%"+content+"%");
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                String pname = rs.getString("pname");
                //String cno = rs.getString("cno");
                productlists.add(new Productlist(pname)) ;
            }
          return productlists;
        } catch (Exception e) {
            System.out.println("商品搜索数据失败"+e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    //通过主动请求获取商品数据
    public List<Productlist> PostSearchProduct(String serarch) {
        List<Object> values=new ArrayList<>();
        List<Productlist> productlists=new ArrayList<>();
        String sql="select * from product where 1=1 ";
        if (serarch != null && serarch.trim().length()>0) {
            sql+=" and product.pname like ?";
            values.add("%"+serarch+"%");
        }
        try (Connection con = jdbcutil.getConnection();
        ) {
            PreparedStatement ps = con.prepareStatement(sql);
            for(int i=0;i<values.size();i++){
                ps.setObject(i+1,values.get(i));
            }
            ResultSet res=ps.executeQuery();
            while (res.next()){
                String pid = res.getString("pid");
                String pname = res.getString("pname");
                double shop_price = res.getDouble("shop_price");
                String pimage = res.getString("pimage");
                String pdesc = res.getString("pdesc");
                String cid = res.getString("cid");
                Productlist product = new Productlist(pid,pname,shop_price,pimage,
                        pdesc,cid);
                productlists.add(product);
            }
            return productlists;
        } catch (Exception e) {
            System.out.println("查询部分商品信息失败"+e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
