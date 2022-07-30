package customer_management.service;

import customer_management.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer>findAll();
    void add(Customer customer);
    Customer findId(int id);
    void update(int id,Customer customer);
    void remove (int id);
}
