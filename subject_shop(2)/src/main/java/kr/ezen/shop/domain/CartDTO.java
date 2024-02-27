package kr.ezen.shop.domain;

import lombok.Data;

@Data
public class CartDTO {
    private int c_num;
    private String id;
    private int p_num;
    private int p_qty;

    private String p_name;
    private String p_image;
    private int price;
    private int p_point;
    private String p_spec;

    private int tot_price;
    private int tot_point;


    public int getP_qty() {
        setTotal();
        return p_qty;
    }

    public void setTotal(){
        this.tot_price = this.p_qty*price;
        this.tot_point = this.p_qty*p_point;
    }

}
