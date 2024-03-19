package com.playground.ecommerce21.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.playground.ecommerce21.model.Product;


@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
}