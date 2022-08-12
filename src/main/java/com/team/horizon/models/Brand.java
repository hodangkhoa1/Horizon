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
public class Brand {

    private String brandId, brandName, imageBrand;

    public Brand(String brandId, String brandName, String imageBrand) {
        this.brandId = brandId;
        this.brandName = brandName;
        this.imageBrand = imageBrand;
    }
    
}
