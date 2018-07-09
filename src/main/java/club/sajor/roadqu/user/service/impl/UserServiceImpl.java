package club.sajor.roadqu.user.service.impl;

import club.sajor.roadqu.user.dao.UserDao;
import club.sajor.roadqu.user.model.User;
import club.sajor.roadqu.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User login(String username, String password) {
        User user = userDao.login(username, password);
        return user;
    }

    @Override
    public void register(User user) {
        userDao.register(user);
    }

    @Override
    public User findUserByName(String username) {
        User user = userDao.findUserByName(username);
        return user;
    }

    @Override
    public void changePassword(String password, String userid) {
        userDao.chagePassword(password, userid);
    }

    @Override
    public void userUpdate(User user) {
        userDao.userUpdate(user);
    }

    @Override
    public User findUserById(String userid) {
        return userDao.findUserById(userid);
    }
}
