package kr.ezen.controller;

import kr.ezen.service.AdminService;
import kr.ezen.service.ProductService;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.PageDTO;
import kr.ezen.shop.domain.ProductDTO;
import kr.ezen.shop.util.ProdSpec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ProdController {
    @Autowired
    private ProductService service;
    @Autowired
    private AdminService aservice;

    @PostMapping("/prodInput.do")
    public String prodInput(MultipartHttpServletRequest mr, HttpServletRequest request) {
        service.prodInput(mr, request);
        return "redirect:/admin/prodList.do";
    }

    @RequestMapping("/prodInfo.do")
    public String prodInfo(int p_num, Model model, @ModelAttribute("paDto") PageDTO paDto) {
        List<CategoryDTO> list = aservice.catList();
        model.addAttribute("list", list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        ProductDTO pDto = service.prodInfo(p_num);
        model.addAttribute("pDto", pDto);
        model.addAttribute("paDto", paDto);
        return "admin/prod_update";
    }
    @PostMapping("/prodUpdate.do")
    public String prodUpdate(MultipartHttpServletRequest mr, HttpServletRequest request,
                             RedirectAttributes rttr) {
        service.prodUpdate(mr,request);
        rttr.addAttribute("viewPage", mr.getParameter("viewPage"));
        rttr.addAttribute("cntPerPage", mr.getParameter("cntPerPage"));
        return "redirect:/admin/prodList.do";
    }
    @RequestMapping("/prodDelete.do")
    public String prodDelete(int p_num, String p_image, HttpServletRequest request,
                             @ModelAttribute("paDto") PageDTO paDto, RedirectAttributes rttr) {
        service.prodDelete(p_num, p_image, request);
        rttr.addAttribute("viewPage", paDto.getViewPage());
        rttr.addAttribute("cntPerPage", paDto.getCntPerPage());
        return "redirect:/admin/prodList.do";
    }
}
