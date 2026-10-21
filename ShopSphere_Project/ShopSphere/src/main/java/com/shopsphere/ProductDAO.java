package com.shopsphere;

import java.sql.*;
import java.util.*;

public class ProductDAO {
    public List<Product> findActive(String search) throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT product_id,name,brand,description,price,discount,stock,image_url FROM products WHERE status=TRUE AND (name LIKE ? OR brand LIKE ? OR description LIKE ?) ORDER BY product_id DESC";
        try (Connection c=DB.getConnection(); PreparedStatement ps=c.prepareStatement(sql)) {
            String q = "%" + (search == null ? "" : search.trim()) + "%";
            ps.setString(1,q); ps.setString(2,q); ps.setString(3,q);
            try(ResultSet rs=ps.executeQuery()) {
                while(rs.next()) products.add(new Product(rs.getInt("product_id"),rs.getString("name"),rs.getString("brand"),rs.getString("description"),rs.getBigDecimal("price"),rs.getBigDecimal("discount"),rs.getInt("stock"),rs.getString("image_url")));
            }
        }
        return products;
    }
    public Product findById(int id) throws SQLException {
        String sql="SELECT product_id,name,brand,description,price,discount,stock,image_url FROM products WHERE product_id=? AND status=TRUE";
        try(Connection c=DB.getConnection(); PreparedStatement ps=c.prepareStatement(sql)) {
            ps.setInt(1,id); try(ResultSet rs=ps.executeQuery()) {
                if(!rs.next()) return null;
                return new Product(rs.getInt("product_id"),rs.getString("name"),rs.getString("brand"),rs.getString("description"),rs.getBigDecimal("price"),rs.getBigDecimal("discount"),rs.getInt("stock"),rs.getString("image_url"));
            }
        }
    }
}
