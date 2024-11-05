package vn.hoidanit.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class UserController {

    // DI : Dependency Injection
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handleHello(); // gọi tới model
        model.addAttribute("stall", test); // model sau khi có data thì gửi lại tới controller
        return "hello"; // controller sau khi xử lí data thì gửi lại cho view , view render ra dữ liệu
    }

    @RequestMapping("/admin/user")
    public String getCreateAccountPage(Model model) {
        return "/admin/user/create";
    }

}

// @RestController
// public class UserController {

// DI : Dependency Injection
// private UserService userService;

// public UserController(UserService userService) {
// this.userService = userService;
// }

// @GetMapping("/")
// public String getHomePage() {
// return this.userService.handleHello();
// }

// }
