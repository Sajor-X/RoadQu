package club.sajor.roadqu.user.service;

import club.sajor.roadqu.user.model.User;

public interface UserService {
    User login(String username, String password);

    void register(User user);

    User findUserByName(String username);

    void changePassword(String password, String userid);

    void userUpdate(User user);

    User findUserById(String userid);
}
