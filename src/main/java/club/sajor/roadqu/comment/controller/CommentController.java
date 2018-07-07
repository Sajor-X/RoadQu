package club.sajor.roadqu.comment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CommentController {

    @RequestMapping("/addComment")
    public String addComment(HttpServletRequest request){

        return "";
    }
}
