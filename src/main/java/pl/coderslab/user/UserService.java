package pl.coderslab.user;

public interface UserService {
    void addUser(User user);
    void deleteUser(Long userId);
    User getUser(Long userId);
    void editUser(User user);
}
