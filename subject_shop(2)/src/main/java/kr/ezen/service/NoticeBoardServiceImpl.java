package kr.ezen.service;

import kr.ezen.shop.domain.NoticeDTO;
import kr.ezen.shop.domain.PageDTO;
import kr.ezen.shop.mapper.NoticeBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

    @Autowired
    private NoticeBoardMapper mapper;
    @Override
    public List<NoticeDTO> noticeList(PageDTO paDto) {
        int totalCnt = mapper.totalNoticeCnt(paDto);
        paDto.setValue(totalCnt);
        List<NoticeDTO> list = mapper.noticeList(paDto);
        return list;
    }

    @Override
    public void noticeRegister(NoticeDTO nDto) {
        mapper.noticeRegister(nDto);
    }

    @Override
    public NoticeDTO noticeInfo(int bid) {
        return mapper.noticeInfo(bid);
    }

    @Override
    public void noticeModify(NoticeDTO nDto) {
        mapper.noticeModify(nDto);
    }

    @Override
    public void noticeRemove(int bid) {
        mapper.noticeRemove(bid);
    }
}
