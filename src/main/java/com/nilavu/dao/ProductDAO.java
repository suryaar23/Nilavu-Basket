package com.nilavu.dao;

import java.util.List;
import com.nilavu.model.Product;

public interface ProductDAO {
    List<Product> getAllProducts();
    List<Product> getProductsByCategory(int categoryId);
    void addProduct(Product p);
    void updateProduct(Product p);
    void deleteProduct(int id);
    void addStock(int productId, int quantity);
    boolean reduceStock(int productId, int qty); // ✅ NEW
	int getStockByProductId(int productId);
	Product getProductById(int productId);

}
