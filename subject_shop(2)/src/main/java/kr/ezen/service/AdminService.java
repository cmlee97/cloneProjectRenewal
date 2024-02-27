package kr.ezen.service;

import java.util.List;

import kr.ezen.shop.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;

@Service

public interface AdminService {
	//관리자 로그인
	boolean loginOk(AdminDTO aDto, HttpServletRequest req);
	
	//카테고리 등록
	int catInput(CategoryDTO cDto);
	
	//카테고리 리스트
	List<CategoryDTO> catList();
	
	//카테고리 정보
	CategoryDTO catInfo(int cat_num);
	
	//카테고리 수정
	int catUpdate(CategoryDTO cDto);
	
	//카테고리 삭제
	int catDelete(int cat_num);
	
	//회원 리스트
	List<MemberDTO> memberList(PageDTO paDto);
	//회원정보
	MemberDTO memberInfo(int no);
	//회원수정
	int memberUpdate(MemberDTO mDto);
	//회원삭제
	int deleteMember(int no);

	//제품리스트
	List<ProductDTO> prodList(PageDTO pDto);

}
