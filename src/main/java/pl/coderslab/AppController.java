package pl.coderslab;

import org.dom4j.rule.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.cart.Cart;
import pl.coderslab.cart.CartService;
import pl.coderslab.cart_item.CartItem;
import pl.coderslab.cart_item.CartItemService;
import pl.coderslab.product.Product;
import pl.coderslab.product.ProductService;
import pl.coderslab.user.User;
import pl.coderslab.user.UserService;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;

@Controller
@RequestMapping("")
@SessionAttributes("user")
public class AppController {

    private ProductService productService;
    private CartService cartService;
    private CartItemService cartItemService;
    private UserService userService;

    public AppController(ProductService productService, CartService cartService, CartItemService cartItemService, UserService userService) {
        this.productService = productService;
        this.cartService = cartService;
        this.cartItemService = cartItemService;
        this.userService = userService;
    }

    @GetMapping("")
    public String showMain(){
        return "index";
    }

    @GetMapping("/register")
    public String registerForm(Model model){
        model.addAttribute("user", new User());
        return "register";
    }
    @PostMapping("/register")
    public String addNewUser(User user, Model model){
        Cart cart = cartService.addCart(new Cart());
        user.setCart(cart);
        userService.addUser(user);
        model.addAttribute("user", user);
        return "redirect:/login";
    }
    @PostMapping("/login")
    public String loginUser(HttpSession session){
        User user = (User) session.getAttribute("user");
        User loginUser = userService.getUser(user.getId());
        if(loginUser == null){
            return "redirect:/register";
        }
        return "redirect:/";
    }

    @GetMapping("/login")
    public String loginForm(){
        return "login";
    }

    @PostMapping("/cart/{id}")
    public String addToCart(@RequestParam Long id, Model model){
        Product product = productService.getProduct(id);
        cartService.getCart(id);
        cartItemService.addCartItem(new CartItem(LocalDateTime.now(), product));
        return null;
    }
}
