package pl.coderslab.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import pl.coderslab.category.Category;
import pl.coderslab.category.CategoryRepository;

import java.util.List;

@Controller
public class ProductController {

    private final CategoryRepository categoryRepository;
    private final ProductRepository productRepository;

    public ProductController(CategoryRepository categoryRepository, ProductRepository productRepository) {

        this.categoryRepository = categoryRepository;
        this.productRepository = productRepository;
    }

    @GetMapping("/all")
    public String getAllProducts(Model model){
        List<Product> products = productRepository.findAll();
        List<Category> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("products", products);
        return "all";
    }
    @GetMapping("/find-by-category/{id}")
    public String findByCategory(@PathVariable Long id, Model model){
        List<Product> products = productRepository.findByCategoryId(id);
        List<Category> categories = categoryRepository.findAll();
        model.addAttribute("products", products);
        model.addAttribute("categories", categories);
        return "find-by-category/findByCategory";
    }
}
