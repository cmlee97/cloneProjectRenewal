package kr.ezen.service;

import kr.ezen.shop.domain.NoticeDTO;
import kr.ezen.shop.domain.PageDTO;
import kr.ezen.shop.domain.QuestionDTO;
import kr.ezen.shop.domain.QuestionReplyDTO;
import kr.ezen.shop.mapper.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService{

    @Autowired
    private CustomerMapper mapper;
    @Override
    public List<NoticeDTO> noticeList(PageDTO paDto) {
        int totalCnt = mapper.totalNoticeCnt(paDto);
        paDto.setValue(totalCnt);
        return mapper.noticeList(paDto);
    }

    @Override
    public List<QuestionDTO> questionList(PageDTO paDto) {
        int totalCnt = mapper.totalQuesCnt(paDto);
        paDto.setValue(totalCnt);
        return mapper.questionList(paDto);
    }

    @Override
    public void quesRegister(QuestionDTO qDto) {
        mapper.quesRegister(qDto);
    }

    @Override
    public QuestionDTO quesInfo(int qid) {
        mapper.plusHit(qid);
        return mapper.quesInfo(qid);
    }

    @Override
    public QuestionDTO quesUpdate(int qid) {
        return mapper.quesInfo(qid);
    }

	@Override
	public QuestionReplyDTO answer(int qid) {
		QuestionReplyDTO qrDto = new QuestionReplyDTO();
		 int ans_count = mapper.answerCount(qid); 
		 if(ans_count!=0)
			qrDto = mapper.answer(qid);
		return qrDto;
	}

}
