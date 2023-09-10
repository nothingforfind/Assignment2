package com.example.assignment1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    private final DataSource dataSource;

    @Autowired
    public UserService(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = dataSource.getConnection()) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM User");
            while (resultSet.next()) {
                User user = new User();
                user.setUserId(resultSet.getString("user_id"));
                user.setPassword(resultSet.getString("password"));
                user.setEmail(resultSet.getString("email"));
                user.setRole(resultSet.getString("role"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public void insertUser(User user) {
        try (Connection connection = dataSource.getConnection()) {
            String query = "INSERT INTO User (user_id, password, email, role) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getUserId());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getRole());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUser(String username) {
        User user = null;
        try (Connection connection = dataSource.getConnection()) {
            String query = "SELECT * FROM User WHERE user_id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setUserId(resultSet.getString("user_id"));
                user.setPassword(resultSet.getString("password"));
                user.setEmail(resultSet.getString("email"));
                user.setRole(resultSet.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public List<Question> getQuestionsByQuantity(int quantity) {
        List<Question> questions = new ArrayList<>();
        try (Connection connection = dataSource.getConnection()) {
            String query = "SELECT * FROM Quiz ORDER BY RAND() LIMIT ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, quantity);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Question question = new Question();
                question.setQuestionId(resultSet.getString("question_id"));
                question.setQuestionContent(resultSet.getString("question_content"));
                question.setOption1(resultSet.getString("option1"));
                question.setOption2(resultSet.getString("option2"));
                question.setOption3(resultSet.getString("option3"));
                question.setOption4(resultSet.getString("option4"));
                question.setAnswer1(resultSet.getString("answer1"));
                question.setAnswer2(resultSet.getString("answer2"));
                question.setAnswer3(resultSet.getString("answer3"));
                question.setAnswer4(resultSet.getString("answer4"));
                questions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }

    public void insertQuestion(Question question) {
        try (Connection connection = dataSource.getConnection()) {
            String query = "INSERT INTO Quiz (question_content, " +
                    "option1, option2, option3, option4, " +
                    "answer1, answer2, answer3, answer4) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, question.getQuestionContent());
            preparedStatement.setString(2, question.getOption1());
            preparedStatement.setString(3, question.getOption2());
            preparedStatement.setString(4, question.getOption3());
            preparedStatement.setString(5, question.getOption4());
            preparedStatement.setString(6, question.getAnswer1());
            preparedStatement.setString(7, question.getAnswer2());
            preparedStatement.setString(8, question.getAnswer3());
            preparedStatement.setString(9, question.getAnswer4());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Boolean checkExist (String username) {
        Boolean result = false;
        try (Connection connection = dataSource.getConnection()) {
            String query = "SELECT CASE\n" +
                    "    WHEN EXISTS (SELECT 1 FROM User WHERE user_id = ?)\n" +
                    "    THEN '1'\n" +
                    "    ELSE '0'\n" +
                    "END AS result;";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                result = resultSet.getBoolean("result");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public Boolean authentication (String username, String password) {
        Boolean result = false;
        try (Connection connection = dataSource.getConnection()) {
            String query = "SELECT CASE\n" +
                    "    WHEN EXISTS (SELECT 1 FROM User WHERE user_id = ? AND password = ?)\n" +
                    "    THEN '1'\n" +
                    "    ELSE '0'\n" +
                    "END AS result;";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                result = resultSet.getBoolean("result");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
