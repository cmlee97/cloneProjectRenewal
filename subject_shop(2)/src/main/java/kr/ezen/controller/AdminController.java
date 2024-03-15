package kr.ezen.controller;

import kr.ezen.service.AdminService;
import kr.ezen.shop.domain.*;
import kr.ezen.shop.util.ProdSpec;
import kr.ezen.shop.util.QuestionOption;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService service;

    @GetMapping("/home.do")
    public String home(){
        return "admin/admin_home";
    }
    @GetMapping("/login.do")
    public String login(){
        return "admin/admin_login";
    }
    @RequestMapping("loginOk.do")
    public String loginOk(AdminDTO aDto, HttpServletRequest req, RedirectAttributes rttr){
        boolean result = service.loginOk(aDto, req);
        if(!result){
            rttr.addAttribute("result",0);
            return "redirect:/admin/login.do";
        }
        return "redirect:/admin/home.do";
    }
    @RequestMapping("logout.do")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/admin/home.do";
    }
    //카테고리
    @GetMapping("/catInput.do")
    public String catInput(){
        return "admin/cat_input";
    }
    @PostMapping("/catInput.do")
    public String catInput(CategoryDTO cDto) {
    	service.catInput(cDto);
    	return "redirect:/admin/catList.do";
    }
    @GetMapping("/catList.do")
    public String catList(CategoryDTO dto, Model model){
    	List<CategoryDTO> list = service.catList();
    	model.addAttribute("list", list);
        return "admin/cat_list";
    }
    @RequestMapping("/catInfo.do")
    public String catInfo(int cat_num, Model model) {
    	CategoryDTO cDto = service.catInfo(cat_num);
    	model.addAttribute("cDto", cDto);
    	return "admin/cat_update";
    }
    @RequestMapping("/catUpdate.do")
    public String catUpdate(CategoryDTO cDto) {
    	service.catUpdate(cDto);
    	return "redirect:/admin/catList.do";
    }
    @RequestMapping("/catDelete.do")
    public String catDelete(int cat_num) {
    	service.catDelete(cat_num);
    	return "redirect:/admin/catList.do";
    }
    //제품
    @GetMapping("/prodInput.do")
    public String prodInput(Model model){
        List<CategoryDTO> list = service.catList();
        model.addAttribute("list", list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        return "admin/prod_input";
    }
    @RequestMapping("/prodList.do")
    public String prodList(Model model, PageDTO paDto){
        List<ProductDTO> list = service.prodList(paDto);
        model.addAttribute("list", list);
        model.addAttribute("paDto", paDto);
        return "admin/prod_list";
    }
    //회원
    @RequestMapping("/memberList.do")
    public String memberList(Model model, PageDTO paDto){
        List<MemberDTO> list = service.memberList(paDto);
        model.addAttribute("list", list);
        model.addAttribute("paDto", paDto);
        return "admin/mem_list";
    }
    @RequestMapping("/memberInfo.do")
    public String memberInfo(int no, Model model,@ModelAttribute("paDto") PageDTO paDto){
        MemberDTO mDto = service.memberInfo(no);
        model.addAttribute("mDto", mDto);
        model.addAttribute("paDto", paDto);
        return "admin/mem_info";
    }
    @PostMapping("/memberUpdate.do")
    public String memberUpdate(MemberDTO mDto,@ModelAttribute("paDto") PageDTO paDto
            , RedirectAttributes rttr){
        service.memberUpdate(mDto);
        rttr.addAttribute("viewPage",paDto.getViewPage());
        rttr.addAttribute("cntPerPage",paDto.getCntPerPage());
        return "redirect:/admin/memberList.do";
    }
    @RequestMapping("/memberDelete.do")
    public String memberDelete(int no, @ModelAttribute("paDto") PageDTO paDto
            , RedirectAttributes rttr){
        service.deleteMember(no);
        rttr.addAttribute("viewPage",paDto.getViewPage());
        rttr.addAttribute("cntPerPage",paDto.getCntPerPage());
        return "redirect:/admin/memberList.do";
    }
    //문의사항
    @RequestMapping("/questionList.do")
    public String questionList(Model model, PageDTO paDto, String ques_option) {
    	if(paDto.getQues_option()==null)
    	paDto.setQues_option("all");
    	List<QuestionDTO> list = service.questionList(paDto);
    	model.addAttribute("paDto", paDto);
    	model.addAttribute("list", list);
   	 	QuestionOption[] opspec = QuestionOption.values();
   	 	model.addAttribute("opspec", opspec);
    	return "admin/ques_list";
    }
    @RequestMapping("/quesInfo.do")
    public String quesInfo(int qid, Model model) {
    	QuestionDTO qDto = service.quesInfo(qid);
    	model.addAttribute("qDto", qDto);
      	QuestionOption[] opspec = QuestionOption.values();
        model.addAttribute("opspec", opspec);
        QuestionReplyDTO qrDto = service.answer(qid);
        if(qrDto != null)
        model.addAttribute("qrDto", qrDto);
    	return "admin/ques_info";
    }
    @RequestMapping("/answerRegister.do")
    public String answerRegister(int qid, String q_writer, String ans_contents) {
    	QuestionReplyDTO qrDto = new QuestionReplyDTO();
    	System.out.println(qid);
    	qrDto.setQid(qid);
    	qrDto.setQ_writer(q_writer);
    	qrDto.setAns_contents(ans_contents);
    	service.answerRegister(qrDto);
    	return "redirect:/questionList.do";
    }
    @RequestMapping("/answerModify.do")
	public String answerModify(/* int rno, int qid, String ans_contents */QuestionReplyDTO qrDto) {
		/*
		 * QuestionReplyDTO qrDto = new QuestionReplyDTO(); qrDto.setRno(rno);
		 * qrDto.setAns_contents(ans_contents);
		 * qrDto.setAns_contents(ans_contents);
		 * qrDto.setAns_contents(ans_contents);
		 */
    	service.answerModify(qrDto);
    	return "redirect:/quesInfo.do?qid="+qrDto.getQid();
    }
   
    @RequestMapping("/answerDelete.do")
    public String answerDelete(int rno, int qid) {
    	service.answerDelete(rno, qid);
    	return "redirect:/questionInfo.do?qid="+qid;
    }
}
