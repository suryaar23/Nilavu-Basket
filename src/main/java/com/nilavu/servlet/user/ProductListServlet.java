package com.nilavu.servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.CategoryDAO;
import com.nilavu.dao.ProductDAO;
import com.nilavu.daoImplements.CategoryDAOImpl;
import com.nilavu.daoImplements.ProductDAOImpl;
import com.nilavu.model.Category;
import com.nilavu.model.Product;

@WebServlet("/products")
public class ProductListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO = new ProductDAOImpl();
    private CategoryDAO categoryDAO = new CategoryDAOImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String shopIdParameter = request.getParameter("shopId");
    	String keyword = request.getParameter("keyword");
    	String categoryId = request.getParameter("categoryId");
    	
    	
        List<Product> products;
        
        if((keyword != null && !keyword.isEmpty()) || (categoryId != null && !categoryId.isEmpty())) {
        	products = productDAO.searchProducts(keyword, categoryId);
        }
        else if(shopIdParameter!= null && !shopIdParameter.isEmpty()) {
        	int shopId = Integer.parseInt(shopIdParameter);
        	products = productDAO.getProductsByShopId(shopId);
        }
        else {
        	products = productDAO.getAllProducts();	
        }
        
        List<Category> categories = categoryDAO.getAllCategories();
        
        request.setAttribute("products", products);
        request.setAttribute("categories" , categories);
        
        request.getRequestDispatcher("user/products.jsp").forward(request, response);
    }
}
