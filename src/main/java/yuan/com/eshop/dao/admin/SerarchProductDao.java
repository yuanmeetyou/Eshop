package yuan.com.eshop.dao.admin;

import yuan.com.eshop.bean.Productlist;
import yuan.com.eshop.dao.jdbcutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*
* 搜索商品数据的查询
* */
public class SerarchProductDao {
    public List<Productlist> serarchProduct(Productlist productlist) {
        List<Object> values=new ArrayList<>();
        String sql="select * from product where 1=1  ";
        if (productlist.getPname()!= null && productlist.getPname().trim().length()>0 ) {
            sql+=" and product.pname  like ?";
            values.add("%"+productlist.getPname()+"%");
        }
        if (productlist.getIs_hot()!= null && productlist.getIs_hot()!=-1) {
            sql+=" and product.is_hot  like ?";
            values.add("%"+productlist.getIs_hot()+"%");
        }
        if (productlist.getCid()!= null && !productlist.getCid().equals("-1")) {
            sql+=" and product.cid  like ?";
            values.add("%"+productlist.getCid()+"%");
        }
        try (Connection con = jdbcutil.getConnection();
        ) {
            PreparedStatement ps = con.prepareStatement(sql);
            //设置传位符的值
            for (int i = 0; i < values.size(); i++) {
                ps.setObject(i+1,values.get(i));
            }
            List<Productlist> productlists=new ArrayList<>();
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
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
        } catch (Exception e) {
            System.out.println("商品搜索数据失败"+e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
