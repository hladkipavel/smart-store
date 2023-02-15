package pl.coderslab.cart_item;

public interface CartItemService {
    void addCartItem(CartItem cartItem);
    void deleteCartItem(Long id);
    CartItem getCartItem(Long id);
    void editCartItem(CartItem cartItem);
}
