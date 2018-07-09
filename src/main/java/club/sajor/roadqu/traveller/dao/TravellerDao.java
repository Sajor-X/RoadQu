package club.sajor.roadqu.traveller.dao;

import club.sajor.roadqu.traveller.model.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

public interface TravellerDao {

    @Select("select k.*, u.username from travelkeep k, users u where u.userid=k.userid")
    List<Traveller> selectAllTraveller();

    @Select("select k.*, u.username from travelkeep k, users u where u.userid=k.userid and tkdestination = #{tkdestionation}")
    List<Traveller> selectTravellerByDestination(String tkdestination);

    @Select("select k.*, u.username from travelkeep k, users u where u.userid=k.userid and tkid = #{tkid}")
    Traveller selectTravellerById(String tkid);

//    @Select("select k.*, u.username from travelkeep k, users u where u.userid=k.userid  ")
//    List<Traveller> selectTravellerByTime(Date datetime);

}
