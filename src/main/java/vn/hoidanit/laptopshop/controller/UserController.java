package vn.hoidanit.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.hoidanit.laptopshop.service.UserService;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    // DI : Dependency Injection
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        // String test = this.userService.handleHello(); // gọi tới model
        List<User> arrUsers = this.userService.getAllUsersByEmail("1@gmail.com");
        System.out.println(arrUsers);
        model.addAttribute("stall", "test"); // model sau khi có data thì gửi lại tới controller
        return "hello"; // controller sau khi xử lí data thì gửi lại cho view , view render ra dữ liệu
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("user", users); // "user" la gia tri nhan duoc ben view , users la bien o tren gan vao
        return "admin/user/user";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        List<User> userDetail = this.userService.getAllUserById(id);
        model.addAttribute("id", id);
        model.addAttribute("detail", userDetail);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User stall) {
        this.userService.handleSaveUser(stall);
        return "redirect:/admin/user";
    }

}
