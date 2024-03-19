package com.playground.ecommerce21.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.playground.ecommerce21.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    // Define any custom query methods specific to Customer here
}
