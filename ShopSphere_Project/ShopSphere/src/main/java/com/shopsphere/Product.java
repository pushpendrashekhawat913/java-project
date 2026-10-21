package com.shopsphere;

import java.math.BigDecimal;

public class Product {
    private final int id;
    private final String name, brand, description, imageUrl;
    private final BigDecimal price, discount;
    private final int stock;
    public Product(int id, String name, String brand, String description, BigDecimal price, BigDecimal discount, int stock, String imageUrl) {
        this.id=id; this.name=name; this.brand=brand; this.description=description; this.price=price; this.discount=discount; this.stock=stock; this.imageUrl=imageUrl;
    }
    public int getId(){return id;} public String getName(){return name;} public String getBrand(){return brand;}
    public String getDescription(){return description;} public BigDecimal getPrice(){return price;}
    public BigDecimal getDiscount(){return discount;} public int getStock(){return stock;} public String getImageUrl(){return imageUrl;}
    public BigDecimal getSalePrice(){return price.multiply(BigDecimal.ONE.subtract(discount.divide(new BigDecimal("100"))));}
}
