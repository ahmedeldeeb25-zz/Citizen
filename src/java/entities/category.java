/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


/**
 *
 * @author Ahmed_Eldeeb
 */
@Entity
public class category {
    
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;
    
    @OneToMany(mappedBy = "cat_id")
    @LazyCollection(LazyCollectionOption.FALSE)
    private Collection<sub_category> sub=new ArrayList<sub_category>();

    public int getId() {
        return id;
    }

    public Collection<sub_category> getSub() {
        return sub;
    }

    public void setSub(Collection<sub_category> sub) {
        this.sub = sub;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
    
}
