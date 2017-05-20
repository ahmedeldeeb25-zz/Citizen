/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/**
 *
 * @author Ahmed_Eldeeb
 */
@Entity
public class post {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String title;
    @Column(insertable = true, updatable = true, nullable = false, length = 255)
    private String content;
    
    @Column(columnDefinition = "LONGBLOB default NULL")
    private byte[] pic;
    @Column(columnDefinition = "integer default 0")
    private int visit;
    //@Column(name = "myColumn", nullable = false, columnDefinition = "int default 100")
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date date;
    
    private int rate;
    private String address;
    private String phone;
    private String email;
    private String website;
    private String video_url;
    
    @ManyToOne
    @JoinColumn(name="City")
    private city City;
    @ManyToOne
    @JoinColumn(name="Categeory")
    private sub_category category;
    @ManyToOne
    @JoinColumn(name="user_id")
    private profile user_id;
    @OneToMany(mappedBy = "Post_id",cascade = CascadeType.REMOVE)
    @LazyCollection(LazyCollectionOption.FALSE)
    private Collection<comment> comments=new ArrayList<comment>();
    
    
    private String Lang;
    private String Lat;

    public String getLang() {
        return Lang;
    }

    public void setLang(String Lang) {
        this.Lang = Lang;
    }

    public String getLat() {
        return Lat;
    }

    public void setLat(String Lat) {
        this.Lat = Lat;
    }
    
    
     
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getVideo_url() {
        return video_url;
    }

    public void setVideo_url(String video_url) {
        this.video_url = video_url;
    }

    public Collection<comment> getComments() {
        return comments;
    }

    public void setComments(Collection<comment> comments) {
        this.comments = comments;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
 
    public city getCity() {
        return City;
    }

    public void setCity(city City) {
        this.City = City;
    }

    public sub_category getCategory() {
        return category;
    }

    public void setCategory(sub_category category) {
        this.category = category;
    }

    public byte[] getPic() {
        return pic;
    }

    public void setPic(byte[] pic) {
        this.pic = pic;
    }

    public int getVisit() {
        return visit;
    }

    public void setVisit(int visit) {
        this.visit = visit;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public profile getUser_id() {
        return user_id;
    }

    public void setUser_id(profile user_id) {
        this.user_id = user_id;
    }

    

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }
    
    
    
    
    
}
