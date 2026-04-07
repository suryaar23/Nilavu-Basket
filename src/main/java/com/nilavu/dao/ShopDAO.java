package com.nilavu.dao;

import com.nilavu.model.Shop;
import java.util.List;

public interface ShopDAO {
	void addShop(Shop shop);
	List<Shop> getAllShops();
}
