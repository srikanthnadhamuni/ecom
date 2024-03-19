package com.playground.ecommerce21.controller;

import com.playground.ecommerce21.model.Product;
import com.playground.ecommerce21.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {

    private final ProductService productService;
    private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/all") public List<Product> getAllProducts() {
        logger.info("Fetching all products");
        return productService.getAllProducts();
    }
}
