package vn.spring.stationery.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContactController {
    @GetMapping("/contact")
    public String getContactPage() {
        return "client/contact/show";
    }
}
