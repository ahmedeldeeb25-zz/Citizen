/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

/**
 *
 * @author Ahmed_Eldeeb
 */
@Entity
public class profile {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String First_name;
    private String Last_name;
    private String Address;
    @Column(unique = true)
    private String Email;
    private String Password;
    private String Phone;
    private String About;
    private String Social;
    private String sec_question;
    private String answer;
    //@Column(name = "name", insertable = true, updatable = true, nullable = false, length = 255)
    @Lob
    @Column(columnDefinition = "LONGBLOB default NULL")
    private byte[] Picture;

    ///Realtions
    @OneToMany(mappedBy = "user_id",fetch = FetchType.EAGER)
    private Collection<post> posts = new ArrayList<post>();

    @OneToMany(mappedBy = "user_id")
    private Collection<contact> Contact = new ArrayList<contact>();
    @OneToMany(mappedBy = "user_id")
    private Collection<comment> comments = new ArrayList<comment>();

    @ManyToMany(mappedBy = "user_id")
    private Collection<interest> Interest = new ArrayList<interest>();
    

    public Collection<interest> getInterest() {
        return Interest;
    }

    public void setInterest(Collection<interest> Interest) {
        this.Interest = Interest;
    }
    

    public Collection<comment> getComments() {
        return comments;
    }

    public void setComments(Collection<comment> comments) {
        this.comments = comments;
    }

    public Collection<contact> getContact() {
        return Contact;
    }

    public void setContact(Collection<contact> Contact) {
        this.Contact = Contact;
    }

    public Collection<post> getPosts() {
        return posts;
    }

    public void setPosts(Collection<post> posts) {
        this.posts = posts;
    }

    public String getSec_question() {
        return sec_question;
    }

    public void setSec_question(String sec_question) {
        this.sec_question = sec_question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirst_name() {
        return First_name;
    }

    public void setFirst_name(String First_name) {
        this.First_name = First_name;
    }

    public String getLast_name() {
        return Last_name;
    }

    public void setLast_name(String Last_name) {
        this.Last_name = Last_name;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getAbout() {
        return About;
    }

    public void setAbout(String About) {
        this.About = About;
    }

    public String getSocial() {
        return Social;
    }

    public void setSocial(String Social) {
        this.Social = Social;
    }

    public byte[] getPicture() {
        return Picture;
    }

    public void setPicture(byte[] Picture) {
        this.Picture = Picture;
    }

}
