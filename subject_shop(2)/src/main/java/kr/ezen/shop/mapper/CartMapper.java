package kr.ezen.shop.mapper;

import kr.ezen.shop.domain.CartDTO;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.domain.ProductDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartMapper {
    //장바구니
    //상품추가
    void cartAdd(CartDTO cDto);
    //장바구니 리스트
    List<CartDTO> cartList(String id);
    //장바구니 삭제
    void cartDelete(int p_num);
    //장바구니 상품개수 수정
    void cartModify(CartDTO cDto);
    //장바구니 상품체크
    CartDTO cartProdCheck(CartDTO cDto);
    //구매자 정보
    MemberDTO buyerInfo(String id);
    ////결제페이지 제품삭제
    void checkoutDelete(int prod);
}
