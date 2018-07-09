package club.sajor.roadqu.memory.controller;

import club.sajor.roadqu.comment.model.Comment;
import club.sajor.roadqu.comment.service.CommentService;
import club.sajor.roadqu.memory.model.Memory;
import club.sajor.roadqu.memory.model.MemoryType;
import club.sajor.roadqu.memory.service.MemoryService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
        List<Memory> memories;
//        User user = (User)request.getSession().getAttribute("user");
//        if(user != null)
//            memories = memoryService.selectAllMemoryByUserId(user.getUserid());
//        else
//            memories = memoryService.selectAllMemory();
        memories = memoryService.selectAllMemory();
        request.getSession().setAttribute("memories", memories);
        return "/memory/memory";
    }

    @RequestMapping("/memoryDetail")
    public String memoryDetail(String tmid, HttpServletRequest request){
        Memory memory = memoryService.selectMemoryById(tmid);
        request.setAttribute("memory", memory);

        List<Comment> commentList = commentService.selectCommentByTmid(tmid);
        request.setAttribute("commentList", commentList);

        return "/memory/memory_detail";
    }

    @RequestMapping("/memoryList")
    public String memoryList(@Param("memorytypeid") String memorytypeid, @Param("page") int page, HttpServletRequest request){
//        int page = Integer.parseInt(request.getParameter("page"));
        List<MemoryType> memoryTypeList = memoryService.selectAllMemoryType();
        request.getSession().setAttribute("memoryTypeList", memoryTypeList);
        System.out.println(page);
        List<Memory> memories = memoryService.selectMemoryByTypeId(memorytypeid, (page-1)*4);
        request.getSession().setAttribute("memories", memories);
        return "/memory/memory_list";
    }

}
