package pl.coderslab;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.cart.JpaCartService;
import pl.coderslab.product.JpaProductService;
import pl.coderslab.product.Product;
import pl.coderslab.user.User;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("")
@SessionAttributes({"user", "cart"})
public class AppController {
    private final JpaProductService jpaProductService;
    private final JpaCartService jpaCartService;

    public AppController(JpaProductService jpaProductService, JpaCartService jpaCartService) {
        this.jpaProductService = jpaProductService;
        this.jpaCartService = jpaCartService;
    }


    @GetMapping("")
    public String showMain(Model model){
        List<Product> allProducts = jpaProductService.getLastAddedProducts();
        model.addAttribute("allProducts", allProducts);
        model.addAttribute("user", null);
        return "index";
    }

    @GetMapping("/homepage")
    public String showHomepage(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        model.addAttribute("user", user);
        model.addAttribute("cart", jpaCartService.getCartByUserId(user.getId()));
        return "homepage";
    }
}
