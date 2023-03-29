package pl.coderslab.cart_item;

import lombok.*;
import pl.coderslab.cart.Cart;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
public class EditedCartItem {
    private Long productId;
    private Integer count;
    private Double price;
    private Long cartId;

}
