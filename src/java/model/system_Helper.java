/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.profile;
import org.hibernate.Session;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class system_Helper {
    
    public String getUserName(Session s,int id){
 
        profile user=(profile) s.get(profile.class, 1);
        
        
        
        return user.getFirst_name()+" "+user.getLast_name();
    }
    
}
