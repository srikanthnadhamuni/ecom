// The oders class handles customer orders. Each order can copnsis of multiple products in different quantities.
// This is the model class for the Order entity. It is annotated with @Entity to indicate that it is a JPA entity.
// Its autolinked with the table name "orders" using the @Table annotation.

package com.playground.ecommerce21.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.util.List;


@Entity
@Table(name = "orders")
public class Order {
    @Id
    private Long id;
    @OneToMany
    private List<Product> products;
    private String status;

    // Constructors, getters, and setters

    public Order(List<Product> products, String status) {
        this.products = products;
        this.status = status;
    }

    // Getters and setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        if (status.equals("placed") || status.equals("shipped") || status.equals("delivered") || status.equals("cancelled")) {
            this.status = status;
        } else {
            throw new IllegalArgumentException("Invalid status");
        }
    }
}
