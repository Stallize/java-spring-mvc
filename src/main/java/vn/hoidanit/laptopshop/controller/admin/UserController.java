package vn.hoidanit.laptopshop.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

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

import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;
import vn.hoidanit.laptopshop.domain.User;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

@Controller
public class UserController {

    // DI : Dependency Injection
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
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

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("user", users); // "user" la gia tri nhan duoc ben view , users la bien o tren gan vao
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User userDetail = this.userService.getUserById(id);
        model.addAttribute("id", id);
        model.addAttribute("detail", userDetail);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User stall, BindingResult newUserBindingResult,
            @RequestParam("stallFile") MultipartFile file) {
        // validate

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar"); // luu ten file
        String hashPassword = this.passwordEncoder.encode(stall.getPassword());
        stall.setAvatar(avatar);
        stall.setPassword(hashPassword);
        stall.setRole(userService.getRoleByName(stall.getRole().getName()));

        // save
        this.userService.handleSaveUser(stall);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}") // GET
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("updateUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("updateUser") User stall,
            @RequestParam("stallFile") MultipartFile file) {
        User currentUser = this.userService.getUserById(stall.getId());
        if (currentUser != null) {
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            currentUser.setFullName(stall.getFullName());
            currentUser.setPhone(stall.getPhone());
            currentUser.setAddress(stall.getAddress());
            currentUser.setRole(userService.getRoleByName(stall.getRole().getName()));
            currentUser.setAvatar(avatar);
            this.userService.handleSaveUser(currentUser);
        }
        model.addAttribute("updateUser", currentUser);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("deleteUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete") // GET
    public String postDeleteUser(Model model, @ModelAttribute("deleteUser") User stall) {
        this.userService.deleteUserById(stall.getId());
        return "redirect:/admin/user";
    }
}
