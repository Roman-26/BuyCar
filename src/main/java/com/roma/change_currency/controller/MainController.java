package com.roma.change_currency.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class MainController {

    @GetMapping("/index")
    public String index(Principal principal,Model model) {
        model.addAttribute("username",principal.getName());
        return "index";
    }
}
