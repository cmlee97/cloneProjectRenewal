package kr.ezen.shop.domain;

import lombok.Data;

import java.sql.Date;

@Data
public class MemberDTO {
	private int no;
	private String id;
	private String pw;
	private String name;
	private int age;
	private Date birthday;
	private String email;
	private String tel;

	private String zipcode;
	private String road_addr;
	private String jibun_addr;
	private String detail_addr;
	
}
