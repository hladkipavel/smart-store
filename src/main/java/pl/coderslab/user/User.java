package pl.coderslab.user;

import lombok.*;
import pl.coderslab.cart.Cart;
import pl.coderslab.order.Order;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import java.util.ArrayList;
import java.util.List;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;
    @Size(min = 2)
    private String firstName;
    @Size(min = 2)
    private String lastName;
    @NotBlank
    private String email;
    @Size(min = 8)
    private String password;
//    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
//    List<Order> orders = new ArrayList<>();

    public User(String firstName, String lastName, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }
}
