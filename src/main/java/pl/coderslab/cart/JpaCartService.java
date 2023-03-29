package pl.coderslab.cart;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import pl.coderslab.user.UserRepository;

@Service
@Primary
@RequiredArgsConstructor
public class JpaCartService implements CartService{
    private final CartRepository cartRepository;
    @Override
    public Cart addCart(Cart cart) {
        cartRepository.save(cart);
        return cartRepository.findById(cart.getId()).orElse(null);
    }

    @Override
    public void deleteCart(Long id) {
        cartRepository.deleteById(id);
    }

    @Override
    public Cart getCart(Long id) {
        return cartRepository.findById(id).orElse(null);
    }

    @Override
    public void editCart(Cart cart) {
        cartRepository.save(cart);
    }

    public Cart getCartByUserId(Long id){
        return cartRepository.findCartByUserId(id);
    }

}
