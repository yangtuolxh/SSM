package cn.happy.service;

import cn.happy.dao.ProductMapper;
import cn.happy.model.Product;

import java.util.List;

/**
 * Created by Administrator on 2017/8/27.
 */
public class ProductService implements IProductService {
    ProductMapper productMapper;

    public ProductMapper getProductMapper() {
        return productMapper;
    }

    public void setProductMapper(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    public List<Product> selectProduct() {
        return productMapper.selectProduct();
    }

    public Product selectAProduct(int productid) {
        return productMapper.selectAProduct(productid);
    }

    public int updateProduct(Product product){
        return productMapper.updateProduct(product);
    }
}
