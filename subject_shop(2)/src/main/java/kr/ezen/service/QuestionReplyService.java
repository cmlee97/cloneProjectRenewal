package kr.ezen.service;

import kr.ezen.shop.domain.QuestionReplyDTO;
import kr.ezen.shop.domain.ReplyPageDTO;
import org.springframework.stereotype.Service;

@Service
public interface QuestionReplyService {
    //댓글 등록
    int register(QuestionReplyDTO rDto);
    //댓글 조회
    QuestionReplyDTO read(int rno);
    //댓글 수정
    int modify(QuestionReplyDTO rDto);
    //댓글 삭제
    int remove(int rno);
    //게시글별 댓글리스트
    ReplyPageDTO getList(int qid, int viewPage);

    int replyCnt(int qid);
}
