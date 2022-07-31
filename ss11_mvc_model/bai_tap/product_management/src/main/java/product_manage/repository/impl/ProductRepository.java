package product_manage.repository.impl;

import product_manage.model.Product;
import product_manage.repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList =new ArrayList<>();

    static {
        productList.add(new Product(1,"Chuối cả nải",1000,"màu vàng","Trung Quốc"));
        productList.add(new Product(2,"Cam ",2000,"màu cam","Việt Nam"));
        productList.add(new Product(3,"Đu đủ cả hủ",3000,"màu xanh  ","Triều Tiên"));
        productList.add(new Product(4,"Nghệ cả củ",4000,"màu vàng","Trung Quốc"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public Product findById(int id) {
        for (Product product:productList) {
                if (id == product.getId()){
                    return product;
                }
        }
        return null;
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> products =new ArrayList<>();
        for (int i = 0; i <productList.size() ; i++) {
            if (productList.get(i).getName().toLowerCase(Locale.ROOT).contains(name.toLowerCase(Locale.ROOT))){
                products.add(productList.get(i));
            }
        }
        return products;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void update(int id, Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (id==productList.get(i).getId()){
                productList.get(i).setName(product.getName());
                productList.get(i).setPrice(product.getPrice());
                productList.get(i).setDescribe(product.getDescribe());
                productList.get(i).setProducer(product.getProducer());
                break;
            }
        }
    }

    @Override
    public void remove(int id) {
        for (int i = 0; i <productList.size() ; i++) {
            if (id==productList.get(i).getId()){
                productList.remove(productList.get(i));
            }
        }
    }
}
