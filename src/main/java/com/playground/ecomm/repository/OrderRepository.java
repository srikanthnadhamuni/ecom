package com.playground.ecomm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.playground.ecomm.model.Order;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    // Define any custom query methods specific to Order here
}
