package kr.ezen.service;

import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public interface MemberService {
	//회원로그인
	boolean memberLogin(MemberDTO mDto, HttpServletRequest req);
	//아이디체크
	MemberDTO idCheck(String uid);
	//회원등록
	int memberRegister(MemberDTO mDto);
	//아이디찾기
	String findId(MemberDTO dto);
	//비밀번호 찾기
	int findPw(String uid, String uEmail);
	//비밀번호 수정
	int modifyPw(MemberDTO dto);
}
