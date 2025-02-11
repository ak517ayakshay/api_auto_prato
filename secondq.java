package com.api.auto;
import io.restassured.response.Response;
import org.testng.annotations.Test;
import static io.restassured.RestAssured.given;

public class secondq{
    // 1️⃣ Fetch Population of a Specific City
    @Test
    public void testFetchCityPopulation() {

        Response response = given()
                .param("city", "Lagos")
                .when()
                .get("https://countriesnow.space/api/v0.1/countries/population/cities/q")
                .then()
                .statusCode(200)
                .extract().response();

        int pop=response.jsonPath().getInt("data.populationCounts[0].value");
        System.out.println(pop);
        System.out.println(pop+10000);
}
}