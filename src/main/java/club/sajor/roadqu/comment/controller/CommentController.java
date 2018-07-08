package club.sajor.roadqu.comment.controller;

import club.sajor.roadqu.comment.model.Comment;
import club.sajor.roadqu.comment.service.CommentService;
import club.sajor.roadqu.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/addComment")
    public String addComment(String tmid, String commentcontent, HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user == null){
            request.setAttribute("msg", "请先登录");
            return "login/login";
        }
        Comment comment = new Comment();
        comment.setCommentcontent(commentcontent);
        comment.setMemoryid(tmid);
        comment.setUserid(user.getUserid());
        comment.setCommentdate(new Date());
        comment.setMemoryid(tmid);

        System.out.print("memory/memory_detail");
        commentService.addComment(comment);
        request.setAttribute("tmid", tmid);
        return "forward:memoryDetail.do";
    }
}
