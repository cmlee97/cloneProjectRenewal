package kr.ezen.controller;


import kr.ezen.service.MemberService;
import kr.ezen.service.ViewService;
import kr.ezen.shop.domain.CartDTO;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.domain.ProductDTO;
import kr.ezen.shop.util.ProdSpec;
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
