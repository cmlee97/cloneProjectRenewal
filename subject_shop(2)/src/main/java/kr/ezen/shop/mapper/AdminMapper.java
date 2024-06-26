package kr.ezen.shop.mapper;

import java.util.List;
import java.util.Map;

import kr.ezen.shop.domain.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;

@Mapper
public interface AdminMapper {

	//관리자 로그인
	AdminDTO loginOk(AdminDTO aDto);

	//카테고리등록
	int catInput(CategoryDTO cDto);
	//카테고리 리스트
	List<CategoryDTO> catList();
	//카테고리 정보
	CategoryDTO catInfo(int cat_num);
	//카테고리 수정
	int catUpdate(CategoryDTO cDto);
	//카테고리 삭제
	int catDelete(int cat_num);

	//회원리스트
	List<MemberDTO> memberList(PageDTO pDto);
	//회원정보
	MemberDTO memberInfo(int no);
	//회원수정
	int memberUpdate(MemberDTO mDto);
	//회원삭제
	int deleteMember(int no);

	//제품리스트
	List<ProductDTO> prodList(PageDTO pDto);
	//제품등록
	int prodInput(Map map);
	//제품 정보
	ProductDTO prodInfo(int p_num);
	///제품수정
	int prodUpdate(Map map);
	//제품삭제
	int prodDelete(int p_num);

	//전체 제품수
	int totalProdCnt(PageDTO pDto);

	int totalMemCnt(PageDTO pDto);
	//문의사항 리스트
	List<QuestionDTO> questionList(PageDTO paDto);
	//문의사항 개수
	int totalQuesCnt(PageDTO paDto);
	//문의사항 정보
	QuestionDTO quesInfo(int qid);
	//문의사항답변 등록
	void answerRegister(QuestionReplyDTO qrDto);
	//문의사항답변 삭제
	void answerDelete(int rno);
	//문의사항답변시 문의사항상태 변경
	void stateChangeReg(int qid);	
	//문의사항답변 삭제시 문의사항상태 변경
	void stateChangeDel(int qid);	
	//문의사항 수정
	void answerModify(QuestionReplyDTO qrDto);
	//문의사항 답변 조회
	QuestionReplyDTO answer(int qid);
	//문의사항 개수 조회
	int answerCount(int qid);
}
