package com.example.assignment1;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@org.springframework.stereotype.Controller
public class Controller {

    @RequestMapping("login")
    public String toLogin() {
        return "form-login";
    }

    @RequestMapping ("check-authentication")
    public String toCheck() {
        return "form-take-quiz";
    }

    @RequestMapping("/registration")
    public String toRegistration() {

        return "fom-registration";
    }

    @PostMapping("check")
    public String check(@RequestParam String submitButton) {
        if ("Signin".equals(submitButton)) {
            return "redirect:check-authentication";
        } else if ("Registration".equals(submitButton)) {
            return "redirect:registration";
        } else {
            return "redirect:error";
        }
    }
}
