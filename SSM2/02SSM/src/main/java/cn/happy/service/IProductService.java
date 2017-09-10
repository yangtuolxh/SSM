package cn.happy.service;

import cn.happy.dao.ProductMapper;
import cn.happy.model.Product;

import java.util.List;

/**
 * Created by Administrator on 2017/8/27.
 */
public interface IProductService {
    List<Product> selectProduct();
    Product selectAProduct(int productid);
    int updateProduct(Product product);
}
