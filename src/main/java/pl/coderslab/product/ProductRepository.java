package pl.coderslab.product;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long> {
    @Query("select p from Product p order by p.id desc ")
    List<Product> findLastAddedProducts();
    List<Product> findByCategoryId(Long id);
}
