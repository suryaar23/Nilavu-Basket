package com.nilavu.daoImplements;

import java.sql.*;
import java.util.*;
import com.nilavu.dao.CartItemDAO;
import com.nilavu.model.CartItem;
import com.nilavu.util.DBConnection;

public class CartItemDAOImpl implements CartItemDAO {

	@Override
	public void addToCart(int cartId, int productId) {

	    String checkSql = "SELECT cart_item_id, quantity FROM cart_items WHERE cart_id=? AND product_id=?";
	    String insertSql = "INSERT INTO cart_items(cart_id,product_id,quantity) VALUES(?,?,1)";
	    String updateSql = "UPDATE cart_items SET quantity = quantity + 1 WHERE cart_item_id=?";
	    String stockSql  = "SELECT stock FROM products WHERE product_id=?";

	    try (Connection con = DBConnection.getConnection()) {

	        // 1. Get stock
	        int stock = 0;
	        PreparedStatement psStock = con.prepareStatement(stockSql);
	        psStock.setInt(1, productId);
	        ResultSet rsStock = psStock.executeQuery();
	        if (rsStock.next()) {
	            stock = rsStock.getInt("stock");
	        }

	        if (stock <= 0) return; // ❌ no stock → do nothing

	        // 2. Check if already in cart
	        PreparedStatement ps = con.prepareStatement(checkSql);
	        ps.setInt(1, cartId);
	        ps.setInt(2, productId);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            int cartItemId = rs.getInt("cart_item_id");
	            int currentQty = rs.getInt("quantity");

	            // ❌ already reached stock limit
	            if (currentQty >= stock) return;

	            // ✅ increase quantity
	            PreparedStatement ps2 = con.prepareStatement(updateSql);
	            ps2.setInt(1, cartItemId);
	            ps2.executeUpdate();

	        } else {
	            // ✅ add new row if stock exists
	            PreparedStatement ps2 = con.prepareStatement(insertSql);
	            ps2.setInt(1, cartId);
	            ps2.setInt(2, productId);
	            ps2.executeUpdate();
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


    @Override
    public List<CartItem> getCartItems(int cartId) {
        List<CartItem> list = new ArrayList<>();

        String sql = """
            SELECT ci.cart_item_id, ci.cart_id, ci.quantity,
                   p.product_id, p.product_name, p.price
            FROM cart_items ci
            JOIN products p ON ci.product_id = p.product_id
            WHERE ci.cart_id = ?
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CartItem ci = new CartItem();
                ci.setCartItemId(rs.getInt("cart_item_id"));
                ci.setCartId(rs.getInt("cart_id"));
                ci.setProductId(rs.getInt("product_id"));
                ci.setProductName(rs.getString("product_name"));
                ci.setPrice(rs.getDouble("price"));
                ci.setQuantity(rs.getInt("quantity"));
                list.add(ci);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public void removeItem(int cartItemId) {
        String getQtySql = "SELECT quantity FROM cart_items WHERE cart_item_id=?";
        String updateSql = "UPDATE cart_items SET quantity = quantity - 1 WHERE cart_item_id=?";
        String deleteSql = "DELETE FROM cart_items WHERE cart_item_id=?";

        try (Connection con = DBConnection.getConnection()) {

            // 1. Get current quantity
            PreparedStatement ps1 = con.prepareStatement(getQtySql);
            ps1.setInt(1, cartItemId);
            ResultSet rs = ps1.executeQuery();

            if (rs.next()) {
                int qty = rs.getInt("quantity");

                if (qty > 1) {
                    // 2. Decrease quantity
                    PreparedStatement ps2 = con.prepareStatement(updateSql);
                    ps2.setInt(1, cartItemId);
                    ps2.executeUpdate();
                } else {
                    // 3. Remove row if qty == 1
                    PreparedStatement ps3 = con.prepareStatement(deleteSql);
                    ps3.setInt(1, cartItemId);
                    ps3.executeUpdate();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    public void clearCart(int cartId) {
        String sql = "DELETE FROM cart_items WHERE cart_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ NEW: how many already in cart
    @Override
    public int getQuantityInCart(int cartId, int productId) {
        int qty = 0;
        String sql = "SELECT quantity FROM cart_items WHERE cart_id=? AND product_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                qty = rs.getInt("quantity");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return qty;
    }
}
