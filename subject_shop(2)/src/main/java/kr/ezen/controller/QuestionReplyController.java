package kr.ezen.controller;

import kr.ezen.service.QuestionReplyService;
import kr.ezen.service.ViewService;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.QuestionReplyDTO;
import kr.ezen.shop.domain.ReplyPageDTO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/replies")
public class QuestionReplyController {

    @Autowired
    private QuestionReplyService service;

    //게시글별 댓글 리스트
    @GetMapping("/list/{qid}")
    public QuestionReplyDTO getList(@PathVariable("qid") int qid){
    	QuestionReplyDTO answer = service.getList(qid);
        return answer;
    }
}
