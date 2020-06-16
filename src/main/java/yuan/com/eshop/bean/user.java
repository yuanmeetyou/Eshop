package yuan.com.eshop.bean;

public class user {
    private String uid;
    private String username;
    private String upass;
    private String pass;
    private String realname;
    private String phone;

    public user(){}
    public user(String username, String password) {
        this.username = username;
        this.pass = password;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "user{" +
                "uid='" + uid + '\'' +
                ", username='" + username +
                ", pass='" + pass + '\'' +
                ", upass='" + upass + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
