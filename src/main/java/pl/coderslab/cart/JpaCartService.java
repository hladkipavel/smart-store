package pl.coderslab.cart;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
@RequiredArgsConstructor
public class JpaCartService implements CartService{
    private final CartRepository cartRepository;
    @Override
    public void addCart(Cart cart) {
        cartRepository.save(cart);
    }

    @Override
    public void deleteCart(Long id) {
        cartRepository.deleteById(id);
    }

    @Override
    public Cart getCart(Long id) {
        return cartRepository.getOne(id);
    }

    @Override
    public void editCart(Cart cart) {
        cartRepository.save(cart);
    }
}
