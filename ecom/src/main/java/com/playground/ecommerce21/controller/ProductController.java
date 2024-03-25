// ProductController.java is a REST controller that handles HTTP requests for the Product entity.
// It has two GET endpoints: getAllProducts and getProductById.
// The getAllProducts method returns all products in the database.
// The getProductById method returns a product by its ID.
// The logger is used to log information about the requests.
// The ProductService is autowired to the controller.
// The ProductService class is used to interact with the database.

package com.playground.ecommerce21.controller;

import com.playground.ecommerce21.model.Product;
import com.playground.ecommerce21.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {

    private final ProductService productService;
    private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    // The getAllProducts method is a GET endpoint that returns all products in the
    // database.
    @GetMapping("/all")
    public List<Product> getAllProducts() {
        logger.info("Fetching all products");

        List<Product> products = productService.getAllProducts();
        // for (Product product : products) {
        // product.printProductDetails();
        // }
        return productService.getAllProducts();
    }

    // The getProductById method is a GET endpoint that returns a product by its ID.
    @GetMapping("/{id}")
    public Product getProductById(@PathVariable Long id) {
        logger.info("Fetching product with id: " + id);
        return productService.getProductById(id);
    }
}
