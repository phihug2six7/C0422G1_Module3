package repository.customer.impl;

import model.customer.Customer;
import repository.BaseRepository;
import repository.customer.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String DISPLAY_ALL_CUSTOMER="select * from khach_hang where `status` = 1 ;";
    private static final String CREATE_CUSTOMER="INSERT INTO khach_hang (ma_loai_khach, ho_ten, ngay_sinh,gioi_tinh," +
            "so_cmnd,so_dien_thoai,email,dia_chi) VALUES (?, ?, ?,?,?,?,?,?);";
    private static final String FIND_BY_CUSTOMER_ID="select*from khach_hang where ma_khach_hang=?";
    private static final String UPDATE_CUSTOMER="update khach_hang set ma_loai_khach=?,ho_ten=?,ngay_sinh=?,gioi_tinh=?," +
            "so_cmnd=?,so_dien_thoai=?,email=?,dia_chi=? where ma_khach_hang=?;";
    private static final String DELETE_CUSTOMER="delete from khach_hang where ma_khach_hang=?;";
    private static final String REMOVE_CUSTOMER_STATUS="update khach_hang set `status`= 0 where ma_khach_hang = ?;";
    private static final String DISPLAY_CUSTOMER="select * from khach_hang  ;";
    @Override
    public List<Customer> DisplayAllCustomer() {
        Connection connection= BaseRepository.getConnection();
        List<Customer> customerList =new ArrayList<>();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(DISPLAY_ALL_CUSTOMER);
            ResultSet rs= preparedStatement.executeQuery();
            Customer customer=null;
            while (rs.next()){
                int customerId=rs.getInt("ma_khach_hang");
                int customerTypeId=rs.getInt("ma_loai_khach");
                String customerName=rs.getString("ho_ten");
                String customerDateOfBirth=rs.getString("ngay_sinh");
                int customerGender=rs.getInt("gioi_tinh");
                String customerIdCard=rs.getString("so_cmnd");
                String customerPhone=rs.getString("so_dien_thoai");
                String customerEmail=rs.getString("email");
                String customerAddress=rs.getString("dia_chi");
                customer=new Customer(customerId,customerTypeId,customerName,customerDateOfBirth,customerGender,
                        customerIdCard,customerPhone,customerEmail,customerAddress);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer findById(int id) {
        Customer customer=null;
        Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(FIND_BY_CUSTOMER_ID);
            preparedStatement.setInt(1,id);
            ResultSet rs=preparedStatement.executeQuery();
            while (rs.next()){
                int customerId=rs.getInt("ma_khach_hang");
                int customerTypeId=rs.getInt("ma_loai_khach");
                String customerName=rs.getString("ho_ten");
                String customerDateOfBirth=rs.getString("ngay_sinh");
                int customerGender=rs.getInt("gioi_tinh");
                String customerIdCard=rs.getString("so_cmnd");
                String customerPhone=rs.getString("so_dien_thoai");
                String customerEmail=rs.getString("email");
                String customerAddress=rs.getString("dia_chi");
                customer =new Customer(customerId,customerTypeId,customerName,customerDateOfBirth,customerGender,customerIdCard,customerPhone,customerEmail,customerAddress);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public void addCustomer(Customer customer) {
        Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(CREATE_CUSTOMER);
            preparedStatement.setInt(1,customer.getCustomerTypeId());
            preparedStatement.setString(2,customer.getCustomerName());
            preparedStatement.setString(3,customer.getCustomerDateOfBirth());
            preparedStatement.setInt(4,customer.getCustomerGender());
            preparedStatement.setString(5,customer.getCustomerIdCard());
            preparedStatement.setString(6,customer.getCustomerPhoneNumber());
            preparedStatement.setString(7,customer.getCustomerEmail());
            preparedStatement.setString(8,customer.getCustomerAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
       boolean rowUpdate;
       Connection connection=BaseRepository.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setInt(1,customer.getCustomerTypeId());
            preparedStatement.setString(2,customer.getCustomerName());
            preparedStatement.setString(3,customer.getCustomerDateOfBirth());
            preparedStatement.setInt(4,customer.getCustomerGender());
            preparedStatement.setString(5,customer.getCustomerIdCard());
            preparedStatement.setString(6,customer.getCustomerPhoneNumber());
            preparedStatement.setString(7,customer.getCustomerEmail());
            preparedStatement.setString(8,customer.getCustomerAddress());
            preparedStatement.setInt(9,customer.getCustomerID());
            rowUpdate=preparedStatement.executeUpdate()>0;
        return rowUpdate;
    }

    @Override
    public boolean removeCustomer(int id) throws SQLException {
        boolean rowRemove;
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(REMOVE_CUSTOMER_STATUS);
        preparedStatement.setInt(1, id);
        rowRemove = preparedStatement.executeUpdate() > 0;
        return rowRemove;
    }

    @Override
    public List<Customer> displayCustomer() {
        Connection connection= BaseRepository.getConnection();
        List<Customer> customerList =new ArrayList<>();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(DISPLAY_CUSTOMER);
            ResultSet rs= preparedStatement.executeQuery();
            Customer customer=null;
            while (rs.next()){
                int customerId=rs.getInt("ma_khach_hang");
                int customerTypeId=rs.getInt("ma_loai_khach");
                String customerName=rs.getString("ho_ten");
                String customerDateOfBirth=rs.getString("ngay_sinh");
                int customerGender=rs.getInt("gioi_tinh");
                String customerIdCard=rs.getString("so_cmnd");
                String customerPhone=rs.getString("so_dien_thoai");
                String customerEmail=rs.getString("email");
                String customerAddress=rs.getString("dia_chi");
                customer=new Customer(customerId,customerTypeId,customerName,customerDateOfBirth,customerGender,
                        customerIdCard,customerPhone,customerEmail,customerAddress);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
