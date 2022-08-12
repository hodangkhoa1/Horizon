package com.team.horizon.models;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author ASUS
 */
@Getter
@Setter
public class ProductType {

    private String productTypeID, productTypeName, iconProductType;

    public ProductType(String productTypeID, String productTypeName, String iconProductType) {
        this.productTypeID = productTypeID;
        this.productTypeName = productTypeName;
        this.iconProductType = iconProductType;
    }
}
