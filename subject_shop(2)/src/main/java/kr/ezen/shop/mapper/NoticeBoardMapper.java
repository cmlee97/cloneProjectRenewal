package kr.ezen.shop.mapper;

import kr.ezen.shop.domain.NoticeDTO;
import kr.ezen.shop.domain.PageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeBoardMapper {
    //공지사항 리스트
    List<NoticeDTO> noticeList(PageDTO paDto);
    //공지사항 등록
    void noticeRegister(NoticeDTO nDto);
    //공지사항 정보
    NoticeDTO noticeInfo(int bid);
    //공지사항 수정
    void noticeModify(NoticeDTO nDto);
    //공지사항 삭제
    void noticeRemove(int bid);
    //공지사항 수
    int totalNoticeCnt(PageDTO paDto);
}
