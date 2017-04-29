/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author Ahmed_Eldeeb
 */

@Entity
public class comment {
    
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    
    @ManyToOne
    private post Post_id;
    @ManyToOne
    private profile user_id;
    private String Content;
    private Date date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public post getPost_id() {
        return Post_id;
    }

    public void setPost_id(post Post_id) {
        this.Post_id = Post_id;
    }

    public profile getUser_id() {
        return user_id;
    }

    public void setUser_id(profile user_id) {
        this.user_id = user_id;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
    
}
