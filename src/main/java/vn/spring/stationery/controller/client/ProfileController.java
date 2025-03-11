package vn.spring.stationery.controller.client;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import vn.spring.stationery.service.UploadService;
import vn.spring.stationery.service.UserService;
import vn.spring.stationery.domain.Product;
import vn.spring.stationery.domain.User;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ProfileController {

    // DI : Dependency Injection
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public ProfileController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // @RequestMapping("/")
    // public String getHomePage(Model model) {
    // // String test = this.userService.handleHello(); // gọi tới model
    // List<User> arrUsers = this.userService.getAllUsersByEmail("1@gmail.com");
    // System.out.println(arrUsers);
    // model.addAttribute("stall", "test"); // model sau khi có data thì gửi lại tới
    // controller
    // return "hello"; // controller sau khi xử lí data thì gửi lại cho view , view
    // render ra dữ liệu
    // }

    @RequestMapping("/profile")
    public String getUserDetailPage(Model model, HttpServletRequest request) {
        User currentUser = new User(); // null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        User userDetail = this.userService.getUserById(id);

        model.addAttribute("id", id);
        model.addAttribute("detail", userDetail);
        return "client/profile/show";
    }
}
