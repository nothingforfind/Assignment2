package com.example.assignment2;

public class User {

    private String userId;
    private String password;
    private String email;
    private String role;

    public User(String userId, String password, String email, String role) {
        this.userId = userId;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    public User() {

    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
