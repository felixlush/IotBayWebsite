/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iot.isd.model;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author thebigmoney
 */
public class LogEntry {
    private String email;
    private String date;
    private String loginTime;
    private String logoutTime;
    
    public LogEntry(String email, String date, String loginTime) {
        this.email = email;
        this.loginTime = loginTime;
        this.date = date;
    }
    
    public LogEntry(String email, String date, String loginTime, String logoutTime) {
        this.email = email;
        this.date = date;
        this.loginTime = loginTime;
        this.logoutTime = logoutTime;   
    }

    public void addLogoutTime(String logoutTime) {
        this.logoutTime = logoutTime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime;
    }

    public String getLogoutTime() {
        return logoutTime;
    }

    public void setLogoutTime(String logoutTime) {
        this.logoutTime = logoutTime;
    }

    public boolean getloginTime() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
}
