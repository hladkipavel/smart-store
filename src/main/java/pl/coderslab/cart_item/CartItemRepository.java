package pl.coderslab.cart_item;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.cart.Cart;

import java.util.List;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {

    @Query("select distinct ci from CartItem ci where ci.product.id = ?1 and ci.cart.id = ?2")
    CartItem findByProductIdAndCartId(Long productId, Long cartId);

    @Query ("select SUM(ci.product.price * ci.count) from CartItem ci join Product p on p.id = ci.product.id\n" +
            "                  where ci.cart.id = ?1")
    Double totalPriceCartItemsByUserId(Long carId);

    List<CartItem> findCartItemByCartId(Long id);
}
