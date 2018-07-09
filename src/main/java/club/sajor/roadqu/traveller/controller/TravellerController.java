package club.sajor.roadqu.traveller.controller;

import club.sajor.roadqu.traveller.model.Traveller;
import club.sajor.roadqu.traveller.service.TravellerService;
import club.sajor.roadqu.user.model.User;
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
public class TravellerController {

    @Autowired
    private TravellerService travellerService;

    @RequestMapping("/traveller")
    public String traveller(HttpServletRequest request){
        List<Traveller> travellers = travellerService.selectAllTraveller();
        request.getSession().setAttribute("travellers", travellers);
        return "traveller/traveller";
    }

    @RequestMapping("/travellerForMe")
    public String travellerForMe(int page, HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user == null){
            request.getSession().setAttribute("msg", "请先登录");
            return "login/login";
        }
        List<Traveller> travellers = travellerService.selectTravellerByUserId(user.getUserid(), (page-1)*7);
        request.getSession().setAttribute("travellers", travellers);
        return "user/traveller_list";
    }

    @RequestMapping("/travellerDetail")
    public String travellerDetail(String tkid, HttpServletRequest request){
        Traveller traveller = travellerService.selectTravellerById(tkid);
        request.getSession().setAttribute("traveller", traveller);
        return "traveller/traveller_detail";
    }

    @RequestMapping("/travellerSearch")
    public String travellerSearch(String tkdestination, HttpServletRequest request){
        List<Traveller> travellers;
        if(tkdestination!="")
            travellers = travellerService.selectTravellerByDestination(tkdestination);
        else
            travellers = travellerService.selectAllTraveller();
        request.getSession().setAttribute("travellers", travellers);
        return "traveller/traveller";
    }

    @RequestMapping("/travellerAdd")
    public String travellerAdd(MultipartFile file, Traveller traveller, HttpServletRequest request) throws IOException {
        String oldFileName = file.getOriginalFilename();
        String newFileName = UUID.randomUUID().toString().replace("-", "");
        String fix = oldFileName.substring(oldFileName.indexOf('.'));
        file.transferTo(new File("/Users/zhangzhenqin/Desktop/Sajor/roadqu/web/images/"+newFileName+fix));
        User user = (User)request.getSession().getAttribute("user");
        if(user == null){
            request.getSession().setAttribute("msg", "请先登录");
            return "login/login";
        }
        traveller.setTkimg("/images/"+newFileName+fix);
        traveller.setUserid(user.getUserid());
        travellerService.addTraveller(traveller);
        return "user/traveller_add";
    }

    @RequestMapping("/travellerDelete")
    public String travellerDelete(String tkid, HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user == null){
            request.getSession().setAttribute("msg", "请先登录");
            return "login/login";
        }
        travellerService.deleteTravellerById(tkid);
        return "user/traveller_list";
    }
}
