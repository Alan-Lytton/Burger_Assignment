package com.coding.burger.controllers;

import com.coding.burger.models.Burger;
import com.coding.burger.services.BurgerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class BurgerController {
    private final BurgerService burgerService;

    public BurgerController(BurgerService burgerService) {
        this.burgerService = burgerService;
    }

    @GetMapping("")
    public String index(@ModelAttribute("burger")Burger burger, Model model){
        model.addAttribute("burgers", burgerService.findAllBurgers());
        return "index.jsp";
    }

    @PostMapping("")
    public String process(@Valid @ModelAttribute("burger")Burger burger, BindingResult result, Model model){
        if(result.hasErrors()){
            model.addAttribute("burgers", burgerService.findAllBurgers());
            return "index.jsp";
        }else{
        burgerService.createBurger(burger);
        return "redirect:/";
        }
    }
}
