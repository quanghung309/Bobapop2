/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import utils.RandomId;

/**
 *
 * @author duong
 */
public class Cart {
    String cartId;
    String productId;
    String productName;
    String size;
    String productImg;
    int quantity;
    float price;
    int icePercent;
    int sugarPercent;
    public Cart() {
    }
    
    public Cart(String productId,String productImg,String productName, String size, int quantity, float price, int icePercent, int sugarPercent) {
        this.cartId = RandomId.generateRandomID();
        this.productId = productId;
        this.productImg = productImg;
        this.productName = productName;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
        this.icePercent = icePercent;
        this.sugarPercent = sugarPercent;
    }

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }
    
    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }
    
    public int getSugarPercent() {
        return sugarPercent;
    }

    public void setSugarPercent(int sugarPercent) {
        this.sugarPercent = sugarPercent;
    }
    
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getIcePercent() {
        return icePercent;
    }

    public void setIcePercent(int icePercent) {
        this.icePercent = icePercent;
    }
    
}
