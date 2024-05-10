/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.user.model;

/**
 *
 * @author CHAMOD
 */
public class User {
    
    private int id;
    private String name;
    private String password;
    private String phone;
    private String address;
    private String email;
    private String userType;

        // Constructor with all properties
        public User(int id, String name,String password, String phone, String address, String email, String userType) {
            super();
            this.id = id;
            this.name = name;
            this.password = password;
            this.phone = phone;
            this.address = address;
            this.email = email;
            this.userType =userType;
        }

        // Constructor without id property (auto-generated)
        public User(String name,String password, String phone, String address, String email, String userType) {
            super();
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

        // Default constructor
        public User() {
        }
    
        // Getter and setter methods for the id property
        public int getId() {
            return id;
        }
        public void setId(int id) {
            this.id = id;
        }
                    // Getter and setter methods for the name property
                    public String getName() {
                        return name;
                    }
                    public void setName(String name) {
                        this.name = name;
                    } 
                        // Getter and setter methods for the password property
                        public String getPassword() {
                            return password;
                        }
                        public void setPassword(String password) {
                            this.password = password;
                        }
                            // Getter and setter methods for the phone property
                            public String getPhone(){
                                return phone;
                            }
                            public void setPhone(String phone){
                                this.phone = phone;
                            }
                        // Getter and setter methods for the email property
                        public String getEmail() {
                            return email;
                        }
                        public void setEmail(String email) {
                            this.email = email;
                        }
                    // Getter and setter methods for the address property
                    public String getAddress() {
                        return address;
                    }

                    public void setAddress(String address) {
                        this.address = address;
                    }
                // Getter and setter methods for the userType property
                public String getUserType() {
                    return userType;
                }

                public void setUserType(String userType) {
                    this.userType = userType;
                }
}