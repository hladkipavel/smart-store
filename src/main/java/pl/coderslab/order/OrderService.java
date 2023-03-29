package pl.coderslab.order;

public interface OrderService {
    void addOrder(Order order);
    void deleteOrder(Long id);
    void editOrder(Order order);
    Order getOrder(Long id);
}
