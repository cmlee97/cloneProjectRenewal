package kr.ezen.service;

import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.UUID;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper mapper;
    @Autowired
    private JavaMailSender mailSender;
    @Override
    public boolean memberLogin(MemberDTO mDto, HttpServletRequest req) {
        HttpSession session = req.getSession();
        //아이디와 일치하는 회원정보를 DTO에 담아서 가져옴
        MemberDTO loginDTO = mapper.memberLogin(mDto);
        if(loginDTO != null){//일치하는 아이디가 있는 경우
            String inputPw = mDto.getPw();//사용자가 입력한 비밀번호
            String dbPw = loginDTO.getPw();
            if(inputPw.equals(dbPw)){//비밀번호 일치시 세션에 등록
                session.setAttribute("loginDto", loginDTO);
                return true;
            }else{//비밀번호 불일치
                return false;
            }
        }
        return false;
    }

    @Override
    public MemberDTO idCheck(String uid) {
        MemberDTO mDto = mapper.idCheck(uid);
        return mDto;
    }

    @Override
    public int memberRegister(MemberDTO mDto) {
        mapper.memberRegister(mDto);
        return 0;
    }
    public String findId(MemberDTO dto) {
        String resultId = mapper.findId(dto);
        return resultId;
    }

    @Override
    public int findPw(String uid, String uEmail) {
        //임시비밀번호
        String tempPw= UUID.randomUUID().toString().substring(0,6);
        MimeMessage mail = mailSender.createMimeMessage();
        String mailContents = "<h3>임시 비밀번호 발급</h3></br>"
                +"<h2>"+tempPw+"</h2>"
                +"<p>위의 비밀번호를 이용하여 로그인 후 마이페이지에서 변경바랍니다.</p>";
        try {
            mail.setSubject("ez아카데미 [임시 비밀번호]", "utf-8");
            mail.setText(mailContents, "utf-8","html");
            //상대방 메일 셋팅
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(uEmail));
            mailSender.send(mail);

        }catch(Exception e){
            e.printStackTrace();
        }
        int n = mapper.findPw(uid, uEmail, tempPw);
        return n;
    }

    @Override
    public int modifyPw(MemberDTO dto) {
        int n = mapper.updatePw(dto);
        return n;
    }
}
