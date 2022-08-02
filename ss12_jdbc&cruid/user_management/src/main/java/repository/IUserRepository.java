package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    void insertUser(User user);
    User selectUser(int id);
    List<User> selectAllUsers();
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
    List<User> searchUser(String country);
    List<User> sortUser();
}
