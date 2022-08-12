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
public class Notification {

    private String notifyId, userId, notifyType;
    private int isRead;
    private Timestamp notifyCreated;

    public Notification() {
    }

    public Notification(String notifyId, String userId, String notifyType, int isRead, Timestamp notifyCreated) {
        this.notifyId = notifyId;
        this.userId = userId;
        this.notifyType = notifyType;
        this.isRead = isRead;
        this.notifyCreated = notifyCreated;
    }

}
