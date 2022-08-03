package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    IUserRepository iUserRepository=new UserRepository();
    @Override
    public void insertUser(User user){
        iUserRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
       return iUserRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return iUserRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return iUserRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return iUserRepository.updateUser(user);
    }

    @Override
    public List<User> searchUser(String country) {
        return iUserRepository.searchUser(country);
    }

    @Override
    public List<User> sortUser() {
        return iUserRepository.sortUser();
    }

    @Override
    public User getUserById(int id) {
        return iUserRepository.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        iUserRepository.insertUserStore(user);
    }
}
