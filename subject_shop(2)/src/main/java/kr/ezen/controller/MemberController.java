package kr.ezen.controller;


import kr.ezen.service.MemberService;
import kr.ezen.shop.domain.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.UUID;


@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private MemberService service;


    @GetMapping("login.do")
    public String login(){
        return "/member/member_loginForm";
    }

    @PostMapping("login.do")
    public String login(MemberDTO mDto, HttpServletRequest req, RedirectAttributes rttr){
        boolean result = service.memberLogin(mDto,req);
        System.out.println("result = " + result);
        if(!result){//로그인실패
            rttr.addAttribute("result", 0);
            return "redirect:/member/login.do";//redirect는 get방식
        }

        return "redirect:/";
    }
    @GetMapping("logout.do")
    public String memberLogout(HttpSession session){
        session.invalidate();//세션 초기화
        return "redirect:/";
    }
    @GetMapping("register.do")
    public String register(){
        return "/member/member_register";
    }

    @RequestMapping("/memberIdCheck.do")
    @ResponseBody
    public String memberIdCheck(@RequestParam("uid") String uid) {
        System.out.println("uid = " + uid);
        MemberDTO dto = service.idCheck(uid);
        if(dto !=null || "".equals(uid.trim())) {
            return "no";
        }

        return "yes";
    }

    @RequestMapping("/memberEmailCheck.do")
    @ResponseBody
    public String emailCheck(@RequestParam("uEmail") String uEmail){
        System.out.println("uEmail : "+ uEmail);
        //인증코드 생성
        String uuid = UUID.randomUUID().toString().substring(0,6);
        System.out.println("uuid:"+ uuid);

        MimeMessage mail = mailSender.createMimeMessage();
        String mailContents = "<h3>이메일 주소 확인</h3></br>"
                +"<span>사용자가 본인임을 확인하려고 합니다. 다음코드를 입력하세요.</span>"
                +"<h2>"+uuid+"</h2>";
        try {
            mail.setSubject("ez아카데미 [이메일 인증]", "utf-8");
            mail.setText(mailContents, "utf-8","html");
            //상대방 메일 셋팅
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(uEmail));
            mailSender.send(mail);
            return uuid;
        }catch(Exception e){
            e.printStackTrace();
        }
        return "fail";
    }
    @RequestMapping("/memberRegister.do")
    public String memberInsert(MemberDTO dto) {
//		dao.memberInsert(dto);
        service.memberRegister(dto);

        return "redirect:/";
    }
    @GetMapping("idPwFind.do")
    public String idPwFind(String find, Model model){
        model.addAttribute("find", find);
        return "/member/member_idPwFind";
    }
    @PostMapping("findId.do")
    @ResponseBody
    public String findId(MemberDTO dto){
        System.out.println("dto.getName() = " + dto.getName());
        System.out.println("dto.getTel() = " + dto.getTel());
        String resultId = service.findId(dto);
        System.out.println("resultId = " + resultId);
        return resultId;

    }
    @PostMapping("findPw.do")
    @ResponseBody
    public int findPw(String uid, String uEmail){
        int n = service.findPw(uid, uEmail);
        System.out.println("n = " + n);
        return n;
    }
    @PostMapping("pwCheck.do")
    @ResponseBody
    public String pwCheck(String pw, HttpSession session){
        System.out.println("입력된 pw = " + pw);
        MemberDTO dto =(MemberDTO) session.getAttribute("loginDto");
        String dbPw = dto.getPw();
        String chkResult="";
        if(pw.equals(dbPw)){
            chkResult = "ok";
        }else {
            chkResult = "no";
        }
        return chkResult;
    }
    @PostMapping("pwChange.do")
    @ResponseBody
    public int pwChange(@RequestBody MemberDTO dto){
        int n = service.modifyPw(dto);
        return n;
    }


}
