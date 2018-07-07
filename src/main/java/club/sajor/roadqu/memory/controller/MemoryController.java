package club.sajor.roadqu.memory.controller;

import club.sajor.roadqu.comment.model.Comment;
import club.sajor.roadqu.comment.service.CommentService;
import club.sajor.roadqu.memory.model.Memory;
import club.sajor.roadqu.memory.model.MemoryType;
import club.sajor.roadqu.memory.service.MemoryService;
import club.sajor.roadqu.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MemoryController {

    @Autowired
    private MemoryService memoryService;
    @Autowired
    private CommentService commentService;

    @RequestMapping("/memory")
    public String memory(HttpServletRequest request){

        List<MemoryType> memoryTypeList = memoryService.selectAllMemoryType();
        request.getSession().setAttribute("memoryTypeList", memoryTypeList);

        User user = (User)request.getSession().getAttribute("user");
        List<Memory> memories = null;
        if(user != null)
            memories = memoryService.selectAllMemoryByUserid(user.getUserid());
        else
            memories = memoryService.selectAllMemory();
        request.getSession().setAttribute("memories", memories);
        return "/memory/memory";
    }

    @RequestMapping("/memoryDetail")
    public String memoryDetail(String tmid, HttpServletRequest request){
        Memory memory = memoryService.selectMemoryByid(tmid);
        request.setAttribute("memory", memory);

        List<Comment> commentList = commentService.selectCommentByTmid(tmid);
        request.setAttribute("commentList", commentList);

        return "/memory/memory_detail";
    }
}
