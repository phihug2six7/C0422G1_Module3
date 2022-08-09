package service.customer.impl;

import model.customer.Customer;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import service.customer.ICustomerService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepository();

    private final String NAME_REREX = "^((([A-Z]+)([a-z]+)\\s)+)(([A-Z]+[a-z]*)*)$";

    private final String PHONE_NUMBER_REGEX = "^((090)|(091)|(\\(84\\)\\+90)|(\\(84\\)\\+91))(([0-9]){7})$";

    private final String IDCARD_REGEX = "^\\d{9}$";

    private final String EMAIL_REGEX = "^[\\w\\_]+\\@[a-z]+\\.[a-z]+$";

    private final String BIRTHDAY="";

    @Override
    public List<Customer> DisplayAllCustomer() {
        return iCustomerRepository.DisplayAllCustomer();
    }

    @Override
    public Customer findById(int id) {
        return iCustomerRepository.findById(id);
    }

    @Override
    public void addCustomer(Customer customer) {
        iCustomerRepository.addCustomer(customer);
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return iCustomerRepository.updateCustomer(customer);
    }

    @Override
    public boolean removeCustomer(int id) throws SQLException {
        return iCustomerRepository.removeCustomer(id);
    }

    @Override
    public List<Customer> displayCustomer() {
        return iCustomerRepository.displayCustomer();
    }

    @Override
    public Map<String, String> CheckCustomer(Customer customer) {
        Map<String, String> mapErrors = new HashMap<>();
        if (!customer.getCustomerName().isEmpty()) {
            if (!customer.getCustomerName().matches(NAME_REREX)) {
                mapErrors.put("nameCustomerRegex", "Please input right format");
            }
        } else {
            mapErrors.put("nameCustomerRegex", "Please input name");
        }
        if (!customer.getCustomerPhoneNumber().isEmpty()){
            if (!customer.getCustomerPhoneNumber().matches(PHONE_NUMBER_REGEX)){
                mapErrors.put("phoneRegex","Please input right format");
            }
        }else {
            mapErrors.put("phoneRegex","Please input phone");
        }
        if (!customer.getCustomerIdCard().isEmpty()){
            if (!customer.getCustomerIdCard().matches(IDCARD_REGEX)){
                mapErrors.put("idCardRegex","Please input right format");
            }
        }else {
            mapErrors.put("idCardRegex","Please input name");
        }
        if (!customer.getCustomerEmail().isEmpty()){
            if (!customer.getCustomerEmail().matches(EMAIL_REGEX)){
                mapErrors.put("emailRegex","Please input right format");
            }
        }else {
            mapErrors.put("emailRegex","Please input email");
        }
        return mapErrors;
    }
}
