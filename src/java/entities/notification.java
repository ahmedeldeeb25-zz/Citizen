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
import javax.persistence.OneToOne;

/**
 *
 * @author Ahmed_Eldeeb
 */
@Entity
public class notification {
    
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    
    private  String message;
    private Date date;
    @OneToOne
    private post post_id;
    @OneToOne
    private profile uesr_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public post getPost_id() {
        return post_id;
    }

    public void setPost_id(post post_id) {
        this.post_id = post_id;
    }

    public profile getUesr_id() {
        return uesr_id;
    }

    public void setUesr_id(profile uesr_id) {
        this.uesr_id = uesr_id;
    }
    
    
}
