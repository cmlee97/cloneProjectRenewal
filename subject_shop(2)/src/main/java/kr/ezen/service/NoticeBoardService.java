package kr.ezen.service;

import kr.ezen.shop.domain.NoticeDTO;
import kr.ezen.shop.domain.PageDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NoticeBoardService {
    //공지사항 리스트출력
    List<NoticeDTO> noticeList(PageDTO paDto);
    //공지사항 등록
    void noticeRegister(NoticeDTO nDto);
    //공지사항 정보
    NoticeDTO noticeInfo(int bid);
    //공지사항 수정
    void noticeModify(NoticeDTO nDto);
    //공지사항 삭제
    void noticeRemove(int bid);
}
