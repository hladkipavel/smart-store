package pl.coderslab.cart;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    @Query("select SUM(ci.count) from CartItem ci where ci.cart.id = ?1")
    Double countCartItemsByCardId(Long cartId);
    Cart findCartByUserId(Long id);
}
