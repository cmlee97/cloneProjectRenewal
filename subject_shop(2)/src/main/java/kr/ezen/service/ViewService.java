package kr.ezen.service;

import kr.ezen.shop.domain.CartDTO;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.domain.PageDTO;
import kr.ezen.shop.domain.ProductDTO;
import kr.ezen.shop.domain.QuestionDTO;
import kr.ezen.shop.domain.QuestionReplyDTO;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ViewService {

    //제품 전체리스트
    List<ProductDTO> prodList();
    //카테고리 리스트
    List<CategoryDTO> catList();
    //스펙별 리스트
    List<ProductDTO> specView(String p_spec);
    //카테고리별 제품리스트
    List<ProductDTO> catView(String p_category_fk);
    //제품상세보기
    ProductDTO prodView(int p_num);

    //장바구니
    //상품추가
    void cartAdd(CartDTO cDto);


    //사용자 정보 조회
    MemberDTO userInfo(MemberDTO dto);
    //사용자 정보 수정
    void userModify(MemberDTO mDto);
    //사용자 문의사항 조회
	List<QuestionDTO> quesList(PageDTO paDto);
	 //문의사항게시물 정보
    QuestionDTO myquesInfo(int qid);
	//문의사항 수정
    void quesModify(QuestionDTO qDto);
    //문의사항 삭제
    void questionRemove(int qid);
    //문의사항 답변조회
	QuestionReplyDTO reply(int qid);
}
