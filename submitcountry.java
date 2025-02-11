package com.api.auto;

import groovy.lang.GString;
import io.restassured.response.Response;
import org.testng.annotations.Test;

import static io.restassured.RestAssured.given;

public class submitcountry {
    @Test
    public void submit() {

        Response res = given()
                .param("country", "nigeria").when().get("https://countriesnow.space/api/v0.1/countries/population/q").then().extract().response();

        System.out.println(res.asPrettyString());
    }

}
