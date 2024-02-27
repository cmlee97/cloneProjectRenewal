package kr.ezen.shop.domain;

import lombok.Data;

import java.sql.Date;

@Data
public class NoticeDTO {

    private int bid;
    private String subject;
    private String contents;
    private int hit;
    private String writer;
    private Date reg_date;
}
