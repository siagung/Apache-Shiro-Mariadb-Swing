package com.mkl.myshiro;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author agung
 */

public class User {
 
  /**
   *
   */
  private static final long serialVersionUID = -4656759219348212715L;
 
  private Integer id;
  private String userid;
  private String email;
  private String passphrase;
  private String salt;
  private Integer access_level_id;
 
  // ... getters and setters ...

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the userid
     */
    public String getUserid() {
        return userid;
    }

    /**
     * @param userid the userid to set
     */
    public void setUserid(String userid) {
        this.userid = userid;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the passphrase
     */
    public String getPassphrase() {
        return passphrase;
    }

    /**
     * @param passphrase the passphrase to set
     */
    public void setPassphrase(String passphrase) {
        this.passphrase = passphrase;
    }

    /**
     * @return the salt
     */
    public String getSalt() {
        return salt;
    }

    /**
     * @param salt the salt to set
     */
    public void setSalt(String salt) {
        this.salt = salt;
    }

    /**
     * @return the access_level_id
     */
    public Integer getAccess_level_id() {
        return access_level_id;
    }

    /**
     * @param access_level_id the access_level_id to set
     */
    public void setAccess_level_id(Integer access_level_id) {
        this.access_level_id = access_level_id;
    }
 
}
