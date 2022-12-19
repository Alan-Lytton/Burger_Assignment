package com.coding.burger.services;

import com.coding.burger.models.Burger;
import com.coding.burger.repositories.BurgerRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


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

    public Burger findOneBurger(Long id){
        Optional<Burger> optionalBurger = burgerRepository.findById(id);
        if(optionalBurger.isPresent()){
            return optionalBurger.get();
        } else {
            return null;
        }
    }

    public Burger updateBurger(Burger burger) {
        Burger oneBurger = this.findOneBurger(burger.getId());
        if (oneBurger == null){
            return null;
        }
        oneBurger.setBurgerName(burger.getBurgerName());
        oneBurger.setRestaurantName(burger.getRestaurantName());
        oneBurger.setRating(burger.getRating());
        oneBurger.setNotes(burger.getNotes());
        return burgerRepository.save(oneBurger);
    }
}
