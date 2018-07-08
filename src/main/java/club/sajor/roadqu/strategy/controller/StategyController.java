package club.sajor.roadqu.strategy.controller;

import club.sajor.roadqu.strategy.model.Strategy;
import club.sajor.roadqu.strategy.model.StrategyType;
import club.sajor.roadqu.strategy.service.StrategyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class StategyController {

    @Autowired
    private StrategyService strategyService;

    @RequestMapping("/strategy")
    public String strategy(HttpServletRequest request){
        List<StrategyType> strategyTypeList = strategyService.selectAllStrategyType();
        request.getSession().setAttribute("strategyTypeList", strategyTypeList);

        List<Strategy> strategies = strategyService.selectAllStrategy();
        request.getSession().setAttribute("strategies", strategies);
        return "strategy/strategy";
    }

    @RequestMapping("strategyDetail")
    public String strategyDetail(String tsid, HttpServletRequest request){
        Strategy strategy = strategyService.selectStrategyById(tsid);
        request.setAttribute("strategy", strategy);
        return "/strategy/strategy_detail";
    }

}
