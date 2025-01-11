package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Product;
import service.ProductDao_usingHibernate;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired //spring dependency injection
	private ProductDao_usingHibernate pDao_usingHibernate;

	@RequestMapping("/getall")
	public String getAllProduct(Model model) {
	    List<Product> productList = pDao_usingHibernate.findAll();
	    model.addAttribute("productList", productList);
	    return "productList"; 
	}
}