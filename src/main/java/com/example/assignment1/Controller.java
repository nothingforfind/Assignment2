package com.example.assignment1;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller {

    @RequestMapping("/hello")
    public String home() {
        return "index";
    }

}
