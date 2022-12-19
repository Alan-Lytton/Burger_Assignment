package com.coding.burger.repositories;

import com.coding.burger.models.Burger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BurgerRepository extends CrudRepository <Burger, Long> {

    List<Burger> findAll();


}
