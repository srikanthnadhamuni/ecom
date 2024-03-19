package com.playground.ecommerce21;

import com.playground.ecommerce21.model.Product;
import com.playground.ecommerce21.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.math.BigDecimal;

@SpringBootApplication
public class EcomApplication implements CommandLineRunner {
	
	@Autowired ProductRepository productRepository;

	public static void main(String[] args) {
		SpringApplication.run(EcomApplication.class, args);
	}
	
	@Override public void run(String... args) throws Exception {
		System.out.println("I'm at the start of the application"); // Added printf statement
		// Create sample products
		Product product1 = new Product(1L, "iPhone 16", new BigDecimal(1200), "The latest, greatest iPhone from Apple", 1, "image1.jpg");
		Product product2 = new Product(2L, "Yoga Mat", new BigDecimal(12.99), "Astanga comes easy with this mat",  2, "image2.jpg");
		Product product3 = new Product(3L, "Coffee Holder", new BigDecimal(15.45), "Your coffee always hot",  1, "image3.jpg");
		
		// Save products to the database
		productRepository.save(product1);
		productRepository.save(product2);
		productRepository.save(product3);
	}
}
