package com.team.horizon.models;

import java.sql.Timestamp;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author ASUS
 */
@Getter
@Setter
public class Cart {

    private String cartId, userId, imageProduct, productName;
    private int quantity, price;
    private Timestamp purchaseDate;

    public Cart() {
    }

    public Cart(String cartId, String userId, String imageProduct, String productName, int quantity, int price, Timestamp purchaseDate) {
        this.cartId = cartId;
        this.userId = userId;
        this.imageProduct = imageProduct;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
        this.purchaseDate = purchaseDate;
    }

    
}
