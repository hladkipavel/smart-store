package pl.coderslab.cart;


public interface CartService {
    Cart addCart(Cart cart);
    void deleteCart(Long id);
    Cart getCart(Long id);
    void editCart(Cart cart);
}
