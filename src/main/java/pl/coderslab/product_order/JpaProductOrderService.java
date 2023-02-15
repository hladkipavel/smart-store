package pl.coderslab.product_order;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
@RequiredArgsConstructor
public class JpaProductOrderService implements ProductOrderService{
    private final ProductOrderRepository productOrderRepository;
    @Override
    public void addProductOrder(ProductOrder productOrder) {
        productOrderRepository.save(productOrder);
    }

    @Override
    public void deleteProductOrder(Long id) {
        productOrderRepository.deleteById(id);
    }

    @Override
    public void editProductOrder(ProductOrder productOrder) {
        productOrderRepository.save(productOrder);
    }

    @Override
    public ProductOrder getProductOrder(Long id) {
        return productOrderRepository.getOne(id);
    }
}
