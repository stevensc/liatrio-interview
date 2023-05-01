import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@ExtendWith(SpringExtension.class)
@WebMvcTest(ApiApplication.class)
class ApiApplicationTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ApiApplication apiController;

    private ObjectMapper objectMapper = new ObjectMapper();

    @BeforeEach
    public void setup() {
        Map<String, Object> response = Map.of("message", "Automate all the things!", "timestamp", 1529729125);
        when(apiController.getApiResponse()).thenReturn(response);
    }

    @Test
    void testGetApiResponse() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/api"))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andReturn();

        String content = result.getResponse().getContentAsString();
        Map<String, Object> responseMap = objectMapper.readValue(content, new TypeReference<Map<String, Object>>(){});

        assertTrue(responseMap.containsKey("message"));
        assertTrue(responseMap.containsKey("timestamp"));
    }
}
