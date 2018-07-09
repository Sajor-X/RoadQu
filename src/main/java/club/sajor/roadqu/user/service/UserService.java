package club.sajor.roadqu.user.service;

import club.sajor.roadqu.user.model.User;

public interface UserService {
    public User login(String username, String password);

    public void register(User user);

    public User findUserByName(String username);

    void changePassword(String password, String userid);
}
