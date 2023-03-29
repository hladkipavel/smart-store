package pl.coderslab.cart_item;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.cart.Cart;
import pl.coderslab.cart.JpaCartService;
import pl.coderslab.product.JpaProductService;
import pl.coderslab.product.Product;
import pl.coderslab.user.User;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class CartItemController {

    private final JpaCartService jpaCartService;
    private final JpaCartItemService jpaCartItemService;
    private final JpaProductService jpaProductService;

    public CartItemController(JpaCartService jpaCartService, JpaCartItemService jpaCartItemService, JpaProductService jpaProductService) {
        this.jpaCartService = jpaCartService;
        this.jpaCartItemService = jpaCartItemService;
        this.jpaProductService = jpaProductService;
    }
    @GetMapping("/cart-all")
    public String viewAllInCart(HttpSession session, Model model){
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "redirect:/register";
        }
        Cart cart = jpaCartService.getCartByUserId(user.getId());
        model.addAttribute("user", user);
        model.addAttribute("cart", cart);
        List<CartItem> cartItems = jpaCartItemService.getCartItemByCartId(cart.getId());
        model.addAttribute("cartItems", cartItems);
        Integer totalCount = cart.getCountItems();
        model.addAttribute("totalCount", totalCount);
        Double totalPrice = jpaCartItemService.getTotalPriceCartItemsByUserId(cart.getId());
        model.addAttribute("totalPrice", totalPrice);
        return "cartAll";
    }
    @GetMapping("/after-change/{id}/{counter}")
    @ResponseBody
    public String updateCountProduct(@PathVariable Long id,
                                     @PathVariable Integer counter) {
        CartItem cartItem = jpaCartItemService.getCartItem(id);
        cartItem.setCount(counter);
        jpaCartItemService.addCartItem(cartItem);
        return "all";
    }
    @GetMapping("/delete/{id}")
    public String deleteProductById(@PathVariable Long id, HttpSession session, Model model){
        jpaCartItemService.deleteCartItem(id);
        Cart cart = (Cart) session.getAttribute("cart");
        model.addAttribute("cart", cart);
        return "/cartAll";
    }
    @GetMapping("/cart/{id}")
    public String addToCart(@PathVariable Long id, HttpSession session, Model model){
        Product product = jpaProductService.getProduct(id);
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "redirect:/login";
        }
        Cart cart = (Cart) session.getAttribute("cart");
        CartItem cartItem = jpaCartItemService.getCartItemByProductIdAndCartId(id, cart.getId());
        if (cartItem != null){
            cartItem.setAddDate(LocalDateTime.now());
            cartItem.setCount(cartItem.getCount() + 1);
        }else{
            cartItem = new CartItem(1, product, LocalDateTime.now(),cart);
        }
        jpaCartItemService.addCartItem(cartItem);
        cart = jpaCartService.getCartByUserId(user.getId());
        model.addAttribute("cart", cart);
        model.addAttribute("user", user);
        List<CartItem> listInCart = cart.getCartItems();
        model.addAttribute("listInCart", listInCart);
        return "redirect:/all";
    }
}
