package pl.coderslab.product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.category.Category;
import pl.coderslab.order.Order;
import pl.coderslab.product_order.ProductOrder;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.List;

import static javax.persistence.GenerationType.*;

@Entity
@Table(name = "products")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;
    private String name;
    private String description;
    private double price;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
//    @ManyToMany
//    @JoinTable(name = "products_orders",
//            joinColumns = @JoinColumn(name = "product_id"),
//            inverseJoinColumns = @JoinColumn(name = "order_id"))
//    private List<Order> orders = new ArrayList<>();
    @OneToMany(mappedBy = "product")
    private List<ProductOrder> productOrders;
}
