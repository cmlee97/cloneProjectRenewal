package kr.ezen.shop.mapper;

import kr.ezen.shop.domain.QuestionReplyDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QuestionReplyMapper {
    //댓글등록
    int insert(QuestionReplyDTO rDto);
    //댓글 조회
    QuestionReplyDTO select(int rno);
    //댓글 수정
    int update(QuestionReplyDTO rDto);
    //댓글 삭제
    int delete(int rno);
    //특정게시글 전체 댓글 수
    int replyCnt(int qid);

    //게시글별 댓글 리스트
    List<QuestionReplyDTO> getListByQid(@Param("qid") int qid,
                                        @Param("startIndex") int si,
                                        @Param("cntPerPage") int cp);
}
