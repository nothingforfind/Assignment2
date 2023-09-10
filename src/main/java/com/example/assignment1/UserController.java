package com.example.assignment1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/users")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @RequestMapping("/user")
    public User getUser() {
        return userService.getUser("nothingforfind");
    }

    @RequestMapping("/questions")
    public List<Question> getAllQuestions() {
        return userService.getQuestionsByQuantity(3);
    }

    @RequestMapping("/logging")
    public boolean test() {
        return userService.authentication("nothingforfind", "123456");
    }
}
