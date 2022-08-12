package com.team.horizon.models;

import lombok.Data;

/**
 *
 * @author ASUS
 */
@Data
public class ProductContentError {

    private String productDescriptionError, productContentError;

    public ProductContentError() {
        this.productDescriptionError = "";
        this.productContentError = "";
    }
}
