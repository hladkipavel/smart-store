package pl.coderslab.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import pl.coderslab.cart.Cart;
import pl.coderslab.cart_item.CartItem;
import pl.coderslab.cart_item.JpaCartItemService;
import pl.coderslab.category.Category;
import pl.coderslab.category.JpaCategoryService;
import pl.coderslab.user.User;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class ProductController {

    private final JpaCartItemService jpaCartItemService;
    private final JpaProductService jpaProductService;
    private final JpaCategoryService jpaCategoryService;

    public ProductController(JpaCartItemService jpaCartItemService, JpaProductService jpaProductService, JpaCategoryService jpaCategoryService) {
        this.jpaCartItemService = jpaCartItemService;
        this.jpaProductService = jpaProductService;
        this.jpaCategoryService = jpaCategoryService;
    }
    @GetMapping("/all")
    public String getAllProducts(Model model){
        List<Product> products = jpaProductService.showAllProducts();
        List<Category> categories = jpaCategoryService.showAllCategory();
        model.addAttribute("categories", categories);
        model.addAttribute("products", products);
        return "all";
    }
    @GetMapping("/find-by-category/{id}")
    public String findByCategory(@PathVariable Long id, Model model){
        List<Product> products = jpaProductService.getProductByCategory(id);
        List<Category> categories = jpaCategoryService.showAllCategory();
        model.addAttribute("products", products);
        model.addAttribute("categories", categories);
        return "find-by-category/findByCategory";
    }
    @GetMapping("/view-single/{id}")
    public String getSingleProduct(@PathVariable Long id, Model model){
        Product product = jpaProductService.getProduct(id);
        model.addAttribute("product", product);
        return "productSingle";
    }
}
