package service.customer.impl;

import model.customer.CustomerType;
import repository.customer.ICustomerTypeRepository;
import repository.customer.impl.CustomerTypeRepository;
import service.customer.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    ICustomerTypeRepository iCustomerTypeRepository=new CustomerTypeRepository();
    @Override
    public List<CustomerType> findAllCustomerType() {
        return iCustomerTypeRepository.findAllCustomerType();
    }
}