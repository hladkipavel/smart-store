package pl.coderslab;

import org.dom4j.rule.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.cart.Cart;
import pl.coderslab.cart.CartRepository;
import pl.coderslab.cart_item.*;
import pl.coderslab.product.Product;
import pl.coderslab.product.ProductRepository;
import pl.coderslab.product.ProductService;
import pl.coderslab.user.User;
import pl.coderslab.user.UserRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.Validator;
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
    private final Validator validator;


    public AppController(ProductRepository productRepository, CartItemRepository cartItemRepository, UserRepository userRepository, ProductService productService, CartRepository cartRepository, Validator validator) {
        this.productRepository = productRepository;
        this.cartItemRepository = cartItemRepository;
        this.userRepository = userRepository;
        this.productService = productService;
        this.cartRepository = cartRepository;
        this.validator = validator;
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
    public String addNewUser(@Valid User user, BindingResult bindingResult, Model model, HttpSession session){
        if (bindingResult.hasErrors()) {
            return "register";
        }
        Cart cart = cartRepository.save(new Cart());
        cart.setUser((User)session.getAttribute("user"));
        cartRepository.save(cart);
        model.addAttribute("user", user);
        model.addAttribute("cart", cart);
        return "redirect:/login";
    }
    @PostMapping("/login")
    public String loginUser(@Valid User userToCompare ,BindingResult bindingResult, Model model, HttpSession session){
        String email = userToCompare.getEmail();
        User user = userRepository.findByEmail(email);
        if (bindingResult.hasErrors()) {
            return "login";
        }
        if(user == null){
            return "redirect:/register";
        }
        Cart cart = cartRepository.findCartByUserId(user.getId());
        model.addAttribute("user", user);
        model.addAttribute("cart", cart);
        session.setAttribute("user",user);
        session.setAttribute("cart",cart);

        return "redirect:/homepage";
    }

    @GetMapping("/login")
    public String loginForm(Model model){
        User user = new User();
        model.addAttribute("user", user);
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
        model.addAttribute("user", user);
        model.addAttribute("cart", cart);
        List<CartItem> cartItems = cart.getCartItems();
        model.addAttribute("cartItems", cartItems);
        Integer totalCount = cart.getCountItems();
        model.addAttribute("totalCount", totalCount);
        Double totalPrice = cartItemRepository.totalPriceCartItemsByUserId(cart.getId());
        model.addAttribute("totalPrice", totalPrice);
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
    @GetMapping("/delete/{id}")
    public String deleteProductById(@PathVariable Long id, HttpSession session, Model model){
        cartItemRepository.deleteById(id);
        Cart cart = (Cart) session.getAttribute("cart");
        model.addAttribute("cart", cart);
        return "/cartAll";
    }
    @GetMapping("/account")
    public String showUserAccount(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        model.addAttribute("user", user);
        return "userAccount";
    }
    @PostMapping("/account")
    public String editUserData(@Valid User user,BindingResult bindingResult, HttpSession session){
        if(bindingResult.hasErrors()){
            return "userAccount";
        }
        userRepository.save(user);
        session.setAttribute("user", user);
        return "redirect:/";
    }
    @GetMapping("/homepage")
    public String showHomepage(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        model.addAttribute("user", user);
        model.addAttribute("cart", cartRepository.findCartByUserId(user.getId()));
        return "homepage";
    }
}
