package pl.coderslab.product;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@Primary
@RequiredArgsConstructor
public class JpaProductService implements ProductService{
    private final ProductRepository productRepository;
    @Override
    public List<Product> showAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public void addProduct(Product product) {
        productRepository.save(product);
    }

    @Override
    public Product getProduct(Long id) {
        return productRepository.getOne(id);
    }

    @Override
    public void deleteProduct(Long id) {
        productRepository.delete(productRepository.getOne(id));
    }

    @Override
    public void editProduct(Product product) {
        productRepository.save(product);
    }
}
