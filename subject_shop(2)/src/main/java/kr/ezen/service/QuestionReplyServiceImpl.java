package kr.ezen.service;

import kr.ezen.shop.domain.QuestionReplyDTO;
import kr.ezen.shop.domain.ReplyPageDTO;
import kr.ezen.shop.mapper.CustomerMapper;
import kr.ezen.shop.mapper.QuestionReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionReplyServiceImpl implements QuestionReplyService{
    @Autowired
    private QuestionReplyMapper mapper;
    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public int register(QuestionReplyDTO rDto) {
        int n = mapper.insert(rDto);
        return n;
    }

    @Override
    public QuestionReplyDTO read(int rno) {
        return mapper.select(rno);
    }

    @Override
    public int modify(QuestionReplyDTO rDto) {
        return mapper.update(rDto);
    }

    @Override
    public int remove(int rno) {
        QuestionReplyDTO rDto = mapper.select(rno);
        return mapper.delete(rno);
    }

    @Override
    public QuestionReplyDTO getList(int qid) {
        QuestionReplyDTO answer = mapper.getListByQid(qid);
        return answer;
    }
}
