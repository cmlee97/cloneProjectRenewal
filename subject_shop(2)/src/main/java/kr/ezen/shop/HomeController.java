package kr.ezen.shop;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import kr.ezen.service.ViewService;
import kr.ezen.shop.domain.CategoryDTO;
import kr.ezen.shop.domain.ProductDTO;
import kr.ezen.shop.util.ProdSpec;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ViewService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<CategoryDTO> list = service.catList();
		model.addAttribute("cat_list", list);
		ProdSpec[] pdSpec = ProdSpec.values();
		model.addAttribute("pdSpec", pdSpec);
		List<ProductDTO> prod_list = service.prodList();
		model.addAttribute("prod_list", prod_list);
		return "/home";
	}

}
