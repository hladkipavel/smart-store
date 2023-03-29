package pl.coderslab.product;

import java.util.List;

public interface ProductService {
    List<Product> showAllProducts();
    void addProduct(Product product);
    Product getProduct(Long id);
    void deleteProduct(Long id);
    void editProduct(Product product);
}
