/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.horizon.models;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author ASUS
 */
@Getter
@Setter
public class ProductContent {

    private String productContentId, productId, productDescription, productContent;

    public ProductContent() {
    }

    public ProductContent(String productContentId, String productId, String productDescription, String productContent) {
        this.productContentId = productContentId;
        this.productId = productId;
        this.productDescription = productDescription;
        this.productContent = productContent;
    }

}
