package product_manage.service;

import product_manage.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    Product findById(int id);
    List<Product> findByName(String name);
    void add(Product product);
    void update(int id,Product product);
    void remove(int id);


}
