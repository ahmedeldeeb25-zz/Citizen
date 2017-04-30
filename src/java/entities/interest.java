/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import model.user;
import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

/**
 *
 * @author Ahmed_Eldeeb
 */
@Entity
public class interest {
    
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @ManyToMany
    private Collection<profile> user_id = new ArrayList<profile>();  
    @ManyToMany
    private Collection<city> city_id = new ArrayList<city>(); 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Collection<profile> getUser_id() {
        return user_id;
    }

    public void setUser_id(Collection<profile> user_id) {
        this.user_id = user_id;
    }

    

    public Collection<city> getCity_id() {
        return city_id;
    }

    public void setCity_id(Collection<city> city_id) {
        this.city_id = city_id;
    }
    
    
}
