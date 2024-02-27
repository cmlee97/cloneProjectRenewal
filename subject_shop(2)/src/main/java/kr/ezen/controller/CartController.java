package kr.ezen.controller;

import kr.ezen.service.CartService;
import kr.ezen.service.ViewService;
import kr.ezen.shop.domain.CartDTO;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.MemberDTO;
import kr.ezen.shop.util.ProdSpec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private ViewService vservice;
    @Autowired
    private CartService cservice;
    //장바구니
    @GetMapping("cart.do")
    public String cart(Model model,HttpSession session){
        List<CategoryDTO> cat_list = vservice.catList();
        model.addAttribute("cat_list", cat_list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        MemberDTO dto =(MemberDTO) session.getAttribute("loginDto");
        List<CartDTO> cart_list = cservice.cartList(dto.getId());
        model.addAttribute("cart_list", cart_list);
        return "/view/cartPage";
    }
    @RequestMapping("cartAdd.do")
    public String cartAdd(CartDTO cDto, int p_num, HttpSession session, Model model){
        List<CategoryDTO> cat_list = vservice.catList();
        model.addAttribute("cat_list", cat_list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        MemberDTO dto =(MemberDTO) session.getAttribute("loginDto");
        cDto.setId(dto.getId());
        cDto.setP_num(p_num);

        System.out.println("cDto.getId() = " + cDto.getId());
        cservice.cartAdd(cDto);
        return "redirect:/cart/cart.do";
    }
    @RequestMapping("cartModify.do")
    public String cartModify(CartDTO cDto){
        cservice.cartModify(cDto);
        return "redirect:/cart/cart.do";
    }
    @RequestMapping("cartDelete.do")
    public String cartDelete(int p_num){
        cservice.cartDelete(p_num);
        return "redirect:/cart/cart.do";
    }
    @GetMapping("checkout.do")
    public String checkout(Model model, HttpSession session){
        List<CategoryDTO> cat_list = vservice.catList();
        model.addAttribute("cat_list", cat_list);
        ProdSpec[] pdSpec = ProdSpec.values();
        model.addAttribute("pdSpec", pdSpec);
        MemberDTO dto =(MemberDTO) session.getAttribute("loginDto");
        List<CartDTO> cart_list = cservice.cartList(dto.getId());
        model.addAttribute("cart_list", cart_list);
        MemberDTO mDto = cservice.buyerInfo(dto.getId());
        model.addAttribute("mDto", mDto);
        return "/view/checkout";
    }
    @RequestMapping("checkoutDelete.do")
    public String checkoutDelete(String delProdNums){
        cservice.checkoutDelete(delProdNums);
        return "redirect:/cart/checkout.do";
    }
}
