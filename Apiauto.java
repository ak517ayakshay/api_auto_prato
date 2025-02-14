package com.api.auto;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.json.JSONObject;
import org.testng.Assert;
import org.testng.annotations.Test;

import static io.restassured.RestAssured.given;

public class Apiauto {

    @Test
    public void testFetchCityPopulation() {

        Response response = given()
                .param("city", "Lagos")
                .when()
                .get("https://countriesnow.space/api/v0.1/countries/population/cities/q")
                .then()
                .statusCode(200)
                .extract().response();

System.out.println(response.asPrettyString());

        
    }
}
