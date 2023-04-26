package com.example.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@RestController
public class ApiApplication {
    @GetMapping("/api")
    public Map<String, Object> getApiResponse() {
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Automate all the things!");
        response.put("timestamp", Instant.now().getEpochSecond());
        return response;
    }
}