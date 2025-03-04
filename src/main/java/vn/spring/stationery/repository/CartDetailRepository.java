package vn.spring.stationery.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.spring.stationery.domain.Cart;
import vn.spring.stationery.domain.CartDetail;
import vn.spring.stationery.domain.Product;
import vn.spring.stationery.domain.User;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);
}
