package yuan.com.eshop.dao;


import java.sql.*;
import java.util.ResourceBundle;

public class jdbcutil {
    //数据库的连接信息
    private final static String DRIVER=getValue("jdbc.driver");
    private final static String URL=getValue("jdbc.url");
    private final static String USER=getValue("jdbc.user");
    private final static String PASSWORD=getValue("jdbc.password");
    //1、注册数据库驱动程序

   static {
       try {
           Class.forName(DRIVER);
       } catch (ClassNotFoundException e) {
           e.printStackTrace();
       }
   }
   //寻找资源包，找到对应的字符串
   public static String getValue(String key){
       //使用指定的基本名称、默认的语言环境和调用者的类加载器获取资源包。
        ResourceBundle jdbc = ResourceBundle.getBundle("jdbc");
        // 从此资源包或它的某个父包中获取给定键的字符串。
        return jdbc.getString(key);
    }

    /**
     * @return con
     */
   //2、连接数据库
    public static Connection getConnection(){
        try {

            Connection con = DriverManager.getConnection(URL,USER,PASSWORD);
             return con;
        } catch (SQLException e) {
            System.err.println(e.getMessage()+"数据库连接失败");
        }
        return null;
    }
    //6、关闭数据库
    public static void close(Connection conn, Statement stat,ResultSet res){
        try {
            if (res != null) {
                res.close();
            }
            if (stat != null) {
                stat.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
