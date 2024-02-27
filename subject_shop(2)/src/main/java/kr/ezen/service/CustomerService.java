package kr.ezen.service;

import kr.ezen.shop.domain.NoticeDTO;
import kr.ezen.shop.domain.PageDTO;
import kr.ezen.shop.domain.QuestionDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CustomerService {
    //공지사항 리스트
    List<NoticeDTO> noticeList(PageDTO paDto);
    //문의사항 리스트
    List<QuestionDTO> questionList(PageDTO paDto);
    //문의사항 등록
    void quesRegister(QuestionDTO qDto);
    //문의사항게시물 정보
    QuestionDTO quesInfo(int qid);
    //문의사항 게시물 업데이트시 정보
    QuestionDTO quesUpdate(int qid);
    //문의사항 수정
    void quesModify(QuestionDTO qDto);
    //문의사항 삭제
    void questionRemove(int qid);
}
