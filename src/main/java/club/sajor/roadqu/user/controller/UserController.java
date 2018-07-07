package club.sajor.roadqu.user.controller;

import club.sajor.roadqu.user.model.User;
import club.sajor.roadqu.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(String username, String password, String checkcode, HttpServletRequest request){
        String code = (String) request.getSession().getAttribute("code");
        if(!checkcode.equalsIgnoreCase(code)){
            request.getSession().setAttribute("msg", "check code error");
            return "login/login";
        }
        User user = userService.login(username, password);
        if(user != null){
            request.getSession().setAttribute("user", user);
            return "index";
        }
        request.getSession().setAttribute("msg", "username or password error");
        return "login/login";
    }

    @RequestMapping("/checkCode")
    public @ResponseBody int checkCode(@RequestParam(value = "checkcode") String checkcode, HttpServletRequest request){
        String code = (String) request.getSession().getAttribute("code");
        System.out.println(code);
        System.out.println(checkcode);
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
            request.getSession().setAttribute("msg", "check code error");
            return "login/register";
        }
        userService.register(user);
        request.getSession().setAttribute("user", user);
        return "index";
    }

    @RequestMapping("/checkUserNameExit")
    public @ResponseBody int checkUserNameExit(@RequestParam(value = "username") String username, HttpServletRequest request){
        User user = userService.findUserByName(username);
        if(user == null)
            return 0;
        return 1;
    }
}
