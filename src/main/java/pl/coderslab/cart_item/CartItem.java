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

    private Integer count;

    @Column(name = "add_date")
    private LocalDateTime addDate;
    @ManyToOne
    private Cart cart;
    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product;

    public CartItem(int count, Product product, LocalDateTime addDate, Cart cart) {
        this.count = count;
        this.addDate = addDate;
        this.cart = cart;
        this.product = product;
    }
}
