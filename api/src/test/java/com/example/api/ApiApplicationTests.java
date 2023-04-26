package com.example.api;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ApiApplicationTest {
    
    @Autowired
    private MockMvc mockMvc;

    @Test
    public void testGetApiResponse() throws Exception {
        MvcResult result = mockMvc.perform(get("/api"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message").value("Automate all the things!"))
                .andReturn();
        
        String response = result.getResponse().getContentAsString();
        Map<String, Object> jsonResponse = new ObjectMapper().readValue(response, new TypeReference<Map<String, Object>>() {});
        
        assertTrue(jsonResponse.containsKey("message"));
        assertTrue(jsonResponse.containsKey("timestamp"));
    }
}