/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.horizon.utils;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author ASUS
 */
public class GetCookie {

    private static final String REMEMBER_USER = "c_user";
    private static final String SECRET_KEY = "ssshhhhhhhhhhh!!!!";

//    public static Account cookieUsername(HttpServletRequest request) throws SQLException {
//        Cookie[] arrayCookie = request.getCookies();
//        CheckAccount checkLogin = new CheckAccount();
//
//        if (arrayCookie != null) {
//            for (Cookie cookie : arrayCookie) {
//                if (cookie.getName().equals(REMEMBER_USER)) {
//                    return checkLogin.checkAccount(Encrypt.decrypt(cookie.getValue(), SECRET_KEY));
//                }
//            }
//        }
//
//        return null;
//    }
}
