package pl.coderslab.cart;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.Entity;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
}
