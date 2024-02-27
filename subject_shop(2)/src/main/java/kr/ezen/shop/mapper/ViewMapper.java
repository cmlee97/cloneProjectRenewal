package kr.ezen.shop.mapper;

import kr.ezen.shop.domain.CartDTO;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.domain.ProductDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ViewMapper {
    //제품 전체 리스트
    List<ProductDTO> prodList();
    //카테고리 리스트
    List<CategoryDTO> catList();
    //스펙별 제품리스트
    List<ProductDTO> specView(String p_spec);
    //카테고리별 제품리스트
    List<ProductDTO> catView(String p_category_fk);

    //제품상세보기
    ProductDTO prodView(int p_num);

    //장바구니
    //상품추가
    void cartAdd(CartDTO cDto);

    //사용자 정보
    MemberDTO userInfo(MemberDTO dto);
    //사용자 정보 수정
    void userModify(MemberDTO mDto);
}
