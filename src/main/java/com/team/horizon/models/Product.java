/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class Product {

    private String productId, productName, brandId, imageProduct, productTypeId;
    private int productPrice, productDiscount, viewers, quantity;
    private Timestamp productCreated;

    public Product() {
    }

    public Product(String productId, String productName, String brandId, String imageProduct, String productTypeId, int productPrice, int productDiscount, int viewers, int quantity, Timestamp productCreated) {
        this.productId = productId;
        this.productName = productName;
        this.brandId = brandId;
        this.imageProduct = imageProduct;
        this.productTypeId = productTypeId;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.viewers = viewers;
        this.quantity = quantity;
        this.productCreated = productCreated;
    }
    
}
