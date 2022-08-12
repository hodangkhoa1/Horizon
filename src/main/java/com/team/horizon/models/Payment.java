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
public class Payment {

    private String paymentId, userId, productId, typePayment;
    private int total;
    private Timestamp PaymentCreated;

    public Payment(String paymentId, String userId, String productId, String typePayment, int total, Timestamp PaymentCreated) {
        this.paymentId = paymentId;
        this.userId = userId;
        this.productId = productId;
        this.typePayment = typePayment;
        this.total = total;
        this.PaymentCreated = PaymentCreated;
    }
    
}
