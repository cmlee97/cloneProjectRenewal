package kr.ezen.service;

import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.domain.ProductDTO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Service

public interface ProductService {


	//제품 등록
	int prodInput(MultipartHttpServletRequest mr, HttpServletRequest request);
	//제품 정보
	ProductDTO prodInfo(int p_num);
	//제품 수정
	int prodUpdate(MultipartHttpServletRequest mr, HttpServletRequest request);
	//제품 삭제
	int prodDelete(int p_num, String p_image, HttpServletRequest request);
}
