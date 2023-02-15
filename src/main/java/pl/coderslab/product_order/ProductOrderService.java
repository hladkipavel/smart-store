package pl.coderslab.product_order;

public interface ProductOrderService {
    void addProductOrder(ProductOrder productOrder);
    void deleteProductOrder(Long id);
    void editProductOrder(ProductOrder productOrder);
    ProductOrder getProductOrder(Long id);
}
