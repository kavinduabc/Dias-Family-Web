/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminUserManagement;

import java.sql.Connection;

/**
 *
 * @author CHAMOD
 */
public class User {
    
    private int id;
    private String username;
    private String name;
    private String password;
    private String phone;
    private String address;
    private String email;
    private String userType;

    

    public User(int id, String username, String name,String password, String phone, String address, String email, String userType) {
        super();
        this.id = id;
        this.username = username;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.userType =userType;
        
    }
    
    public User(String username, String name,String password, String phone, String address, String email, String userType) {
        super();
        this.username = username;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.userType =userType;
        
    }

    public User(int id, String usernameVal, String phoneNumber, String address, String email, String userType) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public User() {
        
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    
        public String getUsername() {
            return username;
        }
        public void setUsername(String username) {
            this.username = username;
        }

    
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    } 
    
    
    
        public String getPassword() {
            return password;
        }
        public void setPassword(String password) {
            this.password = password;
        }
    
    
    public String getPhone(){
        return phone;
    }
    public void setPhone(String phone){
        this.phone = phone;
    }
    
    
        public String getEmail() {
            return email;
        }
        public void setEmail(String email) {
            this.email = email;
        }

    

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    
        public String getUserType() {
            return userType;
        }

        public void setUserType(String userType) {
            this.userType = userType;
        }

    

   

   
}
