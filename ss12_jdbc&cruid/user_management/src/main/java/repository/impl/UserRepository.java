package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        Connection connection= BaseRepository.getConnectDB();
        PreparedStatement preparedStatement=connection.prepareStatement(INSERT_USERS_SQL);
        preparedStatement.setString(1,user.getName());
        preparedStatement.setString(2,user.getEmail());
        preparedStatement.setString(3,user.getCountry());
        System.out.println(preparedStatement);
        preparedStatement.executeUpdate();
    }

    @Override
    public User selectUser(int id) {
        User user=null;
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet rs=preparedStatement.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                String email=rs.getString("email");
                String country=rs.getString("country");
                user=new User(id,name,email,country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users=new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_USERS);
            System.out.println(preparedStatement);
            ResultSet rs=preparedStatement.executeQuery();
            while (rs.next()){
                int id=rs.getInt("id");
                String name =rs.getString("name");
                String email =rs.getString("email");
                String country =rs.getString("country");
                users.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection=BaseRepository.getConnectDB();
        PreparedStatement preparedStatement=connection.prepareStatement(DELETE_USERS_SQL);
        preparedStatement.setInt(1,id);
        rowDeleted=preparedStatement.executeUpdate()>0;
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        Connection connection=BaseRepository.getConnectDB();
        PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_USERS_SQL);
        preparedStatement.setString(1,user.getName());
        preparedStatement.setString(2,user.getEmail());
        preparedStatement.setString(3,user.getCountry());
        preparedStatement.setInt(4,user.getId());
        rowUpdated=preparedStatement.executeUpdate()>0;
        return rowUpdated;
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
