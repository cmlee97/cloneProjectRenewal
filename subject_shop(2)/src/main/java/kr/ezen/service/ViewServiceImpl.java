package kr.ezen.service;

import kr.ezen.shop.domain.CartDTO;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.domain.PageDTO;
import kr.ezen.shop.domain.ProductDTO;
import kr.ezen.shop.domain.QuestionDTO;
import kr.ezen.shop.domain.QuestionReplyDTO;
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

	@Override
	public List<QuestionDTO> quesList(PageDTO paDto) {
        int totalCnt = mapper.totalQuesCnt(paDto);
        paDto.setValue(totalCnt);
		return mapper.quesList(paDto);
	}
	@Override
    public QuestionDTO myquesInfo(int qid) {
        return mapper.myquesInfo(qid);
    }
	@Override
	public void quesModify(QuestionDTO qDto) {
	    mapper.quesModify(qDto);
	   }
    @Override
    public void questionRemove(int qid) {
        mapper.questionRemove(qid);
    }

	@Override
	public QuestionReplyDTO reply(int qid) {
		return mapper.reply(qid);
	}
	
}
