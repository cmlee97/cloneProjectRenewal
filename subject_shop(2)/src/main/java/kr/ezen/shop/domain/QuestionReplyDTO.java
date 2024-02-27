package kr.ezen.shop.domain;

import lombok.Data;

import java.util.Date;

@Data
public class QuestionReplyDTO {
    private int rno;
    private int qid;
    private String r_contents;
    private String replyer;
    private Date r_date;
    private Date update_date;
}
