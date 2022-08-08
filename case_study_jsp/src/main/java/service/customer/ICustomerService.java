package service.customer;

import model.customer.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    List<Customer> DisplayAllCustomer();
    Customer findById(int id);
    void addCustomer(Customer customer);
    boolean updateCustomer(Customer customer) throws SQLException;
    boolean removeCustomer(int id) throws SQLException;
}
