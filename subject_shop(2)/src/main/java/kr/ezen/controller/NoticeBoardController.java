package kr.ezen.controller;

import kr.ezen.service.NoticeBoardService;
import kr.ezen.shop.domain.NoticeDTO;
import kr.ezen.shop.domain.PageDTO;
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
@RequestMapping("/admin")
public class NoticeBoardController {

    @Autowired
    private NoticeBoardService service;

    @GetMapping("/noticeList.do")
    public String noticeList(Model model, PageDTO paDto){
        List<NoticeDTO> list = service.noticeList(paDto);
        model.addAttribute("list", list);
        model.addAttribute("paDto", paDto);
        return "/admin/noticeList";
    }
    @GetMapping("/noticeRegister.do")
    public String noticeRegister(){
        return "/admin/noticeRegister";
    }
    @PostMapping("/noticeRegister.do")
    public String noticeRegister(NoticeDTO nDto){
        service.noticeRegister(nDto);
        return "redirect:/admin/noticeList.do";
    }
    @RequestMapping("/noticeInfo.do")
    public String noticeInfo(int bid, Model model, PageDTO paDto){
        NoticeDTO nDto = service.noticeInfo(bid);
        model.addAttribute("nDto", nDto);
        model.addAttribute("paDto", paDto);
        return "/admin/noticeInfo";
    }
    @RequestMapping("/noticeModify.do")
    public String noticeModify(NoticeDTO nDto, @ModelAttribute("paDto") PageDTO paDto
            , RedirectAttributes rttr){
        service.noticeModify(nDto);
        rttr.addAttribute("viewPage",paDto.getViewPage());
        rttr.addAttribute("cntPerPage",paDto.getCntPerPage());
        return "redirect:/admin/noticeList.do";
    }

    @RequestMapping("/noticeRemove.do")
    public String noticeRemove(int bid, @ModelAttribute("paDto") PageDTO paDto
            , RedirectAttributes rttr){
        service.noticeRemove(bid);
        rttr.addAttribute("viewPage",paDto.getViewPage());
        rttr.addAttribute("cntPerPage",paDto.getCntPerPage());
        return "redirect:/admin/noticeList.do";
    }
}
