package product_manage.service.impl;

import product_manage.model.Product;
import product_manage.repository.IProductRepository;
import product_manage.repository.impl.ProductRepository;
import product_manage.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository repository =new ProductRepository();


    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public Product findById(int id) {
        return repository.findById(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return repository.findByName( name);
    }

    @Override
    public void add(Product product) {
        repository.add(product);
    }

    @Override
    public void update(int id, Product product) {
        repository.update(id,product);
    }


    @Override
    public void remove(int id) {
        repository.remove(id);
    }
}
