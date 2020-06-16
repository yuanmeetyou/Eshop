package yuan.com.eshop.dao;

import yuan.com.eshop.bean.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class registerDao {
    public int register(user user){
        String sql="insert into user values (?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement pre=null;
        try {
            conn=jdbcutil.getConnection();
            try {
                pre = conn.prepareStatement(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            pre.setString(1,user.getUid());
            pre.setString(2,user.getUsername());
            pre.setString(3,user.getPass());
            pre.setString(4,user.getUpass());
            pre.setString(5,user.getPhone());
            pre.setString(6,user.getRealname());
            int i = pre.executeUpdate();
            return i;
        }catch (SQLException e){
            System.out.println("登录失败"+e.getMessage());
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
       return 0;
    }
}
