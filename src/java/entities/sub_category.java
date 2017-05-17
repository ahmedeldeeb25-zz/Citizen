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
import javax.persistence.ManyToOne;
 
import javax.persistence.OneToMany;
 

/**
 *
 * @author Ahmed_Eldeeb
 */
@Entity
public class sub_category {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private category cat_id;

    @OneToMany(mappedBy = "category",fetch = FetchType.EAGER)
    private Collection<post> posts = new ArrayList<post>();

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

    public category getCat_id() {
        return cat_id;
    }

    public void setCat_id(category cat_id) {
        this.cat_id = cat_id;
    }

}
