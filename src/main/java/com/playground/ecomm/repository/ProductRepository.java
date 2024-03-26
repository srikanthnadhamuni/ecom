package com.playground.ecomm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.playground.ecomm.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
}