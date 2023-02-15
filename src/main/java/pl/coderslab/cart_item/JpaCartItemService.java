package pl.coderslab.cart_item;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
@Repository
@RequiredArgsConstructor
public class JpaCartItemService implements CartItemService{
    private CartItemRepository cartItemRepository;
    @Override
    public void addCartItem(CartItem cartItem) {
        cartItemRepository.save(cartItem);
    }

    @Override
    public void deleteCartItem(Long id) {
        cartItemRepository.deleteById(id);
    }

    @Override
    public CartItem getCartItem(Long id) {
        return cartItemRepository.getOne(id);
    }

    @Override
    public void editCartItem(CartItem cartItem) {
        cartItemRepository.save(cartItem);
    }
}
