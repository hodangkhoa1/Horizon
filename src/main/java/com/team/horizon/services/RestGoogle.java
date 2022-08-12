package com.team.horizon.services;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.team.horizon.models.Constants;
import com.team.horizon.models.GoogleAccount;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

public class RestGoogle {

    public static String getGoogleToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jsonObject = new Gson().fromJson(response, JsonObject.class);
        return jsonObject.get("access_token").toString().replaceAll("\"", "");
    }

    public static GoogleAccount getGoogleUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        return new Gson().fromJson(response, GoogleAccount.class);
    }
}
