//package pl.coderslab.cart_item;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.fasterxml.jackson.databind.util.JSONPObject;
//import com.mysql.cj.xdevapi.JsonArray;
//import com.mysql.cj.xdevapi.JsonParser;
//import org.springframework.web.bind.annotation.*;
//import pl.coderslab.cart.CartService;
//import pl.coderslab.product.Product;
//import pl.coderslab.product.ProductService;
//import pl.coderslab.user.User;
//import pl.coderslab.user.UserService;
//
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.util.*;
//
//@RestController
//public class CartItemJsonController {
//    private final ProductService productService;
//    private final CartService cartService;
//    private final CartItemService cartItemService;
//    private final UserService userService;
//    private final CartItemRepository cartItemRepository;
//
//    public CartItemJsonController(ProductService productService, CartService cartService,
//                                  CartItemService cartItemService, UserService userService, CartItemRepository cartItemRepository) {
//        this.productService = productService;
//        this.cartService = cartService;
//        this.cartItemService = cartItemService;
//        this.userService = userService;
//        this.cartItemRepository = cartItemRepository;
//    }
//
//    @PostMapping("/after-change")
//    public String getChanges(@RequestBody LinkedHashMap product, HttpSession session){
////        ObjectMapper objectMapper = new ObjectMapper();
////        List<Product> productList = new ArrayList<>();
////        try{
//////            productList = Arrays.asList(objectMapper.readValue(products, Product.class));
////
////        }catch (IOException e){
////            System.out.println(e);
////        }
////        System.out.println(productList);
////        HashMap<> = products.get("products");
////      User user = (User) session.getAttribute("user");
////        List<CartItem> items =  user.getCart().getCartItems();
////        cartItemRepository.getCartItemByProductName(products.getName());
//        return "redirect:/";
//    }
//}
