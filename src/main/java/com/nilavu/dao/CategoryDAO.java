package com.nilavu.dao;

import java.util.List;
import com.nilavu.model.Category;

public interface CategoryDAO {
    List<Category> getAllCategories();
    void addCategory(Category category);
}
