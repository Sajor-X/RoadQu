package club.sajor.roadqu.strategy.dao;

import club.sajor.roadqu.strategy.model.Strategy;
import club.sajor.roadqu.strategy.model.StrategyType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface StrategyDao {

    @Select("select * from strategytype")
    List<StrategyType> selectAllStrategyType();

    @Select("select * from travelstrategy")
    List<Strategy> selectAllStrategy();

    @Select("select * from travelstrategy where tsid = #{tsid}")
    Strategy selectStrategyById(String tsid);
}
