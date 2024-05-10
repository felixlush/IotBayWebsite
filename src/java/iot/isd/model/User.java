/*
 * User is a JavaBean that stores name, email, password and Date Of Birth, Address
 */
package iot.isd.model;

/**
 *
 * @author thebigmoney
 */
public class User {
    private String name;
    public String email;
    public String password;
    private String address;
    private int cardNum;
    private String cardName;
    private String cardExpiryDate;
    private int cardCVV;
    private String[] searchHistory;
    public boolean loggedin;
    public String[] purchaseHistory;
    
    
    //insert a contructor

    public User(String name, String email, String password, String address) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.address = address;
        this.cardNum = 0;
        this.cardName = null;
        this.cardCVV = 0;
        this.cardExpiryDate = null;
        this.searchHistory = null;
        this.loggedin = false;
        this.purchaseHistory = null;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getAddress() {
        return address;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCardNum() {
        return cardNum;
    }

    public void setCardNum(int cardNum) {
        this.cardNum = cardNum;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public String getCardExpiryDate() {
        return cardExpiryDate;
    }

    public void setCardExpiryDate(String cardExpiryDate) {
        this.cardExpiryDate = cardExpiryDate;
    }

    public int getCardCVV() {
        return cardCVV;
    }

    public void setCardCVV(int cardCVV) {
        this.cardCVV = cardCVV;
    }

    public String[] getSearchHistory() {
        return searchHistory;
    }

    public void setSearchHistory(String[] searchHistory) {
        this.searchHistory = searchHistory;
    }
    
    public String[] getPurchaseHistory(){
        return purchaseHistory;
    }
    
    
}
