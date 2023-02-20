package pl.coderslab.cart_item;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {

    CartItem findByProductId(Long productId);
    @Query("select distinct ci from CartItem ci where ci.product.id = ?1 and ci.cart.id = ?2")
    CartItem findByProductIdAndCartId(Long productId, Long cartId);

}
