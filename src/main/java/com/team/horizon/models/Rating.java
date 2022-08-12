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
public class Rating {

    private String ratingId, productId, userId;
    private int numberRating;
    private Timestamp ratingCreated;

    public Rating() {
    }

    public Rating(String ratingId, String productId, String userId, int numberRating, Timestamp ratingCreated) {
        this.ratingId = ratingId;
        this.productId = productId;
        this.userId = userId;
        this.numberRating = numberRating;
        this.ratingCreated = ratingCreated;
    }
    
}
