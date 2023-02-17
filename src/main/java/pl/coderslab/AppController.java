package pl.coderslab;

import org.dom4j.rule.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.cart.Cart;
import pl.coderslab.cart.CartService;
import pl.coderslab.cart_item.CartItem;
import pl.coderslab.cart_item.CartItemRepository;
import pl.coderslab.cart_item.CartItemService;
import pl.coderslab.product.Product;
import pl.coderslab.product.ProductService;
import pl.coderslab.user.User;
import pl.coderslab.user.UserRepository;
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
    private CartItemRepository cartItemRepository;

    private UserRepository userRepository;

    public AppController(CartItemRepository cartItemRepository, UserRepository userRepository, ProductService productService, CartService cartService, CartItemService cartItemService, UserService userService) {
        this.cartItemRepository = cartItemRepository;
        this.userRepository = userRepository;
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
    public String addNewUser(User user, Model model, HttpSession session){
        Cart cart = cartService.addCart(new Cart());
        user.setCart(cart);
        userService.addUser(user);
        model.addAttribute("user", user);
        return "redirect:/login";
    }
    @PostMapping("/login")
    public String loginUser(@RequestParam String email,
                            @RequestParam String password, HttpSession session){
        User user = userRepository.findByEmail(email);
        if(user == null){
            return "redirect:/register";
        }
        session.setAttribute("user", user);
        return "redirect:/";
    }

    @GetMapping("/login")
    public String loginForm(){
        return "login";
    }

    @GetMapping("/cart/{id}")
    public String addToCart(@PathVariable Long id, HttpSession session){
        Product product = productService.getProduct(id);
        User user = (User) session.getAttribute("user");
        Cart userCart = user.getCart();
        cartItemService.addCartItem(new CartItem(1, product.getName(), LocalDateTime.now(), userCart));

        return "addToCart";
    }
}
