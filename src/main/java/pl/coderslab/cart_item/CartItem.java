package pl.coderslab.cart_item;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.cart.Cart;
import pl.coderslab.product.Product;

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
    @Column(name = "product_name")
    private String productName;
    private int count;
    @Column(name = "add_date")
    private LocalDateTime addDate;
    @ManyToOne
    private Cart cart;

    public CartItem(int count, String productName, LocalDateTime addDate, Cart cart) {
        this.count = count;
        this.productName = productName;
        this.addDate = addDate;
        this.cart = cart;
    }
}
