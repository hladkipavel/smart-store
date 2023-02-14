package pl.coderslab.user;

import lombok.*;
import pl.coderslab.cart.Cart;
import pl.coderslab.order.Order;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.List;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "users")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    @OneToOne(cascade = CascadeType.REMOVE)
    private Cart cart;
    @OneToMany(mappedBy = "user")
    List<Order> orders = new ArrayList<>();
}
