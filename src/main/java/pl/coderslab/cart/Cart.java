package pl.coderslab.cart;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.user.User;

import javax.persistence.*;
import java.time.LocalDateTime;

import static javax.persistence.GenerationType.*;

@Entity
@Table(name = "carts")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;
    @Column(name = "creation_date")
    private LocalDateTime creationDate;
    @OneToOne(mappedBy = "cart")
    private User user;

}
