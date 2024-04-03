package kr.ezen.controller;

import kr.ezen.service.CustomerService;
import kr.ezen.service.ViewService;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.NoticeDTO;
import kr.ezen.shop.domain.PageDTO;
import kr.ezen.shop.domain.QuestionDTO;
import kr.ezen.shop.domain.QuestionReplyDTO;
import kr.ezen.shop.util.QuestionOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/view")
public class CustomerController {
    @Autowired
    private CustomerService service;
    @Autowired
    private ViewService viewservice;

    @GetMapping("/customerService.do")
    public String customerService(){
        return "/customerService/csHome";
    }

    @RequestMapping("/noticeList.do")
    public String noticeList(Model model, PageDTO paDto){
        List<NoticeDTO> list = service.noticeList(paDto);
        model.addAttribute("list", list);
        model.addAttribute("paDto", paDto);
        return "/customerService/csNotice";
    }
    
    
    @RequestMapping("/questionList.do")
    public String questionList(Model model, @ModelAttribute("paDto") PageDTO paDto, String ques_option){
    	if(paDto.getQues_option()==null)
    	paDto.setQues_option("all");
        List<QuestionDTO> list = service.questionList(paDto);
        model.addAttribute("list", list);
        model.addAttribute("paDto", paDto);
        QuestionOption[] opspec = QuestionOption.values();
        model.addAttribute("opspec", opspec);
        return "/customerService/csQuestionList";
    }
    @GetMapping("/quesRegister.do")
    public String quesRegister(Model model){
    	 QuestionOption[] opspec = QuestionOption.values();
         model.addAttribute("opspec", opspec);
        return "/customerService/csQuestionReg";
    }
    @PostMapping("/quesRegister.do")
    public String quesRegister(QuestionDTO qDto){
        service.quesRegister(qDto);
        return "redirect:/view/questionList.do";
    }
    @RequestMapping("/quesInfo.do")
    public String quesInfo(int qid, Model model, PageDTO paDto , String code){
        QuestionDTO qDto = service.quesInfo(qid);
        model.addAttribute("qDto", qDto);
        model.addAttribute("paDto", paDto);
        QuestionReplyDTO qrDto = service.answer(qid);
        if(qrDto!=null)
        model.addAttribute("qrDto", qrDto);
        else {
        	qrDto.setRno(0);
        	model.addAttribute("qrDto", qrDto);
        }
        return "/customerService/csQuestionInfo";
    }
//    @RequestMapping("/quesUpdate.do")
//    public String quesUpdate(int qid, Model model, PageDTO paDto){
//        QuestionDTO qDto = service.quesUpdate(qid);
//        model.addAttribute("qDto", qDto);
//        model.addAttribute("paDto", paDto);
//        return "/customerService/csQuestionUpdate";
//    }
//    @PostMapping("/quesModify.do")
//    public String quesModify(QuestionDTO qDto, @ModelAttribute("paDto") PageDTO paDto
//            , RedirectAttributes rttr){
//        service.quesModify(qDto);
//        rttr.addAttribute("viewPage",paDto.getViewPage());
//        rttr.addAttribute("cntPerPage",paDto.getCntPerPage());
//        return "redirect:/view/questionList.do";
//    }
//    @RequestMapping("/questionRemove.do")
//    public String questionRemove(int qid, @ModelAttribute("paDto") PageDTO paDto
//            , RedirectAttributes rttr){
//        service.questionRemove(qid);
//        rttr.addAttribute("viewPage",paDto.getViewPage());
//        rttr.addAttribute("cntPerPage",paDto.getCntPerPage());
//        return "redirect:/view/questionList.do";
//    }
}
