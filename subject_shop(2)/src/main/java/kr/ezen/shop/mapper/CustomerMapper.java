package kr.ezen.shop.mapper;

import kr.ezen.shop.domain.NoticeDTO;
import kr.ezen.shop.domain.PageDTO;
import kr.ezen.shop.domain.QuestionDTO;
import kr.ezen.shop.domain.QuestionReplyDTO;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CustomerMapper {
    //공지사항 리스트
    List<NoticeDTO> noticeList(PageDTO paDto);
    //공지사항 수
    int totalNoticeCnt(PageDTO paDto);
    //문의사항 리스트
    List<QuestionDTO> questionList(PageDTO paDto);
    //문의사항 수
    int totalQuesCnt(PageDTO paDto);

    //문의사항 등록
    void quesRegister(QuestionDTO qDto);
    //문의사항 게시물 정보
    QuestionDTO quesInfo(int qid);
    //조회수
    void plusHit(int qid);
    //문의사항 답변 조회
  	QuestionReplyDTO answer(int qid);
  	//문의사항 개수 조회
  	int answerCount(int qid);
}
