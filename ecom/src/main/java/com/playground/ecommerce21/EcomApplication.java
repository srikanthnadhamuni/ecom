package com.playground.ecommerce21;

import com.playground.ecommerce21.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class EcomApplication {
	
	@Autowired
	ProductRepository productRepository;

	public static void main(String[] args) {
		SpringApplication.run(EcomApplication.class, args);
	}
}
