package kr.ezen.shop.domain;

import lombok.Data;

import java.util.Date;

@Data
public class QuestionReplyDTO {
    private int rno;
    private int qid;
    private String ans_contents;
    private String replyer;
    private String q_writer;
    private Date anw_reg_date;
   
}
