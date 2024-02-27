package kr.ezen.shop.domain;

import lombok.Data;

@Data
public class ProductDTO {
	private int p_num;
	private String p_name;
	private String p_category_fk;
	private String p_company;
	private String p_image;
	private int p_qty;
	private int price;
	private String p_spec;
	private String p_content;
	private int p_point;
	private String p_inputDate;
	
	private int toPrice;
	private int toPoint;
}
