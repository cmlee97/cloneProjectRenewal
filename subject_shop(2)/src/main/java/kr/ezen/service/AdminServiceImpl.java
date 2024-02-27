package kr.ezen.service;

import java.util.List;

import kr.ezen.shop.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ezen.shop.mapper.AdminMapper;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper mapper;


	@Override
	public boolean loginOk(AdminDTO aDto, HttpServletRequest req) {
		HttpSession session = req.getSession();
		AdminDTO loginDto = mapper.loginOk(aDto);
		if(loginDto != null){
			String inputPw = aDto.getPassword();//사용자가 입력한 비밀번호
			String dbPw = loginDto.getPassword();
			if(inputPw.equals(dbPw)){
				session.setAttribute("loginDto",loginDto);
				session.setAttribute("adminloginDto",loginDto);
				return true;
			}
		}else{
			return false;
		}
		return false;
	}

	//카테고리 등록
	@Override
	public int catInput(CategoryDTO cDto) {
		mapper.catInput(cDto);
		return 0;
	}
	//카테고리 리스트
	@Override
	public List<CategoryDTO> catList() {
		List<CategoryDTO> list = mapper.catList();
		return list;
	}
	@Override
	public CategoryDTO catInfo(int cat_num) {
		CategoryDTO cDto = mapper.catInfo(cat_num);
		return cDto;
	}
	@Override
	public int catUpdate(CategoryDTO cDto) {
		mapper.catUpdate(cDto);
		return 0;
	}
	@Override
	public int catDelete(int cat_num) {
		mapper.catDelete(cat_num);
		return 0;
	}
	//회원
	@Override
	public List<MemberDTO> memberList(PageDTO paDto) {
		int totalCnt = mapper.totalMemCnt(paDto);
		paDto.setValue(totalCnt);
		List<MemberDTO> list = mapper.memberList(paDto);
		return list;
	}

	@Override
	public MemberDTO memberInfo(int no) {
		MemberDTO mDto = mapper.memberInfo(no);
		return mDto;
	}

	@Override
	public int memberUpdate(MemberDTO mDto) {
		mapper.memberUpdate(mDto);
		return 0;
	}

	@Override
	public int deleteMember(int no) {
		mapper.deleteMember(no);
		return 0;
	}
	//제품
	@Override
	public List<ProductDTO> prodList(PageDTO pDto) {
		int totalCnt = mapper.totalProdCnt(pDto);
		pDto.setValue(totalCnt);
		List<ProductDTO> list = mapper.prodList(pDto);
		return list;
	}
}
