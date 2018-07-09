package club.sajor.roadqu.traveller.controller;

import club.sajor.roadqu.traveller.model.Traveller;
import club.sajor.roadqu.traveller.service.TravellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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

    @RequestMapping("/travellerDetail")
    public String travellerDetail(String tkid, HttpServletRequest request){
        Traveller traveller = travellerService.selectTravellerById(tkid);
        request.getSession().setAttribute("traveller", traveller);
        return "traveller/traveller_detail";
    }


    @RequestMapping("/travellerSearch")
    public String travellerSearch(String tkdestination, HttpServletRequest request){
        List<Traveller> travellers;
        System.out.println(tkdestination);
        if(tkdestination!="")
            travellers = travellerService.selectTravellerByDestination(tkdestination);
        else
            travellers = travellerService.selectAllTraveller();
        request.getSession().setAttribute("travellers", travellers);
        return "traveller/traveller";
    }
}
