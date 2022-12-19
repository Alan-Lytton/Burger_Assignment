package com.coding.burger.services;

import com.coding.burger.models.Burger;
import com.coding.burger.repositories.BurgerRepository;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BurgerService {
    private final BurgerRepository burgerRepository;

    public BurgerService(BurgerRepository burgerRepository){
        this.burgerRepository = burgerRepository;
    }

    public List<Burger> findAllBurgers(){
        return burgerRepository.findAll();
    }

    public Burger createBurger(Burger b){
        return burgerRepository.save(b);
    }
}
