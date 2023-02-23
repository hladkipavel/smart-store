package pl.coderslab.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.cart.Cart;
import pl.coderslab.cart.JpaCartService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.Validator;

@Controller
public class UserController {

    private final JpaCartService jpaCartService;
    private final JpaUserService jpaUserService;
    private final Validator validator;

    public UserController(JpaCartService jpaCartService, JpaUserService jpaUserService, Validator validator) {
        this.jpaCartService = jpaCartService;
        this.jpaUserService = jpaUserService;
        this.validator = validator;
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
        Cart cart = jpaCartService.addCart(new Cart());
        cart.setUser((User)session.getAttribute("user"));
        jpaCartService.addCart(cart);
        model.addAttribute("user", user);
        model.addAttribute("cart", cart);
        return "redirect:/login";
    }
    @PostMapping("/login")
    public String loginUser(@Valid User userToCompare ,BindingResult bindingResult, Model model, HttpSession session){
        String email = userToCompare.getEmail();
        User user = jpaUserService.getUserByEmail(email);
        if (bindingResult.hasErrors()) {
            return "login";
        }
        if(user == null){
            return "redirect:/register";
        }
        Cart cart = jpaCartService.getCartByUserId(user.getId());
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
        jpaUserService.editUser(user);
        session.setAttribute("user", user);
        return "redirect:/";
    }
}
