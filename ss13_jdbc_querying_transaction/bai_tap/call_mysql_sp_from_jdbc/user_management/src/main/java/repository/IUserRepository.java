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
    User getUserById(int id);
    void insertUserStore(User user) throws SQLException;
    List<User> displayUsers();
    boolean editUser(User user) throws SQLException;
    boolean removeUser(int id) throws SQLException;
    void addUserTransaction(User user, int[] permisions);
}
