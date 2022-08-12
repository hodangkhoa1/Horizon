package com.team.horizon.models;

import lombok.Data;

/**
 *
 * @author ASUS
 */
@Data
public class ProductError {
    
    private String productNameError, imageProductError, productPriceError, productBrandError, quantityError, productTypeError, productDescriptionError, productContentError;
    
    public ProductError() {
        this.productNameError = "";
        this.imageProductError = "";
        this.productPriceError = "";
        this.productBrandError = "";
        this.productTypeError = "";
        this.quantityError = "";
        this.productDescriptionError = "";
        this.productContentError = "";
    }
}
