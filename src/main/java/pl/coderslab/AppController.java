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
import pl.coderslab.product.ProductRepository;
import pl.coderslab.product.ProductService;
import pl.coderslab.user.User;
import pl.coderslab.user.UserRepository;
import pl.coderslab.user.UserService;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("")
@SessionAttributes("user")
public class AppController {

    private final ProductService productService;
    private final CartService cartService;
    private final CartItemService cartItemService;
    private final UserService userService;
    private final CartItemRepository cartItemRepository;

    private final UserRepository userRepository;
    private final ProductRepository productRepository;

    public AppController(ProductRepository productRepository, CartItemRepository cartItemRepository, UserRepository userRepository, ProductService productService, CartService cartService, CartItemService cartItemService, UserService userService) {
        this.productRepository = productRepository;
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
        User user = userRepository.findById(9L).orElse(null);
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
    public String addToCart(@PathVariable Long id, HttpSession session, Model model){
        Product product = productService.getProduct(id);
        User user = (User) session.getAttribute("user");
        Cart userCart = user.getCart();
        cartItemService.addCartItem(new CartItem(1, product, LocalDateTime.now(), userCart));
        List<CartItem> listInCart = userCart.getCartItems();
        model.addAttribute("listInCart", listInCart);
        return "redirect:/all";
    }

    @GetMapping("/cart-all")
    public String viewAllInCart(HttpSession session, Model model){
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "redirect:/register";
        }
        List<CartItem> cartItems = user.getCart().getCartItems();
        model.addAttribute("cartItems", cartItems);
        return "/viewAllInCart";
    }
//    @GetMapping("/after-change/")
//    public String updateCountProduct(@RequestParam(name="counter") int count,
//                                     @RequestParam(name="total-price") String price,
//                                     @RequestParam(value = "id") Long id){
//        double priceDouble = Double.parseDouble(price.replace("$", ""));
//        CartItem cartItem = cartItemRepository.findById(id).orElse(null);
//        cartItem.setCount(count);
//        cartItemRepository.save(cartItem);
//        return "all";
//    }
}
