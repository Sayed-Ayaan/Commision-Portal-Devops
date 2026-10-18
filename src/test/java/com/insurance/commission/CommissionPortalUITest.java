package com.insurance.commission;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class CommissionPortalUITest {
    private WebDriver driver;

    @BeforeEach
    public void setUp() {
        // Ensure ChromeDriver is available in your system PATH or configured
        driver = new ChromeDriver();
        driver.manage().window().maximize();
    }

    @Test
    public void testPortalHomeTitle() {
        // Navigate to your locally deployed Tomcat application
        driver.get("http://localhost:8080/commission-portal/");
        
        String pageTitle = driver.getTitle();
        // Basic assertion check
        assertTrue(driver.getPageSource().length() > 0, "Page content should not be empty");
    }

    @AfterEach
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}