/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.horizon.models;

import lombok.Data;

/**
 *
 * @author ASUS
 */
@Data
public class AccountError {

    private String usernameError, passwordError, newPasswordError, confirmPasswordError, emailError, phoneNumberError, addressError, verifySMSError;

    public AccountError() {
        this.usernameError = "";
        this.passwordError = "";
        this.newPasswordError = "";
        this.confirmPasswordError = "";
        this.emailError = "";
        this.phoneNumberError = "";
        this.addressError = "";
        this.verifySMSError = "";
    }

}
