package club.sajor.roadqu.strategy.service;

import club.sajor.roadqu.strategy.model.Strategy;
import club.sajor.roadqu.strategy.model.StrategyType;

import java.util.List;

public interface StrategyService {
    List<StrategyType> selectAllStrategyType();

    List<Strategy> selectAllStrategy();

    Strategy selectStrategyById(String tsid);
}
