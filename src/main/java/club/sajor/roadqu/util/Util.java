package club.sajor.roadqu.util;

import club.sajor.roadqu.user.model.User;

import javax.servlet.http.HttpServletRequest;

public class Util {
    public static User CheckUser(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            request.setAttribute("msg", "请先登录");
            return null;
        }
        return user;
    }
}
