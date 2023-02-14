package pl.coderslab.order;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.user.User;

import javax.persistence.*;
import java.time.LocalDateTime;

import static javax.persistence.GenerationType.*;

@Entity
@Table(name = "orders")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;
    private LocalDateTime createdDate;
    @ManyToOne
    @JoinColumn(name = "user")
    private User user;

}
