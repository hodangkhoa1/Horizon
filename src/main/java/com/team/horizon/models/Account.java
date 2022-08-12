/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.horizon.models;

import java.sql.*;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author ASUS
 */
@Getter
@Setter
public class Account {

    private String userId, userName, passwordHash, email, sex, phoneNumber, defaultAvatar, colorAvatar, imageAvatar, userAddress;
    private Date dateOfBirth;
    private int activeAccount, disableAccount, isAdmin;
    private Timestamp accountCreated;

    public Account() {
    }

    public Account(String userId, String userName, String passwordHash, String email, String sex, String phoneNumber, String defaultAvatar, String colorAvatar, String imageAvatar, String userAddress, Date dateOfBirth, int activeAccount, int disableAccount, int isAdmin, Timestamp accountCreated) {
        this.userId = userId;
        this.userName = userName;
        this.passwordHash = passwordHash;
        this.email = email;
        this.sex = sex;
        this.phoneNumber = phoneNumber;
        this.defaultAvatar = defaultAvatar;
        this.colorAvatar = colorAvatar;
        this.imageAvatar = imageAvatar;
        this.userAddress = userAddress;
        this.dateOfBirth = dateOfBirth;
        this.activeAccount = activeAccount;
        this.disableAccount = disableAccount;
        this.isAdmin = isAdmin;
        this.accountCreated = accountCreated;
    }
    
}
