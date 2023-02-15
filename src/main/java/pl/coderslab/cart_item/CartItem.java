package pl.coderslab.cart_item;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.cart.Cart;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="cart_item")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int count;
    @Column(name = "add_date")
    private LocalDateTime addDate;
    @ManyToOne
    private Cart cart;
}
