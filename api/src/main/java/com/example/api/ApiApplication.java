package com.example.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.time.Instant;
import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@RestController
public class ApiApplication {
    
    public static void main(String[] args) {
        SpringApplication.run(ApiApplication.class, args);
    }

    @GetMapping("/api")
    public Map<String, Object> getApiResponse() {
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Automate all the things!");
        response.put("timestamp", Instant.now().getEpochSecond());
        return response;
    }
}