package club.sajor.roadqu.strategy.service.impl;

import club.sajor.roadqu.strategy.dao.StrategyDao;
import club.sajor.roadqu.strategy.model.Strategy;
import club.sajor.roadqu.strategy.model.StrategyType;
import club.sajor.roadqu.strategy.service.StrategyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "strategyService")
public class StrategyServiceImpl implements StrategyService {

    @Autowired
    private StrategyDao strategyDao;

    @Override
    public List<StrategyType> selectAllStrategyType() {
        return strategyDao.selectAllStrategyType();
    }

    @Override
    public List<Strategy> selectAllStrategy() {
        return strategyDao.selectAllStrategy();
    }

    @Override
    public Strategy selectStrategyById(String tsid) {
        return strategyDao.selectStrategyById(tsid);
    }
}
