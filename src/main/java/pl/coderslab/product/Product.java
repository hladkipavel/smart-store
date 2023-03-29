package pl.coderslab.product;

import lombok.*;
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
@ToString(exclude = "id")
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
//    @OneToMany(mappedBy = "product")
//    private List<ProductOrder> productOrders;
}
