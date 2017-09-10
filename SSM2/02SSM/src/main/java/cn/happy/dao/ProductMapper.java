package cn.happy.dao;

import cn.happy.model.Product;

import java.util.List;

public interface ProductMapper {
 List<Product> selectProduct();
 Product selectAProduct(int productid);
 int updateProduct(Product product);
}