package pl.coderslab.product_order;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.order.Order;
import pl.coderslab.product.Product;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="products_orders")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private double price;
    private int count;
    @ManyToOne
    private Product product;
    @ManyToOne
    private Order order;
}
