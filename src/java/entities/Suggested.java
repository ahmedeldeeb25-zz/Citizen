/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.Column;
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
public class Suggested {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    int id;
    
    int pFrom;
    int pTo;
    @Column(columnDefinition = "int default 0")
    int visits;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getpFrom() {
        return pFrom;
    }

    public void setpFrom(int pFrom) {
        this.pFrom = pFrom;
    }

    public int getpTo() {
        return pTo;
    }

    public void setpTo(int pTo) {
        this.pTo = pTo;
    }

    public int getVisits() {
        return visits;
    }

    public void setVisits(int visits) {
        this.visits = visits;
    }
    
    
}
