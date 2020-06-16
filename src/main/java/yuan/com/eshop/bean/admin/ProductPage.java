package yuan.com.eshop.bean.admin;

import yuan.com.eshop.bean.Productlist;

import java.util.List;

public class ProductPage {
    /*
    * 1、当前页
    * 2、当前的条数
    * 3、总条数
    * 4、总页数
    * 5、每页显示的数据
    * */
    private  Integer currentpage;
    private Integer curretskip;
    private  Integer totalskip;
    private Integer pagecount;
    private List<Productlist> productlists;
    public Integer getPagecount() {
        return pagecount;
    }

    public void setPagecount(Integer pagecount) {
        this.pagecount = pagecount;
    }

    public Integer getCurrentpage() {
        return currentpage;
    }

    public void setCurrentpage(Integer currentpage) {
        this.currentpage = currentpage;
    }

    public Integer getCurretskip() {
        return curretskip;
    }

    public void setCurretskip(Integer curretskip) {
        this.curretskip = curretskip;
    }


    public Integer getTotalskip() {
        return totalskip;
    }

    public void setTotalskip(Integer totalskip) {
        this.totalskip = totalskip;
    }

    public List<Productlist> getProductlists() {
        return productlists;
    }

    public void setProductlists(List<Productlist> productlists) {
        this.productlists = productlists;
    }

}
