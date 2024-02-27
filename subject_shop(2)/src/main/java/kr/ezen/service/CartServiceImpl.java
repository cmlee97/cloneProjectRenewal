package kr.ezen.service;

import kr.ezen.shop.domain.CartDTO;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.domain.ProductDTO;
import kr.ezen.shop.mapper.CartMapper;
import kr.ezen.shop.mapper.ViewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper mapper;

    @Override
    public void cartAdd(CartDTO cDto) {
        CartDTO prodCheck = mapper.cartProdCheck(cDto);
        if(prodCheck!=null){
            prodCheck.setP_qty(prodCheck.getP_qty()+cDto.getP_qty());
            mapper.cartModify(prodCheck);
        }else{
            mapper.cartAdd(cDto);
        }
    }

    @Override
    public List<CartDTO> cartList(String id) {
        List<CartDTO> cart_list = mapper.cartList(id);
        return cart_list;
    }

    @Override
    public void cartDelete(int p_num) {
            mapper.cartDelete(p_num);
    }

    @Override
    public void cartModify(CartDTO cDto) {
        mapper.cartModify(cDto);
    }

    @Override
    public MemberDTO buyerInfo(String id) {
        MemberDTO mDto = mapper.buyerInfo(id);
        return mDto;
    }

    @Override
    public void checkoutDelete(String delProdNums) {
        String[] prodArr = delProdNums.split("/");
        for(int i = 0; i< prodArr.length; i++) {
            int prod = Integer.parseInt(prodArr[i]);
            mapper.checkoutDelete(prod);
        }
    }


}
