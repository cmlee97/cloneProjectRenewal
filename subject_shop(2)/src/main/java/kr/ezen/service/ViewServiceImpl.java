package kr.ezen.service;

import kr.ezen.shop.domain.CartDTO;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.domain.ProductDTO;
import kr.ezen.shop.mapper.AdminMapper;
import kr.ezen.shop.mapper.ViewMapper;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

@Service
public class ViewServiceImpl implements ViewService {
    @Autowired
    private ViewMapper mapper;


    @Override
    public List<ProductDTO> prodList() {
        List<ProductDTO> prod_list = mapper.prodList();
        return prod_list;
    }

    @Override
    public List<CategoryDTO> catList() {
        List<CategoryDTO> cat_list = mapper.catList();
        return cat_list;
    }

    @Override
    public List<ProductDTO> specView(String p_spec) {
        List<ProductDTO> specProdList = mapper.specView(p_spec);
        return specProdList;
    }

    @Override
    public List<ProductDTO> catView(String p_category_fk) {
        List<ProductDTO> catProdList = mapper.catView(p_category_fk);
        return catProdList;
    }

    @Override
    public ProductDTO prodView(int p_num) {
        ProductDTO pDto = mapper.prodView(p_num);
        return pDto;
    }

    @Override
    public void cartAdd(CartDTO cDto) {
        mapper.cartAdd(cDto);
    }

    @Override
    public MemberDTO userInfo(MemberDTO dto) {
        return mapper.userInfo(dto);
    }

    @Override
    public void userModify(MemberDTO mDto) {
        mapper.userModify(mDto);
    }

}
