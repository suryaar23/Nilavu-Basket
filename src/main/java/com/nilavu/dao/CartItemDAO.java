package com.nilavu.dao;

import java.util.List;
import com.nilavu.model.CartItem;

public interface CartItemDAO {

    void addToCart(int cartId, int productId);

    List<CartItem> getCartItems(int cartId);

    void removeItem(int cartItemId);

    void clearCart(int cartId);

    // ✅ NEW
    int getQuantityInCart(int cartId, int productId);
}
