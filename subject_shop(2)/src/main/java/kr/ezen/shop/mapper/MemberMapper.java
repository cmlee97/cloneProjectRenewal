package kr.ezen.shop.mapper;

import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartRequest;

import java.lang.reflect.Member;
import java.util.List;

@Mapper
public interface MemberMapper {

	//회원등록
	int memberRegister(MemberDTO mDto);
	//회원로그인
    MemberDTO memberLogin(MemberDTO mDto);
	//아이디체크
	MemberDTO idCheck(String uid);
	//아이디찾기
	String findId(MemberDTO dto);
	//비밀번호 찾기
	int findPw(String uid, String uEmail, String tempPw);
	//비밀번호 수정
	int updatePw(MemberDTO dto);
}
