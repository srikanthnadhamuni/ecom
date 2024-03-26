// The Customer class holds all the customer details. They are used for placing orders and for shipping the products to the customer.
// This is the model class for the Customer entity. It is annotated with @Entity to indicate that it is a JPA entity.
// Its autolinked with the table name "customers" using the @Table annotation.
package com.playground.ecomm.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "customers")
public class Customer {
    @Id
    private long id;
    private String name; // first and last names are part of the name
    private String email; // email is used for login and for sending order notifications to the customer.
                          // Backend needs to validate the email address.
    private String phone; // mobile number is used sometimes for rev-verfiying or for 2FA of the customer
                          // through an OTP.
    private String address;
    private String city;
    private String state; // state needs to be a valid state in the country. Backend needs to validate the
                          // state.
    private String pincode; // The pincode is used not just for addressing, but also for calculating the
                            // shipping cost and taxes.
    private String country;

    // Constructor that takes all fields as arguments
    public Customer(long id, String name, String email, String phone, String address, String city, String state,
            String pincode, String country) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.city = city;
        this.state = state;
        this.pincode = pincode;
        this.country = country;
    }

    // Add getters and Setter methods for all fields
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        // Validate email format using regex
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        if (email.matches(emailRegex)) {
            this.email = email;
        } else {
            throw new IllegalArgumentException("Invalid email format");
        }
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        // Validate phone number format using regex
        String phoneRegex = "^\\+91[1-9]\\d{9}$";
        if (phone.matches(phoneRegex)) {
            this.phone = phone;
        } else {
            throw new IllegalArgumentException("Invalid phone number format");
        }
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        // Validate pincode format using regex
        String pincodeRegex = "^[1-9][0-9]{5}$";
        if (pincode.matches(pincodeRegex)) {
            this.pincode = pincode;
        } else {
            throw new IllegalArgumentException("Invalid pincode format");
        }
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}