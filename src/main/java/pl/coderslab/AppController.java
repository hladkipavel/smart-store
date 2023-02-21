package pl.coderslab;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.cart.Cart;
import pl.coderslab.cart.CartRepository;
import pl.coderslab.cart.CartService;
import pl.coderslab.cart_item.*;
import pl.coderslab.product.Product;
import pl.coderslab.product.ProductController;
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
@SessionAttributes({"user", "cart"})
public class AppController {

    private final ProductService productService;
    private final CartItemRepository cartItemRepository;

    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;


    public AppController(ProductRepository productRepository, CartItemRepository cartItemRepository, UserRepository userRepository, ProductService productService,CartRepository cartRepository) {
        this.productRepository = productRepository;
        this.cartItemRepository = cartItemRepository;
        this.userRepository = userRepository;
        this.productService = productService;
        this.cartRepository = cartRepository;
    }

    @GetMapping("")
    public String showMain(Model model){
        List<Product> allProducts = productRepository.findLastAddedProducts();
        model.addAttribute("allProducts", allProducts);
        model.addAttribute("user", null);
        return "index";
    }

    @GetMapping("/register")
    public String registerForm(Model model){
        model.addAttribute("user", new User());
        return "register";
    }
    @PostMapping("/register")
    public String addNewUser(User user, Model model){
        Cart cart = cartRepository.save(new Cart());
        user.setCart(cart);
        userRepository.save(user);
        model.addAttribute("user", user);
        model.addAttribute("cart", cart);
        return "redirect:/login";
    }
    @PostMapping("/login")
    public String loginUser(@RequestParam String email,
                            @RequestParam String password, HttpSession session){
        User user = userRepository.findById(9L).orElse(null);
        if(user == null){
            return "redirect:/register";
        }
        Cart cart = user.getCart();
        session.setAttribute("user", user);
        session.setAttribute("cart", cart);
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
        if(user == null){
            return "redirect:/login";
        }
        Cart cart = (Cart) session.getAttribute("cart");
        CartItem cartItem = cartItemRepository.findByProductIdAndCartId(id, cart.getId());
        if (cartItem != null){
            cartItem.setAddDate(LocalDateTime.now());
            cartItem.setCount(cartItem.getCount() + 1);
        }else{
            cartItem = new CartItem(1, product, LocalDateTime.now(),cart);
        }
        cartItemRepository.save(cartItem);
        cart = cartRepository.findById(user.getId()).orElse(null);
        model.addAttribute("cart", cart);
        user.setCart(cart);
        model.addAttribute("user", user);
        List<CartItem> listInCart = cart.getCartItems();
        model.addAttribute("listInCart", listInCart);
        return "redirect:/all";
    }

    @GetMapping("/cart-all")
    public String viewAllInCart(HttpSession session, Model model){
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "redirect:/register";
        }
        Cart cart = cartRepository.findById(user.getId()).orElse(null);
        user.setCart(cart);
        model.addAttribute("user", user);
        model.addAttribute("cart", cart);
        List<CartItem> cartItems = user.getCart().getCartItems();
        model.addAttribute("cartItems", cartItems);
        return "cartAll";
    }
    @GetMapping("/after-change/{id}/{counter}")
    @ResponseBody
    public String updateCountProduct(@PathVariable Long id,
                                     @PathVariable Integer counter) {
        CartItem cartItem = cartItemRepository.findById(id).orElse(null);
        cartItem.setCount(counter);
        cartItemRepository.save(cartItem);
        return "all";
    }
    @GetMapping("/{id}")
    public String getSingleProduct(@PathVariable Long id, Model model){
        Product product = productService.getProduct(id);
        model.addAttribute("product", product);
        return "productSingle";
    }



}
