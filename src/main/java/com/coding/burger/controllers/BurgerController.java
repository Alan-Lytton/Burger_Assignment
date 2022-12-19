package com.coding.burger.controllers;

import com.coding.burger.models.Burger;
import com.coding.burger.services.BurgerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

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
        }else {
            burgerService.createBurger(burger);
            return "redirect:/";
        }
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id")Long id, @ModelAttribute("burger")Burger burger, Model model){
        model.addAttribute("burger", burgerService.findOneBurger(id));
        return "edit.jsp";
    }

    @PutMapping("/edit/{id}")
    public String update(@Valid @ModelAttribute("burger")Burger burger, BindingResult result){
        if(result.hasErrors()){
            return "/edit.jsp";
        }
        else{
            burgerService.updateBurger(burger);
            return"redirect:/";
        }
    }
}
