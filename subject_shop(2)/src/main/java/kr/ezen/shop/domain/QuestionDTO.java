package kr.ezen.shop.domain;

import lombok.Data;

import java.sql.Date;


@Data
public class QuestionDTO {
    private int qid;
    private String q_subject;
    private String q_contents;
    private int q_hit;
    private String q_writer;
    private Date reg_date;
}
