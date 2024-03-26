
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.math.BigDecimal;
import java.util.Arrays;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.hamcrest.Matchers.*;
import com.playground.ecomm.*;


@SpringBootTest
@AutoConfigureMockMvc
public class ProductControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ProductService productService;

    @Test
    public void getAllProductsTest() throws Exception {
        Product product = new Product();
        product.setId(1L);
        product.setAsin("ASIN123");
        product.setName("Test Product");
        product.setPrice(new BigDecimal("100.0"));
        product.setDescription("This is a test product");
        product.setQuantity(10);
        product.setImage("test_image.jpg");

        when(productService.getAllProducts()).thenReturn(Arrays.asList(product));

        mockMvc.perform(get("/products/all"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Test Product")))
                .andExpect(content().string(containsString("ASIN123")))
                .andExpect(content().string(containsString("100.0")))
                .andExpect(content().string(containsString("This is a test product")))
                .andExpect(content().string(containsString("10")))
                .andExpect(content().string(containsString("test_image.jpg")));
    }
}
        product.setName("Test Product");
        product.setPrice(100.0);

        when(productService.getAllProducts()).thenReturn(Arrays.asList(product));

        mockMvc.perform(get("/products/all"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Test Product")));
    }
}