package repository.customer.impl;

import model.customer.CustomerType;
import repository.BaseRepository;
import repository.customer.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    private static final String FIND_ALL_CUSTOMER_TYPE="select * from loai_khach";
    @Override
    public List<CustomerType> findAllCustomerType() {
        Connection connection= BaseRepository.getConnection();
        List<CustomerType> customerTypeList=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(FIND_ALL_CUSTOMER_TYPE);
            ResultSet rs= preparedStatement.executeQuery();
            while (rs.next()){
                int customerTypeId=rs.getInt("ma_loai_khach");
                String customerName=rs.getString("ten_loai_khach");
                CustomerType customerType=new CustomerType(customerTypeId,customerName);
                customerTypeList.add(customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }
}
