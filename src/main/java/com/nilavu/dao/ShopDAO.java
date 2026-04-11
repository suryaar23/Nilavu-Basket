package com.nilavu.dao;

import com.nilavu.model.Shop;
import java.util.List;

public interface ShopDAO {
	Boolean addShop(Shop shop);
	List<Shop> getAllShops();
	Shop getShopById(int id);
	Boolean updateShop(Shop shop);
}
