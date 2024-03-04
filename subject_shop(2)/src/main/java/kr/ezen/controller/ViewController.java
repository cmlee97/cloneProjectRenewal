package kr.ezen.controller;


import kr.ezen.service.MemberService;
import kr.ezen.service.ViewService;
import kr.ezen.shop.domain.CartDTO;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.domain.PageDTO;
import kr.ezen.shop.domain.ProductDTO;
import kr.ezen.shop.domain.QuestionDTO;
import kr.ezen.shop.domain.QuestionReplyDTO;
import kr.ezen.shop.util.ProdSpec;
import kr.ezen.shop.util.QuestionOption;

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
import java.util.List;
import java.util.UUID;


@Controller
@RequestMapping("/view")
public class ViewController {

    @Autowired
    private ViewService service;


    @GetMapping("prodAll.do")
    public String prodAll(Model model) {
        List<CategoryDTO> cat_list = service.catList();
        model.addAttribute("cat_list", cat_list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        List<ProductDTO> prod_list = service.prodList();
        model.addAttribute("prod_list", prod_list);
        return "/view/viewAll";
    }
    @GetMapping("specView.do")
    public String specView(Model model, String p_spec) {
        List<CategoryDTO> cat_list = service.catList();
        model.addAttribute("cat_list", cat_list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        List<ProductDTO> specProdList= service.specView(p_spec);
        model.addAttribute("specProdList", specProdList);
        model.addAttribute("p_spec", p_spec);
        return "/view/specView";
    }
    @RequestMapping("catView.do")
    public String catView(Model model, String p_category_fk){
        List<CategoryDTO> cat_list = service.catList();
        model.addAttribute("cat_list", cat_list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        List<ProductDTO> catProdList = service.catView(p_category_fk);
        model.addAttribute("catProdList", catProdList);
        model.addAttribute("p_category_fk", p_category_fk);
        return "/view/categoryView";
    }
    @RequestMapping("prodView.do")
    public String prodView(Model model, int p_num, String p_spec){
        List<CategoryDTO> cat_list = service.catList();
        model.addAttribute("cat_list", cat_list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        ProductDTO pDto = service.prodView(p_num);
        model.addAttribute("pDto", pDto);
        return "/view/prodView";
    }
    @GetMapping("myPage.do")
    public String myPage(Model model){
        List<CategoryDTO> cat_list = service.catList();
        model.addAttribute("cat_list", cat_list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        return "/view/mypage";
    }
    @GetMapping("userInfo.do")
    public String userInfo(Model model, HttpSession session){
        List<CategoryDTO> cat_list = service.catList();
        model.addAttribute("cat_list", cat_list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        MemberDTO dto =(MemberDTO) session.getAttribute("loginDto");
        System.out.println("dto.getId() = " + dto.getId());
        MemberDTO mDto = service.userInfo(dto);
        model.addAttribute("mDto", mDto);
        return "/view/userInfo";
    }
   
    @PostMapping("userModify.do")
    public String userModify(MemberDTO mDto){
        service.userModify(mDto);
        return "redirect:/view/userInfo.do";
    }
    //문의사항
	 @RequestMapping("questionInfo.do")
	    public String questionInfo( @ModelAttribute("paDto") PageDTO paDto, String q_writer, String ques_option, Model model) {
		 paDto.setQ_writer(q_writer);
		 System.out.println(q_writer);
		 if(ques_option==null)
		    	paDto.setQues_option("all");
		 else paDto.setQues_option(ques_option);
		 List<QuestionDTO> ques_list = service.quesList(paDto);
		 model.addAttribute("ques_list", ques_list);
		 QuestionOption[] opspec = QuestionOption.values();
	     model.addAttribute("opspec", opspec);
	     model.addAttribute(paDto);
	    	return "/view/myQuestion";
	    }
	 @RequestMapping("myquesInfo.do")
	 public String myquesInfo(int qid, Model model, PageDTO paDto , String code) {
		 QuestionDTO quesinfo = service.myquesInfo(qid);
		 QuestionOption[] opspec = QuestionOption.values();
	     model.addAttribute("opspec", opspec);
		 model.addAttribute("quesinfo", quesinfo);
		 model.addAttribute("paDto", paDto);
		 return "/view/myQuestioninfo";
	 }
	 @PostMapping("/quesModify.do")
	    public String quesModify(QuestionDTO qDto, @ModelAttribute("paDto") PageDTO paDto
	            , RedirectAttributes rttr){
	        service.quesModify(qDto);
	        rttr.addAttribute("viewPage",paDto.getViewPage());
	        rttr.addAttribute("cntPerPage",paDto.getCntPerPage());
	        return "redirect:/view/questionList.do";
	    }
	 @RequestMapping("/questionRemove.do")
	    public String questionRemove(int qid, @ModelAttribute("paDto") PageDTO paDto
	            , RedirectAttributes rttr){
	        service.questionRemove(qid);
	        rttr.addAttribute("viewPage",paDto.getViewPage());
	        rttr.addAttribute("cntPerPage",paDto.getCntPerPage());
	        return "redirect:/view/questionList.do";
	    }
//	 @RequestMapping("/quesInfo.do")
//	    public String quesInfo(int qid, Model model, PageDTO paDto , String code){
//	        QuestionDTO qDto = service.quesInfo(qid);
//	        model.addAttribute("qDto", qDto);
//	        model.addAttribute("paDto", paDto);
//	        return "/customerService/csQuestionInfo";
//	    }
    //장바구니
    @GetMapping("cart.do")
    public String cart(Model model){
        List<CategoryDTO> cat_list = service.catList();
        model.addAttribute("cat_list", cat_list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);

        return "/view/cartPage";
    }
    @RequestMapping("cartAdd.do")
    public String cartAdd(CartDTO cDto, int p_num, HttpSession session, Model model){
        List<CategoryDTO> cat_list = service.catList();
        model.addAttribute("cat_list", cat_list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        MemberDTO dto =(MemberDTO) session.getAttribute("loginDto");
        cDto.setId(dto.getId());
        cDto.setP_num(p_num);

        System.out.println("cDto.getId() = " + cDto.getId());
        service.cartAdd(cDto);
        return "redirect:/view/cart.do";
    }


}
