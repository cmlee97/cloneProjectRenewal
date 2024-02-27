package kr.ezen.controller;

import kr.ezen.service.QuestionReplyService;
import kr.ezen.shop.domain.QuestionReplyDTO;
import kr.ezen.shop.domain.ReplyPageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/replies")
public class QuestionReplyController {

    @Autowired
    private QuestionReplyService service;

    //댓글 등록
    @PostMapping("/new")
    public String create(@RequestBody QuestionReplyDTO qrDto){
        int n = service.register(qrDto);
        return n==1?"success":"fail";
    }
    //댓글 조회
    @GetMapping("/{rno}")
    public QuestionReplyDTO read(@PathVariable("rno") int rno){
        return service.read(rno);
    }
    //댓글 수정
    @PutMapping("/{rno}")
    public String modify(@PathVariable("rno") int rno, @RequestBody QuestionReplyDTO rDto){
        rDto.setRno(rno);
        int n = service.modify(rDto);
        return n==1?"success":"fail";
    }
    //댓글 삭제
    @DeleteMapping("/{rno}")
    public String remove(@PathVariable("rno") int rno){
        int n = service.remove(rno);
        return n==1?"success":"fail";
    }
    //게시글별 댓글 리스트
    @GetMapping("/list/{qid}/{viewPage}")
    public ReplyPageDTO getList(@PathVariable("qid") int qid, @PathVariable("viewPage") int viewPage){
        ReplyPageDTO rPageDto = service.getList(qid,viewPage);
        return rPageDto;
    }
}
