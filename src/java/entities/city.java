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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/**
 *
 * @author Ahmed_Eldeeb
 */
@Entity
public class city {
    
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @ManyToOne
    @JoinColumn(name="gov_id")
    private govern gov_id;
    
    private String name;

    public govern getGov_id() {
        return gov_id;
    }

    public void setGov_id(govern gov_id) {
        this.gov_id = gov_id;
    }
     

  // @Fetch(value = FetchMode.SUBSELECT)
    @OneToMany(mappedBy = "City")
    @LazyCollection(LazyCollectionOption.FALSE)
    private Collection<post> posts=new ArrayList<post>();

    public Collection<post> getPosts() {
        return posts;
    }

    public void setPosts(Collection<post> posts) {
        this.posts = posts;
    }
    

    public int getId() {
        return id;
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
