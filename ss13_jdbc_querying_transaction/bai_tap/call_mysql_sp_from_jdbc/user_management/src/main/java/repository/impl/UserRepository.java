package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?;";
    private static final String SELECT_ALL_USERS = "select * from users;";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SEARCH_COUNTRY_SQL="select id,name,email,country from users where country like ?;";
    private static final String SORT_NAME_SQL="SELECT * FROM users order by name";
    private static final String UPDATE_USERS_SQL_SP = "call edit_user(?,?,?,?)";
    private static final String DELETE_USERS_SQL_SP="call remove_user(?)";
    private static final String INSERT_USERS_SQL_2 = "INSERT INTO users (id,name, email, country) VALUES (?,?, ?, ?);";
    private static final String INSERT_USERS_PERMISION="INSERT INTO user_permision(user_id,permision_id) " + "VALUES(?,?)";;
    @Override
    public void insertUser(User user)  {
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
    public List<User> searchUser(String country) {
        List<User> users=new ArrayList<>();
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SEARCH_COUNTRY_SQL);
            preparedStatement.setString(1, "%"+country+"%");
            System.out.println(preparedStatement);
            ResultSet rs=preparedStatement.executeQuery();
            while (rs.next()){
                int id =rs.getInt("id");
                String name =rs.getString("name");
                String email=rs.getString("email");
                country = rs.getString("country");
                users.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public List<User> sortUser() {
        List<User> users=new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SORT_NAME_SQL);
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
    public User getUserById(int id) {
        User user = null;
        String query="{Call get_user_by_id(?)}";
        // thiết lập kết nối
        Connection connection=BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");

                String email = rs.getString("email");

                String country = rs.getString("country");

                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        String query = "{CALL insert_user(?,?,?)}";
        Connection connection=BaseRepository.getConnectDB();
        CallableStatement callableStatement = connection.prepareCall(query);
        callableStatement.setString(1, user.getName());

        callableStatement.setString(2, user.getEmail());

        callableStatement.setString(3, user.getCountry());

        System.out.println(callableStatement);

        callableStatement.executeUpdate();

    }

    @Override
    public List<User> displayUsers() {
        String query="{call display_list_user()}";
        List<User> users=new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement=connection.prepareCall(query);
            ResultSet rs=callableStatement.executeQuery();
            while (rs.next()){
                int id=rs.getInt("id");
                String name=rs.getString("name");
                String email=rs.getString("email");
                String country=rs.getString("country");
                users.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean editUser(User user) throws SQLException {
        boolean rowUpdated;
        Connection connection=BaseRepository.getConnectDB();
        CallableStatement callableStatement=connection.prepareCall(UPDATE_USERS_SQL_SP);
        callableStatement.setString(1,user.getName());
        callableStatement.setString(2,user.getEmail());
        callableStatement.setString(3,user.getCountry());
        callableStatement.setInt(4,user.getId());
        rowUpdated=callableStatement.executeUpdate()>0;
        return rowUpdated;

    }

    @Override
    public boolean removeUser(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection=BaseRepository.getConnectDB();
        CallableStatement callableStatement=connection.prepareCall(DELETE_USERS_SQL_SP);
        callableStatement.setInt(1,id);
        rowDeleted=callableStatement.executeUpdate()>0;
        return rowDeleted;
    }

    @Override
    public void addUserTransaction(User user, int[] permisions) {
        Connection con=null;
        PreparedStatement pstmt=null;
        PreparedStatement pstmtAssignment = null;
        ResultSet rs = null;

        try {
            con=BaseRepository.getConnectDB();
            con.setAutoCommit(false);
            pstmt = con.prepareStatement(INSERT_USERS_SQL_2, Statement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1,user.getId());

            pstmt.setString(2, user.getName());

            pstmt.setString(3, user.getEmail());

            pstmt.setString(4, user.getCountry());

            int rowAffected = pstmt.executeUpdate();

            // get user id

            rs = pstmt.getGeneratedKeys();

            int userId = 0;
            if (rs.next())

                userId = rs.getInt(1);
            if (rowAffected ==1){
                pstmtAssignment=con.prepareStatement(INSERT_USERS_PERMISION);
                for (int permisionId : permisions) {
                    pstmtAssignment.setInt(1, userId);

                    pstmtAssignment.setInt(2, permisionId);

                    pstmtAssignment.executeUpdate();
                }
                con.commit();
            }else {
                con.rollback();
            }
        } catch (SQLException ex) {
            try {

                if (con != null)

                    con.rollback();

            } catch (SQLException e) {

                System.out.println(e.getMessage());

            }

            System.out.println(ex.getMessage());
    }finally {

            try {

                if (rs != null) rs.close();

                if (pstmt != null) pstmt.close();

                if (pstmtAssignment != null) pstmtAssignment.close();

                if (con != null) con.close();

            } catch (SQLException e) {

                System.out.println(e.getMessage());

            }

        }

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
