package club.sajor.roadqu.memory.controller;

import club.sajor.roadqu.comment.model.Comment;
import club.sajor.roadqu.comment.service.CommentService;
import club.sajor.roadqu.memory.model.Memory;
import club.sajor.roadqu.memory.model.MemoryType;
import club.sajor.roadqu.memory.service.MemoryService;
import club.sajor.roadqu.user.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
        memories = memoryService.selectAllMemory();
        request.getSession().setAttribute("memories", memories);
        return "/memory/memory";
    }

    @RequestMapping("/memoryForMe")
    public String memoryForMe(@Param("page")int page, HttpServletRequest request){
        List<MemoryType> memoryTypeList = memoryService.selectAllMemoryType();
        request.getSession().setAttribute("memoryTypeList", memoryTypeList);
        User user = (User)request.getSession().getAttribute("user");
        if(user == null){
            request.setAttribute("msg", "请先登录");
            return "login/login";
        }
        List<Memory> memories = memoryService.selectMemoryByUserId(user.getUserid(), (page-1)*4);
        request.getSession().setAttribute("memories", memories);
        return "user/memory_list";
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
        List<MemoryType> memoryTypeList = memoryService.selectAllMemoryType();
        request.getSession().setAttribute("memoryTypeList", memoryTypeList);

        List<Memory> memories = memoryService.selectMemoryByTypeId(memorytypeid, (page-1)*4);
        request.getSession().setAttribute("memories", memories);
        return "/memory/memory_list";
    }

    @RequestMapping("/memoryAdd")
    public String memoryAdd(MultipartFile file, Memory memory, HttpServletRequest request) throws IOException {
        String oldFileName = file.getOriginalFilename();
        String newFileName = UUID.randomUUID().toString().replace("-", "");
        String fix = oldFileName.substring(oldFileName.indexOf('.'));

        file.transferTo(new File("/Users/zhangzhenqin/Desktop/Sajor/roadqu/web/images/"+newFileName+fix));
        User user = (User)request.getSession().getAttribute("user");
        if(user == null){
            request.setAttribute("msg", "请先登录");
            return "login/login";
        }
        memory.setTmimg("/images/"+newFileName+fix);
        memory.setUserid(user.getUserid());
        memoryService.addMemory(memory);
        return "redirect:memoryForMe.do?page=1";
    }

    @RequestMapping("/memoryDelete")
    public String memoryDelete(String tmid, HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user == null){
            request.setAttribute("msg", "请先登录");
            return "login/login";
        }
        memoryService.deleteMemoryById(tmid);
        return "redirect:memoryForMe.do?page=1";
    }

    @RequestMapping("/memorySearch")
    public String memorySearch(String key, HttpServletRequest request){
        List<MemoryType> memoryTypeList = memoryService.selectAllMemoryType();
        request.getSession().setAttribute("memoryTypeList", memoryTypeList);

        List<Memory> memories = memoryService.selectMemoryByKey(key);
        request.setAttribute("memories", memories);
        return "memory/memory_search";
    }
}
