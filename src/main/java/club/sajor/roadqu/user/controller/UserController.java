package club.sajor.roadqu.user.controller;

import club.sajor.roadqu.memory.model.MemoryType;
import club.sajor.roadqu.memory.service.MemoryService;
import club.sajor.roadqu.user.model.User;
import club.sajor.roadqu.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private MemoryService memoryService;

    @RequestMapping("/login")
    public String login(String username, String password, String checkcode, HttpServletRequest request){
        String code = (String) request.getSession().getAttribute("code");
        if(!checkcode.equalsIgnoreCase(code)){
            request.setAttribute("msg", "验证码错误");
            return "login/login";
        }
        User user = userService.login(username, password);
        if(user != null){
            request.getSession().setAttribute("user", user);
            List<MemoryType> memoryTypeList = memoryService.selectAllMemoryType();
            request.getSession().setAttribute("memoryTypeList", memoryTypeList);
            return "index";
        }
        request.setAttribute("msg", "用户名或密码错误");
        return "login/login";
    }

    @RequestMapping("/checkCode")
    public @ResponseBody int checkCode(@RequestParam(value = "checkcode") String checkcode, HttpServletRequest request){
        String code = (String)request.getSession().getAttribute("code");
//        System.out.println(code);
//        System.out.println(checkcode);
        if(!checkcode.equalsIgnoreCase(code))
            return 0;
        return 1;
    }

    @RequestMapping("/exit")
    public String exit(HttpServletRequest request){
        request.getSession().invalidate();
        return "login/login";
    }

    @RequestMapping("/register")
    public String register(User user, String checkcode, HttpServletRequest request){
        String code = (String) request.getSession().getAttribute("code");
        if(!checkcode.equalsIgnoreCase(code)){
            request.setAttribute("msg", "验证码错误");
            return "login/register";
        }
        userService.register(user);
        request.getSession().setAttribute("user", user);
        return "index";
    }

    @RequestMapping("/checkUserName")
    public @ResponseBody int checkUserName(@RequestParam(value = "username") String username, HttpServletRequest request){
        User user = userService.findUserByName(username);
        if(user == null)
            return 0;
        return 1;
    }

    @RequestMapping("/changePassword")
    public String changePassword(String oldpassword, String password, HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user == null){
            request.setAttribute("msg", "请先登录");
            return "login/login";
        }
        if(!user.getPassword().equals(oldpassword)){
            request.setAttribute("msg", "原始密码错误");
            return "user/password_change";
        }
        userService.changePassword(password, user.getUserid());
        request.getSession().invalidate();
        request.setAttribute("msg", "密码已修改，请重新登录");
        return "login/login";
    }

    @RequestMapping("userUpdate")
    public String userUpdate(User newUser, HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user == null){
            request.setAttribute("msg", "请先登录");
            return "login/login";
        }

        newUser.setUserid(user.getUserid());
        newUser.setUsername(user.getUsername());
        newUser.setUsercount(user.getUsercount());
        newUser.setUserimg(user.getUserimg());

        userService.userUpdate(newUser);
        request.setAttribute("msg", "修改成功");
        request.getSession().setAttribute("user", newUser);
        return "user/account_detail";
    }
}
