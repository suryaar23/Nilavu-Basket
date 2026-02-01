package com.nilavu.dao;

public interface CartDAO {
    int getOrCreateCart(int userId);
	void markCartCompleted(int cartId);
}
